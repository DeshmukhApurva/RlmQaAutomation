#All Requests - Request Predefined Filters specific Step definitions
#All Scenario mentioned in RequestPredefinedFilters.feature

And(/^I check "(.*?)"$/) do |arg|
	begin
		arg1 = getDetails arg
		arg2 = getCredentialInfo
		
		menuOptions = Array.new
		reqStatus = Array.new
		createdBY = Array.new
		
		predefinedFilters = arg1["filters"].split(",")
		defaultValue = arg1["defaultfilter"]
		Status = arg1["status"]
		userName=arg2["Name"]
		
		within all(".ui-select-match")[1] do
			defaultFilter = find(:css, ".ng-binding.ng-scope", :visible=>true).text
			if defaultFilter == defaultValue
				puts "The default filter value present for Request is : #{defaultFilter}"
			else
				puts "Failed to see #{defaultValue} as default value for the predefined filter"
			end
		end
		
		within all(".ui-select-match")[1] do
			find(:css, ".ng-binding.ng-scope").click
		end
		sleep 5
		
		all(".ui-select-choices-row-inner").each do |menu|
			menuOptions << menu.first("span").text
		end
		
		if predefinedFilters.to_a == menuOptions.to_a
			puts "The filter options present for Request are #{menuOptions} "
		else
			putstr "The predefined filter options are not present for Request"
		end
		
		find("input[placeholder='Select Request Type...']").send_keys defaultValue
		puts "Selected #{defaultValue} filter"
		sleep 3
		
		find("input[placeholder='Select Request Type...']").send_keys :enter
		sleep 3
		
		reqStatus = all(:xpath, '//div[2]/div/div/div/div[4]/div').collect(&:text)
		createdBY = all(:xpath, '//div[2]/div/div/div/div[7]/div').collect(&:text)
		
		if reqStatus.size > 0
			unless reqStatus.include? Status
				puts "For filter #{defaultValue}, request status is #{Status}"
			else
				putstr "The Request status for #{defaultValue} is other than #{Status}"
			end	
		else
			puts "No Requests found for filter #{defaultValue} to verify"
		end
		
		if createdBY.size > 0
			if createdBY.include? userName
				puts "All #{defaultValue} belongs to Logged-in user - #{userName}"
			else
				putstr "All #{defaultValue} doesn't belong to Logged-in user"
			end	
		else
			puts "No Requests found for filter #{defaultValue} to verify"
		end
		
	rescue Exception => ex
		putstr "Error while verifying predefined filters on Request tab"
		putstr_withScreen  ex.message
	end
end

And(/^I select "(.*?)"$/) do |arg|
	begin
		within all(".ui-select-match")[1] do
			find(:css, ".ng-binding.ng-scope").click
		end
		sleep 5
		find("input[placeholder='Select Request Type...']").send_keys arg
		sleep 3
		puts "Selected #{arg} filter"
		find("input[placeholder='Select Request Type...']").send_keys :enter
		sleep 3
	rescue Exception => ex
		putstr "Error while selecting predefined filters for Request as #{arg}"
		putstr_withScreen  ex.message
	end
end

And(/^I verify requests for "(.*?)"$/) do |arg|
	begin
		arg1 = getReference "DefaultAccounts"
		arg2 = getCredentialInfo
		reqStatus = Array.new
		createdBY = Array.new
		
		Status = arg1["status"]
		userName = arg2["Name"]
		
		reqStatus = all(:xpath, '//div[2]/div/div/div/div[4]/div').collect(&:text)
		createdBY = all(:xpath, '//div[2]/div/div/div/div[7]/div').collect(&:text)
		
		if reqStatus.size > 0
			if reqStatus.include? Status
				puts "For filter #{arg},request status is #{Status}"
			else
				putstr "The Request status for #{arg} is other than #{Status}"
			end	
		else
			puts "No requests are found for filter #{arg} to verify Status"
		end
		
		if createdBY.size > 0
			if createdBY.include? userName
				puts "All #{arg} belongs to Logged-in user - #{userName}"
			else
				putstr "All #{arg} doesn't belong to Logged-in user"
			end	
		else
			puts "No requests are found for filter #{arg} to verify Logged-in user"
		end
		
	rescue Exception => ex
		putstr "Error while verifying Request for selected filter #{arg}"
		putstr_withScreen  ex.message
	end
end

And(/^I verify "(.*?)" records$/) do |arg|
	begin
		arg1 = getReference "DefaultAccounts"
		reqAccount = Array.new
		reqAccount = all(:xpath, '//div[2]/div/div/div/div[3]/div').collect(&:text)
		
		Account = arg1["account"]
		
		if reqAccount.size > 0
			if reqAccount.include? Account
				puts "The account for #{arg} is #{Account}"
			else
				putstr "The account for #{arg} is other than #{Account}"
			end	
		else
			puts "No requests are found for filter #{arg}"
		end
		
	rescue Exception => ex
		putstr "Error while verifying Request for selected filter #{arg}"
		putstr_withScreen  ex.message
	end
end