#All Opportunity Module Features - Step definitions
#All Scenario mentioned in OpportunitiesSyncing.feature

Then (/^I Select the Partner Opportunity with sync "(.*?)" and Update$/) do |argument1|
  begin
    arg1 = getReference argument1
    presentIndex = Array.new
    within all(".ui-select-match")[1] do
      find(:css, ".ng-binding.ng-scope").click
      sleep 3
    end
    sleep 3
    find("input[placeholder='Select Quarter...']").send_keys "All Quarters"
    sleep 3
    puts "Successfully Set as All Quarters"
    find("input[placeholder='Select Quarter...']").send_keys :enter
    sleep 5
    find("input[placeholder='Search Opportunities...']").send_keys arg1['Name']
    sleep 3
    puts "Successfully see the Partner Agreement Opportunity"
    sleep 2
    within all(".ui-grid-canvas")[1] do
      tr = all(".ui-grid-row")
      tr.each_with_index do |row, index|
        if row.all("div[role='gridcell']")[0].text == arg1['Name']
          presentIndex << index
        end
      end
    end
    if presentIndex.size == 0
      if presentIndex.size == 0
        if page.has_css?(".ui-grid-row-selected")
          sleep 3
          puts "checkbox is already enabled"
        else
          sleep 3
          all(".ui-grid-selection-row-header-buttons")[0].click
          sleep 5
          # all(".ui-grid-selection-row-header-buttons")[1].click
          # sleep 5
          puts "Enabled the checkbox"
        end
    end
    sleep 5
    page.find('.srevicon-dots-md').click
    sleep 3
    page.find('.uib-dropdown-menu').click
    sleep 3
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
        click_on('Update')
        puts "Clicked on Update button"
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
            putstr "Test case failed"
          end
        end
      end
    end
  rescue Exception=> ex
    puts "Error in Selecting the #{argument1} Partner Opportunity"
    putstr_withScreen  ex.message
  end
end

Then (/^I Select the Partner Opportunity and bulkupdate with sync "(.*?)"$/) do |argument1|
  begin
    arg1 = getReference argument1
    presentIndex = Array.new
    within all(".ui-select-match")[1] do
      find(:css, ".ng-binding.ng-scope").click
      sleep 3
    end
    sleep 3
    find("input[placeholder='Select Quarter...']").send_keys "All Quarters"
    sleep 3
    puts "Successfully Set as All Quarters"
    find("input[placeholder='Select Quarter...']").send_keys :enter
    sleep 5
    find("input[placeholder='Search Opportunities...']").send_keys arg1['Name']
    sleep 3
    puts "Successfully see the Partner Agreement Opportunity"
    sleep 2
    within all(".ui-grid-canvas")[1] do
      tr = all(".ui-grid-row")
      tr.each_with_index do |row, index|
        if row.all("div[role='gridcell']")[0].text == arg1['Name']
          presentIndex << index
        end
      end
    end
    if presentIndex.size == 0
      if presentIndex.size == 0
        if page.has_css?(".ui-grid-row-selected")
          sleep 3
          puts "checkbox is already enabled"
        else
          sleep 3
          all(".ui-grid-selection-row-header-buttons")[0].click
          sleep 5
          all(".ui-grid-selection-row-header-buttons")[1].click
          sleep 5
          puts "Enabled the checkbox"
        end
      end
      sleep 5
      page.find('.srevicon-dots-md').click
      sleep 3
      page.find('.uib-dropdown-menu').click
      sleep 3
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
        click_on('Update')
        puts "Clicked on Update button"
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
            putstr "Test case failed"
          end
        end
      end
    end
  rescue Exception=> ex
    puts "Error in Selecting the #{argument1} Partner Opportunity"
    putstr_withScreen  ex.message
  end
end

And (/^I verify Tomaster opportunity$/) do
  begin
    arg1 = getReference "ToMaster"
    within all('.detailList')[0] do
      $MasterOpp = page.find(:id,'opp11_ileinner').text
    end
    within all('.listRelatedObject')[0] do
      tr = all(".dataRow")
      tr.each do |row|
        if row.all(".dataCell")[0].text == arg1["Name"]
          if $MasterOpp == arg1['Sales Stage']
            puts "Sync is successful for the option 'To Master Opportunity'"
          else
            putstr "Sync is unsuccessful for the option 'To Master Opportunity' and Stop sync is enabled"
          end
        end
      end
    end
  rescue Exception=>ex
    puts "Error in verifying the master Opportunity"
    putstr_withScreen  ex.message
  end
end

And (/^I verify master opportunity$/) do
  begin
    arg1 = getReference "FromMaster"
    within all('.detailList')[0] do
      $MasterOpp = page.find(:id,'opp11_ileinner').text
    end
    within all('.listRelatedObject')[0] do
      tr = all(".dataRow")
      tr.each do |row|
        if row.all(".dataCell")[0].text == arg1["Name"]
          if $MasterOpp == arg1['Sales Stage']
            puts "Sync is successful for the option 'To Master Opportunity'"
          else
            putstr "Sync is unsuccessful for the option 'To Master Opportunity' and Stop sync is enabled"
          end
        end
      end
    end
  rescue Exception=>ex
    puts "Error in verifying the master Opportunity"
    putstr_withScreen  ex.message
  end
end