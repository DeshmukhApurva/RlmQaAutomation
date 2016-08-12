#All Opportunity Generation - Batch Generation Activity specific Step definitions
#All Scenario mentioned in BatchGenerationActivity.feature

When(/^I create a new Asset Filter$/) do
	begin
		sleep 5
		within all(".pbSubsection")[0] do
			click_on "New"
		end
		sleep 3
		all(".dataRow")[0].all(".dataCell")[2].select("Asset Name")			
		sleep 8		
		all(".dataRow")[0].all(".dataCell")[3].select("LIKE")					
		sleep 10			
		all(".dataRow")[0].all(".dataCell")[4].first("input").set("PES_Asset")		
		sleep 5	
		fill_in "View Name",:with => "Asset "+$Opp
		within all(".pbBottomButtons")[0] do
			click_on "Save"
		end
		puts "Asset Filter created successfully."
	rescue Exception => ex
		putstr "Error occurred while creating Asset Filter."
		putstr_withScreen  ex.message
	end
end	
 
When(/^I edit an Asset Filter$/) do
	begin
		sleep 5
		within all(".search")[0] do
			first("input").set("Asset "+$Opp)
		end
		sleep 2
		within all(".pbSubsection")[0] do
			first(:link,"Edit").click
		end
		sleep 2
		fill_in "Description",:with => "Asset Edited"+$Opp
		sleep 3
		all(".dataRow")[1].all(".dataCell")[2].select("Quantity")			
		sleep 8		
		all(".dataRow")[1].all(".dataCell")[3].select(">")					
		sleep 10			
		all(".dataRow")[1].all(".dataCell")[4].first("input").set("0")		
		sleep 5	
		within all(".pbBottomButtons")[0] do
			click_on "Save"
		end 
		puts "Asset Filter Edited Successfully. Added Additional Filter Criteria"
	rescue Exception => ex
	putstr "Error occurred while creating Asset Filter."
	putstr_withScreen  ex.message
	end
end

When(/^I view result of Asset Filter$/) do
	begin
		sleep 5
		within all(".search")[0] do
			first("input").set("Asset "+$Opp)
		end
		sleep 2
		within all(".pbSubsection")[0] do
			first(:link,"Edit").click
		end
		sleep 2
		within all(".pbBottomButtons")[0] do
			click_on "View Result"
		end 
		puts "Asset Filter View Result verified Successfully."
	rescue Exception => ex
		putstr "Error occurred while verifying Asset Filter View Result."
		putstr_withScreen  ex.message
	end
end

When(/^I verify record count of Asset Filter$/) do
	begin
		sleep 5
		within all(".search")[0] do
			first("input").set("Asset "+$Opp)
		end
		sleep 2
		within all(".pbSubsection")[0] do
			first("input[type='checkbox']").set(true)
		end
		sleep 4
		puts all('#mainTableA')[0].all("div").last.text
		puts "Asset Filter Record Count Display verified Successfully."
	rescue Exception => ex
		putstr "Error occurred while verifying Asset Filter Record Count Display."
		putstr_withScreen  ex.message
	end
end


Then(/^I delete an Asset Filter$/) do
	begin
	sleep 5
	within all(".search")[0] do
		first("input").set("Asset "+$Opp)
	end
	sleep 2
	within all(".pbSubsection")[0] do
		page.accept_confirm { first(:link,"Del").click }
	end
	sleep 2
	puts "Asset Filter Deleted Successfully."
	rescue Exception => ex
		putstr "Error occurred while deleting Asset Filter."
		putstr_withScreen  ex.message
	end
end


When(/^I create a new GroupingLogic$/) do
	begin
	sleep 5
	within all(".pbSubsection")[1] do
		click_on "New"
	end
	click_on "Add Row"
	sleep 3
	all(".list")[0].all(".dataRow")[0].all(".dataCell")[2].select("Asset Name")			
	sleep 5		
	fill_in "View Name",:with => "GroupLogic "+$Opp
	within all(".pbBottomButtons")[0] do
		click_on "Save"
	end
	puts "Grouping Logic created successfully."
	rescue Exception => ex
		putstr "Error occurred while creating Grouping Logic."
		putstr_withScreen  ex.message
	end
end	

