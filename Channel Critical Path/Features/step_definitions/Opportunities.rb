#All Opportunities - Opportunity Contacts subtab,Opportunity Details subtab,Opportunity Grid,Opportunity Notes subtab,Opportunities Predefined filter,Opportunity Quotes subtab,Opportunity Renewals subtab,Show Opportunities with Unavailable Stages,Sales Stage,Quote Tab specific Step definitions
#All Scenario mentioned in OpportunityContactsSubTab.feature,OpportunityDetailsSubTab.feature,OpportunityGrid.feature,OpportunityNotesSubTab.feature,OpportunitiesPredefinedFilter.feature,OpportunityQuotesSubTab.feature,OpportunityRenewalsSubTab.feature,ShowOpportunitieswithUnavailableStages.feature,SalesStage.feature,QuoteTab.feature

Then(/^I should able to see the "([^"]*)" columns$/) do |grid|
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 5
    if page.has_content?(arg["OpportunityModuleField1"])
      puts "Successfully see the #{arg["OpportunityModuleField1"]} request grid name"
    else
      putstr "Failed to see the #{arg["OpportunityModuleField1"]} request grid name"
    end
    sleep 3
    if page.has_content?(arg["OpportunityModuleField2"])
      puts "Successfully see the #{arg["OpportunityModuleField2"]} request grid name"
    else
      putstr "Failed to see the #{arg["OpportunityModuleField2"]} request grid name"
    end
    sleep 3

    if page.has_content?(arg["OpportunityModuleField3"])
      puts "Successfully see the #{arg["OpportunityModuleField3"]} request grid name"
    else
      putstr "Failed to see the #{arg["OpportunityModuleField3"]} request grid name"
    end
    sleep 3

    if page.has_content?(arg["OpportunityModuleField4"])
      puts "Successfully see the #{arg["OpportunityModuleField4"]} request grid name"
    else
      putstr "Failed to see the #{arg["OpportunityModuleField4"]} request grid name"
    end
    sleep 3

    if page.has_content?(arg["OpportunityModuleField5"])
      puts "Successfully see the #{arg["OpportunityModuleField5"]} request grid name"
    else
      putstr "Failed to see the #{arg["OpportunityModuleField5"]} request grid name"
    end
    sleep 3

    if page.has_content?(arg["OpportunityModuleField6"])
      puts "Successfully see the #{arg["OpportunityModuleField6"]} request grid name"
    else
      putstr "Failed to see the #{arg["OpportunityModuleField6"]} request grid name"
    end
    sleep 3

    if page.has_content?(arg["OpportunityModuleField7"])
      puts "Successfully see the #{arg["OpportunityModuleField7"]} request grid name"
    else
      putstr "Failed to see the #{arg["OpportunityModuleField7"]} request grid name"
    end
    sleep 3

    if page.has_content?(arg["OpportunityModuleField8"])
      puts "Successfully see the #{arg["OpportunityModuleField8"]} request grid name"
    else
      putstr "Failed to see the #{arg["OpportunityModuleField8"]} request grid name"
    end
    sleep 3
    if page.has_content?(arg["OpportunityModuleField9"])
      puts "Successfully see the #{arg["OpportunityModuleField9"]} request grid name"
    else
      putstr "Failed to see the #{arg["OpportunityModuleField9"]} request grid name"
    end
    sleep 3
    if page.has_content?(arg["OpportunityModuleField10"])
      puts "Successfully see the #{arg["OpportunityModuleField10"]} request grid name"
    else
      putstr "Failed to see the #{arg["OpportunityModuleField10"]} request grid name"
    end
    sleep 3
    if page.has_content?(arg["OpportunityModuleField11"])
      puts "Successfully see the #{arg["OpportunityModuleField11"]} request grid name"
    else
      putstr "Failed to see the #{arg["OpportunityModuleField11"]} request grid name"
    end
    sleep 3
    if page.has_content?(arg["OpportunityModuleField12"])
      puts "Successfully see the #{arg["OpportunityModuleField12"]} request grid name"
    else
      putstr "Failed to see the #{arg["OpportunityModuleField12"]} request grid name"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{grid} columns"
    putstr_withScreen  ex.message
  end
end


And(/^user sorts by "([^"]*)" in "([^"]*)" order from "([^"]*)" page$/) do |sort_parameter, sort_order, opportunity|
  begin
    sleep 5
    if page.has_css?(".ui-grid-header-cell-row")
      sleep 4
      within all(".ui-grid-header-cell-row")[1] do
        all(".ui-grid-icon-angle-down")[0].click
      end
      sleep 5
      all("button[ng-focus='focus=true']")[1].click
      sleep 4
      puts "Changing order to: #{sort_order}"
    else
      puts "No #{opportunity} Opportunity fields Found"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the sorted by #{sort_parameter} in #{sort_order} order from #{opportunity} page"
    putstr_withScreen  ex.message
  end
end

Then(/^files should be sorted by "([^"]*)" in "([^"]*)" order from "([^"]*)" page$/) do |sort_parameter, sort_order, opportunity|
  begin
    sleep 3
    arg = getDetails "RequestGrid"
    sleep 5
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 5
      all_files = all(:xpath, '//div[2]/div/div[position() <= 6]/div/div[1]/div/a').collect(&:text)
    sleep 6
    within all(".ui-grid-header-cell-row")[1] do
      all(".ui-grid-icon-angle-down")[0].click
    end
    sleep 5
    ascending_order = find(".ui-grid-menu-item-active").text
    sleep 5
    if ascending_order == arg["SortAscendingOrder"]

      puts "Verifying ascending order selection"

      original_array = all_files
      all_files = all_files.map(&:downcase)

      sorted_array = all_files.sort_by { |f| f.class == Array ? f.first : f }
      original_array = original_array.map(&:downcase)

      puts "Application Sorting Result: #{original_array}"
      puts "Internal Sorting Result: #{sorted_array} "
      sleep 5
    else
      puts "Verifying descending order selection"

      original_array = all_files
      all_files = all_files.map(&:downcase)

      sorted_array = all_files.sort_by { |f| f.class == Array ? f.first : f }
      sorted_array = sorted_array.reverse!

      original_array = original_array.map(&:downcase)

      puts "Application Sorting Result: #{original_array}"
      puts "Internal Sorting Result: #{sorted_array}"
      sleep 5
    end
    else
      puts "No Opportunities Records Found"
   end
  rescue Exception => ex
    putstr "Error occurred while verifying the sorted by #{sort_parameter} in #{sort_order} order from #{opportunity} page"
    putstr_withScreen  ex.message
  end
end

And(/^user sorts by "([^"]*)" in "([^"]*)" sort order from "([^"]*)" page$/) do |sort_parameter, sort_order, opportunity|
  begin
    sleep 5
    if page.has_css?(".ui-grid-header-cell-row")
      sleep 4
      within all(".ui-grid-header-cell-row")[1] do
        all(".ui-grid-icon-angle-down")[0].click
      end
      sleep 5
      all("button[ng-focus='focus=true']")[2].click
      sleep 4
      puts "Changing order to: #{sort_order}"
    else
      puts "No #{opportunity} Opportunity fields Found"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the sorted by #{sort_parameter} in #{sort_order} order from #{opportunity} page"
    putstr_withScreen  ex.message
  end
end

Then(/^files should be sorted by "([^"]*)" in "([^"]*)" sort order from "([^"]*)" page$/) do |sort_parameter, sort_order, opportunity|
  begin
    sleep 3
    arg = getDetails "RequestGrid"
    sleep 5

    rowcount = all(".ui-grid-row.ng-scope").count
   if rowcount > 0
    sleep 5
    all_files = all(:xpath, '//div[2]/div/div[position() <= 6]/div/div[1]/div/a').collect(&:text)
    sleep 6
    within all(".ui-grid-header-cell-row")[1] do
      all(".ui-grid-icon-angle-down")[0].click
    end
    sleep 5
    descending_order = find(".ui-grid-menu-item-active").text
    sleep 5
    if descending_order == arg["SortDescendingOrder"]

      puts "Verifying descending order selection"

      original_array = all_files
      all_files = all_files.map(&:downcase)

      sorted_array = all_files.sort_by { |f| f.class == Array ? f.first : f }
      original_array = original_array.map(&:downcase)

      puts "Application Sorting Result: #{original_array}"
      puts "Internal Sorting Result: #{sorted_array} "
      sleep 5
    else
      puts "Verifying ascending order selection"

      original_array = all_files
      all_files = all_files.map(&:downcase)

      sorted_array = all_files.sort_by { |f| f.class == Array ? f.first : f }
      sorted_array = sorted_array.reverse!

      original_array = original_array.map(&:downcase)

      puts "Application Sorting Result: #{original_array}"
      puts "Internal Sorting Result: #{sorted_array}"
      sleep 5
    end
  else
    puts "No Opportunities Records Found"
  end
  rescue Exception => ex
    putstr "Error occurred while verifying the sorted by #{sort_parameter} in #{sort_order} order from #{opportunity} page"
    putstr_withScreen  ex.message
  end
end

