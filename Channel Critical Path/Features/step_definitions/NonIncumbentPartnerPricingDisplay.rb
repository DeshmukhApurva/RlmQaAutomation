#All Opportunities - NonIncumbentPartnerPricingDisplay specific Step definitions
#All Scenario mentioned in NonIncumbentPartnerPricingDisplay.feature

Then(/^I verify the "([^"]*)" field$/) do |prevent_portal_download|
  begin
    sleep 5
    if page.has_content?(prevent_portal_download)
      puts "Successfully see the #{prevent_portal_download} field"
    else
      putstr "Failed to see the #{prevent_portal_download} field"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the #{prevent_portal_download} field"
    putstr_withScreen  ex.message
  end
end

And(/^I open the existing asset$/) do
  begin
    sleep 5
    arg = getReference "NonIncumbentPartnerPricingDisplay"
    sleep 5
    within (".fBody") do
      click_button 'Go!'
    end
    sleep 10
    if page.has_css?(".listItemPad")
      sleep 4
      puts "Successfully see the Alphabetic Pagination"
      all(".listItemPad")[12].click
      sleep 8
      all(".selectArrow")[0].click
      sleep 8
      within(".bottomNav") do
        first("table").all("tr")[4].click
      end
    else
      putstr "Failed to see the Alphabetic Pagination"
    end
    sleep 10
    result = false
    all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
      if activity.text.include? arg["AssetName"]
        puts "Successfully match the asset name"
        activity.click
        puts "Successfully opened the #{arg["AssetName"]} asset"
      result = true
      break
      end
    end
    putstr "Unable to find the #{arg["AssetName"]} asset" unless result
  rescue Exception => ex
    putstr "Error occurred while clicking on existing #{arg["AssetName"]} asset"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the partner account fields$/) do
  begin
    sleep 5
    arg = getDetails "NonIncumbentPartnerPricingDisplay"
    sleep 5
    if page.has_content?(arg["PartnerAccountField1"])
      puts "Successfully see the #{arg["PartnerAccountField1"]} field"
    else
      putstr "Failed to see the #{arg["PartnerAccountField1"]} field"
    end
    sleep 3
    if page.has_content?(arg["PartnerAccountField2"])
      puts "Successfully see the #{arg["PartnerAccountField2"]} field"
    else
      putstr "Failed to see the #{arg["PartnerAccountField2"]} field"
    end
    sleep 3

    if page.has_content?(arg["PartnerAccountField3"])
      puts "Successfully see the #{arg["PartnerAccountField3"]} field"
    else
      putstr "Failed to see the #{arg["PartnerAccountField3"]} field"
    end
    sleep 3

    if page.has_content?(arg["PartnerAccountField4"])
      puts "Successfully see the #{arg["PartnerAccountField4"]} field"
    else
      putstr "Failed to see the #{arg["PartnerAccountField4"]} field"
    end
    sleep 3

    if page.has_content?(arg["PartnerAccountField5"])
      puts "Successfully see the #{arg["PartnerAccountField5"]} field"
    else
      putstr "Failed to see the #{arg["PartnerAccountField5"]} field"
    end
    sleep 3

    if page.has_content?(arg["PartnerAccountField6"])
      puts "Successfully see the #{arg["PartnerAccountField6"]} field"
    else
      putstr "Failed to see the #{arg["PartnerAccountField6"]} field"
    end
    sleep 3

    if page.has_content?(arg["PartnerAccountField7"])
      puts "Successfully see the #{arg["PartnerAccountField7"]} field"
    else
      putstr "Failed to see the #{arg["PartnerAccountField7"]} field"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the partner account fields"
    putstr_withScreen  ex.message
  end
end

And(/^I edit the existing "([^"]*)"$/) do |name|
  begin
    sleep 5
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    sleep 5
    puts "Successfully edit the #{name}"
  rescue Exception => ex
    putstr "Error occurred while editing the #{name}"
    putstr_withScreen  ex.message
  end
end

And(/^I click renewal opportunity having products$/) do
  begin
    sleep 5
    arg = getReference "AddPartnerOpportunity"

    if page.has_content?(arg["PartnerOpportunityName"])
      puts "#{arg["PartnerOpportunityName"]} seen on page successfully"
      first(:link,arg["PartnerOpportunityName"]).click
    else
      within all(".pbBody")[5] do
        within(".list") do
          renewal_opportunity = first(".dataRow").first("th").first("a").text
          puts renewal_opportunity
          sleep 3
          first(".dataRow").first("th").first("a").click
          sleep 5
          puts "Successfully open the renewal opportunity"
        end
      end
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while clicking the renewal opportunity"
    putstr_withScreen  ex.message
  end
end

And(/^I open the quote$/) do
  begin
    sleep 5
    within all(".pbBody")[10] do
      within(".list") do
        quote_name = first(".dataRow").all("td")[1].first("a").text
        puts quote_name
        sleep 3
        first(".dataRow").all("td")[1].first("a").click
        sleep 5
        puts "Successfully open the quote"
      end
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while clicking the quote"
    putstr_withScreen  ex.message
  end
end

And(/^I open the existing service contract$/) do
  begin
    sleep 5
    arg = getReference "NonIncumbentPartnerPricingDisplay"
    sleep 5
    within (".fBody") do
      click_button 'Go!'
    end
    sleep 10
    if page.has_css?(".listItemPad")
      sleep 4
      puts "Successfully see the Alphabetic Pagination"
      all(".listItemPad")[15].click
      sleep 8
      all(".selectArrow")[0].click
      sleep 8
      within(".bottomNav") do
        first("table").all("tr")[4].click
      end
    else
      putstr "Failed to see the Alphabetic Pagination"
    end
    sleep 10
    result = false
    all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
      if activity.text.include? arg["ServiceContractName"]
        puts "Successfully match the service Contract name"
        activity.click
        puts "Successfully opened the #{arg["ServiceContractName"]} service Contract"
      result = true
      break
      end
    end
    putstr "Unable to find the #{arg["ServiceContractName"]} service Contract" unless result
  rescue Exception => ex
    putstr "Error occurred while clicking on existing #{arg["ServiceContractName"]} service Contract"
    putstr_withScreen  ex.message
  end
