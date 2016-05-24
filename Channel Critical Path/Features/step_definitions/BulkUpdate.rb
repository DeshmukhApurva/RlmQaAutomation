#All Opportunities - Bulk Update specific Step definitions
#All Scenario mentioned in BulkUpdate.feature

And (/^I select the opportunity for field update for "(.*?)"$/) do |data|
	begin		
		arg1 = getDetails data
		find('.srevicon-dots-md').click		
		sleep 3
		if page.has_content?"Edit Selected"
			putstr "BulkUpdate Option is visible,Test case failed"
		else
			puts "BulkUpdate Option is not visible."
		end
		within all(".ui-select-match")[1] do
			find(:css, ".ng-binding.ng-scope").click
			sleep 3
		end
		sleep 5
		find("input[placeholder='Search Opportunities...']").send_keys arg1['PartnerOpportunity']
		sleep 3
		puts "Successfully see the Partner Agreement Opportunity"
		sleep 2		
		find(".ui-grid-disable-selection").click
		sleep 3
		find('.srevicon-dots-md').click		
		sleep 3
		find('.uib-dropdown-menu').click
		sleep 3
	rescue Exception => ex
		puts "Error in selecting the opportunity for field updates"
		putstr_withScreen  ex.message
	end
end

Then (/^I verify the Bulk Update window$/) do 
	begin
    sleep 3
	arg1 = getDetails "BulkUpdate"
	within(".modal-content") do 
		if page.has_content? "Update Opportunities"
			puts "Navigated to Bulk Update edit page"
		else
			putstr "Could not navigate to Bulk Update edit page"
		end		
		if page.has_content?"Sales Stage"			
			within all(".ui-select-match")[0] do
			find(:css, ".ng-binding").click
			sleep 3
			end
			find("input[placeholder='Select or search...']").send_keys arg1["Sales Stage"]
			sleep 3	
			find("input[placeholder='Select or search...']").send_keys :enter
			sleep 5
			puts "Sales Stage field is seen and editable"
		else
			putstr "Sales Stage field is not available"
		end
		if page.has_content?"Probability"
			find("input[ng-model='formData.probability']").set(arg1['Probability'])
			sleep 3
			puts "Probability field is seen and editable"
		else
			putstr "Probability field is not available"
		end
		if page.has_content?"Reseller Rep"			
			within all(".ui-select-match")[1] do
				find(:css, ".ng-binding").click
				sleep 3
			end
			find("input[placeholder='Select or search...']").send_keys arg1["Reseller Rep"]
			sleep 3	
			find("input[placeholder='Select or search...']").send_keys :enter
			sleep 5
			puts "Reseller Rep field is seen and editable"
		else
			putstr "Reseller Rep field is not available"
		end
		if page.has_content?"Distributor Rep"			
			within all(".ui-select-match")[2] do
				find(:css, ".ng-binding").click
				sleep 3
			end
			find("input[placeholder='Select or search...']").send_keys arg1["Distributor Rep"]
			sleep 3	
			find("input[placeholder='Select or search...']").send_keys :enter
			sleep 5
			puts "Distributor Rep field is seen and editable"
		else
			putstr "Distributor Rep field is not available"
		end
		if page.has_content?"New Status"			
			puts "New Status field is seen and editable"
		else
			putstr "New Status field is not available"
		end
		if page.has_css?".glyphicon-calendar"
			find(".glyphicon-calendar").click	
			first('.text-center').click
			puts "Close Date field is seen and has date picker"
		else
			putstr "Close Date field is not available"
		end	
		sleep 5
	end	
	rescue Exception=>ex
		puts "Error in verifying the BulkUpdate window"
		putstr_withScreen ex.message
	end
end

When (/^I click on the "(.*?)" button$/) do |data|
	begin	
		arg1 = getDetails"BulkUpdate"
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
			# find(".ng-valid-date]").set('2017-02-24')
			# sleep 3
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
			# first("textarea").send_keys [:control, 'a'], :backspace
			# sleep 4
			# first("textarea").send_keys arg1['Status']	
			# sleep 2			
			click_on(data)				
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
		sleep 5
	rescue Exception => ex
		puts "Error in performing bulk update"
		putstr_withScreen  ex.message
	end
end

# Then (/^I select one or more the opportunity$/) do 
	# begin		
		# within all(".ui-select-match")[1] do
			# find(:css, ".ng-binding.ng-scope").click
			# sleep 3
		# end
		# sleep 3		
		# find("input[placeholder='Select Quarter...']").send_keys "Q2 2016"
		# sleep 3
		# puts "Successfully Set as All Quarters"
		# find("input[placeholder='Select Quarter...']").send_keys :enter
		# sleep 5			
		# within all(".ui-grid-canvas")[1] do
			# tr = all(".ui-grid-row")			
			# tr.each do |row|
				# begin
					# if row.all("div[role='gridcell']")[12].has_css?'.btn-round-sm.srevicon-pencil.ng-isolate-scope.btn-orange'					
						# puts "NeedStatusUpdate button is present on the page"					
					# else
						# # putstr "NeedStatusUpdate button is not present on the page"
						# # raise "There is no Opportunity to update"
						# # break
						# raise ex
					# end	
				# rescue Exception=>ex
					# page.driver.browser.quit
				# end
			# end			
		# end	
		# rescue Exception => ex
		# puts "Error in selecting one or more the opportunity"
		# putstr_withScreen  ex.message
	# end
