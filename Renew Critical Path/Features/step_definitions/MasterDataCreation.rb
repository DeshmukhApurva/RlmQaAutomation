#All Renew master data creation
#All Scenario mentioned in RenewMsterData.feature
Then(/^I create new Renew Account with value "(.*?)"$/) do |arg|
  begin

    click_on "New"
    sleep 2
    puts "Creating a new Account"
    sleep 4
    fill_in "acc2",:with => arg
    puts "Filled value for Account name"
   
    sleep 1
    within(:id,"topButtonRow") do
      click_on "Save"
    end

    puts "Account  successfully created For"+arg
  rescue Exception => ex
    puts "Error occurred while creating Account"
    puts ex.message

  end
end
When(/^I click on the "(.*?)" grid tab$/) do |tab|
  begin
    sleep 5
    if page.has_css?("#AllTab_Tab")
      sleep 3
      find(".allTabsArrow").click
      sleep 4
      within(".bPageBlock") do
        find("#p1").select "All Tabs"
        puts "Click On All TAb"
        sleep 4
        click_on tab
      end
      sleep 3
      puts "Successfully navigate to the #{tab} page"
    else
      raise "Failed to see the All Tab Icon"
    end
    sleep 8
  rescue Exception => ex
    raise "Error occurred while clicking the #{tab} tab"
    putstr_withScreen  ex.message
  end
end

Then(/^I click on Price Books and create pricebook with the name "(.*?)"$/) do |arg1|
  begin
    sleep 8
    click_on "Price Books"
    sleep 5
    puts "I click on Price Book"
    sleep 6
    click_on "New"
    puts "Creating Standard Price Book"
    sleep 5
    fill_in "Price Book Name",:with=>arg1
    sleep 5
    find('input[type=checkbox]').click
    #topButtonRow
    within(".pbBottomButtons") do
      first(:xpath, "//*[contains(@name, 'save')]").click
      sleep 5
    end

    puts "Pricebook created"

  rescue Exception => ex
    raise "Error occurred while creating Price book"
    putstr_withScreen  ex.message
  end
end

#Then(/^I click on Products and create product with the name "(.*?)" and product code "(.*?)" $/) do |arg1,arg2|
#Then(/^I click on Products and create product with the name "(.*?)" and product code "(.*?)"$/) do |arg1,arg2|
#Then (/^I click on Products and create product with the name "(.*?)"$/) do |arg|
#begin
#    sleep 8
#    click_on "Products"
#    sleep 8
#    puts "I click on Products"
#    sleep 10
#
#    #    within all(".bSubBlock brandSecondaryBrd secondaryPalette") do
#    #      puts "m in"
#    #      first(:xpath, "//*[contains(@name, 'go')]").click
#    #    end
#    click_on "New"
#    puts "Adding products"
#    sleep 5
#    fill_in "Product Name",:with=>arg
#    fill_in "Product Code",:with=> "Pro1234"
#    sleep 5
#   #find('input[type=checkbox]').click
#    #topButtonRow
#    find(:xpath, "(//input[@id='IsActive'])").set(true)
#    sleep 5
#    within(".pbBottomButtons") do
#      first(:xpath, "//*[contains(@name, 'save')]").click
#      sleep 5
#    end
#
#    puts "Product added successfully"
#    sleep 5
#    click_on "Add"
#    sleep 5
#    first(:xpath, "//*[contains(@title, 'Unit Price')]").send_keys "3000"
#    sleep 5
#    click_on "Save"
#    sleep 5
#    puts "product price added successfully"
#    sleep 5
#    click_on "Add to Price Book"
#    sleep 5
#    find(:xpath, "//*[contains(@name, 'allBox')]").click
#    sleep 3
#    #find(:xpath, "//*[contains(@value, 'Select')]").click
#    #find(:xpath, "//input[@value='Select']").click
#    #first(:xpath, "//*[contains(@title, 'Select')]").click
#    first(:xpath, "//*[contains(@name, 'edit')]").click
#    
#    puts "I click on Select"
#    end
#    sleep 5
#    find(:xpath, "//*[contains(@title, 'List Price 1')]").send_keys "3500"
#    sleep 5
#    click_on "Save"
#    sleep 5
#
#
#  rescue Exception => ex
#    raise "Error occurred while adding product"
#    putstr_withScreen  ex.message
#  #end
#end
#

When(/^I click on "([^"]*)" tab$/) do |tab|
  begin
    sleep 8
    click_on tab
    sleep 8
    puts "Successfully to open the #{tab} page"
  rescue Exception => ex
    putstr "Error occurred while clicking the #{tab} tab"
    putstr_withScreen  ex.message
  end