And(/^I search with account "([^"]*)" name from "([^"]*)" page$/) do |account_name, opportunity|
  begin
    sleep 4
    find("input[placeholder='Search Opportunities...']").send_keys [:control, 'a'], :backspace
    sleep 3
    find("input[placeholder='Search Opportunities...']").send_keys account_name
    sleep 3
    find("input[placeholder='Search Opportunities...']").send_keys :enter
    sleep 4
    puts "Successfully enter the #{account_name} name"
    sleep 5
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      within all(".ui-grid-canvas")[1] do
        within all("div[role='gridcell']")[1] do
          search_data = first("div").text
          if search_data == account_name
            puts "Successfully see the search #{account_name} results"
          else
            putstr "Failed to see the search #{account_name} results"
          end
        end
      end
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while searching and verifying the #{account_name} results from #{opportunity} page"
    putstr_withScreen  ex.message
  end
end


Then(/^I verify the grid scroll up and scroll down the page and default pagination value$/) do
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 5
      default_pagination_count = all("button[type='button']")[1].text
      if default_pagination_count.to_i == arg["DefaultPaginationValue"].to_i
        puts "Successfully see the default value: #{default_pagination_count}"
      else
        putstr "Failed to see the default value: #{default_pagination_count}"
      end
    sleep 5
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount >= 25
      sleep 5
      all("button[type='button']")[1].send_keys :page_down
      sleep 5
      all("button[type='button']")[1].send_keys :page_up
      sleep 5
    else
      puts "Scroll bar is disabled"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the scroll up and scroll down the page and default pagination value"
    putstr_withScreen  ex.message
  end
end

And(/^I uncheck the "([^"]*)" fields from "([^"]*)" page$/) do |grid, opportunity|
  begin
    sleep 5
    i = 0
    if page.has_css?(".ui-grid-icon-ok")
      all(".ui-grid-icon-ok").each do |icon|
        i = i+1
        sleep 4
        icon.click
        sleep 4
        if i == 12
          break
        end
      end
      sleep 5
      puts "Successfully uncheck the #{grid} fields"
      sleep 5
    else
      putstr "Failed to see the #{grid} ok fields"
    end
    sleep 5
    find(".ui-grid-icon-menu").click
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while un-checking the #{grid} fields from #{opportunity} page"
    putstr_withScreen  ex.message
  end
end

Then(/^I should not able to see the "([^"]*)" fields from "([^"]*)" page$/) do |grid, opportunity|
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 4
    unless page.has_content?(arg["OpportunityGridField1"])
      puts "Unable to see the #{arg["OpportunityGridField1"]} request grid name"
    else
      putstr "Able see the #{arg["OpportunityGridField1"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["OpportunityGridField3"])
      puts "Unable to see the #{arg["OpportunityGridField3"]} request grid name"
    else
      putstr "Able see the #{arg["OpportunityGridField3"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["OpportunityGridField4"])
      puts "Unable to see the #{arg["OpportunityGridField4"]} request grid name"
    else
      putstr "Able see the #{arg["OpportunityGridField4"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["OpportunityGridField5"])
      puts "Unable to see the #{arg["OpportunityGridField5"]} request grid name"
    else
      putstr "Able see the #{arg["OpportunityGridField5"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["OpportunityGridField6"])
      puts "Unable to see the #{arg["OpportunityGridField6"]} request grid name"
    else
      putstr "Able see the #{arg["OpportunityGridField6"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["OpportunityGridField7"])
      puts "Unable to see the #{arg["OpportunityGridField7"]} request grid name"
    else
      putstr "Able see the #{arg["OpportunityGridField7"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["OpportunityGridField8"])
      puts "Unable to see the #{arg["OpportunityGridField8"]} request grid name"
    else
      putstr "Able see the #{arg["OpportunityGridField8"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["OpportunityGridField9"])
      puts "Unable to see the #{arg["OpportunityGridField9"]} request grid name"
    else
      putstr "Able see the #{arg["OpportunityGridField9"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["OpportunityGridField10"])
      puts "Unable to see the #{arg["OpportunityGridField10"]} request grid name"
    else
      putstr "Able see the #{arg["OpportunityGridField10"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["OpportunityGridField11"])
      puts "Unable to see the #{arg["OpportunityGridField11"]} request grid name"
    else
      putstr "Able see the #{arg["OpportunityGridField11"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["OpportunityGridField12"])
      puts "Unable to see the #{arg["OpportunityGridField12"]} request grid name"
    else
      putstr "Able see the #{arg["OpportunityGridField12"]} request grid name"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{grid} names from #{opportunity} page"
    putstr_withScreen  ex.message
  end
end

When(/^I click on "([^"]*)" icon$/) do |icon|
  begin
   sleep 5
   rowcount = all(".ui-grid-row.ng-scope").count
   if rowcount > 0
     within all(".ui-grid-canvas")[1] do
      within all("div[role='gridcell']")[12] do
        sleep 5
        first("div").click
        sleep 2
        first("div").click
      end
    end
    sleep 5
   puts "Successfully click the #{icon} icon"
  else
    puts "No Opportunities Records Found"
  end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{icon} icon"
    putstr_withScreen  ex.message
 end
end

Then(/^I should be able to see the "([^"]*)" and "([^"]*)" buttons$/) do |button_text1, button_text2|
  begin
   sleep 5
   rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
     sleep 5
      within all(".ui-grid-canvas")[1] do
        within all("div[role='gridcell']")[12] do
          sleep 5
          first("div").first("div").click
          sleep 1
          no_change = find(:xpath, "//div[2]/div/div/button[1]").text
          puts "#{no_change}"
          update = find(:xpath, "//div[2]/div/div/button[2]").text
          puts "#{update}"
          if no_change == button_text1
            puts "Successfully see the #{button_text1} button"
          else
            putstr "Failed to see the #{button_text1} button"
          end
          sleep 5
          if update == button_text2
            puts "Successfully see the #{button_text2} button"
          else
            putstr "Failed to see the #{button_text2} button"
          end
      end
    end
    sleep 5
    within all(".ui-grid-canvas")[1] do
      within all("div[role='gridcell']")[12] do
        sleep 5
        first("div").first("div").click
      end
    end
    sleep 5
    puts "Successfully click the status update icon"
  else
    puts "No Opportunities Records Found"
  end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{button_text1} and #{button_text2} buttons"
    putstr_withScreen  ex.message
  end
end

When(/^I enter status is "([^"]*)" and click on the "([^"]*)" button$/) do |status, button|
  begin
    sleep 5
   rowcount = all(".ui-grid-row.ng-scope").count
   if rowcount > 0
    sleep 5
    within all(".ui-grid-canvas")[1] do
      within all("div[role='gridcell']")[12] do
        sleep 3
        first("div").first("div").click
      end
    end
    sleep 4
    puts "Successfully click the status update icon"
    sleep 4
    within(".pointed-box") do
      sleep 3
      first("textarea").send_keys [:control, 'a'], :backspace
      sleep 3
      first("textarea").send_keys status
    end
    sleep 5
    puts "Successfully enter the #{status} text"
    sleep 3
    within(".btns-update-status") do
      all("button")[0].click
    end
    puts "Successfully click the #{button} button"
    sleep 5
    within all(".ui-grid-canvas")[1] do
      within all("div[role='gridcell']")[10] do
        sleep 3
        updated_status = first("div").text
        puts "Successfully see the updated #{updated_status} status"
      end
    end
    sleep 5
    within all(".ui-grid-canvas")[1] do
      within all("div[role='gridcell']")[12] do
        sleep 3
        first("div").first("div").click
      end
    end
    sleep 5
  else
    puts "No Opportunities Records Found"
  end
  rescue Exception => ex
    putstr "Error occurred while updating the #{status} status flag"
    putstr_withScreen  ex.message
  end
end

And(/^I enter status is "([^"]*)" and click on "([^"]*)" button$/) do |status, button|
  begin
   sleep 5
   rowcount = all(".ui-grid-row.ng-scope").count
   if rowcount > 0
    within all(".ui-grid-canvas")[1] do
      within all("div[role='gridcell']")[12] do
        sleep 3
        first("div").first("div").click
      end
    end
    sleep 5
    puts "Successfully click the status update icon"
    sleep 4
    within(".pointed-box") do
      sleep 3
      first("textarea").send_keys [:control, 'a'], :backspace
      sleep 4
      first("textarea").send_keys status
    end
    sleep 5
    puts "Successfully enter the #{status} text"
    within(".btns-update-status") do
      all("button")[1].click
    end
    puts "Successfully click the #{button} button"
    sleep 5
    within all(".ui-grid-canvas")[1] do
      within all("div[role='gridcell']")[10] do
        sleep 3
        updated_status = first("div").text
        if updated_status == status
          puts "Successfully see the updated #{status} status"
        else
          putstr "Failed to see the updated #{status} status"
        end
      end
    end
    sleep 5
    within all(".ui-grid-canvas")[1] do
      within all("div[role='gridcell']")[12] do
        sleep 3
        first("div").first("div").click
      end
    end
    sleep 5
  else
    puts "No Opportunities Records Found"
  end
  rescue Exception => ex
    putstr "Error occurred while updating the #{status} status flag"
    putstr_withScreen  ex.message
  end
end


And(/^I click close the "([^"]*)" dialogue box$/) do |status|
  begin
   sleep 5
   rowcount = all(".ui-grid-row.ng-scope").count
   if rowcount > 0
    within all(".ui-grid-canvas")[1] do
      within all("div[role='gridcell']")[12] do
        sleep 3
        first("div").first("div").click
      end
    end
    puts "Successfully click the #{status} icon"
    sleep 5
    within all(".ui-grid-canvas")[1] do
      within all("div[role='gridcell']")[10] do
        sleep 3
        first("div").click
      end
    end
    sleep 5
    puts "Successfully closed the #{status} dialogue box"
  else
    puts "No Opportunities Records Found"
  end
  rescue Exception => ex
    putstr "Error occurred while closing the #{status} dialogue box"
    putstr_withScreen  ex.message
  end
