#All Partner Partner Opportunity Module Features - Step definitions
#All Scenario mentioned in Incumbent.feature

Then (/^I Select the "(.*?)" Partner Opportunity$/) do |argument1|
  begin
    $arg = getReference argument1
    # within all(".ui-select-match")[1] do
    # binding.pry
    # find(:css, ".ng-binding.ng-scope").click
    # sleep 3
    # end
    # sleep 3
    # if page.has_css?(".ui-select-match-close")
    # sleep 4
    # all(".ui-select-match-close").each do |filter|
    # filter.click
    # end
    # sleep 3
    # else
    # puts "Unable to see the filter values"
    # end

    sleep 5
    #find("input[placeholder='Search Opportunities...']").send_keys $arg['Name']
    find(:xpath, "//input[contains(@placeholder, 'Search Opportunities')]").send_keys $arg['Name']
    sleep 3
    puts "Successfully see the Partner Agreement Opportunity"
    sleep 2
    $isIncumbent = 0
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      within all(".ui-grid-canvas")[1] do
        tr = all(".ui-grid-row")
        td = all("div[role='gridcell']")
        tr.each do |row|
          if row.all("div[role='gridcell']")[0].text == $arg['Name']
            row.all("div[role='gridcell']")[0].click
            puts "Successfully clicked #{$arg['Name']}"
            sleep 3
          $isIncumbent = 1
          end
        end
      end
    else
      puts "No #{$arg['Name']} Opportunities Records Found"
    end
    sleep 5
  rescue Exception=> ex
    puts "Error in Selecting the #{argument1} Partner Opportunity"
    putstr_withScreen  ex.message
  end
end

And (/^I verify the "(.*?)" field value$/) do |field_name|
  begin
    sleep 3
    if $isIncumbent > 0
      if page.has_content? "Opportunity Name"
        puts "Successfully navigated to Details tab"
      else
        putstr "Could not navigate to Details tab"
      end
      within(".data-table") do
        $renewalFieldValue=all("tr")[4].all("td")[2].text
        $amountFieldValue=all("tr")[5].all("td")[2].text
      end
      if $renewalFieldValue != "0.00"
        puts "Incumbent is checked and #{field_name} field is not empty and has #{$renewalFieldValue}"
      else
        puts "Incumbent is not checked and #{field_name} field is not empty and has #{$renewalFieldValue}"
      end
      if $amountFieldValue != "0.00"
        puts "Amount field is populated if the latest quote item is assigned"
      else
        puts "Amount field is populated if the latest quote item is not assigned"
      end
    else
      puts "No #{$arg['Name']} Opportunities Records Found"
    end
  rescue Exception=>ex
    puts "Error in verifying #{field_name} field values."
    putstr_withScreen  ex.message
  end
end

When(/^I navigate to "([^"]*)" tab$/) do |arg1|
  begin
    sleep 6
    if $isIncumbent > 0
      first(:link, arg1).click
      sleep 5
      puts "Navigated to #{arg1} tab"
    else
      puts "No #{$arg['Name']} Opportunities Records Found"
    end
  rescue Exception => ex
    puts "Error occurred while navigating to #{arg1} tab"
    putstr_withScreen ex.message
  end
end

When(/^I click on Account$/)do
  begin
    sleep 5
    click_link('Accounts')
    sleep 5
  rescue Exception => ex
    puts "Error occurred clicking on Accounts"
    puts ex.message
  end
end

Then(/^I open Accounts$/)do
  begin
    arg = getDetails "IncumbentPo"
    sleep 6
    find('#fcf').select "All Accounts"
    sleep 5
    within (".fBody") do
      if page.has_xpath?('//input[@name="go"]')
        first(:button, "Go").click
      end
    end
    if page.has_css?(".listItemPad")
      sleep 4
      puts "Successfully see the Alphabetic Pagination"
      all(".listItemPad")[15].click
      sleep 5
      all(".selectArrow")[0].click
      sleep 3
      # within(".bottomNav") do
      # first("table").all("tr")[4].click
      # end
      within(".x-grid3") do
        click_link arg["Account"]
      end
    else
      putstr "Failed to see the Alphabetic Pagination"
    end
    sleep 8
  rescue Exception => ex
    puts "Error occurred while click on open Accounts"
    puts ex.message
  end
end