end

Then(/^I create new Asset with Name "(.*?)" and its Product "(.*?)" and its Status "(.*?)" and price "(.*?)" and account "(.*?)"$/) do |arg1,arg2,arg3,arg4,arg5|
  begin
    sleep 10
    click_on "New"
    sleep 5
    puts "Creating a new Asset"
    sleep 5
    fill_in "Name",:with => arg1
    puts "Filled value for Asset name"
    sleep 5
    fill_in "Account",:with => arg5
    puts "Filled value for Asset Account"
    sleep 5
    first(:xpath, "//*[contains(@id, 'Status')]").select(arg3)
    sleep 5
    fill_in "Product2",:with =>arg2
    puts "Filled value for Asset Product"
    sleep 8
    fill_in "Price",:with =>arg4
    fill_in "Quantity",:with => "1"
    sleep 5

    within(:id,"topButtonRow") do
      click_on "Save"
    end
    sleep 8
    puts "Asset  successfully created"
  rescue Exception => ex
    puts "Error occurred while creating Asset"
    puts ex.message
  end
end

Then(/^I create new Service Contracts with Name "(.*?)" with Account "(.*?)" and Product "(.*?)"$/) do |arg1,arg2,arg|
  begin

    ProductName=arg

    click_on "New"
    sleep 2
    puts "Creating a new Service Contract"
    sleep 4
    fill_in "Name",:with => arg1
    puts "Filled value for Service Contract name"
    sleep 4
    fill_in "Account",:with => arg2
    puts "Filled value for Account name"
    sleep 5
    within(:id,"topButtonRow") do
      click_on "Save"
    end
    sleep 10
    puts "Service Contract  successfully created"
    sleep 5
    click_on "Add Line Item"
    sleep 5
    click_on "Save"
    within (".x-grid3-body") do
      tr=all(".x-grid3-row")
      tr.each do |row|
        puts row
        puts row.all("td")[1].text
        if row.all("td")[1].text == ProductName
          row.all("td")[0].first("div").first("input").click
        end
      end
    end
    click_on 'Select'
    puts "Successfully select the service contract line item"

    #find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[3]/input").send_keys "1"
    find(:xpath, "//*[contains(@name, 'Quantity')]").send_keys "1"
    sleep 3
    all(:xpath,'//td/input[@value=" Save "]')[0].click
    puts "Successfully added product to service contract"

  rescue Exception => ex
    puts "Error occurred while creating Service Contract"
    puts ex.message
  end
end
Then (/^I select with its Product "(.*?)"$/) do |arg|
  begin
    ProductName=arg
    puts "ProductName"+ProductName
    sleep 7
    within('.list') do
      first(:link).click
    end
    sleep 4
    click_on "Add Line Item"
    puts "Successfully click on  Add Line Items"
    sleep 6
    first(:xpath, "//*[contains(@id, 'p1')]").select("Standard Price Book")
    sleep 6

    click_on "Save"
    puts "Select Price book"
    sleep 6
    within (".x-grid3-body") do
      tr=all(".x-grid3-row")
      tr.each do |row|
        puts row
        puts row.all("td")[1].text
        if row.all("td")[1].text == ProductName
          sleep 5
          row.all("td")[0].first("div").first("input").click
        end
      end
    end
    sleep 5
    click_on "Select"
    puts "Successfully select the product"
    sleep 8
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[3]/input").set arg["ProductQuantity"]
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[4]/span/input").set $startDateOLI
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[5]/span/input").set $endDateOLI
    all(:xpath,'//td/input[@value=" Save "]')[0].click

  rescue Exception => ex
    putstr "Error occurred while opening a Product"
    putstr_withScreen ex.message
  end
end