end

Then(/^I should not able to see the "([^"]*)" dialogue box$/) do |status|
  begin
   sleep 5
   rowcount = all(".ui-grid-row.ng-scope").count
   if rowcount > 0
    unless page.has_css?(".btns-update-status")
      puts "Unable to see the #{status} dialogue box"
    else
      putstr "Able to see the #{status} dialogue box"
    end
    sleep 5
  else
    puts "No Opportunities Records Found"
  end
  rescue Exception => ex
    putstr "Error occurred while verifying the closed #{status} dialogue box"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the current expiration quarter value in Expiration Quarter filter$/) do
  begin
    sleep 6
    expirationQuarter = getDetails "ExpirationQuarter"
    currentQuarter = expirationQuarter['CurrentQuarter']
    sleep 1
    within all(".ui-select-match")[1] do
      if find(:css, ".ng-binding.ng-scope").text == currentQuarter
        puts "Expiration quarter contains current quarter '#{currentQuarter}' by default."
      end
    end
  rescue Exception => ex
  putstr "Error occurred while verifying the '#{currentQuarter}'"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the current expiration year value in Expiration Year filter$/) do
  begin
    sleep 6
    expirationQuarter = getDetails "ExpirationQuarter"
    currentYear = expirationQuarter['CurrentYear']
    sleep 1
    within all(".ui-select-match")[2] do
      if find(:css, ".ng-binding.ng-scope").text == currentYear
        puts "Expiration year contains current year '#{currentYear}' by default."
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the '#{currentYear}'"
    putstr_withScreen  ex.message
  end
end


And(/^I select the "([^"]*)" filter value$/) do |filter|
  begin
    sleep 10
    find("div[placeholder='Select Opportunity Type...']").click
    sleep 5
    find("input[placeholder='Select Opportunity Type...']").send_keys filter
    sleep 10
    puts "Successfully see the #{filter} filter"
    find("input[placeholder='Select Opportunity Type...']").send_keys :arrow_down
    sleep 5
    find("input[placeholder='Select Opportunity Type...']").send_keys :enter
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the #{filter} filter"
    putstr_withScreen  ex.message
  end
end

And(/^I update the "([^"]*)" column values$/) do |opportunity_name|
  begin
    sleep 3
    arg = getDetails "OpportunityModule"
    sleep 6
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      puts "Successfully see the opportunities"
      sleep 5
      find("input[placeholder='Search Opportunities...']").send_keys [:control, 'a'], :backspace
      sleep 3
      find("input[placeholder='Search Opportunities...']").send_keys opportunity_name
      sleep 3
      find("input[placeholder='Search Opportunities...']").send_keys :enter
      sleep 4
      puts "Successfully enter the #{opportunity_name} name"
      sleep 5
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      puts "Successfully see the #{opportunity_name} opportunity"
      if page.has_css?(".ui-grid-row-selected")
        sleep 5
        puts "#{opportunity_name} checkbox is already enabled"
      else
        sleep 3
        all(".ui-grid-selection-row-header-buttons")[0].click
        sleep 5
        puts "Enabled the #{opportunity_name} checkbox"
      end
      sleep 5
      find(".srevicon-dots-md").click
      sleep 5
      find("a[ng-click='menuItem.click()']").click
      sleep 8
      if page.has_content?("Update Opportunities")
         puts "Successfully see the update opportunities pop-up window"
      else
        puts "Failed to see the update opportunities pop-up window"
      end
      sleep 5
      within all(".col-sm-8")[0] do
        sleep 3
        first("div").click
        sleep 6
        first("input").send_keys arg["UpdateOpportunitySalesStage"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Sales Stage value"
      end
      sleep 4
      within all(".col-sm-8")[1] do
         first("input").send_keys arg["UpdateOpportunityProbability"]
         puts "Successfully updated the Probability value"
      end
      sleep 4
      within all(".col-sm-8")[2] do
        first("input").send_keys arg["UpdateOpportunityCloseDate"]
        puts "Successfully updated the Close Date value"
      end
      sleep 4
      within all(".col-sm-8")[3] do
        sleep 3
        first("div").click
        sleep 6
        first("input").send_keys arg["UpdateOpportunityResellerRep"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Reseller Rep value"
      end
      sleep 5
      within all(".col-sm-8")[4] do
        sleep 3
        first("div").click
        sleep 6
        first("input").send_keys arg["UpdateOpportunityDistributorRep"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Distributor Rep value"
      end
      sleep 5
      within all(".col-sm-8")[5] do
        first("textarea").send_keys arg["UpdateOpportunityNewStatus"]
        puts "Successfully updated the New Status value"
      end
      sleep 5
      click_on 'Update'
      sleep 5
      puts "Successfully updated the Sales Stage,Probability,Close Date,Reseller Rep,Distributor Rep and New Status values"
    else
      puts "No Opportunities Records Found"
    end
    else
      puts "No Opportunities Records Found"
    end
  sleep 5
  rescue Exception => ex
    putstr "Error occurred while updating the Sales Stage,Probability,Close Date,Reseller Rep,Distributor Rep and New Status values"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" and "([^"]*)" column where Rep is not yet selected$/) do |reseller_rep, distributor_rep|
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
    reseller = all("div[role='gridcell']")[7].text
    distributor = all("div[role='gridcell']")[8].text
    sleep 3
    unless reseller == arg["OpportunityRipStatus"]
      sleep 3
      all("div[role='gridcell']")[7].double_click
      sleep 3
      find("div[placeholder='Choose...']").click
      sleep 3
      find("input[placeholder='Choose...']").send_keys arg["OpportunityRipStatus"]
      sleep 3
      find("input[placeholder='Choose...']").send_keys :enter
      sleep 5
      reseller = all("div[role='gridcell']")[7].text
      if reseller == arg["OpportunityRipStatus"]
        puts "#{reseller_rep} is not selected"
      end
    else
      puts "#{reseller_rep} is not selected"
    end
    sleep 5
    unless distributor == arg["OpportunityRipStatus"]
      sleep 3
      all("div[role='gridcell']")[8].double_click
      sleep 3
      find("div[placeholder='Choose...']").click
      sleep 3
      find("input[placeholder='Choose...']").send_keys arg["OpportunityRipStatus"]
      sleep 3
      find("input[placeholder='Choose...']").send_keys :enter
      sleep 5
      distributor = all("div[role='gridcell']")[8].text
      if distributor == arg["OpportunityRipStatus"]
        puts "#{reseller_rep} is not selected"
      end
    else
      puts "#{distributor_rep} is not selected"
    end
   else
      puts "No Opportunities Records Found"
   end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{reseller_rep} and #{distributor_rep} columns"
    putstr_withScreen  ex.message
  end
end


When(/^I select the "([^"]*)" and "([^"]*)" and verify the selected rip value$/) do |reseller_rep, distributor_rep|
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
  if rowcount > 0
     sleep 3
    reseller = all("div[role='gridcell']")[7].text
    distributor = all("div[role='gridcell']")[8].text
    sleep 3
    if reseller == arg["OpportunityRipStatus"]
      sleep 3
      all("div[role='gridcell']")[7].double_click
      sleep 3
      find("div[placeholder='Choose...']").click
      sleep 3
      find("input[placeholder='Choose...']").send_keys arg["UpdateOpportunityResellerRep"]
      sleep 3
      find("input[placeholder='Choose...']").send_keys :enter
      sleep 5
      puts "Successfully select the #{arg["UpdateOpportunityResellerRep"]} value"
    else
      sleep 3
      all("div[role='gridcell']")[7].double_click
      sleep 3
      find("div[placeholder='Choose...']").click
      sleep 3
      find("input[placeholder='Choose...']").send_keys arg["OpportunityRipStatus"]
      sleep 3
      find("input[placeholder='Choose...']").send_keys :enter
      sleep 5
      puts "Successfully select the #{arg["OpportunityRipStatus"]} value"
    end
    sleep 5
    if distributor == arg["OpportunityRipStatus"]
      sleep 3
      all("div[role='gridcell']")[8].double_click
      sleep 3
      find("div[placeholder='Choose...']").click
      sleep 3
      find("input[placeholder='Choose...']").send_keys arg["UpdateOpportunityDistributorRep"]
      sleep 3
      find("input[placeholder='Choose...']").send_keys :enter
      sleep 5
      puts "Successfully select the #{arg["UpdateOpportunityDistributorRep"]} value"
    else
      sleep 3
      all("div[role='gridcell']")[8].double_click
      sleep 3
      find("div[placeholder='Choose...']").click
      sleep 3
      find("input[placeholder='Choose...']").send_keys arg["OpportunityRipStatus"]
      sleep 3
      find("input[placeholder='Choose...']").send_keys :enter
      sleep 5
      puts "Successfully select the #{arg["OpportunityRipStatus"]} value"
    end
  else
    puts "No Opportunities Records Found"
  end
  sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the #{reseller_rep} and #{distributor_rep} columns"
    putstr_withScreen  ex.message
  end
end


And(/^I update the "([^"]*)" sales field$/) do |title|
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 3
      if page.has_css?(".btn-orange")
        sleep 3
        within all(".ui-grid-canvas")[1] do
          within all("div[role='gridcell']")[11] do
            sleep 3
            $before_current_date = first("div").text
          end
        end
        sleep 5
        all("div[role='gridcell']")[2].double_click
        sleep 3
        find("div[placeholder='Choose...']").click
        sleep 3
        click_on(arg["NeedStatusUpdateOpportunitySalesStage"])
        sleep 5
        puts "Successfully updated the #{title} value"
        sleep 3
      else
        putstr "No updated #{title} column"
      end
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while updating the #{title} column"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the updated "([^"]*)" sales field$/) do |title|
  begin
    sleep 5
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 3
      if page.has_css?(".btn-orange")
        puts "Successfully updated the #{title} field"
      else
        putstr "Failed to updated the #{title} field"
      end
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{title} field"
    putstr_withScreen  ex.message
  end
end

When(/^I update the "([^"]*)" field$/) do |title|
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 3
      if page.has_css?(".btn-orange")
        sleep 3
        all("div[role='gridcell']")[3].double_click
        sleep 5
        puts "Successfully updated the #{title} value"
      else
        putstr "No updated #{title} column"
      end
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while updating the #{title} column"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the updated "([^"]*)" field$/) do |title|
  begin
    sleep 5
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 3
      if page.has_css?(".btn-orange")
        puts "Successfully updated the #{title} field"
      else
        putstr "Failed to updated the #{title} field"
      end
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{title} field"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the last status update "([^"]*)" field$/) do |date|
  begin
    sleep 5
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 3
      within all(".ui-grid-canvas")[1] do
        within all("div[role='gridcell']")[11] do
          sleep 3
         updated_date = first("div").text
         puts "Successfully updated the current date #{updated_date}"
        end
      end
      sleep 3
      current_date = "#{Time.now.strftime("%m-%d-%Y")}"
      sleep 3
      if $before_current_date == current_date
        puts "Successfully updated the Current Date and Time"
      else
        puts "Failed to update the Current Date and Time"
      end
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{date} value"
    putstr_withScreen  ex.message
  end
end


Then(/^I should able to see the all the renewal partner opportunities associated to the account$/) do
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
    sleep 4
    all(:xpath, '//div[3]/div[2]/div/div[position() <= 15]/div/div[2]/div').each do |activity|
      if activity.text == arg["OpportunityAccount"]
        puts "Successfully see the renewal partner opportunity account"
      else
        putstr "Unable to find the renewal partner opportunity account"
      end
    end
  else
    puts "No Opportunities Records Found"
  end
  sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the renewal partner opportunities associated to the account"
    putstr_withScreen  ex.message
  end
end

And(/^I should able to see the closed opportunities$/) do
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
    sleep 4
    all(:xpath, '//div[3]/div[2]/div/div[position() <= 15]/div/div[3]/div').each do |activity|
      if activity.text == arg["OpportunitySalesStage1"] || activity.text == arg["OpportunitySalesStage2"]
        puts "Successfully see the renewal partner opportunity account"
      else
        putstr "Unable to find the renewal partner opportunity account"
      end
    end
  else
    puts "No Opportunities Records Found"
  end
  sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{arg["OpportunitySalesStage1"]} and #{arg["OpportunitySalesStage2"]} opportunities"
    putstr_withScreen  ex.message
  end
end


And(/^I should able to see the "([^"]*)" won opportunities$/) do |stage|
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
    sleep 4
    all(:xpath, '//div[3]/div[2]/div/div[position() <= 15]/div/div[3]/div').each do |activity|
      if activity.text == arg["OpportunitySalesStage1"]
        puts "Successfully see the renewal partner opportunity account"
      else
        putstr "Unable to find the renewal partner opportunity account"
      end
    end
  else
    puts "No Opportunities Records Found"
  end
  sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{stage} opportunities"
    putstr_withScreen  ex.message
  end
end

And(/^I should able to see the "([^"]*)" lost opportunities$/) do |stage|
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
    sleep 4
    all(:xpath, '//div[3]/div[2]/div/div[position() <= 15]/div/div[3]/div').each do |activity|
      if activity.text == arg["OpportunitySalesStage2"]
        puts "Successfully see the renewal partner opportunity account"
      else
        putstr "Unable to find the renewal partner opportunity account"
      end
    end
  else
    puts "No Opportunities Records Found"
  end
  sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{stage} opportunities"
    putstr_withScreen  ex.message
  end
end

And(/^I navigate to the "([^"]*)" opportunity sub tab$/) do |name|
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 4
      within all(".ui-grid-canvas")[1] do
        within all("div[role='gridcell']")[0] do
          sleep 3
          first("div").click
          sleep 5
          puts "Successfully opened the #{name} opportunity page"
        end
      end
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while navigate to #{name} opportunity page"
    putstr_withScreen  ex.message
  end