When(/^I create Opportunities and add the Product$/) do
  begin
    arg = getDetails "IncumbentPo"
    time = Time.new
    oppDateTime = time.day.to_s + time.month.to_s + time.year.to_s + time.hour.to_s + time.min.to_s + time.sec.to_s
    year = time.year.to_i + 2
    click_link('Opportunities')
    sleep 5
    click_on "New"
    sleep 5
    puts "Creating a new opportunity"

    $automationOppName = arg["SourceOppName"] + oppDateTime.to_s

    $earliestExpirationDate = "12/30/" + year.to_s
    $oPPCloseDate = "12/31/" + year.to_s

    $startDateOLI = time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s
    $endDateOLI = time.month.to_s + "/" + time.day.to_s + "/" + (time.year.to_i + 1).to_s

    fill_in "Opportunity Name",:with=> $automationOppName
    sleep 1
    fill_in "Close Date",:with=> $oPPCloseDate
    sleep 1
    fill_in "Earliest Expiration Date",:with=> $earliestExpirationDate
    sleep 1
    select arg["SourceOppStage"], :from => "Stage"
    sleep 3
    fill_in "Account Name",:with=> arg["Account"]
    sleep 1

    within(:id,"bottomButtonRow") do
      click_on "Save"
    end

    puts "Successfully created Opportunity"

    sleep 5
    click_on "Choose Price Book"
    sleep 3
    first(:option,'Standard Price Book').select_option
    sleep 4
    click_on "Save"
    puts "Successfully created Opportunity"
    sleep 8
    click_on "Add Product"
    sleep 8
    #$first_product_name
    within("#undefined_grid") do
      all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["SingleProductCheckboxIndex"].to_i
          sleep 5
          unless checkbox.checked?
            checkbox.click
            puts "Successfully enabled the the product"
          break
          else
            puts "Product is already enabled"
          end
        else
        #puts "#{index}"
        end
      end
    end
    sleep 8
    click_on 'Select'
    puts "Successfully select the product"
    sleep 6
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[3]/input").set arg["ProductQuantity"]
    sleep 5
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[2]/input").set arg["ProductSalesPrice"]
    sleep 5
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[4]/span/input").set $startDateOLI
    sleep 5
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[5]/span/input").set $startDateOLI
    sleep 5
    all(:xpath,'//td/input[@value=" Save "]')[0].click
    sleep 8
  rescue Exception => ex
    puts "Error occurred while creating Opportunities and adding the Products"
    puts ex.message
  end
end

And(/^I change the Stage to Closed won$/)do
  begin
    sleep 5
    within(:id,"bottomButtonRow") do
      click_on("Edit")
    end
    sleep 5
    select "Closed Won", :from => "Stage"
    sleep 4
    within(:id,"bottomButtonRow") do
      click_on "Save"
    end
    sleep 5
  rescue Exception => ex
    puts "Error occurred while changing stage to Closed won"
    puts ex.message
  end
end

Then(/^I should see partner opportunity account details$/) do
  begin
    sleep 5
    arg = getReference "AddPartnerOpportunity"
    sleep 2
    if page.has_css?(".pageDescription")
      page_title = find(".pageDescription").text
      $PO_name = page_title
      sleep 2
      puts "Successfully see the partner opportunity #{page_title} details page"
      sleep 2
      within all(".pbSubsection")[0] do
        opportunity_name = first("tbody").all("tr")[1].all("td")[1].text
        $opportunity_name = first("tbody").all("tr")[1].all("td")[1].text
        puts $opportunity_name
        if opportunity_name.to_s == arg["PartnerOpportunityName"].to_s
          puts "Successfully see the partner opportunity #{opportunity_name} name"
        else
        #    putstr "Failed to see the partner opportunity #{arg["PartnerOpportunityName"]} name"
        end
      end
      sleep 2
      within all(".pbSubsection")[1] do
        partner_account1 = first("tbody").first("tr").all("td")[1].text
        if partner_account1.to_s == arg["PartnerAccount1Name"].to_s
          puts "Successfully see the partner account1 #{partner_account1} name"
        else
          putstr "Failed to see the partner account1 #{arg["PartnerAccount1Name"]} name"
        end
        sleep 5
        partner_contact1 = first("tbody").all("tr")[2].all("td")[1].text
        if partner_contact1.to_s == arg["PartnerAccount1Contact"].to_s
          puts "Successfully see the partner contact1 #{partner_contact1} name"
        else
          putstr "Failed to see the partner contact1 #{arg["PartnerAccount1Contact"]} name"
        end
      end
    else
      putstr "Failed to see the partner opportunity details page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the partner opportunity details page"
    putstr_withScreen  ex.message
  end
