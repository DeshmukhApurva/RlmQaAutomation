#All Opportunity Module Features - Step definitions
#All Scenario mentioned in OpportunitiesSyncing.feature

Then (/^I Select the Partner Opportunity with sync "(.*?)" and Update$/) do |argument1|
  begin
  sleep 3
    arg1 = getReference argument1
    presentIndex = Array.new
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
    sleep 4
	find("div[placeholder='Select Opportunity Type...']").click
	sleep 5
	find("input[placeholder='Select Opportunity Type...']").send_keys "New Last Week"
	sleep 3
	puts "Successfully see the New Last Week filter"
	find("input[placeholder='Select Opportunity Type...']").send_keys :arrow_down
	sleep 5
	find("input[placeholder='Select Opportunity Type...']").send_keys :enter
	sleep 5
    find("input[placeholder='Search Opportunities...']").send_keys arg1['Name']
    sleep 3
	find("input[placeholder='Search Opportunities...']").send_keys :enter
	sleep 3
    puts "Successfully see the Partner Agreement Opportunity"
    sleep 2
  rowcount = all(".ui-grid-row.ng-scope").count
  if rowcount > 0
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
   else
    puts "No Opportunities Records Found"
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
    sleep 4
	find("div[placeholder='Select Opportunity Type...']").click
	sleep 5
	find("input[placeholder='Select Opportunity Type...']").send_keys "New Last Week"
	sleep 3
	puts "Successfully see the New Last Week filter"
	find("input[placeholder='Select Opportunity Type...']").send_keys :arrow_down
	sleep 5
	find("input[placeholder='Select Opportunity Type...']").send_keys :enter
	sleep 5
    find("input[placeholder='Search Opportunities...']").send_keys arg1['Name']
    sleep 3
	find("input[placeholder='Search Opportunities...']").send_keys :enter
	sleep 3
    puts "Successfully see the Partner Agreement Opportunity"
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
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
  else
    puts "No Opportunities Records Found"
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

Then (/^I Select the Partner Opportunity to set primary$/) do
  begin
    arg1 = getReference "setPrimary"
    presentIndex = Array.new
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
    sleep 4
	find("div[placeholder='Select Opportunity Type...']").click
	sleep 5
	find("input[placeholder='Select Opportunity Type...']").send_keys "New Last Week"
	sleep 3
	puts "Successfully see the New Last Week filter"
	find("input[placeholder='Select Opportunity Type...']").send_keys :arrow_down
	sleep 5
	find("input[placeholder='Select Opportunity Type...']").send_keys :enter
	sleep 5
    find("input[placeholder='Search Opportunities...']").send_keys arg1['Name']
    sleep 3
	find("input[placeholder='Search Opportunities...']").send_keys :enter
    sleep 3
    puts "Successfully see the Partner Agreement Opportunity"
    sleep 2
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
     within all(".ui-grid-canvas")[1] do
      tr = all(".ui-grid-row")
      tr.each_with_index do |row, index|
        if row.all("div[role='gridcell']")[0].text == arg1['Name']
          row.all("div[role='gridcell']")[0].click
        end
       end
      end
    else
      puts "No Opportunities Records Found"
    end
  rescue Exception=> ex
    puts "Error in selecting the Partner Opportunity to set primary"
    putstr_withScreen  ex.message
  end
end


And(/^I verify the opportunity "([^"]*)" field value$/) do |field_name|
  begin
    sleep 3
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
    within(".data-table") do
      $renewalFieldValue = all("tr")[4].all("td")[2].text
      $amountFieldValue = all("tr")[5].all("td")[2].text
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
     puts "No Opportunities Records Found"
   end
  rescue Exception=>ex
    puts "Error in verifying #{field_name} field values."
    putstr_withScreen  ex.message
  end
end
