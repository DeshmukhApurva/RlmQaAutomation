#All Opportunity Management - Renewal Relationship specific Step definitions
#All Scenario mentioned in RenewalRelationship.feature

And(/^I go to first row where column name is "([^"]*)"$/) do |columnName|
  begin
#    visit "https://na17.salesforce.com/006o000000L584v"
    sleep 5
    puts find(:xpath, "//th[text()='#{columnName}']").text
    find(:xpath, "//th[text()='#{columnName}']").find(:xpath, '..').find(:xpath, "following-sibling::tr/td[2]/a").click
    sleep 3
  end
end
And(/^I resolve the "([^"]*)"$/) do |opportunity|
  begin
    sleep 5
    arg = getDetails "AddOnRenewalOpportunity"
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    sleep 5
    within all(".pbSubsection")[0] do
     sleep 3
    if page.has_css?("#opp11")
      sleep 3
      find("#opp11").select arg["SourceOpportunityStageValue1"]
    else
      puts "Failed to see the Stage Value"
    end
    sleep 3
   end
    sleep 5
    within("#bottomButtonRow") do
      sleep 3
      click_on 'Save'
    end
    sleep 5
	puts "Successfully Resolved the #{opportunity}"
  rescue Exception => ex
    putstr "Error occurred while selecting the #{opportunity}"
   putstr_withScreen  ex.message
  end
end

And(/^I go to created renew opp which showing renewal service to covered asset relationship$/) do
  begin
    sleep 6
    arg = getReference "RenewalRelationship"
    within(".opportunityLineItemBlock") do
      product_name = all("tr")[2].first("th").all("a")[0].text
      puts product_name
      sleep 3
      all("tr")[2].first("th").all("a")[0].click
      puts "Successfully see the product details page"
    end
    sleep 6
      within("#bottomButtonRow") do
        click_on ' Edit '
        sleep 5
      end
      fill_in "Covered Asset",:with => arg["RenewalRelationshipCoveredAsset"]
      sleep 5
      fill_in "Covered Product",:with => arg["RenewalRelationshipCoveredProduct"]
      sleep 6
      first("#bottomButtonRow").click_on ' Save '
      sleep 5
      puts "Successfully updated the Opportunity Product criteria"
  rescue Exception => ex
    putstr "Error occurred while updating the opportunity product criteria"
   putstr_withScreen  ex.message
  end
end

And(/^I click to service contract line item details link$/) do
  begin
    sleep 10
    arg = getReference "RenewalRelationship"
    sleep 6
   # find(:xpath, "//th[text()='Service Contract']").find(:xpath, '..').all(:xpath, "following-sibling::tr/td[9]/a")[1].click
   find(:xpath,"//table[@class='list']/tbody/tr[3]/td[9]/a").click
    puts "Clicked on the SC"
    sleep 3
    puts "Successfully open the service contract page"
    sleep 6
    # within all(".customnotabBlock")[0] do
     # within(".pbBody") do
       # sleep 3
       # all("tr")[2].all("td")[8].first("a").click
       # sleep 4
     # end
     #find(:xpath,"//table[@class='list']/tbody/tr[2]/th/a").click
     first(:xpath,"//*/td[@class='actionColumn']/a[text()='Edit']").click
     puts "Successfully opened the service contract line item page"
    # end
   # sleep 6
   # within("#bottomButtonRow") do
     # click_on 'Edit'
     # sleep 5
   # end
   # sleep 3
   # find("#Asset").send_keys [:control, 'a'], :backspace
   sleep 3
   fill_in "Asset Name",:with => arg["RenewalRelationshipCoveredAsset"]
   sleep 4
   first("#bottomButtonRow").click_on 'Save'
   sleep 6
   puts "Successfully updated the covered asset"
  rescue Exception => ex
    putstr "Error occurred while clicking on service contract link"
  putstr_withScreen  ex.message
  end
end


And(/^I click on the "([^"]*)" link$/) do |source_opportunity|
  begin
    sleep 6
    arg = getDetails "RenewalRelationship"
    within all(".bRelatedList")[3] do
      within(".pbBody") do
        sleep 3
        renewal_relationship_product = all("tr")[1].first("th").first("a").text
        puts renewal_relationship_product
        all("tr")[1].first("th").first("a").click
        sleep 3
      end
    end
    puts "Successfully opend the #{source_opportunity} page"
    sleep 5
    within all(".pbSubsection")[0] do
      $before_updated_probability = all("tr")[5].all("td")[3].text
      $before_updated_amount = all("tr")[6].all("td")[3].text
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while clicking on #{source_opportunity} link"
   putstr_withScreen  ex.message
  end
end