end

And(/^I select the "([^"]*)" syncing$/) do |syncing|
  begin
    sleep 5
    within all(".pbSubsection")[1] do
      within('.detailList') do
        sleep 3
        all("tr")[1].all("td")[2].first("select").select syncing
        sleep 4
        puts "Successfully selected the #{syncing} syncing"
      end
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while selecting the #{syncing} syncing"
    putstr_withScreen  ex.message
  end
end

And(/^I fill the quote required fields$/) do
  begin
    sleep 4
    arg = getDetails "NonIncumbentPartnerPricingDisplay"
    arg2 = getReference "NonIncumbentPartnerPricingDisplay"
    sleep 5
    within all(".pbSubsection")[0] do
      within('.detailList') do
        sleep 3
        all("tr")[0].all("td")[1].first("input").send_keys arg["NewQuoteName"]
        sleep 3
        all("tr")[3].all("td")[1].first("span").first("input").send_keys arg2["PartnerOpportunityName"]
        sleep 4
        puts "Successfully fill the quote required fields"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while filling the quote required fields"
    putstr_withScreen  ex.message
  end
end

And(/^I "([^"]*)" the quote$/) do |button|
  begin
    sleep 5
    within("#bottomButtonRow") do
      click_on button
    end
    sleep 3
    puts "Successfully #{button} the quote"
  rescue Exception => ex
    putstr "Error occurred while clicking the #{button} quote"
    putstr_withScreen  ex.message
  end
end

And(/^I "([^"]*)" the quote page$/) do |button|
  begin
    sleep 4
    arg = getDetails "NonIncumbentPartnerPricingDisplay"
    isSyncing = 0
    sleep 3
    if page.has_css?("#bottomButtonRow")
      within("#bottomButtonRow") do
        puts "Successfully quote sync page"
        sleep 3
        if page.has_css?(".syncStart")
          sleep 3
          click_on arg["StartSync"]
          sleep 4
          isSyncing = 1
          puts "Successfully start the syncing quote"
        else
          click_on arg["StopSync"]
          sleep 6
          click_on arg["StartSync"]
          sleep 4
          puts "Successfully start the syncing quote"
        end
      end
    else
      puts "Faield to see the quote sync page"
    end
  rescue Exception => ex
    putstr "Error occurred while #{button} the quote page"
    putstr_withScreen  ex.message
  end
end

And(/^I update the partner opportunity$/) do
  begin
    sleep 4
    arg = getReference "NonIncumbentPartnerPricingDisplay"
    sleep 5
    within all(".pbSubsection")[0] do
      within('.detailList') do
        sleep 3
        within all(".lookupInput")[0] do
          first("input").send_keys [:control, 'a'], :backspace
        end
        sleep 3
        first(".lookupIcon").click
        sleep 8
      end
    end
    main = page.driver.browser.window_handles.first
    sleep 5
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    sleep 10
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.list') do
      click_on arg["PartnerOpportunityName1"]
    end
    sleep 5
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
    sleep 4
    puts "Successfully updated the partner opportunity"
  rescue Exception => ex
    putstr "Error occurred while updating the partner opportunity"
    putstr_withScreen  ex.message
  end
end

And(/^I remove the partner opportunity$/) do
  begin
    sleep 4
    within all(".pbSubsection")[0] do
      within('.detailList') do
        sleep 3
        within all(".lookupInput")[0] do
          first("input").send_keys [:control, 'a'], :backspace
        end
        sleep 4
        puts "Successfully remove the partner opportunity"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while removing the partner opportunity"
    putstr_withScreen  ex.message
  end
end

And(/^I select the partner opportunity$/) do
  begin
    sleep 4
    within all(".pbBody")[1] do
      within(".list") do
        if all('input[type=checkbox]')[1].checked?
          sleep 3
          puts "Partner opportunity is already enabled"
        else
          sleep 3
          all('input[type=checkbox]')[1].click
          sleep 3
          puts "Enabled the partner opportunity"
        break
        end
      end
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while selecting the partner opportunity"
    putstr_withScreen  ex.message
  end
end

And(/^I click on "([^"]*)" partner opportunity$/) do |button|
  begin
    sleep 4
    if page.has_button?(button)
      puts "Successfully see the #{button} button"
      sleep 3
      click_on button
      sleep 3
      puts "Successfully #{button} the partner opportunity"
    else
      puts "Failed to see the #{button} button"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while clicking the #{button} partner opportunity"
    putstr_withScreen  ex.message
  end
end

When(/^I select the sync "([^"]*)" option$/) do |sync_value|
  begin
    sleep 3
    main = page.driver.browser.window_handles.first
    sleep 5
    popup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    sleep 10
    page.driver.browser.switch_to.window(popup)
    sleep 5
    if page.has_content? "Please select one option for Syncing"
      puts "Navigated to the pop up window."
    else
      putstr "Could not Navigate to the pop up window."
    end
    find(:xpath, ".//*[contains(@id, 'panelOpts')]").select sync_value
    sleep 3
    click_on 'Save'
    sleep 25
    page.driver.browser.switch_to.window(main)
  rescue Exception => ex
    putstr "Error occurred while select the syncing #{sync_value} option"
    putstr_withScreen  ex.message
  end
end

