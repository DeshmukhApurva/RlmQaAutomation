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
    all("input[type='text']")[1].set arg["Account Name"]
  
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
        putstr "Failed to see the #{destination_renewal_opportunity_field} filed"
      else
        puts "Successfully see the #{destination_renewal_opportunity_field} filed"
      end
     end
    puts "Successfully see the #{destination_renewal_opportunity} field"
  rescue Exception => ex
    putstr "Error occurred while verifying the #{destination_renewal_opportunity} field and renewal relationship & Metrics fields values"
   putstr_withScreen  ex.message
  end
end

And(/^I add new line items to the "([^"]*)" and resolve the source opportunity$/) do |source_opportunity|
  begin
    sleep 5
    arg = getDetails "AddOnRenewalOpportunity"
    sleep 6
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    sleep 5
    within all(".pbSubsection")[1] do
      sleep 5
      all("input[type='text']")[0].send_keys [:control, 'a'], :backspace
      sleep 5
      all(".lookupIcon")[0].click
      sleep 10
    end
    sleep 5
    main = page.driver.browser.window_handles.first
    sleep 5
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    sleep 10
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.list') do
      sleep 3
      first("tbody").all("tr")[2].first("th").first("a").click
    end
    sleep 5
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
    sleep 6
    within all(".pbSubsection")[0] do
      sleep 4
      if page.has_css?("#opp11")
          find("#opp11").select arg["SourceOpportunityStageValue"]
          sleep 3
          puts "Successfully resolve the source opportunity"
      else
         puts "Failed to see the Stage Value"
      end
    end
    within("#bottomButtonRow") do
      sleep 3
      click_on 'Save'
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the #{source_opportunity} opportunity"
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