Then(/^I verify product getting associated with renewal relationship$/) do
  begin
    sleep 6
    within all(".pbBody")[1] do
        sleep 3
        renewal_relationship_product = all("tr")[1].first("th").first("a").text
        sleep 4
        if renewal_relationship_product == $first_product_name
          puts "Successfully see the renewal relationship product"
        else
          putstr "Failed to see the renewal relationship product"
        end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the renewal relationship product"
   putstr_withScreen  ex.message
  end
end



Then(/^I verify that associated covered asset getting display there$/) do
    begin
      sleep 6
      arg = getReference "RenewalRelationship"
      within all(".pbSubsection")[2] do
        sleep 4
        covered_asset_name = find(:xpath,"//table[@class='list']/tbody/tr[2]/td[6]/a").text
        # covered_asset_name = all("tr")[0].all("td")[1].text
        sleep 3
        if covered_asset_name == arg["RenewalRelationshipCoveredAsset"]
           puts "Successfully see the covered asset"
        else
          putstr "Failed to see the covered asset"
        end
      end
      sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the covered asset"
   putstr_withScreen  ex.message
 end
end



Then(/^I verify that renewal relationship data populated with service contract and line item details$/) do
  begin
    sleep 6
    arg = getDetails "AddOnRenewalOpportunity"
    within all(".pbSubsection")[0] do
      after_updated_probability = all("tr")[5].all("td")[3].text
      after_updated_amount = all("tr")[6].all("td")[3].text
      unless $before_updated_probability == after_updated_probability
        puts "Successfully updated the renewal opportunity probability"
      else
        putstr "Failed to updated the renewal opportunity probability"
      end
      sleep 3
      unless $before_updated_expected_revenue == after_updated_amount
        puts "Successfully updated the renewal opportunity amount"
      else
        putstr "Failed to updated the renewal opportunity amount"
      end
    end
    sleep 5
    within("#bottomButtonRow") do
      click_on 'Delete'
    end
    sleep 5
    page.driver.browser.switch_to.alert.accept
    sleep 5
    puts "Successfully deleted the #{arg["NewOpportunityName"]} Opportunity"
    sleep 5
  rescue Exception => ex
  putstr "Error occurred while verify that renewal relationship data populated with service contract and line item details"
 putstr_withScreen  ex.message
 end
end

When(/^I create Source Opportunity with Line Items and resolve it and rename$/) do 
  begin
    sleep 6
    arg = getDetails "AddOnRenewalOpportunity"
   
    sleep 6   
    time = Time.new
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
    fill_in "Account Name",:with=> arg["Account Name"]

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
    find(:xpath, "(//input[@type='checkbox'])[3]").set(true)
    click_on 'Select'
    puts "Successfully select the product"
    sleep 6
    #Enter product Quantity
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[3]/input").send_keys "1"
    sleep 2

    #Enter Start Date of Product
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[4]/span/input").set $startDateOLI
    
    sleep 2

    #Enter End Date of Product
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[5]/span/input").set $endDateOLI
    
    sleep 2

    #Enter product sales price
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[6]/input").send_keys "1000"
    sleep 5
    all(:xpath,'//td/input[@value=" Save "]')[0].click
    sleep 6

    within(".opportunityLineItemBlock") do
      within(".list") do
        sleep 3
        $first_product = all(".dataRow")[0].all("th")[0].first("a").text
        puts $first_product
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
    fill_in "Opportunity Name",:with=> arg["NewOpportunityName"]
    sleep 1
    first(:button,'Save').click
    sleep 8
  rescue Exception => ex
    puts "Error occurred while resolving Opportunities"
    puts ex.message
  end
end

 And(/^I select Opportunity$/) do
   begin
     sleep 5
  within('.list') do
    first(:link).click
    puts "I Click on the Opportunity"
  end
  sleep 10
  rescue Exception => ex
    putstr "Error occurred while opening a SuccessPlan"
    putstr_withScreen ex.message
   end
 end 
 
 And(/^I delete the opportunity$/) do
  begin
    within(:xpath,'//div[1]/div[2]/table/tbody/tr/td[2]/div[7]/div[1]') do
    #within all('.customnotabBlock')[1] do
      #within('.customnotabBlock')[1] do
      delCount = all(:link,'Del').count
      puts "delCount = "
      puts delCount
      unless delCount == 0
        first(:link,'Del').click
        sleep 5
        page.driver.browser.switch_to.alert.accept
        sleep 5
        #find(:xpath, "//th[text()='Asset']").find(:xpath, '..').all(:xpath, "following-sibling::tr/td[3]/a")[1].click  # Asset link click
        #find(:xpath, "//th[text()='Service Contract']").find(:xpath, '..').all(:xpath, "following-sibling::tr/td[9]/a")[1].click  # Service Contract link click
      end
    end

    first(:button,'Delete').click
    sleep 4
    page.driver.browser.switch_to.alert.accept
    sleep 5
    puts "Deleted the Opportunity Successfully"

  end
end