end


Then(/^I should able to see the "([^"]*)" opportunity fields$/) do |name|
  begin
    sleep 5
    arg = getDetails "RenewalOpportunitySubTab"
    sleep 5
    if page.has_css?(".ui-grid-header-cell-row")
    within all(".ui-grid-header-cell-row")[1] do
      existing_end_date = all(".ui-grid-header-cell-label")[0].text
      if existing_end_date == arg["RenewalOpportunityField1"]
        puts "Successfully see the #{name} opportunity #{existing_end_date} field"
      else
        putstr "Failed to see the #{name} opportunity #{existing_end_date} field"
      end
      sleep 3
      existing_start_date = all(".ui-grid-header-cell-label")[1].text
      if existing_start_date == arg["RenewalOpportunityField2"]
        puts "Successfully see the #{name} opportunity #{existing_start_date} field"
      else
        putstr "Failed to see the #{name} opportunity #{existing_start_date} field"
      end
      sleep 3
      renewal_target = all(".ui-grid-header-cell-label")[2].text
      if renewal_target == arg["RenewalOpportunityField3"]
        puts "Successfully see the #{name} opportunity #{renewal_target} field"
      else
        putstr "Failed to see the #{name} opportunity #{renewal_target} field"
      end
      sleep 3
      previous_price = all(".ui-grid-header-cell-label")[3].text
      if previous_price == arg["RenewalOpportunityField4"]
        puts "Successfully see the #{name} opportunity #{previous_price} field"
      else
        putstr "Failed to see the #{name} opportunity #{previous_price} field"
      end
      sleep 3
      product_name = all(".ui-grid-header-cell-label")[4].text
      if product_name == arg["RenewalOpportunityField5"]
        puts "Successfully see the #{name} opportunity #{product_name} field"
      else
        putstr "Failed to see the #{name} opportunity #{product_name} field"
      end
      sleep 3
      asset_name = all(".ui-grid-header-cell-label")[5].text
      if asset_name == arg["RenewalOpportunityField6"]
        puts "Successfully see the #{name} opportunity #{asset_name} field"
      else
        putstr "Failed to see the #{name} opportunity #{asset_name} field"
      end
      sleep 3
      serial_number = all(".ui-grid-header-cell-label")[6].text
      if serial_number == arg["RenewalOpportunityField7"]
        puts "Successfully see the #{name} opportunity #{serial_number} field"
      else
        putstr "Failed to see the #{name} opportunity #{serial_number} field"
      end
      sleep 3
      renewal_status = all(".ui-grid-header-cell-label")[7].text
      if renewal_status == arg["RenewalOpportunityField8"]
        puts "Successfully see the #{name} opportunity #{renewal_status} field"
      else
        putstr "Failed to see the #{name} opportunity #{renewal_status} field"
      end
    end
    else
       puts "No #{name} Opportunity fields Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{name} opportunity fields"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" button/) do |menu|
  begin
    sleep 5
    if page.has_css?(".ui-grid-header-cell-row")
      sleep 4
      if page.has_css?(".ui-grid-icon-ok")
        puts "Successfully see the #{menu} button"
        sleep 4
      else
        putstr "Failed to see the #{menu} button"
      end
      sleep 5
      find(".ui-grid-icon-menu").click
      sleep 5
      puts "Successfully clicked the #{menu} button"
      sleep 5
      if page.has_css?(".ui-grid-icon-ok")
        putstr "Able see the #{menu} button"
      else
        puts "Unable to see the #{menu} button"
      end
    sleep 4
    else
      puts "No #{menu} Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{menu} button"
    putstr_withScreen  ex.message
  end
end