# end	

# Then(/^I select one or more the opportunity "([^"]*)" and verify opportunity for "([^"]*)" when status is false$/) do |argument1, argument2|
# begin
	# within all(".ui-select-match")[1] do
		# find(:css, ".ng-binding.ng-scope").click
		# sleep 3
	# end
	# sleep 3		
	# find("input[placeholder='Select Quarter...']").send_keys "Q2 2016"
	# sleep 3
	# puts "Successfully Set as 'Q2 2016'"
	# find("input[placeholder='Select Quarter...']").send_keys :enter	
	# sleep 5	
	# count =0
	# rowcount = all(".ui-grid-row").count
	# if rowcount>0
		# count =1	
		# found = 0
			# within all(".ui-grid-canvas")[1] do
				# tr = all(".ui-grid-row")			
				# tr.each do |row|
					# if row.all("div[role='gridcell']")[12].has_css?'.btn-round-sm.srevicon-pencil.ng-isolate-scope.btn-orange'															
						# found = 0
					# else
						# #------UPDATE
						# if page.has_css?(".ui-grid-row-selected")
							# sleep 3
							# puts "checkbox is already enabled"
						# else
							# sleep 3
							# all(".ui-grid-selection-row-header-buttons")[0].click
							# sleep 5
							# all(".ui-grid-selection-row-header-buttons")[1].click
							# sleep 4
							# puts "Enabled the checkbox"
						# end
						# page.find('.srevicon-dots-md').click		
						# sleep 3
						# page.find('.uib-dropdown-menu').click
						# sleep 3
						# arg1 = getDetails argument2
						# within(".modal-content") do 
							# if page.has_content? "Update Opportunities"
								# puts "Navigated to Bulk Update edit page"
							# else
								# putstr "Could not navigate to Bulk Update edit page"
							# end
							# within all(".ui-select-match")[0] do
								# find(:css, ".ng-binding").click
								# sleep 3
							# end
							# find("input[placeholder='Select or search...']").send_keys arg1["Sales Stage"]
							# sleep 3	
							# find("input[placeholder='Select or search...']").send_keys :enter
							# sleep 5
							# find("input[ng-model='formData.probability']").set(arg1['Probability'])
							# sleep 3
							# # find(".ng-valid-date]").set('2017-02-24')
							# # sleep 3
							# within all(".ui-select-match")[1] do
								# find(:css, ".ng-binding").click
								# sleep 3
							# end
							# find("input[placeholder='Select or search...']").send_keys arg1["Reseller Rep"]
							# sleep 3	
							# find("input[placeholder='Select or search...']").send_keys :enter
							# sleep 5
							# within all(".ui-select-match")[2] do
								# find(:css, ".ng-binding").click
								# sleep 3
							# end
							# find("input[placeholder='Select or search...']").send_keys arg1["Distributor Rep"]
							# sleep 3	
							# find("input[placeholder='Select or search...']").send_keys :enter
							# sleep 5			
							# # first("textarea").send_keys [:control, 'a'], :backspace
							# # sleep 4
							# # first("textarea").send_keys arg1['Status']	
							# # sleep 2			
							# click_on(argument1)	
							# puts "Clicked on #{argument1} button"
						# end	
						# sleep 3
						# if page.has_content?"Opportunities saved successfully."
							# puts "BulkUpdate is completed"
						# else
							# putstr "BulkUpdate is unsuccessful"
						# end
						# within all(".ui-grid-canvas")[1] do
							# within all("div[role='gridcell']")[2] do
								# sleep 3
								# if first("div").text == arg1["Sales Stage"]
									# puts "Updated the Sales Stage to '#{arg1["Sales Stage"]}'."
								# else
									# putstr "Test case failed"
								# end
							# end
						# end
						# #------UPDATE
						# #---Verification
						# arg1 = getDetails argument2		
						# within all(".ui-grid-canvas")[1] do
							# tr = all(".ui-grid-row")			
							# tr.each do |row|				
								# if row.all("div[role='gridcell']")[2].text == arg1["Sales Stage"]
									# puts "Successfully Updated the Sales Stage to '#{arg1["Sales Stage"]}'."				
								# else
									# putstr "Test case failed"					
								# end
							# end			
						# end
						# #---Verfication	
						# found = 1									
					# end	
				# end			
			# end	
	# else
		# count =0
	# end
		# if found == 1
			# putstr "Need Status Update button is present on the page"	
		# else
			# puts "Need Status Update button is not present on the page"
		# end	
		# if count == 1
			# puts "opportunity is present"	
		# else
			# putstr "opportunity is not present"
		# end	
	# rescue Exception => ex
		# puts "Error in selecting one or more the opportunity"
		# putstr_withScreen  ex.message
	# end
