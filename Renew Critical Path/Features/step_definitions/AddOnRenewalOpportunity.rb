#All Opportunity Management - AddOn Renewal Opportunity specific Step definitions
#All Scenario mentioned in AddOnRenewalOpportunity.feature

And(/^I click on existing opportunity$/) do
  begin
    sleep 6
    arg = getReference "AddOnRenewalOpportunity"
    find('#fcf').select "My Opportunities"
    sleep 5
    within (".fBody") do
      click_button 'Go!'
    end
    sleep 6
    result = false
    all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
      if activity.text.include? arg["AddOnRenewalOpportunityName"]
        puts "Successfully match the renewal Opportunity name"
        activity.click
        puts "Successfully opened the renewal Opportunity page"
        result = true
        break
      end
    end
    putstr "Unable to find the renewal Opportunity" unless result
  rescue Exception => ex
    putstr "Error occurred while existing renewal opportunity page"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify that opportunity have lookup to opportunity and field "([^"]*)" and "([^"]*)"$/) do |renewal_opportunity, service_contract|
  begin
    sleep 6
    within all(".pbSubsection")[1] do
      within(".detailList") do
        renewal_text = first("td").text
        if renewal_text.to_s == renewal_opportunity.to_s
          puts "Successfully see the #{renewal_opportunity} field"
        else
          putstr "Failed to see the #{renewal_opportunity} field"
        end
      end
    end
    sleep 4
    if page.has_content?(service_contract)
      puts "Successfully see the #{service_contract} field"
    else
      putstr "Failed to see the #{service_contract} field"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the #{service_contract} field"
    putstr_withScreen  ex.message
  end
end

And(/^Create new Opportunity under an Account$/) do
  begin
    sleep 3
    arg = getDetails "AddOnRenewalOpportunity"
    sleep 1
    $create_new_opportunity = "#{arg["NewOpportunityName"]} #{Time.now.strftime('%m%d_%H%M_%S')}"
    sleep 1
    fill_in "Opportunity Name",:with=>$create_new_opportunity
    fill_in "Account Name",:with=>arg["Account Name"]
#    fill_in "Stage",:with=>arg["OpportunityStageValue"]
    fill_in "Close Date",:with=>arg["RenewalOpportunityCloseDate"]
      
#    find(:xpath, "//td/label[text()='Stage']").find(:xpath, '..').find(:xpath, "following-sibling::td").find(:xpath,"//select").select arg["OpportunityStageValue"]
    find("#opp11").select arg["OpportunityStageValue"]
    sleep 2
    within("#bottomButtonRow") do
      click_on 'Save'
    end
    sleep 3
    puts "Successfully created the #{$create_new_opportunity} opportunity"
  rescue Exception => ex
    putstr "Error occurred while entering the mandatory details on opportunity page"
    putstr_withScreen  ex.message
  end
end

And(/^I enter mandatory details in "([^"]*)" opportunity page$/) do |new_opportunity|
  begin
    sleep 3
    arg = getDetails "AddOnRenewalOpportunity"
    sleep 4
    $create_new_opportunity = "#{arg["NewOpportunityName"]} #{Time.now.strftime('%m%d_%H%M_%S')}"
    sleep 3
    within all(".pbSubsection")[0] do
      sleep 3
      all("input[type='text']")[0].set $create_new_opportunity
      sleep 4
      all("input[type='text']")[3].set arg["RenewalOpportunityCloseDate"]
      sleep 3
      find("#opp11").select arg["OpportunityStageValue"]
    end
    sleep 5
    within("#bottomButtonRow") do
      click_on 'Save'
    end
    sleep 3
    puts "Successfully created the #{new_opportunity} opportunity"
  rescue Exception => ex
    putstr "Error occurred while entering the mandatory details in #{new_opportunity} opportunity page"
    putstr_withScreen  ex.message
  end
end

And(/^I associate opportunity to "([^"]*)"$/) do |destination_renewal_opportunity|
  begin
    sleep 5
    arg = getDetails "RenewalOpportunityFields"
    within all(".pbSubsection")[0] do
      if page.has_css?("#opp12_ilecell")
        $before_updated_probability = first("#opp12_ilecell").text
      else
        putstr "Failed to see the probability value"
      end
      if page.has_css?("#opp7_ilecell")
        $before_updated_amount = first("#opp7_ileinner").text
      else
        putstr "Failed to see the amount value"
      end
    end
    sleep 5
    within all(".pbSubsection")[2] do
      destination_renewal_opportunity_field = all("tr")[0].first("td").text
      unless destination_renewal_opportunity_field.to_s == arg["DestinationRenewalOpportunityField"].to_s
        putstr "Failed to see the #{destination_renewal_opportunity_field} field"
      else
        puts "Successfully see the #{destination_renewal_opportunity_field} field"
      end
    end
    puts "Successfully see the #{destination_renewal_opportunity} field"
  rescue Exception => ex
    putstr "Error occurred while verifying the #{destination_renewal_opportunity} field and renewal relationship & Metrics fields values"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the associated "([^"]*)" and "([^"]*)"$/) do |destination, source|
  begin
    sleep 6
    arg = getDetails "RenewalOpportunityFields"
    within all(".pbSubsection")[0] do
      if page.has_css?("#opp12_ilecell")
        puts "Successfully see the probability"
      else
        putstr "Failed to see the probability"
      end
    end
    sleep 5
    within all(".pbSubsection")[2] do
      if page.has_content?(arg["DestinationRenewalOpportunityField"])
        if page.has_xpath?('//div[6]/table/tbody/tr[1]/td[2]/div/a')
          puts "Successfully see the updated #{arg["DestinationRenewalOpportunityField"]}"
        else
          putstr "Failed to see the updated #{arg["DestinationRenewalOpportunityField"]}"
        end
      else
        putstr "Failed to see the #{arg["DestinationRenewalOpportunityField"]} field"
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while #{destination} and #{source} recalculated on the opportunity"
    putstr_withScreen  ex.message
  end
end

And(/^I select the "([^"]*)" field$/) do |destination_service_contract|
  begin
    sleep 5
    within all(".pbSubsection")[0] do
      if page.has_css?("#opp12_ilecell")
        $before_updated_probability = first("#opp12_ilecell").text
      else
        putstr "Failed to see the probability value"
      end
      if page.has_css?("#opp7_ilecell")
        $before_updated_amount = first("#opp7_ileinner").text
      else
        putstr "Failed to see the amount value"
      end
    end
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    sleep 8
    if page.has_content?(destination_service_contract)
      within all(".pbSubsection")[1] do
        sleep 5
        all("input[type='text']")[1].send_keys [:control, 'a'], :backspace
        sleep 4
        all(".lookupIcon")[1].click
        sleep 10
      end
      sleep 5
      main = page.driver.browser.window_handles.first
      sleep 5
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      sleep 10
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.list') do
        first("tbody").all("tr")[2].first("th").first("a").click
      end
      sleep 5
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
      sleep 5
      puts "Successfully select the #{destination_service_contract} opportunity"
    else
      putstr "Falied to see the #{destination_service_contract} field"
    end
    sleep 5
    within("#bottomButtonRow") do
      sleep 3
      click_on 'Save'
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the #{destination_service_contract} opportunity"
    putstr_withScreen  ex.message
  end