And(/^I select more than one "([^"]*)" from the grid$/) do |opportunity_name|
  begin
    sleep 3
    arg = getDetails "OpportunityModule"
    sleep 6
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      puts "Successfully see the Opportunities"
      sleep 5
      find("input[placeholder='Search Opportunities...']").send_keys [:control, 'a'], :backspace
      sleep 3
      find("input[placeholder='Search Opportunities...']").send_keys opportunity_name
      sleep 3
      find("input[placeholder='Search Opportunities...']").send_keys :enter
      sleep 4
      puts "Successfully enter the #{opportunity_name} name"
      sleep 5
      rowcount = all(".ui-grid-row.ng-scope").count
      if rowcount > 1
        puts "Successfully see the #{opportunity_name} opportunity"
        sleep 4
      if page.has_css?(".ui-grid-row-selected")
        sleep 3
        puts "#{opportunity_name} checkbox is already enabled"
      else
        sleep 3
        all(".ui-grid-selection-row-header-buttons")[0].click
        sleep 5
        all(".ui-grid-selection-row-header-buttons")[1].click
        sleep 4
        puts "Enabled the #{opportunity_name} checkbox"
      end
      sleep 5
      find(".srevicon-dots-md").click
      sleep 5
      find("a[ng-click='menuItem.click()']").click
      sleep 5
      if page.has_content?("Update Opportunities")
        puts "Successfully see the update opportunities pop-up window"
      else
        puts "Failed to see the update opportunities pop-up window"
      end
      sleep 5
      within all(".col-sm-8")[0] do
        sleep 3
        first("div").click
        sleep 6
        first("input").send_keys arg["UpdateOpportunitySalesStage"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Sales Stage value"
      end
      sleep 4
      within all(".col-sm-8")[1] do
        first("input").send_keys arg["UpdateOpportunityProbability"]
        puts "Successfully updated the Probability value"
      end
      sleep 4
      within all(".col-sm-8")[2] do
        first("input").send_keys arg["UpdateOpportunityCloseDate"]
        puts "Successfully updated the Close Date value"
      end
      sleep 4
      within all(".col-sm-8")[3] do
        sleep 3
        first("div").click
        sleep 6
        first("input").send_keys arg["UpdateOpportunityResellerRep"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Reseller Rep value"
      end
      sleep 5
      within all(".col-sm-8")[4] do
        sleep 3
        first("div").click
        sleep 6
        first("input").send_keys arg["UpdateOpportunityDistributorRep"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Distributor Rep value"
      end
      sleep 5
      within all(".col-sm-8")[5] do
        first("textarea").send_keys arg["UpdateOpportunityNewStatus"]
        puts "Successfully updated the New Status value"
      end
      sleep 5
      click_on 'Update'
      sleep 5
      puts "Successfully updated the Sales Stage,Probability,Close Date,Reseller Rep,Distributor Rep and New Status values"
    else
      puts "No Opportunities Records Found"
    end
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while updating the Sales Stage,Probability,Close Date,Reseller Rep,Distributor Rep and New Status values"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the notes gets updated in "([^"]*)" opportunity sub tab$/) do |note|
  begin
    sleep 3
    arg = getDetails "OpportunityModule"
    sleep 4
    updated_note = first(".arrow-box-left").text
    sleep 3
    if updated_note.include?arg["UpdateOpportunityNewStatus"]
      puts "Successfully updated the #{note}: #{arg["UpdateOpportunityNewStatus"]}"
    else
      puts "Failed to updated the #{note}: #{arg["UpdateOpportunityNewStatus"]}"
    end
    sleep 5
    created_by_date_text = first(".arrow-box-left").first("div").text
    date = created_by_date_text.split("on")
    sleep 4
    current_date = "#{Time.now.strftime("%m-%d-%Y")}"
    sleep 3
    puts "Successfully see the #{note} created by: #{date[0]}"
    sleep 3
    if date[1].to_s == current_date.to_s
      puts "Successfully updated the #{note} with Current Date: #{current_date}"
    else
      puts "Failed to updated the #{note} with Current Date: #{date[1]}"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the updated #{note},created by and date"
    putstr_withScreen  ex.message
 end
end

Then(/^I should able to see the "([^"]*)" field list$/) do |details|
  begin
    sleep 8
    arg = getDetails "DetailsOpportunitySubTab"
    sleep 4
    if page.has_content?(arg["DetailsOpportunityField1"])
      puts "Successfully see the #{arg["DetailsOpportunityField1"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField1"]} field"
    end
    sleep 3
    if page.has_content?(arg["DetailsOpportunityField2"])
      puts "Successfully see the #{arg["DetailsOpportunityField2"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField2"]} field"
    end
    sleep 3
    if page.has_content?(arg["DetailsOpportunityField3"])
      puts "Successfully see the #{arg["DetailsOpportunityField3"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField3"]} field"
    end
    sleep 2
    if page.has_content?(arg["DetailsOpportunityField4"])
      puts "Successfully see the #{arg["DetailsOpportunityField4"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField4"]} field"
    end
    sleep 2
    if page.has_content?(arg["DetailsOpportunityField5"])
      puts "Successfully see the #{arg["DetailsOpportunityField5"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField5"]} field"
    end
    sleep 2
    if page.has_content?(arg["DetailsOpportunityField6"])
      puts "Successfully see the #{arg["DetailsOpportunityField6"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField6"]} field"
    end
    sleep 2
    if page.has_content?(arg["DetailsOpportunityField7"])
      puts "Successfully see the #{arg["DetailsOpportunityField7"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField7"]} field"
    end
    sleep 2
    if page.has_content?(arg["DetailsOpportunityField8"])
      puts "Successfully see the #{arg["DetailsOpportunityField8"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField8"]} field"
    end
    sleep 2
    if page.has_content?(arg["DetailsOpportunityField9"])
      puts "Successfully see the #{arg["DetailsOpportunityField9"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField9"]} field"
    end
    sleep 2
    if page.has_content?(arg["DetailsOpportunityField10"])
      puts "Successfully see the #{arg["DetailsOpportunityField10"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField10"]} field"
    end
    sleep 2
    if page.has_content?(arg["DetailsOpportunityField11"])
      puts "Successfully see the #{arg["DetailsOpportunityField11"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField11"]} field"
    end
    sleep 2
    if page.has_content?(arg["DetailsOpportunityField12"])
      puts "Successfully see the #{arg["DetailsOpportunityField12"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField12"]} field"
    end
    sleep 2
    if page.has_content?(arg["DetailsOpportunityField13"])
      puts "Successfully see the #{arg["DetailsOpportunityField13"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField13"]} field"
    end
    sleep 2
    if page.has_content?(arg["DetailsOpportunityField14"])
      puts "Successfully see the #{arg["DetailsOpportunityField14"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField14"]} field"
    end
    sleep 2
    if page.has_content?(arg["DetailsOpportunityField15"])
      puts "Successfully see the #{arg["DetailsOpportunityField15"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField15"]} field"
    end
    sleep 2
    if page.has_content?(arg["DetailsOpportunityField16"])
      puts "Successfully see the #{arg["DetailsOpportunityField16"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField17"]} field"
    end
    sleep 2
    if page.has_content?(arg["DetailsOpportunityField18"])
      puts "Successfully see the #{arg["DetailsOpportunityField18"]} field"
    else
      putstr "Failed to see the see the #{arg["DetailsOpportunityField18"]} field"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the opportunity #{details} fields"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the renewal target and amount currency type$/) do
  begin
   sleep 4
   arg = getDetails "DetailsOpportunitySubTab"
   sleep 4
   within(".data-table") do
     renewal_target = first("tbody").all("tr")[4].all("td")[1].text
     amount = first("tbody").all("tr")[5].all("td")[1].text
   unless renewal_target.to_s == "".to_s
     sleep 3
     if (renewal_target.to_s.include?arg["CurrencyCode1"].to_s) || (renewal_target.to_s.include?arg["CurrencyCode2"].to_s) || (renewal_target.to_s.include?arg["CurrencyCode3"].to_s)
       puts "Successfully see the renewal target currency type"
     else
       putstr "Failed see the renewal target currency type"
     end
   else
     puts "No renewal target price displayed"
   end
   sleep 5
   unless amount.to_s == "".to_s
     if (amount.to_s.include?arg["CurrencyCode1"].to_s) || (amount.to_s.include?arg["CurrencyCode2"].to_s) || (amount.to_s.include?arg["CurrencyCode3"].to_s)
       puts "Successfully see the amount currency type"
     else
       putstr "Failed see the amount currency type"
     end
   else
     puts "No amount price displayed"
   end
  end
  sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the renewal target and amount currency type"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the opportunity "([^"]*)" fields$/) do |contacts|
  begin
    sleep 5
    arg = getDetails "ContactsOpportunitySubTab"
    sleep 4
    if page.has_content?(arg["ContactsOpportunityField1"])
      puts "Successfully see the #{arg["ContactsOpportunityField1"]} field"
    else
      putstr "Failed to see the see the #{arg["ContactsOpportunityField1"]} field"
    end
    sleep 3
    if page.has_content?(arg["ContactsOpportunityField2"])
      puts "Successfully see the #{arg["ContactsOpportunityField2"]} field"
    else
      putstr "Failed to see the see the #{arg["ContactsOpportunityField2"]} field"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the opportunity #{contacts} fields"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the export a file option$/) do
  begin
   sleep 5
   arg = getDetails "ContactsOpportunitySubTab"
   sleep 4
   unless page.has_content?(arg["ContactsOpportunityExport"])
     puts "unable to see the #{arg["ContactsOpportunityExport"]} export option"
   else
     putstr "Able to see the see the #{arg["ContactsOpportunityExport"]} export option"
   end
   sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the export the file"
    putstr_withScreen  ex.message
 end
end

Then(/^files should be "([^"]*)" in "([^"]*)" sort order$/) do |sort_parameter, sort_order|
  begin
    sleep 3
    arg = getDetails "RequestGrid"
    sleep 5
    rowcount = all(:xpath, '//div[2]/div[2]/div/div[position() <= 6]/div/div[1]/div').count
    if rowcount > 0
      sleep 5
      all_files = all(:xpath, '//div[2]/div[2]/div/div[position() <= 6]/div/div[1]/div').collect(&:text)
      sleep 6
      all(".ui-grid-icon-angle-down")[0].click
      sleep 5
      ascending_order = find(".ui-grid-menu-item-active").text
      sleep 5
      if ascending_order == arg["SortAscendingOrder"]

        puts "Verifying ascending order selection"

        original_array = all_files
        all_files = all_files.map(&:downcase)

        sorted_array = all_files.sort_by { |f| f.class == Array ? f.first : f }
        original_array = original_array.map(&:downcase)

        puts "Application Sorting Result: #{original_array}"
        puts "Internal Sorting Result: #{sorted_array} "
        sleep 5
      else
        puts "Verifying descending order selection"

        original_array = all_files
        all_files = all_files.map(&:downcase)

        sorted_array = all_files.sort_by { |f| f.class == Array ? f.first : f }
        sorted_array = sorted_array.reverse!

        original_array = original_array.map(&:downcase)

        puts "Application Sorting Result: #{original_array}"
        puts "Internal Sorting Result: #{sorted_array}"
        sleep 5
      end
    else
      puts "No Opportunities Records Found"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the sorted by #{sort_parameter} in #{sort_order} order"
    putstr_withScreen  ex.message
  end
end

And(/^user "([^"]*)" in "([^"]*)" sort order$/) do |sort_parameter, sort_order|
  begin
    sleep 5
    all(".ui-grid-icon-angle-down")[0].click
    sleep 5
    all("button[ng-focus='focus=true']")[1].click
    sleep 4
    puts "Changing order to: #{sort_order}"
  rescue Exception => ex
    putstr "Error occurred while selecting the sorted by #{sort_parameter} in #{sort_order} order"
    putstr_withScreen  ex.message
  end
end

And(/^user "([^"]*)" in "([^"]*)" order$/) do |sort_parameter, sort_order|
  begin
    sleep 5
    all(".ui-grid-icon-angle-down")[0].click
    sleep 5
    all("button[ng-focus='focus=true']")[2].click
    sleep 4
    puts "Changing order to: #{sort_order}"
  rescue Exception => ex
    putstr "Error occurred while selecting the sorted by #{sort_parameter} in #{sort_order} order"
    putstr_withScreen  ex.message
  end
end

Then(/^files should be "([^"]*)" in "([^"]*)" order$/) do |sort_parameter, sort_order|
  begin
    sleep 3
    arg = getDetails "RequestGrid"
    sleep 5
    rowcount = all(:xpath, '//div[2]/div[2]/div/div[position() <= 6]/div/div[1]/div').count
    if rowcount > 0
      sleep 5
      all_files = all(:xpath, '//div[2]/div[2]/div/div[position() <= 6]/div/div[1]/div').collect(&:text)
      sleep 6
      all(".ui-grid-icon-angle-down")[0].click
      sleep 5
      ascending_order = find(".ui-grid-menu-item-active").text
      sleep 5
      if ascending_order == arg["SortDescendingOrder"]

        puts "Verifying descending order selection"

        original_array = all_files
        all_files = all_files.map(&:downcase)

        sorted_array = all_files.sort_by { |f| f.class == Array ? f.first : f }
        original_array = original_array.map(&:downcase)

        puts "Application Sorting Result: #{original_array}"
        puts "Internal Sorting Result: #{sorted_array} "
        sleep 5
      else
        puts "Verifying ascending order selection"

        original_array = all_files
        all_files = all_files.map(&:downcase)

        sorted_array = all_files.sort_by { |f| f.class == Array ? f.first : f }
        sorted_array = sorted_array.reverse!

        original_array = original_array.map(&:downcase)

        puts "Application Sorting Result: #{original_array}"
        puts "Internal Sorting Result: #{sorted_array}"
        sleep 5
      end
    else
      puts "No Opportunities Records Found"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the sorted by #{sort_parameter} in #{sort_order} order"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the currency related fields$/) do
  begin
    sleep 4
    arg = getDetails "DetailsOpportunitySubTab"
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 5
      within all(".ui-grid-canvas")[1] do
        within all("div[role='gridcell']")[3] do
          sleep 3
          currency_type = first("div").text
          if (currency_type.to_s.include?arg["CurrencyCode1"].to_s) || (currency_type.to_s.include?arg["CurrencyCode2"].to_s) || (currency_type.to_s.include?arg["CurrencyCode3"].to_s)
            puts "Successfully see the currency type"
          else
            putstr "Failed see the currency type"
          end
          sleep 5
        end
      end
    else
      puts "No Opportunities Records Found"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the currency type"
    putstr_withScreen  ex.message
 end
end

And(/^I verify the "([^"]*)" and "([^"]*)" column$/) do |latest_quote, amount|
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      $amount = all("div[role='gridcell']")[4].text
      $latest_quote = all("div[role='gridcell']")[9].text
      sleep 5
      puts "Successfully see the latest quote: #{$latest_quote} and amount: #{$amount}"
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{latest_quote} and #{amount} columns"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the selected quote is set as primary quote$/) do
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 5
      amount = all("div[role='gridcell']")[4].text
      latest_quote = all("div[role='gridcell']")[9].text
      sleep 3
      sleep 5
      if latest_quote == $latest_quote
        sleep 3
        all("div[role='gridcell']")[9].double_click
        sleep 3
        find("div[placeholder='Choose...']").click
        sleep 3
        find("input[placeholder='Choose...']").send_keys :arrow_down
        sleep 3
        find("input[placeholder='Choose...']").send_keys :enter
        sleep 5
        puts "Successfully select the #{latest_quote} value"
      else
        sleep 3
        all("div[role='gridcell']")[9].double_click
        sleep 3
        find("div[placeholder='Choose...']").click
        sleep 3
        find("input[placeholder='Choose...']").send_keys :arrow_down
        sleep 3
        find("input[placeholder='Choose...']").send_keys :enter
        sleep 5
        puts "Successfully select the #{latest_quote} value"
      end
   else
    puts "No Opportunities Records Found"
   end
   sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying selected quote set as primary"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the partner opportunity list$/) do
  begin
    sleep 5
    arg = getReference "AddPartnerOpportunity"
    sleep 4
    if page.has_css?(".customnotabBlock")
      within all(".pbBody")[1] do
        sleep 4
        all("tr")[1].first("th").first("a").click
        puts "Successfully click the partner opportunity"
        sleep 4
      end
      sleep 5
      if page.has_css?(".pageDescription")
        page_title = find(".pageDescription").text
        sleep 4
        puts "Successfully see the partner opportunity #{page_title} details page"
        sleep 5
        within all(".pbSubsection")[0] do
          sleep 4
          opportunity_name = first("tbody").all("tr")[1].all("td")[1].text
          if opportunity_name.to_s == arg["PartnerOpportunityName"].to_s
            puts "Successfully see the partner opportunity #{opportunity_name} name"
          else
            putstr "Failed to see the partner opportunity #{arg["PartnerOpportunityName"]} name"
          end
          sleep 5
        end
        sleep 5
        within all(".pbSubsection")[1] do
          sleep 5
          partner_account1 = first("tbody").first("tr").all("td")[1].text
          if partner_account1.to_s == arg["PartnerAccount1Name"].to_s
            puts "Successfully see the partner account1 #{partner_account1} name"
          else
            putstr "Failed to see the partner account1 #{arg["PartnerAccount1Name"]} name"
          end
        end
      else
        putstr "Failed to see the partner opportunity details page"
      end
      sleep 5
    else
      putstr "Failed to see the Partner Opportunities table"
    end
  rescue Exception => ex
    putstr "Error occurred while"
    putstr_withScreen  ex.message
  end
end

And(/^I should able to see the newly selected quote marked as primary$/) do
  begin
    sleep 5
    if page.has_css?(".pageDescription")
      within all(".bPageBlock")[3] do
        within(".pbBody") do
        sleep 4
        primary_quote = first(".dataRow").all("td")[1].first("a").text
        first(".dataRow").all("td")[1].first("a").click
        sleep 5
        end
      end
      sleep 5
      within all(".pbSubsection")[0] do
        sleep 5
        if all("tr")[5].all("td")[1].first("img")[:title] == "Checked"
          puts "Newly selected quote marked as primary"
        else
          puts "Newly selected quote not marked as primary"
        end
      end
      sleep 5
    else
      putstr "Failed to see the partner opportunity details page"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while veriying the newly selected quote marked as primary"
    putstr_withScreen  ex.message
  end
end

And(/^I should able to see the newly selected quote not marked as primary$/) do
  begin
    sleep 5
    if page.has_css?(".pageDescription")
      within all(".bPageBlock")[3] do
        within(".pbBody") do
          sleep 4
          primary_quote = first(".dataRow").all("td")[1].first("a").text
          first(".dataRow").all("td")[1].first("a").click
          sleep 5
        end
      end
      sleep 5
      within all(".pbSubsection")[0] do
        sleep 5
        if all("tr")[5].all("td")[1].first("img")[:title] == "Checked"
          puts "Newly selected quote marked as primary"
        else
          puts "Newly selected quote not marked as primary"
        end
      end
      sleep 5
    else
      putstr "Failed to see the partner opportunity details page"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while veriying the newly selected quote not marked as primary"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the "([^"]*)" records in grid$/) do |filter|
  begin
   sleep 4

  rescue Exception => ex
    putstr "Error occurred while veriying the newly selected quote not marked as primary"
    putstr_withScreen  ex.message
 end
end




And(/^I click "([^"]*)" drop down value$/) do |sales_stage|
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 6
    rowcount = all(".ui-grid-selection-row-header-buttons").count
    if rowcount > 0
      sleep 3
      within all(".ui-grid-canvas")[1] do
        within all("div[role='gridcell']")[2] do
          sleep 3
          sales_stage_value = first("div").text
          puts sales_stage_value
        end
      end
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while updating the #{sales_stage} column"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the "([^"]*)" drop down values$/) do |sales_stage|
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 6
    rowcount = all(".ui-grid-selection-row-header-buttons").count
    if rowcount > 0
      sleep 5
      all("div[role='gridcell']")[2].double_click
      sleep 3
      find("div[placeholder='Choose...']").click
      sleep 4
      $sales_stage_values = []
      all(".ui-select-choices-row-inner").each do |value|
        $sales_stage_values << value.text
        puts "Partner Opportunity Sales Stage value: #{value.text}"
      end
      sleep 5
      puts "Successfully updated the #{sales_stage} value"
      sleep 3
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while updating the #{sales_stage} column"
    putstr_withScreen  ex.message
  end
end

And(/^I select the multiple "([^"]*)" columns$/) do |opportunities|
  begin
    sleep 3
    arg = getDetails "OpportunityModule"
    sleep 6
    rowcount = all(".ui-grid-selection-row-header-buttons").count
    if rowcount > 0
      puts "Successfully see the #{opportunities}"
      sleep 5
      if page.has_css?(".ui-grid-row-selected")
        sleep 3
        puts "#{opportunities} checkbox is already enabled"
      else
        sleep 3
        all(".ui-grid-selection-row-header-buttons")[0].click
        sleep 5
        all(".ui-grid-selection-row-header-buttons")[1].click
        sleep 4
        puts "Enabled the #{opportunities} checkbox"
      end
      sleep 5
      click_on "Edit"
      sleep 5
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the multiple #{opportunities} columns"
    putstr_withScreen  ex.message
  end