end

And(/^I Navigated to Renewal Opportunity$/) do
  begin
    sleep 5
    setCursorPos = Win32API.new("user32", "SetCursorPos", ['I','I'], 'V')
    setCursorPos.Call(500,10)
    sleep 5
    find(:xpath, '//td[text()="Opportunity Name"]/following-sibling::td/div/a', :match => :prefer_exact).click
    sleep 7
    puts "Navigated Opportunity page"
  rescue Exception => ex
    putstr "Error occurred while navigating to Renewal Opportunity"
    putstr_withScreen  ex.message
  end
end

And(/^I check the Price in Service Contracts$/)do
  begin
    arg = getDetails "IncumbentPo"
    time = Time.new
    oppDateTime = time.day.to_s + time.month.to_s + time.year.to_s + time.hour.to_s + time.min.to_s + time.sec.to_s
    year = time.year.to_i + 2

    within(:id,"bottomButtonRow") do
      click_on("Edit")
    end
    sleep 7
    $automationContractName = arg["ServiceContractName"] + oppDateTime.to_s

    fill_in "Contract Name",:with=> $automationContractName
    sleep 4

    within(:id,"bottomButtonRow") do
      click_on "Save"
    end

    puts "clicked on save"

    sleep 5
    $ServiceContractPrice = first(:xpath,'//td[contains(text(),"Total Price")]/following-sibling::td/div').text
    puts $ServiceContractPrice
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while checking price  in Service Contract"
    putstr_withScreen  ex.message
  end
end

And(/^I check the Price in Asset$/)do
  begin
    sleep 5
    arg = getDetails "IncumbentPo"
    time = Time.new
    oppDateTime = time.day.to_s + time.month.to_s + time.year.to_s + time.hour.to_s + time.min.to_s + time.sec.to_s
    year = time.year.to_i + 2
    sleep 5

    within(:id,"bottomButtonRow") do
      click_on("Edit")
    end
    sleep 7
    $automationAssetName = arg["AssetName"] + oppDateTime.to_s

    fill_in "Asset Name",:with=> $automationAssetName
    puts $automationAssetName
    sleep 4

    within(:id,"bottomButtonRow") do
      click_on "Save"
    end
    sleep 10
    $AssetPrice = first(:xpath,'//td[contains(text(),"Price")]/following-sibling::td/div').text
    puts "Assest Price #{$AssetPrice} displayed"
  rescue Exception => ex
    putstr "Error occurred while checking price in Asset"
    putstr_withScreen  ex.message
  end
end

And(/^I verify Partner accounts Details$/)do
  begin
    sleep 8
    if page.has_css?(".pageDescription")
      within all(".pbSubsection")[1] do
        partner_account1 = first("tbody").first("tr").all("td")[1].text
        if partner_account1.to_s == arg["PartnerAccount1Name"].to_s
          puts "Successfully see the partner account1 #{partner_account1} name"
        else
          putstr "Failed to see the partner account1 #{arg["PartnerAccount1Name"]} name"
        end
        sleep 5
        partner_contact1 = first("tbody").all("tr")[2].all("td")[1].text
        if partner_contact1.to_s == arg["PartnerAccount1Contact"].to_s
          puts "Successfully see the partner contact1 #{partner_contact1} name"
        else
          putstr "Failed to see the partner contact1 #{arg["PartnerAccount1Contact"]} name"
        end
      end
    else
      putstr "Failed to see the partner opportunity details page"
    end

    puts "Verified Account and Contacts in Assests"
  rescue Exception => ex
    putstr "Error occurred while verifying Partner accounts Details"
    putstr_withScreen  ex.message
  end
end

And(/^I click on Any Asset link$/)do
  begin
    sleep 5
    find(:xpath,"//*[contains(@id,'RelatedAssetList_body')]/table/tbody/tr[3]/th/a").click
    sleep 8
    puts "Verified Account and Contacts in Assests"
  rescue Exception => ex
    putstr "Error occurred clicking on Asset link"
    putstr_withScreen  ex.message
  end