end

Then(/^I should be able to see the "([^"]*)" should get resolved$/) do |source|
  begin
    sleep 6
    arg = getDetails "AddOnRenewalOpportunity"
    within all(".pbSubsection")[0] do
      if page.has_css?("#opp12_ilecell")
        after_updated_probability = first("#opp12_ilecell").text
        unless $before_updated_probability == after_updated_probability
          puts "Successfully updated the #{source} probability field"
        else
          putstr "Failed to updated the #{source} probability field"
        end
      else
        putstr "Failed to see the probability value"
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
  rescue Exception => ex
    putstr "Error occurred while #{source} recalculated on the opportunity"
    putstr_withScreen  ex.message
  end
end


And(/^I enter mandatory details in "([^"]*)" opportunity$/) do |new_opportunity|
  begin
    sleep 3
    arg = getDetails "AddOnRenewalOpportunity"
    sleep 4
    $create_new_opportunity = new_opportunity
    sleep 3
    within all(".pbSubsection")[0] do
      sleep 3
      all("input[type='text']")[0].set $create_new_opportunity
      sleep 4
      all("input[type='text']")[3].set arg["RenewalOpportunityCloseDate"]
      sleep 4
      fill_in "Account Name",:with=>arg["Account Name"]
      sleep 3
      find("#opp11").select arg["OpportunityStageValue"]
    end
    sleep 5
    within("#bottomButtonRow") do
      click_on 'Save'
    end
    sleep 10 
    $url = URI.parse(current_url)
    puts $url
    sleep 3
    puts "Successfully created the #{new_opportunity} opportunity"
  rescue Exception => ex
    putstr "Error occurred while entering the mandatory details in #{new_opportunity} opportunity page"
    putstr_withScreen  ex.message
  end
end

When(/^I create Source Opportunity "(.*?)" with Line Items and resolve it with destination "(.*?)"$/) do |arg1,arg2|
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
    $url1 = URI.parse(current_url)
    puts $url1
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
    sleep 5
    fill_in "Opportunity Name",:with=> arg1
    sleep 5
    first(:option,'Closed Won').select_option
    sleep 3
    fill_in "Account Name",:with=> arg["Account Name"]
    sleep 5
    fill_in "Destination Renewal Opportunity" ,:with => arg2
    sleep 2
    first(:button,'Save').click
    
    # sleep 8
    # find(:xpath, "//th[text()='Contributed To']").find(:xpath, '..').find(:xpath, "following-sibling::tr/td[2]/a").click
    sleep 8

   rescue Exception => ex
    puts "Error occurred while resolving Opportunities"
    puts ex.message
  end
end
      
And(/^I manually delete Source opp$/) do
  begin
  visit($url1)
  puts "I Successfully Visited Destination Opp"
  sleep 10
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

And(/^I manually delete destination opp$/) do
  begin
  visit($url)
  puts "I Successfully Visited Destination Opp"
    sleep 8
    first(:button,'Delete').click
    sleep 4
    page.driver.browser.switch_to.alert.accept
    sleep 5
    puts "Deleted the Opportunity Successfully"

  end
end

And(/^I manually delete Sources Inbound records$/) do
 begin
   sleep 8
   visit($url)
   within(:xpath,'//div[1]/div[2]/table/tbody/tr/td[2]/div[7]/div[1]') do
     #    within all('.customnotabBlock')[1] do
     delCount = all(:link,'Del').count
     puts "delCount = "
     puts delCount
     #until delCount == 0
     first(:link,'Del').click
     sleep 5
     page.driver.browser.switch_to.alert.accept
     sleep 8
     first(:link,'Del').click
     sleep 8
     page.driver.browser.switch_to.alert.accept
    
     sleep 8
     #find(:xpath, "//th[text()='Asset']").find(:xpath, '..').all(:xpath, "following-sibling::tr/td[3]/a")[1].click  # Asset link click
     #find(:xpath, "//th[text()='Service Contract']").find(:xpath, '..').all(:xpath, "following-sibling::tr/td[9]/a")[1].click  # Service Contract link click
     #end
   end
 end
end