Then(/^I create new opportunity with Name "(.*?)" with Account "(.*?)" and Product "(.*?)"$/) do |arg1,arg2,arg|
  begin
    ProductName=arg

    sleep 8
    within (".pbHeader") do
      click_on "New"
    end
    puts "New Opportunity button clicked."
    fill_in "Opportunity Name",:with=>arg1
    fill_in "Account Name",:with=>arg2
    #    fill_in "Stage",:with=>arg["OpportunityStageValue"]
    time = Time.new
    fill_in "Close Date",:with=>time.month.to_s + "/" + time.day.to_s + "/" +time.year.to_s

    #    find(:xpath, "//td/label[text()='Stage']").find(:xpath, '..').find(:xpath, "following-sibling::td").find(:xpath,"//select").select arg["OpportunityStageValue"]
    find("#opp11").select "Qualification"
    sleep 2
    within("#bottomButtonRow") do
      click_on 'Save'
    end
    sleep 5 
    click_on "Add Product"
    sleep 5
    first(:xpath, "//*[contains(@id, 'p1')]").select("Standard Price Book")
    sleep 3
    click_on "Save"
    # find(:xpath, "(//input[@type='checkbox'])[2]").set(true)
    within (".x-grid3-body") do
      tr=all(".x-grid3-row")
      tr.each do |row|
        puts row
        puts row.all("td")[1].text
        if row.all("td")[1].text == ProductName
          row.all("td")[0].first("div").first("input").click
        end
      end
    end
    click_on 'Select'
    puts "Successfully select the product"

    #find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[3]/input").send_keys "1"
    find(:xpath, "//*[contains(@name, 'Quantity')]").send_keys "1"
    sleep 3
    all(:xpath,'//td/input[@value=" Save "]')[0].click
    puts "Successfully added product to opportunity"

  rescue Exception => ex
    putstr "Error occurred while creating opportunity"
    putstr_withScreen ex.message
  end
end

And(/^I select SC and generate Opportunity with Name "(.*?)" with Account "(.*?)"$/) do |arg1,arg2|
  begin
    sleep 5
    within('.list') do
      first(:link).click
    end
    sleep 8
    within('#topButtonRow') do
      click_on "Generate Opportunity"
      puts "Click on Generate Opportunity"
    end
    fill_in "Name",:with=>arg1
    time = Time.new
    fill_in "Close Date",:with=>time.month.to_s + "/" + time.day.to_s + "/" +time.year.to_s
    sleep 1
    fill_in "Probability (%)",:with=>"10"
    sleep 1
    find(".class_StageName").select "Qualification"
    sleep 3
    find(:xpath,"//select[contains(@title,'Search scope')]").select "User"
    sleep 3
    fill_in "Owner ID",:with=> "QA RenewNetOps"
    sleep 8
    within("#pgbtn") do
      click_on 'Save'
    end
  end
end


Then(/^I select opportunity with its Product "(.*?)"$/) do |arg|
  begin
    ProductName=arg
    puts "ProductName"+ProductName
    sleep 5
    within('.list') do
      first(:link).click
    end
    sleep 4
    click_on "Add Product"
    puts "Successfully click on  Add Line Items"
    sleep 5
    first(:xpath, "//*[contains(@id, 'p1')]").select("Standard Price Book")
    sleep 5

    click_on "Save"
    puts "Select Price book"

    within (".x-grid3-body") do
      tr=all(".x-grid3-row")
      tr.each do |row|
        puts row
        puts row.all("td")[1].text
        if row.all("td")[1].text == ProductName
          row.all("td")[0].first("div").first("input").click
        end
      end
    end
    puts "Successfully select the product"
    sleep 8

  rescue Exception => ex
    putstr "Error occurred while opening a Product"
    putstr_withScreen ex.message
  end
end

And(/^I select contract and generate Opportunity with Name "(.*?)" with Account "(.*?)"$/) do |arg1,arg2|
  begin
    sleep 5
    within('.list') do
      first(:link).click
    end
    sleep 8
    within('#topButtonRow') do
      click_on "Generate Opportunity"
      puts "Click on Generate Opportunity"
    end
    fill_in "Name",:with=>arg1
    time = Time.new
    fill_in "Close Date",:with=>time.month.to_s + "/" + time.day.to_s + "/" +time.year.to_s
    sleep 1
    fill_in "Probability (%)",:with=>"10"
    sleep 1
    find(".class_StageName").select "Qualification"
    sleep 8
    within("#pgbtn") do
      click_on 'Save'
    end
  end
end

#Then(/^I create new opportunity with Name "(.*?)" with Account "(.*?)" and Pricebook "(.*?)"$/) do |arg1,arg2,arg3|
Then(/^I create new opportunity with Name "(.*?)" with Account "(.*?)" and pricebook "(.*?)"$/) do |arg1,arg2,arg3|
  begin
    #Pricebook=arg3

    sleep 8
    within (".pbHeader") do
      click_on "New"
    end
    puts "New Opportunity button clicked."
    fill_in "Opportunity Name",:with=>arg1
    fill_in "Account Name",:with=>arg2
    #    fill_in "Stage",:with=>arg["OpportunityStageValue"]
    time = Time.new
    fill_in "Close Date",:with=>time.month.to_s + "/" + time.day.to_s + "/" +time.year.to_s

    #    find(:xpath, "//td/label[text()='Stage']").find(:xpath, '..').find(:xpath, "following-sibling::td").find(:xpath,"//select").select arg["OpportunityStageValue"]
    find("#opp11").select "Qualification"
    sleep 2
    within("#bottomButtonRow") do
      click_on 'Save'
    end

    click_on "Choose Price Book"
    sleep 3
    first(:xpath, "//*[contains(@id, 'p1')]").select(arg3)
    sleep 3
    click_on "Save"
    sleep 3
    "Opportunity created and selected the pricebook"

  rescue Exception => ex
    putstr "Error occurred while creating opportunity and selecting the pricebook"
    putstr_withScreen ex.message
  end