# end

# And (/^I verify the changes made in the opportunity grid for "(.*?)"$/) do |data|
	# begin
	# arg1 = getDetails data		
		# within all(".ui-grid-canvas")[1] do
			# tr = all(".ui-grid-row")			
			# tr.each do |row|				
				# if row.all("div[role='gridcell']")[2].text == arg1["Sales Stage"]
					# puts "Successfully Updated the Sales Stage to '#{arg1["Sales Stage"]}'."				
				# else
					# putstr "Test case failed"					
				# end
			# end			
		# end		
	# rescue Exception => ex
		# puts "Error in verifying the changes made in the opportunity grid"
		# putstr_withScreen  ex.message
	# end
# end

Then(/^I select one or more the opportunity "([^"]*)" and verify opportunity for "([^"]*)" when status is false$/) do |argument1, argument2|
begin
	rowcount = 0				
	presentIndex = Array.new
	within all(".ui-select-match")[1] do
		find(:css, ".ng-binding.ng-scope").click
		sleep 3
	end
	sleep 3		
	find("input[placeholder='Select Quarter...']").send_keys "Q2 2016"
	sleep 3
	puts "Successfully Set as 'Q2 2016'"
	find("input[placeholder='Select Quarter...']").send_keys :enter
	sleep 5	
	
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
				# find(".ng-valid-date]").set('2017-02-24')
				# sleep 3
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
				# first("textarea").send_keys [:control, 'a'], :backspace
				# sleep 4
				# first("textarea").send_keys arg1['Status']	
				# sleep 2			
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
			#------UPDATE
			#---Verification
			# arg1 = getDetails argument2		
			# within all(".ui-grid-canvas")[1] do
				# tr = all(".ui-grid-row")			
				# tr.each do |row|				
					# if row.all("div[role='gridcell']")[2].text == arg1["Sales Stage"]
						# puts "Successfully Updated the Sales Stage to '#{arg1["Sales Stage"]}'."				
					# else
						# putstr "Test case failed"					
					# end
				# end			
			# end
			#---Verfication
		else
			puts "Need status button is not visible"			
		end
	else
		puts "No records in the quarter selected"
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
		sleep 5
		find("input[placeholder='Search Opportunities...']").send_keys [:control, 'a'], :backspace
		sleep 2
		find("input[placeholder='Search Opportunities...']").send_keys arg1['PartnerOpportunity']
		sleep 3
		puts "Successfully see the '#{arg1['Name']}' Opportunity"
		sleep 2
		# find(".ui-grid-disable-selection").click
		# sleep 3
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
			#first("textarea").send_keys arg1['Status']
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
		rowcount = 0				
		presentIndex = Array.new
		within all(".ui-select-match")[1] do
			find(:css, ".ng-binding.ng-scope").click
			sleep 3
		end
		sleep 3		
		find("input[placeholder='Select Quarter...']").send_keys "Q2 2016"
		sleep 3
		puts "Successfully Set as 'Q2 2016'"
		find("input[placeholder='Select Quarter...']").send_keys :enter
		sleep 5	
		
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
					# find(".ng-valid-date]").set('2017-02-24')
					# sleep 3
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
					# first("textarea").send_keys [:control, 'a'], :backspace
					# sleep 4
					# first("textarea").send_keys arg1['Status']	
					# sleep 2			
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
				#------UPDATE
				#---Verification
				# arg1 = getDetails argument2		
				# within all(".ui-grid-canvas")[1] do
					# tr = all(".ui-grid-row")			
					# tr.each do |row|				
						# if row.all("div[role='gridcell']")[2].text == arg1["Sales Stage"]
							# puts "Successfully Updated the Sales Stage to '#{arg1["Sales Stage"]}'."				
						# else
							# putstr "Test case failed"					
						# end
					# end			
				# end
				#---Verfication	
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
	within(:id,"topButtonRow") do
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
	within(:id,"topButtonRow") do
		click_on('Save')	
	end
	sleep 3
	within all(".pbSubsection")[0] do
		click_on('PES_CHL_Opp')
	end
	sleep 3
	all(".dataRow")[1].all(".dataCell")[0].click
	sleep 5
	within(:id,"topButtonRow") do
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
	within(:id,"topButtonRow") do
		click_on('Save')	
	end
	rescue Exception => ex
		puts "Error in setting Need Status Update as true"
		putstr_withScreen ex.message
	end
end