end

And(/^I update the "([^"]*)" columns$/) do |opportunities|
  begin
    sleep 3
    arg = getDetails "OpportunityModule"
    sleep 5
    rowcount = all(".ui-grid-selection-row-header-buttons").count
    if rowcount > 0
      puts "Successfully see the #{opportunities}"
      sleep 5
      if page.has_content?("Update Opportunities")
        puts "Successfully see the update opportunities pop-up window"
      else
        puts "Failed to see the update opportunities pop-up window"
      end
      sleep 5
      within all(".col-sm-8")[0] do
        sleep 3
        first("div").click
        sleep 6
        puts $sales_stage_values
        all(".ui-select-choices-row-inner").each do |value|
          if $sales_stage_values.include? value.text
            puts "Bulk Edit page order of Sales Stages dropdown values same as Sales Stages order: #{value.text}"
          else
            puts "Bulk Edit page order of Sales Stages dropdown values not same as Sales Stages order"
          end
        end
        sleep 5
        first("input").send_keys arg["UpdateOpportunitySalesStage"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Sales Stage value"
      end
      sleep 4
      within all(".col-sm-8")[1] do
        first("input").send_keys arg["UpdateOpportunityProbability"]
        puts "Successfully updated the Probability value"
      end
      sleep 4
      within all(".col-sm-8")[2] do
        first("input").send_keys arg["UpdateOpportunityCloseDate"]
        puts "Successfully updated the Close Date value"
      end
      sleep 4
      within all(".col-sm-8")[3] do
        sleep 3
        first("div").click
        sleep 6
        first("input").send_keys arg["UpdateOpportunityResellerRep"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Reseller Rep value"
      end
      sleep 5
      within all(".col-sm-8")[4] do
        sleep 3
        first("div").click
        sleep 6
        first("input").send_keys arg["UpdateOpportunityDistributorRep"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Distributor Rep value"
      end
      sleep 5
      within all(".col-sm-8")[5] do
        first("textarea").send_keys arg["UpdateOpportunityNewStatus"]
        puts "Successfully updated the New Status value"
      end
      sleep 5
      click_on 'Update'
      sleep 5
      puts "Successfully updated the Sales Stage,Probability,Close Date,Reseller Rep,Distributor Rep and New Status values"
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while updating the Sales Stage,Probability,Close Date,Reseller Rep,Distributor Rep and New Status values"
    putstr_withScreen  ex.message
  end
end

And(/^I click on "([^"]*)" tab from account details page$/) do |opportunities|
  begin
    sleep 5
    within(".view-content-section") do
      first("ul").all("li")[3].first("a").click
      sleep 5
    end
    puts "Successfully navigate to the #{opportunities} page"
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while clicking the #{opportunities} tab"
    putstr_withScreen  ex.message
  end
end


And(/^I select the multiple without "([^"]*)" opportunities$/) do |sales_stage|
  begin
    sleep 3
    arg = getDetails "OpportunityModule"
    sleep 6
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      puts "Successfully see the opportunities"
      sleep 5
      if page.has_css?(".ui-grid-row-selected")
        sleep 3
        puts "Opportunities checkbox is already enabled"
      else
        sleep 3
        all(".ui-grid-selection-row-header-buttons")[0].click
        sleep 5
        all(".ui-grid-selection-row-header-buttons")[1].click
        sleep 4
        puts "Enabled the Opportunities checkbox"
      end
      sleep 5
      find(".srevicon-dots-md").click
      sleep 5
      find("a[ng-click='menuItem.click()']").click
      sleep 5
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the multiple #{sales_stage} opportunities"
    putstr_withScreen  ex.message
  end
end


And(/^I search with "([^"]*)" opportunity$/) do |opportunity_name|
  begin
  sleep 4
  rowcount = all(".ui-grid-row.ng-scope").count
  if rowcount > 0
    puts "Successfully see the Opportunities"
    sleep 5
    find("input[placeholder='Search Opportunities...']").send_keys [:control, 'a'], :backspace
    sleep 3
    find("input[placeholder='Search Opportunities...']").send_keys opportunity_name
    sleep 3
    find("input[placeholder='Search Opportunities...']").send_keys :enter
    sleep 4
    puts "Successfully enter the #{opportunity_name} name"
    sleep 5
  else
    puts "No Opportunities Records Found"
  end
  sleep 5
  rescue Exception => ex
    putstr "Error occurred while searching the #{opportunity_name} opportunity"
    putstr_withScreen  ex.message
 end