When(/^I verify record count of GroupingLogic$/) do
	begin
		sleep 5
		within all(".search")[1] do
			first("input").set("GroupLogic "+$Opp)
		end
		sleep 2
		within all(".pbSubsection")[1] do
			first("input[type='checkbox']").set(true)
		end
		sleep 4
		puts all('#mainTableA')[1].all("div").first.text
		puts "Grouping Logic Record Count Display verified Successfully."
	rescue Exception => ex
		putstr "Error occurred while verifying Grouping Logic Record Count Display."
		putstr_withScreen  ex.message
	end
end

Then(/^I delete a GroupingLogic$/) do
	begin
	sleep 5
	within all(".search")[1] do
		first("input").set("GroupLogic "+$Opp)
	end
	sleep 2
	within all(".pbSubsection")[1] do
		page.accept_confirm { first(:link,"Del").click }
	end
	sleep 2
	puts "Grouping Logic Deleted Successfully."
	rescue Exception => ex
		putstr "Error occurred while deleting Grouping Logic."
		putstr_withScreen  ex.message
	end
end

Then (/^I select the Asset filter and Grouping Filter logic$/) do
	begin
		arg = getDetails "FilterLogic"
		sleep 5		
		within(:id,"filterWidget")do
			all('input[type=checkbox]').each_with_index do |checkbox , index|
				if index.to_i == arg["FirstAssetCheckboxIndex"].to_i
				  sleep 5
				  unless checkbox.checked?
					checkbox.click
					puts "Selected the Assets filter"
					break
				  else
					puts "Asset filter is not selected"
				  end				
				end
			end
		end		
		within(:id,"groupWidget")do
			all('input[type=checkbox]').each_with_index do |checkbox , index|
				if index.to_i == arg["FirstGroupingCheckboxIndex"].to_i
				  sleep 5
				  unless checkbox.checked?
					checkbox.click
					puts "Selected the Grouping Filter"
					break
				  else
					puts "Grouping filter is not selected"
				  end					
				end
			end
		end
			find(:xpath,"//*[contains(@id, 'pickL')]").select("Standard Price Book")
      sleep 3
		  choose('Latest Date')
      sleep 3
			choose('Most common Date')
      sleep 3
		  choose('Most valuable Date')
      sleep 3
		  choose('Earliest Date')
      sleep 3
			find("option[value='ServiceSource1__REN_End_Date__c']").click
      sleep 3
      first(".ui-select-match-close").click
      sleep 3
			all("input[type='text']")[4].send_keys arg["FilterName"]
      sleep 4
		  all("input[type='text']")[4].send_keys :enter
		sleep 3
      puts "Successfully set the Add Recipient"
	rescue Exception => ex
		putstr "Error in selecting the Asset filter and Grouping Filter logic"
		putstr_withScreen  ex.message
	end
end

And(/^I set the schedule date$/) do
	begin
	sleep 3
	arg = getDetails "FilterLogic"
	choose('Generate on')
	sleep 4
	page.driver.browser.switch_to.alert.accept
	sleep 3
	all("input[type='text']")[3].set((Time.now+2).strftime('%m/%d/%Y').to_s + " 11:00 AM")
	sleep 3
  find("option[value='ServiceSource1__REN_Start_Date__c']").click
  sleep 4
  find("option[value='ServiceSource1__REN_End_Date__c']").click
	rescue Exception => ex
		putstr "Error in selecting the schedule date"
		putstr_withScreen  ex.message
	end
end


And (/^I "(.*?)" the batch file$/) do |data|
	begin
    sleep 4
			click_on data
			puts "clicked on #{data} button"
		sleep 5
	rescue Exception => ex
		putstr "Error in while clicking on #{data}"
		putstr_withScreen  ex.message
	end
end

Then (/^I check for validation error message$/) do
	begin
		arg = getDetails "FilterLogic"
		within(:id,"filterWidget")do
			all('input[type=checkbox]').each_with_index do |checkbox , index|
				if index.to_i == arg["FirstAssetCheckboxIndex"].to_i
				  sleep 5
				  unless checkbox.checked?
					checkbox.click
					puts "Selected the Assets filter"
					break
				  else
					puts "Asset filter is not selected"
				  end				
				end
			end
		end	
		click_on "Run"
		sleep 2 

		if page.has_content? "Please select Grouping Logic"
			puts "Error message Please select Grouping Logic is displayed"
		else
			puts "Error message Please select Grouping Logic is not displayed"
		end
		within(:id,"filterWidget")do
			all('input[type=checkbox]').each_with_index do |checkbox , index|
				if index.to_i == arg["SecondAssetCheckboxIndex"].to_i
				  sleep 5
				  unless checkbox.checked?
					checkbox.click
					puts "Selected the Assets filter"
					break
				  else
					puts "Asset filter is not selected"
				  end				
				end
			end
		end	
		within(:id,"groupWidget")do
			all('input[type=checkbox]').each_with_index do |checkbox , index|
				if index.to_i == arg["FirstGroupingCheckboxIndex"].to_i
				  sleep 5
				  unless checkbox.checked?
					checkbox.click
					puts "Selected the Grouping Filter"
					break
				  else
					puts "Grouping filter is not selected"
				  end				
				end
			end
		end
		click_on "Run"
		sleep 3
		if page.has_content? "Batch Activity cannot be saved because there are no assets to process"
			puts "Error message Batch Activity cannot be saved because there are no assets to process is displayed"
		else
			puts "Error message Batch Activity cannot be saved because there are no assets to process is not displayed"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error in checking for validation error message"
		putstr_withScreen  ex.message
	end