end

And(/^I click on Service Contracts link$/)do
  begin
    sleep 5
    find(:xpath,"//*[contains(@id,'RelatedServiceContractList_body')]/table/tbody/tr[2]/th/a").click
    sleep 8
  rescue Exception => ex
    putstr "Error occurred while clicking on Service Contracts"
    putstr_withScreen  ex.message
  end
end

Then(/^I search an Account Name$/)do
  begin
    arg1 = getDetails "IncumbentPo"
    AccountName = arg1["Account"]

    find("div[placeholder='Search Accounts...']").click
    sleep 3

    find("input[placeholder='Search Accounts...']").send_keys [:control, 'a'], :backspace

    find("input[placeholder='Search Accounts...']").send_keys AccountName
    sleep 3
    find("input[placeholder='Search Accounts...']").send_keys :enter
    sleep 8
    puts "Entered text #{AccountName} to search in Account search box"

  rescue Exception => ex
    putstr "Error occurred while searching Account Name"
    putstr_withScreen  ex.message
  end
end


And(/^I Verify Price is Present on Assets$/)do
  begin
    sleep 5

    find("input[placeholder='Search...']").send_keys $automationAssetName
    puts $automationAssetName

    PortalAssetPrice = first(:xpath,"//*[contains(@class,'ui-grid-canvas')]/div[contains(@class,'ui-grid-row')]/div[contains(@class,'ng-isolate-scope')]/div[5]").text
    puts PortalAssetPrice

    if $AssetPrice == PortalAssetPrice
      puts "Successfully see the Assests #{PortalAssetPrice} Price"
    else
      putstr "Failed to see the Assests #{PortalAssetPrice} Price"
    end
    puts "Assets Price verified successfully"
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying Assest Price"
    putstr_withScreen  ex.message
  end
end

And(/^I Verify Price is Present on Contracts$/)do
  begin
    sleep 5
    # find("input[placeholder='Search...']").send_keys $automationContractName
    # puts $automationContractName
    #Contractprice = find(:xpath,"//*[contains(@id,'uiGrid-000A-cell']/div").text
    $Contractprice = first(:xpath,"//*[contains(@class,'ui-grid-canvas')]/div[contains(@class,'ui-grid-row')]/div[contains(@class,'ng-isolate-scope')]/div[6]").text
    puts $Contractprice

    # within(".grid-container")do
    # $Contractprice = find(:xpath," //*[contains(@class,'ui-grid-canvas')]/div[contains(@class,'ui-grid-row')]/div[contains(@class,'ng-isolate-scope')]/div[5]").find(:xpath, '..').find(:xpath, "following-sibling::div").text
    # puts $Contractprice
    # # if $ServiceContractPrice == Contractprice
    # # puts "Successfully see the Service Contracts #{Contractprice} Price"
    # # else
    # # putstr "Failed to see the Service Contracts #{Contractprice} Price"
    # # end
    # end
    puts "Contracts name verified  successfully"
    sleep 4
  rescue Exception => ex
    putstr "Error occurred Verify Price is Present on Contracts"
    putstr_withScreen  ex.message
  end
end

And(/^I clicked on Contributed to$/)do
  begin
    sleep 5
    find(:xpath,"//th[text()='Contributed To']").find(:xpath, '..').find(:xpath, "following-sibling::tr/td[2]/a").click
    puts "Clicked on Contributed"
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while clicking on Contribute"
    putstr_withScreen  ex.message
  end
end

And(/^I click on Asset$/)do
  begin
    first(:xpath,"//table[@class='list']/tbody/tr[2]/td[3]/a").click
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while clicking on Asset"
    putstr_withScreen  ex.message
  end
end

And(/^I click on Service Contracts$/)do
  begin
    sleep 5
    find(:xpath,"//table[@class='list']/tbody/tr[3]/td[4]/a").click
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while clicking on Service Contracts"
    putstr_withScreen  ex.message
  end
end

And(/^I check the Incumbent Checkbox$/)do
  begin
    sleep 5
    if page.has_xpath?("//td[contains(text(),'Incumbent')]")
      puts "Incumbent field is Present"
    else
      puts "Incumbent field is Not Present"
    end
  rescue Exception => ex
    putstr "Error occurred while checking incumbent checkbox present in Assests"
    putstr_withScreen  ex.message
  end
end