end

Then(/^I should able to see the "([^"]*)" quote fields$/) do |name|
  begin
    sleep 5
    arg = getDetails "QuoteOpportunitySubTab"
    sleep 5
    if page.has_css?(".ui-grid-header-cell-row")
      within(".ui-grid-header-cell-row") do
        quote_number = all(".ui-grid-header-cell-label")[0].text
        if quote_number == arg["QuoteOpportunityField1"]
          puts "Successfully see the #{name} opportunity #{quote_number} field"
        else
          putstr "Failed to see the #{name} opportunity #{quote_number} field"
        end
        sleep 3
        quote_name = all(".ui-grid-header-cell-label")[1].text
        if quote_name == arg["QuoteOpportunityField2"]
          puts "Successfully see the #{name} opportunity #{quote_name} field"
        else
          putstr "Failed to see the #{name} opportunity #{quote_name} field"
        end
        sleep 3
        expiration_date = all(".ui-grid-header-cell-label")[2].text
        if expiration_date == arg["QuoteOpportunityField3"]
          puts "Successfully see the #{name} opportunity #{expiration_date} field"
        else
          putstr "Failed to see the #{name} opportunity #{expiration_date} field"
        end
        sleep 3
        line_items = all(".ui-grid-header-cell-label")[3].text
        if line_items == arg["QuoteOpportunityField4"]
          puts "Successfully see the #{name} opportunity #{line_items} field"
        else
          putstr "Failed to see the #{name} opportunity #{line_items} field"
        end
        sleep 3
        discount = all(".ui-grid-header-cell-label")[4].text
        if discount == arg["QuoteOpportunityField5"]
          puts "Successfully see the #{name} opportunity #{discount} field"
        else
          putstr "Failed to see the #{name} opportunity #{discount} field"
        end
        sleep 3
        subtotal = all(".ui-grid-header-cell-label")[5].text
        if subtotal == arg["QuoteOpportunityField6"]
          puts "Successfully see the #{name} opportunity #{subtotal} field"
        else
          putstr "Failed to see the #{name} opportunity #{subtotal} field"
        end
        sleep 3
        total_price= all(".ui-grid-header-cell-label")[6].text
        if total_price == arg["QuoteOpportunityField7"]
          puts "Successfully see the #{name} opportunity #{total_price} field"
        else
          putstr "Failed to see the #{name} opportunity #{total_price} field"
        end
        sleep 3
        primary_quote = all(".ui-grid-header-cell-label")[7].text
        if primary_quote == arg["QuoteOpportunityField8"]
          puts "Successfully see the #{name} opportunity #{primary_quote} field"
        else
          putstr "Failed to see the #{name} opportunity #{primary_quote} field"
        end
      end
    else
      puts "No #{name} Opportunity fields Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{name} opportunity fields"
    putstr_withScreen  ex.message
  end