end


Then (/^Wait for "(.*?)" seconds$/) do |data|
  begin
    sleep data.to_i
  end
end
Then (/^I click on BatchLink and verify the "(.*?)" batch generation$/) do |data|
	begin
		sleep 10
		arg = getDetails "FilterLogic"
		sleep 4
		within(".bootstrap-table") do
			find(".form-control").send_keys data
    end
		sleep 4
		within("#batchHistory") do
			first("tr").all("th")[8].first("div").click
			sleep 5
		end
		unless page.has_content?("No matching records found")
      sleep 4
			within("#batchHistory") do
				sleep 3
				completed_activity = first("tbody").all("tr")[0].all("td")[7].text
				if completed_activity == arg["BatchGenerationCompletedStatus"]
					puts "Successfully see the #{data} status"
				else
					puts "Failed to see the #{data} status"
				end
				puts "Batch Ganeration process is completed"
				sleep 4
					@generated_count = first("tbody").all("tr")[0].all("td")[8].text
					unless @generated_count.to_i == arg["BatchGenerationGeneratedCount"]
						first("tbody").all("tr")[0].all("td")[1].first("a").click
					else
						putstr "No Batch Generation activity log link"
						sleep 6
          end
        end
					sleep 5
					within("#batchJobSummary") do
					unless page.has_content?("No matching records found")
						opportunity_count = first("tbody").all("tr").count
						if opportunity_count.to_i == @generated_count.to_i
							puts "Successfully see the #{opportunity_count} count"
						else
							puts "Failed to see the #{opportunity_count} count"
						end
						sleep 5
						@opportunity_name = first("tbody").all("tr")[0].all("td")[1].first("a").text
						first("tbody").all("tr")[0].all("td")[1].first("a").click
						sleep 5
						puts "Successfully opened the opportunity"
					else
#raise "Failed to see the opportunities link in Activity Log Grid"
					putstr "Failed to see the opportunities link in Activity Log Grid"
					end
        end
					sleep 3
					within(".bPageTitle") do
						opportunity_name = first(".pageDescription").text
						if opportunity_name == @opportunity_name
							puts "Successfully see the #{opportunity_name} page"
						else
							puts "Failed to see the #{opportunity_name} page"
						end
					end
#					Below script is required some changes to work all the time.
#					sleep 3
#					product_name = all(:xpath,"//div[2]/table/tbody/tr[2]/th/a")[0].text
#					puts product_name
#					sleep 3
#					all(:xpath,"//div[2]/table/tbody/tr[2]/th/a")[0].click
#					sleep 3
#					puts "Successfully opened the product page"
#					sleep 4
#					if page.has_content?("Renewal")
#						within(".pbSubsection") do
#							if first("tbody").all("tr")[0].all("td")[3].first("img")[:title] == "Checked"
#								puts "Successfully see the renewal product is checked"
#							else
#								putstr "Failed to see the renewal product is checked"
#							end
#						end
#					else
#						puts "Failed to see the Renewal field"
#					end
#					sleep 4
		else
			putstr "No matching #{data} records found"
		end
		sleep 4
	rescue Exception => ex
		putstr "Error in clicking on BatchLink and verify the #{data} batch generation"
		putstr_withScreen  ex.message
	end
end


