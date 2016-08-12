#All Opportunities - Bulk Update specific Step definitions
#All Scenario mentioned in BulkUpdate.feature

And (/^I select the opportunity for field update for "(.*?)"$/) do |data|
  begin
    sleep 3
    arg1 = getDetails data
    sleep 3
    if page.has_css?(".ui-select-match-close")
      sleep 4
      all(".ui-select-match-close").each do |filter|
        filter.click
      end
      sleep 3
    else
      puts "Unable to see the filter values"
    end
    sleep 3
    sleep 10
    find("div[placeholder='Select Opportunity Type...']").click
    sleep 5
    find("input[placeholder='Select Opportunity Type...']").send_keys "New Last Week"
    sleep 3
    puts "Successfully see the New Last Week filter"
    find("input[placeholder='Select Opportunity Type...']").send_keys :arrow_down
    sleep 5
    find("input[placeholder='Select Opportunity Type...']").send_keys :enter
    sleep 5
    find('.srevicon-dots-md').click
    sleep 3
    if page.has_content?"Edit Selected"
      putstr "BulkUpdate Option is visible"
    else
      puts "BulkUpdate Option is not visible"
    end
    sleep 3
    find('.srevicon-dots-md').click
    sleep 4
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      puts "Successfully see opportunities"
      sleep 4
      if page.has_css?(".ui-grid-row-selected")
        sleep 3
        puts "Opportunity checkbox is already enabled"
      else
        sleep 3
        all(".ui-grid-selection-row-header-buttons")[0].click
        sleep 5
        puts "Enabled the Opportunity checkbox"
      end
      sleep 5
      find(".srevicon-dots-md").click
      sleep 5
      find("a[ng-click='menuItem.click()']").click
      sleep 5
    else
      puts "No Opportunities Records Found"
    end
  rescue Exception => ex
    puts "Error in selecting the opportunity for field updates"
    putstr_withScreen  ex.message
  end
end