end

Then(/^I resolved the Source Opportunity and rename with name "(.*?)"$/) do |arg|
  begin
      #Resolve Opportunity
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    #first(:button,'Edit').click
    sleep 5
    first(:option,'Closed Won').select_option
    sleep 2
    first(:button,'Save').click
    sleep 8

    find(:xpath, "//th[text()='Contributed To']").find(:xpath, '..').find(:xpath, "following-sibling::tr/td[2]/a").click
    sleep 8

    # first(:button,'Edit').click
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    sleep 5
    #$automationRO = $automationOppName + "RO"
    fill_in "Opportunity Name",:with=> arg
    sleep 1
    first(:button,'Save').click
    sleep 8
  rescue Exception => ex
    puts "Error occurred while resolving the opportunity"
    puts ex.message
  end
end

When(/^I create Source Opportunity with Line Items and resolve it and rename it as "(.*?)"$/) do |arg|
  begin
  # Components of a Time
  #    puts "Current Time : " + time.inspect
  #    puts time.year    # => Year of the date
  #    puts time.month   # => Month of the date (1 to 12)
  #    puts time.day     # => Day of the date (1 to 31 )
  #    puts time.wday    # => 0: Day of week: 0 is Sunday
  #    puts time.yday    # => 365: Day of year
  #    puts time.hour    # => 23: 24-hour clock
  #    puts time.min     # => 59
  #    puts time.sec     # => 59
  #    puts time.usec    # => 999999: microseconds
  #    puts time.zone    # => "UTC": timezone name
    time = Time.new
    #oppDateTime =  +
    time = Time.new
    oppDateTime = time.day.to_s + time.month.to_s + time.year.to_s + time.hour.to_s + time.min.to_s + time.sec.to_s
    year = time.year.to_i + 2
    click_link('Opportunities')
    sleep 5
    click_on "New"
    sleep 5
    puts "Creating a new opportunity"

    $automationOppName = "SourceOpp" + oppDateTime.to_s
    $earliestExpirationDate = "12/30/" + year.to_s
    $oPPCloseDate = "12/31/" + year.to_s

    $startDateOLI = time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s
    $endDateOLI = time.month.to_s + "/" + time.day.to_s + "/" + (time.year.to_i + 1).to_s

    fill_in "Opportunity Name",:with=>$automationOppName
    sleep 3
    fill_in "Close Date",:with=> $oPPCloseDate
    sleep 3
    fill_in "Earliest Expiration Date",:with=> $earliestExpirationDate
    sleep 3
    select "Qualification", :from => "Stage"
    sleep 3
    fill_in "Account Name",:with=> "QA Test"

    sleep 3

    within(:id,"topButtonRow") do
      click_on "Save"
    end

    puts "Successfully created Opportunity"

    sleep 5
    click_on "Choose Price Book"
    sleep 3
    first(:option,'Standard Price Book').select_option
    sleep 4
    click_on "Save"
    sleep 5
    click_on "Add Product"
    sleep 5

    #find(:xpath, "(//input[@type='checkbox'])[2]").set(true)
    find(:xpath, "(//input[@type='checkbox'])[3]").set(true)
    find(:xpath, "(//input[@type='checkbox'])[4]").set(true)
    find(:xpath, "(//input[@type='checkbox'])[5]").set(true)
    find(:xpath, "(//input[@type='checkbox'])[6]").set(true)

    
    # find(:xpath, "(//input[@type='checkbox'])[6]").set(true)
    # find(:xpath, "(//input[@type='checkbox'])[7]").set(true)
    # find(:xpath, "(//input[@type='checkbox'])[8]").set(true)
    # find(:xpath, "(//input[@type='checkbox'])[9]").set(true)'

    click_on 'Select'
    puts "Successfully select the product"
    sleep 6
    #Enter product Quantity
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[3]/input").send_keys "1"
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[3]/input").send_keys "1"
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[13]/td[3]/input").send_keys "1"
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[3]/input").send_keys "1"
    sleep 2

    #Enter Start Date of Product
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[4]/span/input").set $startDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[4]/span/input").set $startDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[4]/span/input").set $startDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[13]/td[4]/span/input").set $startDateOLI
    sleep 2

    #Enter End Date of Product
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[5]/span/input").set $endDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[5]/span/input").set $endDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[5]/span/input").set $endDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[13]/td[5]/span/input").set $endDateOLI
    sleep 2

    #Enter product sales price
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[6]/input").send_keys "1000"
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[6]/input").send_keys "2000"
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[13]/td[6]/input").send_keys "1500"
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[6]/input").send_keys "3000"
#    sleep 2
    # find(:xpath,"//*[@id='editPage']/table/tbody/tr[21]/td[6]/input").set arg["ProductSalesPrice"]
    # sleep 2
    # find(:xpath,"//*[@id='editPage']/table/tbody/tr[25]/td[6]/input").set arg["ProductSalesPrice"]
    # sleep 2
    # find(:xpath,"//*[@id='editPage']/table/tbody/tr[29]/td[6]/input").set arg["ProductSalesPrice"]
    # sleep 2
    # find(:xpath,"//*[@id='editPage']/table/tbody/tr[33]/td[6]/input").set arg["ProductSalesPrice"]
    # sleep 2
    all(:xpath,'//td/input[@value=" Save "]')[0].click
    sleep 6

    within(".opportunityLineItemBlock") do
      within(".list") do
        sleep 3
        $first_product = all(".dataRow")[0].all("th")[0].first("a").text
        puts $first_product

        $second_product = all(".dataRow")[1].all("th")[0].first("a").text
        puts $second_product

        $third_product = all(".dataRow")[2].all("th")[0].first("a").text
        puts $third_product

        $fourth_product = all(".dataRow")[3].all("th")[0].first("a").text
        puts $fourth_product
        sleep 3
      end
    end

    #Resolve Opportunity
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    #first(:button,'Edit').click
    sleep 5
    first(:option,'Closed Won').select_option
    sleep 2
    first(:button,'Save').click
    sleep 8

    find(:xpath, "//th[text()='Contributed To']").find(:xpath, '..').find(:xpath, "following-sibling::tr/td[2]/a").click
    sleep 8

    # first(:button,'Edit').click
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    sleep 5
    #$automationRO = $automationOppName + "RO"
    fill_in "Opportunity Name",:with=> arg
    sleep 1
    first(:button,'Save').click
    sleep 8
  rescue Exception => ex
    puts "Error occurred while resolving Opportunities"
    puts ex.message
  end