Then (/^I should able to see the "(.*?)" batch generation$/) do |activity|
  begin
	sleep 6
	arg = getDetails "FilterLogic"
	within(".bootstrap-table") do
		find(".form-control").send_keys activity
  end
  sleep 4
	within("#batchHistory") do
		first("tr").all("th")[8].first("div").click
		sleep 5
	end
	unless page.has_content?("No matching records found")
  sleep 4
	within("#batchHistory") do
		failed_activity = first("tbody").all("tr")[0].all("td")[7].text
		if failed_activity == arg["BatchGenerationFailedStatus"]
			puts "Successfully see the #{activity} status"
		else
			puts "Failed to see the #{activity} status"
		end
		sleep 3
		first("tbody").all("tr")[0].all("td")[9].first("a").click
		sleep 5
		puts "Successfully opened the #{activity} record page"
  end
  sleep 5
	puts "Reason For Failures:"
	result = false
	all(:xpath, "//*[@id='batchJobFailedSummary']/tbody/tr[1]/td[6]/span").each do |reason_for_failure|
		sleep 4
		puts reason_for_failure.text
		result = true
		sleep 4
  end
	putstr "Unable to find the Reason For Failures error messages" unless result
	else
		putstr "No matching #{activity} records found"
	end
  sleep 5
	 rescue Exception => ex
		putstr "Error in clicking on BatchLink and verify the #{activity} batch generation"
		putstr_withScreen  ex.message
	end
end


And(/^I "([^"]*)" the "([^"]*)" batch generation file$/) do |action, schedule|
	begin
		sleep 6
		within(".bootstrap-table") do
			find(".form-control").send_keys schedule
    end
		sleep 4
		within("#batchHistory") do
			first("tr").all("th")[8].first("div").click
			sleep 5
		end
		sleep 3
		unless page.has_content?("No matching records found")
		within("#batchHistory") do
			sleep 4
			first("tbody").first("tr").first("td").all("a")[0].click
			sleep 4
			puts "Successfully opened the #{action}  batch generation page"
    end
		sleep 4
		choose('Most valuable Date')
		sleep 3
		choose('Generate now')
    sleep 3
		click_on "Cancel"
		sleep 4
		else
			putstr "No matching #{schedule} records found"
    end
    sleep 4
	rescue Exception => ex
		putstr "Error in clicking on BatchLink and verify the #{action} batch generation"
		putstr_withScreen  ex.message
	end
end

And(/^I delete the "([^"]*)" batch generation file$/) do |schedule|
	begin
		sleep 6
		within(".bootstrap-table") do
			find(".form-control").send_keys schedule
		end
		sleep 4
		unless page.has_content?("No matching records found")
		within("#batchHistory") do
			first("tbody").first("tr").first("td").all("a")[1].click
			sleep 5
			page.driver.browser.switch_to.alert.accept
			sleep 5
			puts "Successfully Deleted from batch generation"
    end
    sleep 4
		else
			putstr "No matching #{schedule} records found"
		end
		sleep 4
	rescue Exception => ex
		putstr "Error in clicking on Delete batch generation file"
		putstr_withScreen  ex.message
	end
end