Then (/^I verify the Bulk Update window$/) do
  begin
    sleep 3
    arg = getDetails "OpportunityModule"
    arg1 = getDetails "BulkUpdate"
    sleep 6
    if page.has_content?("Update Opportunities")
      puts "Successfully see the update opportunities pop-up window"
    else
      puts "Failed to see the update opportunities pop-up window"
    end
    sleep 5
    if page.has_content?"Sales Stage"
      within all(".col-sm-8")[0] do
        sleep 3
        first("div").click
        sleep 6
        first("input").send_keys arg1["Sales Stage"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Sales Stage value"
      end
    else
      putstr "Sales Stage field is not available"
    end
    sleep 4
    if page.has_content?"Probability"
      within all(".col-sm-8")[1] do
        first("input").send_keys arg1['Probability']
        puts "Successfully updated the Probability value"
      end
    else
      putstr "Probability field is not available"
    end
    sleep 3
    if page.has_content?"Reseller Rep"
      within all(".col-sm-8")[3] do
        sleep 3
        first("div").click
        sleep 6
        first("input").send_keys arg1["Reseller Rep"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Reseller Rep value"
      end
    else
      putstr "Reseller Rep field is not available"
    end
    sleep 4
    if page.has_content?"Distributor Rep"
      within all(".col-sm-8")[4] do
        sleep 3
        first("div").click
        sleep 6
        first("input").send_keys arg1["Distributor Rep"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Distributor Rep value"
      end
    else
      putstr "Distributor Rep field is not available"
    end
    sleep 5
    if page.has_content?"New Status"
      puts "New Status field is seen and editable"
    else
      putstr "New Status field is not available"
    end
    sleep 3
    if page.has_css?".glyphicon-calendar"
      within all(".col-sm-8")[2] do
        first("input").send_keys arg["UpdateOpportunityCloseDate"]
        puts "Successfully updated the Close Date value"
      end
    else
      putstr "Close Date field is not available"
    end
    sleep 5
  rescue Exception=>ex
    puts "Error in verifying the BulkUpdate window"
    putstr_withScreen ex.message
  end
end

When (/^I click on the "(.*?)" button$/) do |data|
  begin
    sleep 3
    arg = getDetails "OpportunityModule"
    arg1 = getDetails "BulkUpdate"
    sleep 6
    if page.has_content?("Update Opportunities")
      puts "Successfully see the update opportunities pop-up window"
    else
      puts "Failed to see the update opportunities pop-up window"
    end
    sleep 5
    if page.has_content?"Sales Stage"
      within all(".col-sm-8")[0] do
        sleep 3
        first("div").click
        sleep 6
        first("input").send_keys arg1["Sales Stage"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Sales Stage value"
      end
    else
      putstr "Sales Stage field is not available"
    end
    sleep 4
    if page.has_content?"Probability"
      within all(".col-sm-8")[1] do
        first("input").send_keys arg1['Probability']
        puts "Successfully updated the Probability value"
      end
    else
      putstr "Probability field is not available"
    end
    sleep 3
    if page.has_content?"Reseller Rep"
      within all(".col-sm-8")[3] do
        sleep 3
        first("div").click
        sleep 6
        first("input").send_keys arg1["Reseller Rep"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Reseller Rep value"
      end
    else
      putstr "Reseller Rep field is not available"
    end
    sleep 4
    if page.has_content?"Distributor Rep"
      within all(".col-sm-8")[4] do
        sleep 3
        first("div").click
        sleep 6
        first("input").send_keys arg1["Distributor Rep"]
        sleep 5
        first("input").send_keys :enter
        sleep 5
        puts "Successfully updated the Distributor Rep value"
      end
    else
      putstr "Distributor Rep field is not available"
    end
    sleep 5
    if page.has_content?"New Status"
      puts "New Status field is seen and editable"
    else
      putstr "New Status field is not available"
    end
    sleep 3
    if page.has_css?".glyphicon-calendar"
      within all(".col-sm-8")[2] do
        first("input").send_keys arg["UpdateOpportunityCloseDate"]
        puts "Successfully updated the Close Date value"
      end
    else
      putstr "Close Date field is not available"
    end
    sleep 5
    click_on 'Update'
    sleep 3
    if page.has_content?"Opportunities saved successfully."
      puts "BulkUpdate is completed"
    else
      putstr "BulkUpdate is unsuccessful"
    end
    sleep 3
    within all(".ui-grid-canvas")[1] do
      within all("div[role='gridcell']")[2] do
        sleep 3
        if first("div").text == arg1["Sales Stage"]
          puts "Updated the Sales Stage to '#{arg1["Sales Stage"]}'."
        else
          putstr "Test case failed"
        end
      end
    end
    sleep 5
  rescue Exception => ex
    puts "Error in performing bulk update"
    putstr_withScreen  ex.message
  end
end

Then(/^I select one or more the opportunity "([^"]*)" and verify opportunity for "([^"]*)" when status is false$/) do |argument1, argument2|
  begin
    sleep 3

    allExpQrtrArg = getReference "Expiration Quarter"
    allExpQuarters = allExpQrtrArg["filterValues"].split(",")
    puts allExpQuarters

    allExpYearsArg = getReference "Expiration Year"
    allExpYears = allExpYearsArg["filterValues"].split(",")
    puts allExpYears

    within all(".ui-select-match")[1] do
      if has_selector?(:css, ".close.ui-select-match-close")
        find(:css, ".close.ui-select-match-close").click
      end
    end

    allExpQuarters.each do |value|
      find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[1]/div/div/div/input").click
      click_on(value)
      sleep 1
    end

    within all(".ui-select-match")[2] do
      if has_selector?(:css, ".close.ui-select-match-close")
        find(:css, ".close.ui-select-match-close").click
      end
    end

    allExpYears.each do |value|
      find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[2]/div/div/div/input").click
      click_on(value)
      sleep 1
    end
    sleep 5

    #    allTwoTierData = getReference "TwoTier"
    #
    #    find(:xpath, "//div[2]/div/div[2]/div/div/div[1]/div[5]/input").send_keys [:control, 'a'], :space
    #    sleep 1
    #    find(:xpath, "//div[2]/div/div[2]/div/div/div[1]/div[5]/input").send_keys allTwoTierData["PartnerOpportunity"]
    #    sleep 1

    rowcount = 0
    presentIndex = Array.new
    #    within all(".ui-select-match")[1] do
    #      find(:css, ".ng-binding.ng-scope").click
    #      sleep 3
    #    end
    #    sleep 3
    #    if page.has_css?(".ui-select-match-close")
    #      sleep 4
    #      all(".ui-select-match-close").each do |filter|
    #        filter.click
    #      end
    #      sleep 3
    #    else
    #      puts "Unable to see the filter values"
    #    end
    #    sleep 5
    within all(".ui-grid-canvas")[1] do
      rowcount = all(".ui-grid-row").count
    end

    if rowcount > 0
      within all(".ui-grid-canvas")[1] do
        tr = all(".ui-grid-row")
        tr.each_with_index do |row, index|
          if row.all("div[role='gridcell']")[12].has_css?'.btn-round-sm.srevicon-pencil.ng-isolate-scope.btn-orange'
            presentIndex << index
          end
        end
      end

      if presentIndex.size == 0
        if page.has_css?(".ui-grid-row-selected")
          sleep 3
          puts "checkbox is already enabled"
        else
          sleep 3
          all(".ui-grid-selection-row-header-buttons")[0].click
          sleep 5
          all(".ui-grid-selection-row-header-buttons")[1].click
          sleep 4
          puts "Enabled the checkbox"
        end
        sleep 3
        page.find('.srevicon-dots-md').click
        sleep 3
        page.find('.uib-dropdown-menu').click
        sleep 3
        #--UPDATE
        arg1 = getDetails argument2
        within(".modal-content") do
          if page.has_content? "Update Opportunities"
            puts "Navigated to Bulk Update edit page"
          else
            putstr "Could not navigate to Bulk Update edit page"
          end
          within all(".ui-select-match")[0] do
            find(:css, ".ng-binding").click
            sleep 3
          end
          find("input[placeholder='Select or search...']").send_keys arg1["Sales Stage"]
          sleep 3
          find("input[placeholder='Select or search...']").send_keys :enter
          sleep 5
          find("input[ng-model='formData.probability']").set(arg1['Probability'])
          sleep 3
          within all(".ui-select-match")[1] do
            find(:css, ".ng-binding").click
            sleep 3
          end
          find("input[placeholder='Select or search...']").send_keys arg1["Reseller Rep"]
          sleep 3
          find("input[placeholder='Select or search...']").send_keys :enter
          sleep 5
          within all(".ui-select-match")[2] do
            find(:css, ".ng-binding").click
            sleep 3
          end
          find("input[placeholder='Select or search...']").send_keys arg1["Distributor Rep"]
          sleep 3
          find("input[placeholder='Select or search...']").send_keys :enter
          sleep 5
          click_on(argument1)
          puts "Clicked on #{argument1} button"
        end
        sleep 3
        if page.has_content?"Opportunities saved successfully."
          puts "BulkUpdate is completed"
        else
          putstr "BulkUpdate is unsuccessful"
        end
        within all(".ui-grid-canvas")[1] do
          within all("div[role='gridcell']")[2] do
            sleep 3
            if first("div").text == arg1["Sales Stage"]
              puts "Updated the Sales Stage to '#{arg1["Sales Stage"]}'."
            else
              putstr "could not update the Sales Stage to '#{arg1["Sales Stage"]}'."
            end
          end
        end
      else
        puts "Need status button is not visible"
      end
    else
      puts "No records are selected"
    end
  rescue Exception => ex
    puts "Error in selecting one or more the opportunity #{argument1} and verify opportunity for #{argument2} when status is false"
    putstr_withScreen  ex.message
  end
end

And (/^I update the notes for particular Opportunity$/) do
  begin
    sleep 3
    arg1 = getDetails "NeedStatusUpdate"
    within all(".ui-select-match")[1] do
      find(:css, ".ng-binding.ng-scope").click
      sleep 3
    end
    sleep 3
    if page.has_css?(".ui-select-match-close")
      sleep 4
      all(".ui-select-match-close").each do |filter|
        filter.click
      end
      sleep 3
    else
      puts "Unable to see the filter values"
    end
    sleep 5
    find("input[placeholder='Search Opportunities...']").send_keys [:control, 'a'], :backspace
    sleep 3
    puts "Successfully see the '#{arg1['Name']}' Opportunity"
    sleep 2
    within all(".ui-grid-canvas")[1] do
      within all("div[role='gridcell']")[12] do
        sleep 3
        first("div").first("div").click
        puts "Successfully clicked the Needs Status Update button"
      end
    end
    within(".pointed-box") do
      sleep 3
      first("textarea").send_keys [:control, 'a'], :backspace
      sleep 4
      first("textarea").send_keys arg1['Status']
      all("button")[1].click
      puts "Successfully clicked on No Change button"
    end
    sleep 3
  rescue Exception=> ex
    puts "Error in updating the noted for particular opportunity"
    putstr_withScreen ex.message
  end
end

Then(/^I select one or more the opportunity "([^"]*)" and verify opportunity for "([^"]*)" when status is true$/) do |argument1, argument2|
  begin
    sleep 3

    allExpQrtrArg = getReference "Expiration Quarter"
    allExpQuarters = allExpQrtrArg["filterValues"].split(",")
    puts allExpQuarters

    allExpYearsArg = getReference "Expiration Year"
    allExpYears = allExpYearsArg["filterValues"].split(",")
    puts allExpYears

    within all(".ui-select-match")[1] do
      if has_selector?(:css, ".close.ui-select-match-close")
        find(:css, ".close.ui-select-match-close").click
      end
    end

    allExpQuarters.each do |value|
      find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[1]/div/div/div/input").click
      click_on(value)
      sleep 1
    end

    within all(".ui-select-match")[2] do
      if has_selector?(:css, ".close.ui-select-match-close")
        find(:css, ".close.ui-select-match-close").click
      end
    end

    allExpYears.each do |value|
      find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[2]/div/div/div/input").click
      click_on(value)
      sleep 1
    end
    sleep 5

    #    allTwoTierData = getReference "TwoTier"
    #
    #    find(:xpath, "//div[2]/div/div[2]/div/div/div[1]/div[5]/input").send_keys [:control, 'a'], :space
    #    sleep 1
    #    find(:xpath, "//div[2]/div/div[2]/div/div/div[1]/div[5]/input").send_keys allTwoTierData["PartnerOpportunity"]
    #    sleep 5

    rowcount = 0
    presentIndex = Array.new
    #    within all(".ui-select-match")[1] do
    #      find(:css, ".ng-binding.ng-scope").click
    #      sleep 3
    #    end
    #    sleep 3
    #    if page.has_css?(".ui-select-match-close")
    #      sleep 4
    #      all(".ui-select-match-close").each do |filter|
    #        filter.click
    #      end
    #      sleep 3
    #    else
    #      puts "Unable to see the filter values"
    #    end
    sleep 5
    within all(".ui-grid-canvas")[1] do
      rowcount = all(".ui-grid-row").count
      puts rowcount
    end

    if rowcount > 0
      within all(".ui-grid-canvas")[1] do
        tr = all(".ui-grid-row")
        tr.each_with_index do |row, index|
          if row.all("div[role='gridcell']")[12].has_css?'.btn-round-sm.srevicon-pencil.ng-isolate-scope.btn-orange'
            presentIndex << index
          end
        end
      end
      if presentIndex.size > 0
        presentIndex.each do |rowIndex|
          within all(".ui-grid-canvas")[0] do
            all(".ui-grid-selection-row-header-buttons")[rowIndex.to_i].click
            sleep 2
          end
        end
        page.find('.srevicon-dots-md').click
        sleep 3
        page.find('.uib-dropdown-menu').click
        sleep 3
        #--UPDATE
        arg1 = getDetails argument2
        within(".modal-content") do
          sleep 5
          if page.has_content? "Update Opportunities"
            puts "Navigated to Bulk Update edit page"
          else
            putstr "Could not navigate to Bulk Update edit page"
          end
          within all(".ui-select-match")[0] do
            find(:css, ".ng-binding").click
            sleep 3
          end
          find("input[placeholder='Select or search...']").send_keys arg1["Sales Stage"]
          sleep 3
          find("input[placeholder='Select or search...']").send_keys :enter
          sleep 5
          find("input[ng-model='formData.probability']").set(arg1['Probability'])
          sleep 3
          within all(".ui-select-match")[1] do
            find(:css, ".ng-binding").click
            sleep 3
          end
          find("input[placeholder='Select or search...']").send_keys arg1["Reseller Rep"]
          sleep 3
          find("input[placeholder='Select or search...']").send_keys :enter
          sleep 5
          within all(".ui-select-match")[2] do
            find(:css, ".ng-binding").click
            sleep 3
          end
          find("input[placeholder='Select or search...']").send_keys arg1["Distributor Rep"]
          sleep 3
          find("input[placeholder='Select or search...']").send_keys :enter
          sleep 5
          click_on(argument1)
          puts "Clicked on #{argument1} button"
        end
        sleep 3
        if page.has_content?"Opportunities saved successfully."
          puts "BulkUpdate is completed"
        else
          putstr "BulkUpdate is unsuccessful"
        end
        within all(".ui-grid-canvas")[1] do
          within all("div[role='gridcell']")[2] do
            sleep 3
            if first("div").text == arg1["Sales Stage"]
              puts "Updated the Sales Stage to '#{arg1["Sales Stage"]}'."
            else
              putstr "could not update the Sales Stage to '#{arg1["Sales Stage"]}'."
            end
          end
        end
      else
        putstr "Need status button is not there "
      end
    else
      puts "No records to verify"
    end
  rescue Exception=> ex
    puts "Error in  selecting one or more the opportunity #{argument1} and verify opportunity for #{argument2} when status is true"
    putstr_withScreen ex.message
  end
end

And (/^I set the Needs Status Update as true$/) do
  begin
    all(".dataRow")[0].all(".dataCell")[0].click
    sleep 5
    within(:id,"bottomButtonRow") do
      click_on("Edit")
    end
    sleep 2
    within all(".pbSubsection")[0] do
      if first("input[type='checkbox']").checked?
        puts "set true already"
      else
        first("input[type='checkbox']").click
        puts "not set true"
      end
      sleep 2
    end
    within(:id,"bottomButtonRow") do
      click_on('Save')
    end
    sleep 3
    within all(".pbSubsection")[0] do
      click_on('PES_CHL_Opp')
    end
    sleep 3
    all(".dataRow")[1].all(".dataCell")[0].click
    sleep 5
    within(:id,"bottomButtonRow") do
      click_on("Edit")
    end
    sleep 2
    within all(".pbSubsection")[0] do
      if first("input[type='checkbox']").checked?
        puts "set true already"
      else
        first("input[type='checkbox']").click
        puts "not set true"
      end
      sleep 2
    end
    within(:id,"bottomButtonRow") do
      click_on('Save')
    end
  rescue Exception => ex
    puts "Error in setting Need Status Update as true"
    putstr_withScreen ex.message
  end
end