end

Then(/^I create a new Success Plan Template with Template Name "(.*?)" PhaseName "(.*?)" Days "(.*?)" Indicator "(.*?)" with PlayBook "(.*?)" Criteria1 Type: "(.*?)" Criteria2 Type: "(.*?)" Criteria3 Type: "(.*?)" Criteria1: "(.*?)" Criteria2: "(.*?)" Criteria3: "(.*?)"$/) do |arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11|
  begin
    arg=getDetails "SPT"
    click_link('ServiceSource Setup')
    sleep 5
    click_link('Success Plan Templates')
    puts "clicked successfully"
    sleep 2
    click_on "Create New"
    puts "Creating a new SPT"
    sleep 2
    fill_in "Template Name",:with => arg1
    sleep 2
    within(".pbBottomButtons") do
     click_on "Create"
    end
    puts "Successfully created SPT" 
    sleep 10
    if page.has_content?('Define Success Plan Phases')
      puts "Define Success Plan Phases section displayed"
      sleep 3
    else
      raise "Define Success Plan Phases section not displayed"
    end
    #first(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").select(arg["OppStage"])
    first(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").find(:xpath, 'option[1]').select_option
    # if first(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").should have_content(arg["OppStage"])
      # puts arg["OppStage"]
    # end
    #puts "Opportunity Location set to "+arg["OppStage"]
    click_on "Add Phase"
    sleep 5
    first(:xpath, "//*[contains(@id, 'csmName')]").set(arg2)
    first(:xpath, "//*[contains(@id, 'csmLength')]").set(arg3)
    sleep 5
    within all(".pbButton")[0] do
          click_on "Save"
        end
    puts "Saved Success Plan Template"
    sleep 5
    if page.has_content?('Template has been saved')
        puts "Template has been saved message displayed after saving"
        sleep 3
    else
      raise "Template has been saved message not displayed"
    end
    if page.has_content?('Phase updates have been saved')
        puts "Phase updates have been saved message displayed after saving"
        sleep 3
    else
      raise "Phase updates have been saved message not displayed"
    end
    if page.has_content?('Define Opportunity Location on Success Plan Timeline')
      puts "Define Opportunity Location on Success Plan Timeline section displayed"
      sleep 3
    else
      raise "Define Opportunity Location on Success Plan Timeline section not displayed"
    end
    if page.has_content?('Define Success Plan Playbooks')
      puts "Define Success Plan Playbooks section displayed"
      sleep 3
    else
      raise "Define Success Plan Playbooks section not displayed"
    end
    click_on "Add Playbook"
    sleep 5
   
    within('.list') do
      tr = first("tbody").all("tr")
      tr.each do |row|
        if row.all("td")[1].text == arg5
          row.all("td")[0].all('a')[0].click
          break
        end                        
      end
    end
    puts "Added Playbook Sucessfully"
    sleep 10
    within all(".pbButton")[0] do
          click_on "Save"
        end
    puts "Saved Success Plan Template"

    if page.has_content?('Template has been saved')
        puts "Template has been saved message displayed after saving"
        sleep 3
    else
      raise "Template has been saved message not displayed"
    end
    if page.has_content?('Define Success Plan Indicators')
      puts "Define Success Plan Indicators section displayed"
      sleep 3
    else
      raise "Define Success Plan Indicators section not displayed"
    end
    click_on "Add Indicator"
    puts "Clicked on Add Indicator"
    sleep 10
    within all(".dataRow").last do
      all(".dataCell")[5].first(:xpath, ".//*[contains(@id, 'indicatorTemp:acctplanIndComp:pb1:accountPlanIndicatorsTable:0')]").select(arg8)
    end
    within all(".dataRow").last do
      all(".dataCell")[7].first(:xpath, ".//*[contains(@id, 'indicatorTemp:acctplanIndComp:pb1:accountPlanIndicatorsTable:0')]").select(arg7)
    end
    first(:xpath, "//*[contains(@id, 'indicatorTemp:acctplanIndComp:pb1:accountPlanIndicatorsTable:0:indicator')]").select(arg6)  
    all(:xpath, "//*[contains(@id, 'cr1fv')]").last.set(arg9)
    all(:xpath, "//*[contains(@id, 'cr1tv')]").last.set(arg10)
    sleep 5
    all(:xpath, "//*[contains(@id, 'cr2fv')]").last.set(arg10)
    all(:xpath, "//*[contains(@id, 'cr2tv')]").last.set(arg11)
    sleep 5
    all(:xpath, "//*[contains(@id, 'cr3fv')]").last.set(arg11)
    all(:xpath, "//*[contains(@id, 'cr3tv')]").last.set(arg9)
    sleep 5
    main = page.driver.browser.window_handles.first
    find("img[alt='Indicator Lookup (New Window)']").click
    sleep 5
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    sleep 10
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.list') do
      tr = first("tbody").all("tr")
      tr.each do |row|
        if row.all("th")[0].text == arg4
            row.all("th")[0].all('a')[0].click
            break
        end                        
      end
    end
    sleep 3
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
        sleep 5
   within all(".pbButton")[0] do
          click_on "Save"
        end
    puts "Saved Success Plan Templates"
    sleep 5
    if page.has_content?('Template has been saved')
        puts "Template has been saved message displayed after saving"
        sleep 3
    else
      puts "Template has been saved message not displayed"
    end
    if page.has_content?('Success Plan Template Indicators have been saved')
        puts "Success Plan Template Indicators have been saved message displayed after saving"
        sleep 3
    else
      puts "Success Plan Template Indicators have been saved message not displayed"
    end
    rescue Exception => ex
    putstr "Error occurred while creating SPT"
    putstr_withScreen ex.message
  end 
end

Then (/^I create a new Indicator Group with name "(.*?)"$/) do |arg|
  begin
    
    sleep 5
    click_link('Indicator Groups')
    sleep 5
    if all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").count == 0
      click_on "Add Indicator Group"
      sleep 2
      within_window(page.driver.browser.window_handles.last) do
        find(:xpath, "//*[contains(@id, 'itIndicatorGroupNameId')]").set(arg)
        find('#saveNewIndicatorGroupButtonId').click
      end
      sleep 5
      all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Account")
      sleep 3
      all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Annual Revenue")
      click_on "Add Field"
      sleep 4
      all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Opportunity")
      sleep 3
      all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Expected Amount")
      click_on "Add Field"
      sleep 4
      all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Contact")
      sleep 3
      all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Level")
      click_on "Add Field"
      sleep 4
      click_on "Save"
      if page.has_content?('Indicators have been saved')
      puts "Indicators have been saved message displayed after saving"
      sleep 3
    else
      raise "Indicators have been saved message not displayed"
    end
    else
      puts "Indicator Group already exists"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while Creating an Indicator Group"
    putstr_withScreen ex.message
  end
end

Then (/^I add indicator$/) do
begin
  sleep 5
  click_link('Indicator Groups')
  sleep 5
  if all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").count == 0
    sleep 3
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Account")
    sleep 3
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Annual Revenue")
    click_on "Add Field"
    sleep 4
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Opportunity")
    sleep 3
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Expected Amount")
    click_on "Add Field"
    sleep 4
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Contact")
    sleep 3
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Level")
    sleep 4
    click_on "Add Field"
    sleep 4
    click_on "Save"
    puts "Indicators have been added"
    sleep 5
    if page.has_content?('Indicators have been saved')
      puts "Indicators have been saved message displayed after saving"
      sleep 3
    else
      putstr "Indicators have been saved message not displayed"
    end
  else
    puts "Indicator Group already exists"
  end
  sleep 3
  rescue Exception => ex
    putstr "Indicators Already exist"
  end
end

And(/^create a new Play with value "(.*?)" and "(.*?)" and "(.*?)" and its TaskName "(.*?)" and its task type "(.*?)" and AssignTo "(.*?)" and Description "(.*?)" and days "(.*?)"$/) do |arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8|
  begin

    click_link('Plays')
    puts "Opened Plays Page successfully"
    sleep 2
    click_on "Create Play"
    sleep 2
    fill_in "Display Name",:with => arg1
    fill_in "Short Description",:with => arg3
    find(:xpath, "//*[contains(@id, 'slObjectId')]").select(arg2)
    all('.btn')[0].click
    sleep 5
    puts "Successfully created Play"
    if page.has_content?('Define Play Criteria')
      puts "Define Play Criteria section displayed"
      sleep 3
    else
      raise "Define Play Criteria section not displayed"
    end
    if page.has_content?('Define Play Tasks')
      puts "Define Play Tasks section displayed"
      sleep 3
    else
      raise "Define Play Tasks section not displayed"
    end
    sleep 10
    amt = 500000
    if all(".dataRow").count > 0
      all(".dataRow").each do |row|
        if row.all("td")[1].text == "Annual Revenue"
          row.first(:link,"Delete").click
        break
        end
      end
    end
    first(:xpath, "//*[contains(@id, 'slFieldId')]").select("Annual Revenue")
    sleep 8
    first(:xpath, "//*[contains(@id, 'outOperator')]").select(">")
    sleep 8
    first(:xpath, "//*[contains(@id, 'outValue')]").set(amt)
    sleep 8
    first(:xpath, "//*[contains(@id, 'outValue')]").set(amt)
    all('.btn')[0].click
    sleep 10
    if page.has_content?('Play Criteria have been saved')
      puts "Play Criteria have been saved"
      sleep 5
    else
      raise "Play Criteria have been saved message not displayed"
    end
    click_on "Add Task"
    sleep 10

    all(:xpath, "//*[contains(@id, 'inputName')]").last.set(arg4)
    sleep 4
    all(:xpath, "//*[contains(@id, 'playTaskComp:playTaskComp:pb1:taskList:0:coltype')]").last.select(arg5)
    sleep 4
    all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDesc')]").last.set(arg7)
    # sleep 4
    # all(".dataRow").last.all("td")[5].first("select").select(arg6)
     sleep 4
    all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDays')]").last.set(arg8)
    sleep 6
    all('.btn')[0].click
    sleep 10
    if page.has_content?('Play Tasks have been saved')
      puts "Play Tasks have been saved message displayed"
      sleep 3
    else
      raise "Play Tasks have been saved message not displayed"
    end
  rescue Exception => ex
    putstr "Error occurred while creating a Play"
    putstr_withScreen ex.message
  end
end

And(/^create a new Playbook with value "(.*?)" with play "(.*?)" and its Short Description "(.*?)" and Object "(.*?)" and its TaskName "(.*?)" and its task type "(.*?)" and AssignTo "(.*?)" and Description "(.*?)" and days "(.*?)"$/) do |arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9|
  begin
    arg = getDetails "PlayBook Details"
    sleep 5
    click_link('Playbooks')
    puts "Clicked Playbooks successfully"
    sleep 2
    click_on "Create New"
    sleep 8

    fill_in "Display Name",:with => arg1

    all('.btn')[0].click
    sleep 6
    puts "Successfully created Playbook"
    if page.has_content?('Define Playbook Plays')
      puts "Define Playbook Plays section displayed"
      sleep 6
    else
      raise "Define Playbook Plays section not displayed"
    end
    sleep 6
    click_on "Add Play"
    sleep 5

    addFound = 0
    all(".dataRow").each do |tr|
      if tr.all(".dataCell")[1].text == arg2
        tr.all(".dataCell")[0].all('a')[0].click
      addFound = 1
      break
      end
    end
    if addFound == 0
      click_on "Cancel"
      sleep 5
      click_on "Create Play"
      sleep 2
      fill_in "Display Name",:with => arg2
      fill_in "Short Description",:with => arg3
      find(:xpath, "//*[contains(@id, 'slObjectId')]").select(arg4)
      all('.btn')[0].click
      sleep 5
      puts "Successfully created Play"
      if page.has_content?('Define Play Criteria')
        puts "Define Play Criteria section displayed"
        sleep 3
      else
        raise "Define Play Criteria section not displayed"
      end
      if page.has_content?('Define Play Tasks')
        puts "Define Play Tasks section displayed"
        sleep 3
      else
        raise "Define Play Tasks section not displayed"
      end
      sleep 10
      amt = 500000
      if all(".dataRow").count > 0
        all(".dataRow").each do |row|
          if row.all("td")[1].text == "Annual Revenue"
            row.first(:link,"Delete").click
          break
          end
        end
      end
      first(:xpath, "//*[contains(@id, 'slFieldId')]").select("Annual Revenue")
      sleep 8
      first(:xpath, "//*[contains(@id, 'outOperator')]").select(">")
      sleep 8
      first(:xpath, "//*[contains(@id, 'outValue')]").set(amt)
      sleep 8
      all('.btn')[0].click
      sleep 10
      if page.has_content?('Play Criteria have been saved')
        puts "Play Criteria have been saved"
        sleep 3
      else
        raise "Play Criteria have been saved message not displayed"
      end
      click_on "Add Task"
      sleep 10
      taskArg = getDetails "Play Tasks"
      all(:xpath, "//*[contains(@id, 'inputName')]").last.set(arg5)
      all(:xpath, "//*[contains(@id, 'playTaskComp:playTaskComp:pb1:taskList:0:coltype')]").last.select(arg6)
      all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDesc')]").last.set(arg8)
      all(".dataRow").last.all("td")[4].first("select").select(arg7)
      all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDays')]").last.set(arg9)
      all('.btn')[0].click
      sleep 10
      if page.has_content?('Play Tasks have been saved')
        puts "Play Tasks have been saved message displayed"
        sleep 3
      else
        raise "Play Tasks have been saved message not displayed"
      end
      sleep 2
      all('.btn')[2].click
      puts "Created Play and added Play to Playbook"
    end
    sleep 3
    found = 0
    fill_in "Search:",:with => arg2
    sleep 2
    all(".dataRow").each do |tr|
      if tr.all(".dataCell")[1].text == arg2
      found = 1
      break
      end
    end
    sleep 5
    if found==1
      puts "#{arg2} Play added to Playbook and displayed in Play grid"
      sleep 4
    else
      raise "#{arg2} Play not displayed in Play grid"
      sleep 4
    end
  rescue Exception => ex
    putstr "Error occurred while creating Playbook"
    putstr_withScreen ex.message
  end
end

Then(/^I create a SuccessPlan with template "(.*?)" with Account "(.*?)"$/) do |arg,arg1|
  begin
    puts "Create a new Success Plan"
    
    click_on "New"
    puts "New button is clicked successfully"
    puts "I am Standing on Success Plan Edit page"
    sleep 10
    fill_in "Success Plan Template",:with => arg
    puts "Success plan Template is selected successfully"
    sleep 8
    fill_in "Account",:with => arg1
    puts "Account is Selected successfully"
    sleep 8
    time = Time.new
    fill_in "Phase Start Date",:with => time.month.to_s + "/" + time.day.to_s + "/" +time.year.to_s
    puts "Date is filled in Phase Date"
    sleep 2
    within all(".pbButton")[0] do
      click_on "Save"
      sleep 3
      puts "Save Button is clicked successfully"
    end
  rescue Exception => ex
    putstr "Error occurred while creating SPT"
    putstr_withScreen ex.message
  end
end


