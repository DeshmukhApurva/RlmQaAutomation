#All Opportunities - ReportsTab specific Step definitions
#All Scenario mentioned in ReportsTab.feature



And(/^I open the existing account$/) do
  begin
    sleep 3
    arg = getReference "PartnerAccount"
    sleep 3
    find('#fcf').select "My Accounts"
    sleep 4
#    within (".fBody") do
#      click_button 'Go!'
#    end
    if page.has_button?('Go!')
      click_on "Go!"
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
      if activity.text.include? arg["AccountName"]
        puts "Successfully match the account name"
        activity.click
        puts "Successfully opened the #{arg["AccountName"]} account"
        result = true
        break
      end
    end
    putstr "Unable to find the #{arg["AccountName"]} account" unless result
  rescue Exception => ex
    putstr "Error occurred while clicking on existing #{arg["AccountName"]} account"
    putstr_withScreen  ex.message
  end
end


Then(/^I should not able to see the "([^"]*)" tab$/) do |tab|
  begin
   sleep 3
   unless page.has_content?(tab)
     putstr "#{tab} tab is visible"
   else
     puts "#{tab} tab not visible"
   end
   sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the #{tab} tab"
    putstr_withScreen  ex.message
  end
end


Then(/^I should able to see the "([^"]*)" tab$/) do |tab|
  begin
    sleep 3
    if page.has_content?(tab)
      puts "Successfully see the #{tab} tab"
    else
      putstr "Failed to see the #{tab} tab"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the #{tab} tab"
    putstr_withScreen  ex.message
  end
end


Then(/^I verify the export data fields$/) do
  begin
    sleep 5
    arg = getDetails "ReportsTab"
    sleep 5
    if page.has_content?(arg["ExportDataFields1"])
      puts "Successfully see the #{arg["ExportDataFields1"]} field"
    else
      putstr "Failed to see the #{arg["ExportDataFields1"]} field"
    end
    sleep 3
    if page.has_content?(arg["ExportDataFields2"])
      puts "Successfully see the #{arg["ExportDataFields2"]} field"
    else
      putstr "Failed to see the #{arg["ExportDataFields2"]} field"
    end
    sleep 3

    if page.has_content?(arg["ExportDataFields3"])
      puts "Successfully see the #{arg["ExportDataFields3"]} field"
    else
      putstr "Failed to see the #{arg["ExportDataFields3"]} field"
    end
    sleep 3

    if page.has_content?(arg["ExportDataFields4"])
      puts "Successfully see the #{arg["ExportDataFields4"]} field"
    else
      putstr "Failed to see the #{arg["ExportDataFields4"]} field"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the export data fields"
    putstr_withScreen  ex.message
  end
end

Then(/^I should not able to see the export data fields$/) do
  begin
    sleep 5
    arg = getDetails "ReportsTab"
    sleep 5
    unless page.has_content?(arg["ExportDataFields1"])
      puts "Successfully see the #{arg["ExportDataFields1"]} field"
    else
      putstr "Failed to see the #{arg["ExportDataFields1"]} field"
    end
    sleep 3
    unless page.has_content?(arg["ExportDataFields2"])
      puts "Successfully see the #{arg["ExportDataFields2"]} field"
    else
      putstr "Failed to see the #{arg["ExportDataFields2"]} field"
    end
    sleep 3

    unless page.has_content?(arg["ExportDataFields3"])
      puts "Successfully see the #{arg["ExportDataFields3"]} field"
    else
      putstr "Failed to see the #{arg["ExportDataFields3"]} field"
    end
    sleep 3

    unless page.has_content?(arg["ExportDataFields4"])
      puts "Successfully see the #{arg["ExportDataFields4"]} field"
    else
      putstr "Failed to see the #{arg["ExportDataFields4"]} field"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the export data fields"
    putstr_withScreen  ex.message
  end
end

And(/^I check the "([^"]*)" checkbox field$/) do |field|
  begin
    sleep 4
    if page.has_content?(field)
      puts "Successfully see the #{field} field"
      sleep 3
      if find('input[type=checkbox]').checked?
        sleep 3
        puts "#{field} checkbox is already selected"
      else
        sleep 3
        find('input[type=checkbox]').click
        puts "#{field} checkbox is selected"
      end
      sleep 3
    else
      putstr "Failed to see the #{field} field"
    end
  rescue Exception => ex
    putstr "Error occurred while checking #{field} checkbox"
    putstr_withScreen ex.message
  end