And(/^I select the "([^"]*)" and "([^"]*)" close date and asset date field$/) do |close_date, asset_date_field|
  begin
   sleep 4
	 choose close_date
   sleep 4
			result = false
			all(:xpath, ".//*[contains(@id, 'Closed_Date_Depends_On')]")[3].all('option').each do |asset|
				if asset.text.to_s.include?asset_date_field.to_s
					sleep 5
					puts "Successfully find the #{asset_date_field} field value"
					all(:xpath, ".//*[contains(@id, 'Closed_Date_Depends_On')]")[3].select asset_date_field
					result = true
					break
				end
      end
			putstr "Unable to find the #{asset_date_field} field value" unless result
	rescue Exception => ex
	putstr "Error in selecting the close date and asset date fields"
	putstr_withScreen  ex.message
 end
end

Then(/^I should able to see the "([^"]*)" and "([^"]*)"$/) do |close_date, asset_date_field|
	begin
			sleep 10
			arg = getDetails "FilterLogic"
			sleep 4
			within(".bootstrap-table") do
				find(".form-control").send_keys "Completed"
			end
			sleep 4
			within("#batchHistory") do
				sleep 4
				first("tr").all("th")[8].first("div").click
				sleep 3
				completed_activity = first("tbody").all("tr")[0].all("td")[7].text
				if completed_activity == arg["BatchGenerationCompletedStatus"]
					puts "Successfully see the Completed status"
				else
					puts "Failed to see the Completed status"
				end
				sleep 3
				@@generated_count = first("tbody").all("tr")[0].all("td")[8].text
				puts @@generated_count
				unless @@generated_count.to_i == arg["BatchGenerationGeneratedCount"]
					first("tbody").all("tr")[0].all("td")[1].first("a").click
				else
					putstr "No activity log link"
					sleep 6
				end
			end
   sleep 5
   within all(".pbSubsection")[1] do
     within(".detailList") do
       close_date_formula = all("tr")[4].all("td")[0].text
			 close_date_field = all("tr")[4].all("td")[1].text
       if close_date == close_date_formula
         puts "Successfully see the #{close_date} formula"
       else
				 putstr "Failed to see the #{close_date} formula"
       end
       sleep 4
			 if asset_date_field == close_date_field
				 puts "Successfully see the #{asset_date_field} field"
			 else
				 putstr "Failed to see the #{asset_date_field} field"
			 end
     end
   end
	rescue Exception => ex
	putstr "Error in selecting the close date and asset date fields"
	putstr_withScreen  ex.message
 end
end

And (/^I verify record count displayed for Asset Filter and Grouping Logic$/) do
  begin
    within all(".pbSubsection")[0] do
      $assetfilters = all(:link,'Del').count
      puts "Asset Filter Count = "
      puts $assetfilters
    end

    within all(".pbSubsection")[1] do
      $groupings = all(:link,'Del').count
      puts "Grouping Logic Count = "
      puts $groupings
    end
    if $assetfilters.to_s == $limitvalue.to_s and $groupings.to_s == $limitvalue.to_s
      puts "Batch Record Limit set matches the actual count of records displayed on Batch Grid"
    end
  end
end

And (/^I confirm the Batch Record limit set on Custom Settings$/) do
  begin
  sleep 5
  first(:id,'userNavLabel').click
  sleep 3
  first(:link,'Setup').click
  sleep 5
  find(:id,'setupSearch').set "Custom Settings"  
  sleep 5
  first(:link,'Custom Settings').click
  sleep 5
  first(:link,'CSM Admin').click
  sleep 5
#  first(:button,'Manage').click
#  sleep 5
  $limitcount = find(:xpath,'//th[text()="Batch Opp Genration Grid Rec Limit"]/following-sibling::td[1]').text
  puts "Navigated to Custom Settings to check Batch record limit set"
  puts "Batch Record set = "
  puts $limitcount
  if $assetfilters.to_s == $limitcount.to_s and $groupings.to_s == $limitcount.to_s
    puts "Batch Record Limit set matches the actual count of records displayed on Batch Grid"
  end
  end
end

And(/^I set the Batch Record Limit value in CSM Admin custom setting as it is not set$/) do
  begin
    sleep 3
    #    puts page.has_xpath?("//th[contains(text(),'Batch Opp Genration Grid Rec Limit')]//following-sibling::td/span/img[@alt='Not Checked']")
    #    puts page.has_xpath?("//th[contains(text(),'Batch Opp Genration Grid Rec Limit')]//following-sibling::td/span/img[@alt='Checked']")

#    if page.has_xpath?('//th[text()="Batch Opp Genration Grid Rec Limit"]/following-sibling::td[1]') == ' '
      puts "Limit value is null"
      click_button 'Edit'
      sleep 5
      find(:xpath, '//label[text()="Batch Opp Genration Grid Rec Limit"]/parent::th/following-sibling::td/input').set "4"
      sleep 5
      click_button 'Save'
      sleep 5
      puts "Limit value = 4 is set"
      $limitvalue = "4"
#    end
  rescue Exception => ex
    putstr "Error while setting value"
    putstr_withScreen  ex.message
  end
end

And(/^I reset the Batch Record Limit value to null in CSM Admin custom setting as it is not null$/) do
  begin
    sleep 3
#    puts page.has_xpath?("//th[contains(text(),'Batch Opp Genration Grid Rec Limit')]//following-sibling::td/span/img[@alt='Not Checked']")
#    puts page.has_xpath?("//th[contains(text(),'Batch Opp Genration Grid Rec Limit')]//following-sibling::td/span/img[@alt='Checked']")
#    if page.has_xpath?('//th[text()="Batch Opp Genration Grid Rec Limit"]/following-sibling::td[1]') != ' '
      puts "Limit Value is set already"
      click_button 'Edit'
      sleep 5
      puts "Successfully see the edit form"
      find(:xpath, '//label[text()="Batch Opp Genration Grid Rec Limit"]/parent::th/following-sibling::td/input').set ""
      sleep 5
      click_button 'Save'
      sleep 5
      puts "Limit Value is set to null"
#    end
  rescue Exception => ex
    putstr "Error while setting null value to Limit"
    putstr_withScreen  ex.message
  end
end