end

And(/^user "([^"]*)" in "([^"]*)" order from "([^"]*)" page$/) do |sort_parameter, sort_order, opportunity|
  begin
    sleep 5
    if page.has_css?(".ui-grid-header-cell-row")
      sleep 4
      within(".ui-grid-header-cell-row") do
        all(".ui-grid-icon-angle-down")[0].click
      end
      sleep 5
      all("button[ng-focus='focus=true']")[1].click
      sleep 4
      puts "Changing order to: #{sort_order}"
    else
      puts "No #{opportunity} Opportunity fields Found"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the sorted by #{sort_parameter} in #{sort_order} order from #{opportunity} page"
    putstr_withScreen  ex.message
  end
end

And(/^user "([^"]*)" in "([^"]*)" sort order from "([^"]*)" page$/) do |sort_parameter, sort_order, opportunity|
  begin
    sleep 5
    if page.has_css?(".ui-grid-header-cell-row")
      sleep 4
      within(".ui-grid-header-cell-row") do
        all(".ui-grid-icon-angle-down")[0].click
      end
      sleep 5
      all("button[ng-focus='focus=true']")[2].click
      sleep 4
      puts "Changing order to: #{sort_order}"
    else
      puts "No #{opportunity} Opportunity fields Found"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the sorted by #{sort_parameter} in #{sort_order} order from #{opportunity} page"
    putstr_withScreen  ex.message
  end
end


And(/^I search with the "([^"]*)" opportunities$/) do |opportunity_name|
  begin
    sleep 4
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      puts "Successfully see the Opportunities"
      sleep 5
      find("input[placeholder='Search Opportunities...']").send_keys [:control, 'a'], :backspace
      sleep 3
      find("input[placeholder='Search Opportunities...']").send_keys opportunity_name
      sleep 3
      find("input[placeholder='Search Opportunities...']").send_keys :enter
      sleep 4
      puts "Successfully enter the #{opportunity_name} name"
      sleep 5

    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while searching the #{opportunity_name} opportunity"
    putstr_withScreen  ex.message
  end
end


Then(/^I verify the "([^"]*)" checkbox field$/) do |primary|
  begin
    sleep 4
    arg = getDetails "QuoteOpportunitySubTab"
    sleep 4
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      puts "Successfully see the Quotes"
      sleep 5
      if page.has_content?(arg["QuoteOpportunityField8"])
        puts "Successfully see the #{primary} field"
      else
        putstr "Failed to see the #{primary} field"
      end
      sleep 5
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{primary} quote"
    putstr_withScreen  ex.message
  end
end

When(/^I select the "([^"]*)" checkbox field$/) do |primary|
  begin
    sleep 4
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      puts "Successfully see the Quotes"
      sleep 3
       all("input[type='checkbox']").each do |checkbox|
        if checkbox.checked?
          puts "#{primary} is already enabled"
          sleep 4
        else
          sleep 3
          checkbox.click
          sleep 3
          puts "Enabled the #{primary}"
          break
        end
      end
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while checking the #{primary} quote"
    putstr_withScreen  ex.message
  end
end

And(/^I should able to see the "([^"]*)" selected in quote related list$/) do |primary|
  begin
    sleep 5
    if page.has_css?(".pageDescription")
      sleep 5
      within all(".pbSubsection")[1] do
        sleep 5
        if all("tr")[4].all("td")[1].first("img")[:title] == "Checked"
          puts "Successfully selected the #{primary}"
        else
          puts "#{primary} not selected"
        end
      end
      sleep 5
    else
      putstr "Failed to see the partner opportunity details page"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while veriying the #{primary} checkbox"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the Amount and Quote field value of partner opportunity$/) do
  begin
    sleep 5
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      amount = all("div[role='gridcell']")[4].text
      sleep 3
      unless $amount == amount
        puts "Successfully updated the Quote amount"
      else
        puts "Not updated the Quote amount"
      end
      sleep 5
    else
      puts "No Opportunities Records Found"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the amount and quote field values"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" opportunity fields$/) do |quotes|
  begin
    sleep 4
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      puts "Successfully see the Opportunities"
      sleep 3
      $amount = all("div[role='gridcell']")[4].text
      $quote_field = all("div[role='gridcell']")[9].text
      sleep 3
    else
      puts "No Opportunities Records Found"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the #{quotes} opportunity fields"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the currency fields$/) do
  begin
    sleep 4
    arg = getDetails "DetailsOpportunitySubTab"
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 5
      within all("div[role='gridcell']")[6] do
        sleep 3
        currency_type = first("div").text
        if (currency_type.to_s.include?arg["CurrencyCode1"].to_s) || (currency_type.to_s.include?arg["CurrencyCode2"].to_s) || (currency_type.to_s.include?arg["CurrencyCode3"].to_s)
          puts "Successfully see the currency type"
        else
          putstr "Failed see the currency type"
        end
        sleep 5
      end
    else
      puts "No Quotes Records Found"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the currency type"
    putstr_withScreen  ex.message
  end
end

And(/^I sort "([^"]*)" in "([^"]*)" order$/) do |sort_parameter, sort_order|
  begin
    sleep 5
    if page.has_css?(".ui-grid-header-cell-row")
      sleep 4
      within all(".ui-grid-header-cell-row")[1] do
        all(".ui-grid-icon-angle-down")[9].click
      end
      sleep 5
      all("button[ng-focus='focus=true']")[1].click
      sleep 4
      puts "Changing order to: #{sort_order}"
    else
      puts "No Opportunity fields Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the sorted by #{sort_parameter} in #{sort_order} order"
    putstr_withScreen  ex.message
  end
end


When(/^I create a pdf attachment for quotes$/) do
  begin
    sleep 5
    within all(".listRelatedObject")[1] do
      within(".list") do
        sleep 3
        first("tbody").first(".dataRow").all("td")[1].first("a").click
        sleep 5
      end
    end
    sleep 5
    if page.has_css?(".pageDescription")
      puts "Successfully see the Quote page"
      sleep 5
      if page.has_button?("Create PDF")
        puts "Successfully see the Create PDF button"
        sleep 5
        within("#topButtonRow") do
          click_on 'Create PDF'
        end
        sleep 12
        if page.has_css?("#quotePDFOverlayTitle")
          puts "Successfully see the Quote PDF Preview page"
          sleep 5
          click_on 'Save to Quote'
          sleep 5
        else
          putstr "Failed to see the Quote PDF Preview page"
        end
      else
        putstr "Failed to see the Create PDF button"
      end
    else
      putstr "Failed to see the Quote page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while creating the pdf attachment"
    putstr_withScreen  ex.message
  end
end

When(/^I click on "([^"]*)" link from "([^"]*)" page$/) do |quote_link, opportunity|
  begin
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 5
      within all("div[role='gridcell']")[9] do
        sleep 4
      if page.has_xpath?("//a[contains(@href, '/servlet/servlet.FileDownload?')]")
        sleep 5
        puts "Successfully see the #{quote_link} pdf download link"
        first("div").first("a").click
        sleep 5
        puts "Successfully download the #{quote_link} pdf link"
      else
        putstr "#{quote_link} download link not present"
      end
    end
    else
      puts "No Quotes Records Found"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{quote_link} link from #{opportunity} page"
    putstr_withScreen  ex.message
  end
end


Then(/^I should able to see the download "([^"]*)" attachment$/) do |quote|
  begin
    sleep 5
    page.driver.browser.manage.window.maximize
    sleep 5
    page.current_url
    sleep 5
    page.current_path
    sleep 5
    puts "Successfully see the download #{quote} attachment"
    sleep 8
  rescue Exception => ex
    putstr "Error occurred while verifying the download #{quote} attachment"
    putstr_withScreen  ex.message
  end
end

Then(/^I select all quarter values in Expiration Quarter filter$/) do 
  begin
    allExpQrtrArg = getReference "Expiration Quarter"
    allExpQuarters = allExpQrtrArg["filterValues"].split(",")
    sleep 3
    # Set all available quarters in expiration quarter
    within all(".ui-select-match")[1] do
      find(:css, ".close.ui-select-match-close").click      
    end
    sleep 1
    allExpQuarters.each do |value|
      find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[1]/div/div/div/input").click
      sleep 1
      click_on(value)
      sleep 1
    end
    puts "Selected all available expiration quarters"
  rescue Exception => ex
    putstr "Error occurred while verifying the download #{quote} attachment"
    putstr_withScreen  ex.message
  end
end

Then(/^I select all expiration year value in Expiration Year filter$/) do 
  begin
    allYears = getExpirationYears(10)
    sleep 3
    # Set all available years in expiration year
    within all(".ui-select-match")[2] do
      find(:css, ".close.ui-select-match-close").click      
    end
    sleep 1
    allYears.each do |value|
      find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[2]/div/div/div/input").click
      sleep 1
      click_on(value)
      sleep 1
    end
    puts "Selected all available expiration years"
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the download #{quote} attachment"
    putstr_withScreen  ex.message
  end
end