end

And(/^I uncheck the "([^"]*)" checkbox field$/) do |field|
  begin
    sleep 4
    if page.has_content?(field)
      puts "Successfully see the #{field} field"
      sleep 3
      if find('input[type=checkbox]').checked?
        sleep 3
        find('input[type=checkbox]').click
        puts "#{field} checkbox is not selected"
      else
        sleep 3
        puts "#{field} checkbox is not selected"
      end
      sleep 3
    else
      putstr "Failed to see the #{field} field"
    end
  rescue Exception => ex
    putstr "Error occurred while un-checking #{field} checkbox"
    putstr_withScreen ex.message
  end
end

And(/^I "([^"]*)" the "([^"]*)"$/) do |button, tab|
  begin
  sleep 5
  within("#bottomButtonRow") do
    sleep 3
    click_on button
  end
  sleep 5
  puts "Successfully #{button} the #{tab}"
  rescue Exception => ex
    putstr "Error occurred while #{button} the #{tab}"
    putstr_withScreen  ex.message
 end
end


And(/^I resolve the renewal opportunity$/) do
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
        find("#opp11").select "Closed Won"
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
    puts "Successfully Resolved the renewal opportunity"
  rescue Exception => ex
    putstr "Error occurred while resolving the renewal opportunity"
    putstr_withScreen  ex.message
  end
end

And(/^I open the asset$/) do
  begin
    sleep 5
    within all(".pbBody")[3] do
      within(".list") do
        sleep 3
        first(".dataRow").first("th").first("a").click
        sleep 5
        puts "Successfully open the asset"
      end
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while clicking the asset"
    putstr_withScreen  ex.message
  end
end

And(/^I open the service contract$/) do
  begin
    sleep 5
    #within all(".pbBody")[5] do
    within all("listRelatedObject assetBlock") do
      within(".list") do
        service_contract = first(".dataRow").first("th").first("a").text
        puts service_contract
        sleep 3
        first(".dataRow").first("th").first("a").click
        sleep 5
        puts "Successfully open the service contract"
      end
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while clicking the service contract"
    putstr_withScreen  ex.message
  end
end

And(/^I navigate to "([^"]*)" folder$/) do |folder_name|
  begin
    sleep 5
    first(".quickfindInput").send_keys folder_name
    sleep 5
    within(".x-tree-node") do
    folder_name = first(".nodeText").text
    puts folder_name
    sleep 3
    first(".nodeText").hover
    sleep 3
    first(".pinningOption").click
    sleep 4
    end
    edit_name = all(".x-menu-item")[1].text
    puts edit_name
    sleep 4
    if page.has_content?(folder_name)
      puts "Successfully see the #{folder_name} edit page"
    else
      putstr "Failed to see the #{folder_name} edit page"
    end
    sleep 4
    all(".x-menu-item")[1].click
    sleep 5
    choose "This folder is accessible only by the following users:"
    sleep 4
    within("#duel_sharedto") do
      first("select").send_keys "Public Groups"
      sleep 4
      find("#searchValue_p12").send_keys "All Partner Users"
      sleep 4
      find(".rightArrowIcon").click
      sleep 4
    end
    within("#bottomButtonRow") do
      click_on 'Save'
    end
    sleep 4
    if page.has_content?("Reports & Dashboards")
      puts "Successfully share the record to #{folder_name}"
    else
      putstr "Failed to share the record to  #{folder_name}"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while navigate to #{folder_name} folder"
    putstr_withScreen  ex.message
  end
end

And(/^I should able to see the "([^"]*)" records$/) do |portal_reports|
  begin
   sleep 6
   if page.has_css?(".report-tile.ng-scope")
    within(".view-content-section") do
      puts "Successfully see the reports section"
      sleep 3
      first(".report-tile.ng-scope").hover
      sleep 4
      if page.has_css?(".srevicon-file-csv")
        puts "Successfully see the reports csv link"
        sleep 3
        first(".srevicon-file-csv").click
        sleep 3
      else
        putstr "Failed to see the reports csv link"
      end
    end
  else
    putstr "Failed to see the reports section"
  end
  sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the #{portal_reports} records"
    putstr_withScreen  ex.message
  end
end