#All Play and Playbook Specific Step Definitions
#All Scenario mentioned in Plays.feature

And(/^create a new Play$/) do
	begin
		arg = getDetails "Play Details"
		click_link('Plays')
		puts "Opened Plays Page successfully"
		sleep 2
		click_on "Create Play"
		sleep 2
		fill_in "Display Name",:with => arg["Display Name"]
		fill_in "Short Description",:with => arg["Short Description"]
		find(:xpath, "//*[contains(@id, 'slObjectId')]").select(arg["Object"])
		all('.btn')[0].click
		sleep 5
		puts "Successfully created Play" 
		if page.has_content?('Define Play Criteria')
				puts "Define Play Criteria section displayed"
				sleep 3
		else
			raise "Define Play Criteria section not displayed"
		end
		if page.has_content?('Define Play Tasks')
				puts "Define Play Tasks section displayed"
				sleep 3
		else
			raise "Define Play Tasks section not displayed"
		end
		sleep 10
		amt = 500000
		if all(".dataRow").count > 0
			all(".dataRow").each do |row|
				if row.all("td")[1].text == "Annual Revenue"
					row.first(:link,"Delete").click
					break
				end
			end
		end
		first(:xpath, "//*[contains(@id, 'slFieldId')]").select("Annual Revenue")
		sleep 8
		first(:xpath, "//*[contains(@id, 'outOperator')]").select(">")
		sleep 8
		first(:xpath, "//*[contains(@id, 'outValue')]").set(amt)	
		sleep 8
		first(:xpath, "//*[contains(@id, 'outValue')]").set(amt)
		all('.btn')[0].click
		sleep 10
		if page.has_content?('Play Criteria have been saved')
				puts "Play Criteria have been saved"
				sleep 3
		else
			raise "Play Criteria have been saved message not displayed"
		end
		click_on "Add Task"
		sleep 10
		taskArg = getDetails "Play Tasks"
		all(:xpath, "//*[contains(@id, 'inputName')]").last.set(taskArg["TaskName"])
		all(:xpath, "//*[contains(@id, 'playTaskComp:playTaskComp:pb1:taskList:0:coltype')]").last.select(taskArg["Type"])
		all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDesc')]").last.set(taskArg["Description"])
		all(".dataRow").last.all("td")[5].first("select").select(taskArg["AssignTo"])
		all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDays')]").last.set(taskArg["Days"])
		all('.btn')[0].click
		sleep 10
		if page.has_content?('Play Tasks have been saved')
				puts "Play Tasks have been saved message displayed"
				sleep 3
		else
			raise "Play Tasks have been saved message not displayed"
		end
    rescue Exception => ex
		putstr "Error occurred while creating a Play"
		putstr_withScreen ex.message
	end
end

Then(/^edit a Play$/) do
	begin
		arg = getDetails "Play Details"
		click_link('Plays')
		puts "Opened Plays Page successfully"
		sleep 2
		fill_in "Search:",:with => arg["Display Name"]
		sleep 4
		all(".dataRow").last.all("td")[0].first(:link,"Edit").click
		sleep 5
		fill_in "Short Description",:with => arg["Short Description"] + " updated"
		all('.btn')[0].click
		sleep 5
		puts "Successfully Edited Play" 
		if page.has_content?('Play has been saved')
			puts "Play has been saved message displayed after saving"
			sleep 3
		else
      putstr "Play has been saved message not displayed"
		end
    rescue Exception => ex
		putstr "Error occurred while editing a Play"
		putstr_withScreen ex.message
	end
end

Then(/^delete a Play$/) do
	begin
		arg = getDetails "Play Details"
		click_link('Plays')
		puts "Opened Plays Page successfully"
		sleep 2
		fill_in "Search:",:with => arg["Display Name"]
		sleep 4
		if all(".dataRow").count > 0
			all(".dataRow").last.all("td")[0].first(:link,"Delete").click
			sleep 3
			begin
				driver.switch_to.alert.accept
				# driver.switch_to.alert.confirm
			rescue Exception => ex
				puts "Delete confirmation not displayed"
			end
		end
		sleep 5
		puts "Successfully Deleted Play"
    sleep 5
  rescue Exception => ex
		putstr "Error occurred while deleting a Play"
		putstr_withScreen ex.message
	end
end

Then(/^delete a PlaywithConfirm$/) do
	begin
		arg = getDetails "PlayforPB Details"
		click_link('Plays')
		puts "Opened Plays Page successfully"
		sleep 2
		fill_in "Search:",:with => arg["Display Name"]
		sleep 4
		begin
			all(".dataRow").last.all("td")[0].first(:link,"Delete").click
			sleep 3
			puts page.driver.browser.switch_to.alert.text + " message displayed in confirmation dialog." rescue Selenium::WebDriver::Error::NoAlertOpenError
			puts "Delete confirmation page with list/count of Playbooks that Play is present is displayed."
			page.driver.browser.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
		rescue
			puts "Record deleted"
		end
		foundCount = "First record found with match " + arg["Display Name"] + " deleted"
		sleep 5
		puts "Successfully Deleted Play" 
		if page.has_content?('Play has been deleted')
			puts "Play has been deleted message displayed after deletion"
			sleep 3
		else
			raise "Play has been deleted message not displayed after deletion"
		end
    rescue Exception => ex
		putstr "Error occurred while deleting a Play"
		putstr_withScreen ex.message
	end
end

Then (/^I create a new Indicator Group$/) do
	begin
		arg = getDetails "IndicatorGroup"
		sleep 5
		click_link('Indicator Groups')
		sleep 5
		if all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").count == 0
			click_on "Add Indicator Group"
			sleep 2
			within_window(page.driver.browser.window_handles.last) do
				find(:xpath, "//*[contains(@id, 'itIndicatorGroupNameId')]").set(arg["Name"])
				find('#saveNewIndicatorGroupButtonId').click
			end
			sleep 10
			puts arg["Group Name"] + " Indicator Group created successfully."
			sleep 5
			all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Account")
			sleep 3
			all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Annual Revenue")
			click_on "Add Field"
			sleep 4
			all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Opportunity")
			sleep 3
			all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Expected Amount")
			click_on "Add Field"
			sleep 4
			all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Contact")
			sleep 3
			all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Level")
			click_on "Add Field"
			sleep 4
			click_on "Save"
			if page.has_content?('Indicators have been saved')
			puts "Indicators have been saved message displayed after saving"
			sleep 3
		else
			raise "Indicators have been saved message not displayed"
		end
		else
			puts "Indicator Group already exists"
		end
		sleep 3
	rescue Exception => ex
		putstr "Error occurred while Creating an Indicator Group"
		putstr_withScreen ex.message
	end
end

Then (/^I add indicators$/) do
begin
	sleep 5
	click_link('Indicator Groups')
	sleep 5
  if all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").count == 0
    sleep 3
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Account")
    sleep 3
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Annual Revenue")
    click_on "Add Field"
    sleep 4
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Opportunity")
    sleep 3
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Expected Amount")
    click_on "Add Field"
    sleep 4
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Contact")
    sleep 3
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Level")
    sleep 4
    click_on "Add Field"
    sleep 4
    click_on "Save"
    puts "Indicators have been added"
    sleep 5
    if page.has_content?('Indicators have been saved')
      puts "Indicators have been saved message displayed after saving"
      sleep 3
    else
      putstr "Indicators have been saved message not displayed"
    end
  else
    puts "Indicator Group already exists"
  end
  sleep 3
	rescue Exception => ex
		putstr "Indicators Already exist"
	end
end

And(/^create a new Playbook$/) do
	begin
		arg = getDetails "PlayBook Details"
		sleep 5
		click_link('Playbooks')
		puts "Clicked Playbooks successfully"
		sleep 2
		click_on "Create New"
		sleep 10
		arg.each do |key,val|
			fill_in key,:with => val
		end
		all('.btn')[0].click
		sleep 4
		puts "Successfully created Playbook" 
		if page.has_content?('Define Playbook Plays')
				puts "Define Playbook Plays section displayed"
				sleep 3
		else
			raise "Define Playbook Plays section not displayed"
		end
		click_on "Add Play"
		sleep 5
		arg1 = getDetails "Play Details"
		sleep 3
		addFound = 0
		all(".dataRow").each do |tr|
			if tr.all(".dataCell")[1].text == arg1['Display Name']
				tr.all(".dataCell")[0].all('a')[0].click
				addFound = 1
				break
			end
		end
		if addFound == 0
			click_on "Cancel"
			sleep 5
			click_on "Create Play"
			sleep 2
			fill_in "Display Name",:with => arg1["Display Name"]
			fill_in "Short Description",:with => arg1["Short Description"]
			find(:xpath, "//*[contains(@id, 'slObjectId')]").select(arg1["Object"])
			all('.btn')[0].click
			sleep 5
			puts "Successfully created Play" 
			if page.has_content?('Define Play Criteria')
					puts "Define Play Criteria section displayed"
					sleep 3
			else
				raise "Define Play Criteria section not displayed"
			end
			if page.has_content?('Define Play Tasks')
					puts "Define Play Tasks section displayed"
					sleep 3
			else
				raise "Define Play Tasks section not displayed"
			end
			sleep 10
			amt = 500000
			if all(".dataRow").count > 0
				all(".dataRow").each do |row|
					if row.all("td")[1].text == "Annual Revenue"
						row.first(:link,"Delete").click
						break
					end
				end
			end
			first(:xpath, "//*[contains(@id, 'slFieldId')]").select("Annual Revenue")
			sleep 8
			first(:xpath, "//*[contains(@id, 'outOperator')]").select(">")
			sleep 8
			first(:xpath, "//*[contains(@id, 'outValue')]").set(amt)	
			sleep 8
			all('.btn')[0].click
			sleep 10
			if page.has_content?('Play Criteria have been saved')
					puts "Play Criteria have been saved"
					sleep 3
			else
				raise "Play Criteria have been saved message not displayed"
			end
			click_on "Add Task"
			sleep 10
			taskArg = getDetails "Play Tasks"
			all(:xpath, "//*[contains(@id, 'inputName')]").last.set(taskArg["TaskName"])
			all(:xpath, "//*[contains(@id, 'playTaskComp:playTaskComp:pb1:taskList:0:coltype')]").last.select(taskArg["Type"])
			all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDesc')]").last.set(taskArg["Description"])
			all(".dataRow").last.all("td")[4].first("select").select(taskArg["AssignTo"])
			all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDays')]").last.set(taskArg["Days"])
			all('.btn')[0].click
			sleep 10
			if page.has_content?('Play Tasks have been saved')
					puts "Play Tasks have been saved message displayed"
					sleep 3
			else
				raise "Play Tasks have been saved message not displayed"
			end
			sleep 2
			all('.btn')[2].click
			puts "Created Play and added Play to Playbook"
		end
		sleep 3
		found = 0
		fill_in "Search:",:with => arg1["Display Name"]
		sleep 2
		all(".dataRow").each do |tr|
			if tr.all(".dataCell")[1].text == arg1['Display Name']
			   found = 1
			   break
			end
		end
		if found==1
			puts "#{arg1['Display Name']} Play added to Playbook and displayed in Play grid"
		else
			raise "#{arg1['Display Name']} Play not displayed in Play grid"
		end
    rescue Exception => ex
		putstr "Error occurred while creating Playbook"
		putstr_withScreen ex.message
	end
end

And(/^create a new Play from Playbook$/) do
	begin
    sleep 3
		arg1 = getDetails "PlayBook Details"
    arg = getDetails "PlayforPB Details"
		sleep 5
		click_on 'Playbooks'
		puts "Playbooks link clicked"
		sleep 15
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
			  if row.all("td")[1].text == arg1["Display Name"]
				row.all("td")[0].all('a')[0].click
				break
			  end	
			end
		end
		puts "Created Playbook opened"
		sleep 3
		click_on "Create Play"
		sleep 4
		fill_in "Display Name",:with => arg["Display Name"]
    sleep 4
		fill_in "Short Description",:with => arg["Short Description"]
    sleep 5
		find(:xpath, "//*[contains(@id, 'slObjectId')]").select(arg["Object"])
    sleep 4
		all('.btn')[0].click
		sleep 5
		puts "Successfully created Play" 
  rescue Exception => ex
		 putstr "Error occurred while creating a Play from Playbook"
		 putstr_withScreen ex.message
	end
end

Then(/^verify if Play is associated with Playbook$/) do
begin
	arg = getDetails "PlayBook Details"
	sleep 10
	click_on 'Playbooks'
	puts "Playbooks link clicked"
	sleep 15
	within('.list') do
		tr = first("tbody").all("tr")
		tr.each do |row|
		  if row.all("td")[1].text == arg["Display Name"]
			row.all("td")[0].all('a')[0].click
			break
		  end	
		end
	end
	puts "Playbook opened"
	arg1 = getDetails "PlayforPB Details"
	sleep 3
	fill_in "Search:",:with => arg1["Display Name"]
	sleep 2
	found = 0
	all(".dataRow").each do |tr|
		if tr.all(".dataCell")[1].text == arg1['Display Name']
		   found = 1
		   break
		end
	end
	if found == 1
		puts "#{arg1['Display Name']} Play associated to Playbook and displayed in Play grid"
	else
		raise "#{arg1['Display Name']} Play not associated to Playbook and not displayed in Play grid"
  end
  sleep 5
  rescue Exception => ex
		putstr "Error occurred while verifying Create Play from Playbook"
		putstr_withScreen ex.message
	end
end

Then(/^clone a Playbook$/) do
	begin
		arg = getDetails "PlayBook Details"
		sleep 5
		click_on 'Playbooks'
		puts "Playbooks link clicked"
		sleep 15
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
			  if row.all("td")[1].text == arg["Display Name"]
				row.all("td")[0].first(:link,"Clone").click
				break
			  end	
			end
		end
		puts "Clone clicked"
		sleep 10
		found = 0
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
			  if row.all("td")[1].text == "Clone of "+arg["Display Name"]
				found = 1
				break
			  end	
			end
		end
		sleep 10
		puts "Playbook Cloned successfully. Playbook <b>Clone of #{arg['Display Name']}</b> created"
	rescue Exception => ex
		putstr "Error while Viewing Playbook"
		putstr_withScreen ex.message
	end
end

Then(/^I view the created Playbook$/) do
	begin
		arg = getDetails "PlayBook Details"
		sleep 5
		click_on 'Playbooks'
		puts "Playbooks link clicked"
		sleep 15
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
			  if row.all("td")[1].text == arg["Display Name"]
				row.all("td")[0].all('a')[0].click
				break
			  end	
			end
		end
		puts "Created Playbook opened"
		var = all('.detailList')[0]
		within(var) do
			sleep 5
			arg.each do |key,val|
				page.should have_field(key, with: val)
				puts "Verified   " + key + ":  " + val
			end
		end
		sleep 10
		puts "Created Playbook verified successfully"
	rescue Exception => ex
		putstr "Error while Viewing Playbook"
		putstr_withScreen ex.message
	end
end

Then(/^I Delete a Playbook$/) do
	begin
		arg = getDetails "PlayBook Details"
		sleep 5
		click_on 'Playbooks'
		puts "Playbooks link clicked"
		sleep 15
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
			  if row.all("td")[1].text == "Clone of "+arg["Display Name"]
				row.all("td")[0].first(:link,"Delete").click
				driver.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
				break
			  end	
			end
		end
		puts "Deleted Playbook"
		sleep 10
	rescue Exception => ex
		putstr "Error while Deleting Playbook"
		putstr_withScreen ex.message
	end
end

Then(/^Delete a PBwithConfirm$/) do
	begin
		arg = getDetails "SPTPlayBookEdit Details"
		sleep 10
		click_on 'Playbooks'
		sleep 10
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
			  if row.all("td")[1].text == arg["NewDisplay Name"]
				row.all("td")[0].first(:link,"Delete").click
				sleep 3
					puts page.driver.browser.switch_to.alert.text + " message displayed in confirmation dialog." rescue Selenium::WebDriver::Error::NoAlertOpenError
					puts "Delete confirmation page with list/count of Success Plan/SuccessPlan Template that Playbook is present is displayed."
					driver.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
				sleep 5
				break
			  end	
			end
		end
		puts "Deleted Playbook"
		puts "Successfully Deleted Playbook" 
    rescue Exception => ex
		putstr "Error occurred while deleting a Playbook"
		putstr_withScreen ex.message
	end
end

Then(/^I view the created Play$/) do
	begin
		arg = getDetails "Play Details"
		sleep 5
		click_on 'Plays'
		puts "Plays link clicked"
		fill_in "Search",:with => arg["Display Name"]
		sleep 10
		within('.pbBody') do
			tr = all("tr").last
			tr.all("td")[0].all('a')[0].click
			break
		end
		puts "Created Play opened"
		sleep 5
		var1 = all('.detailList')[0]
		within(var1) do
			sleep 5
			page.should have_field("Display Name", with: arg["Display Name"])
			puts "Verified   " + "Display Name" + ":  " + arg["Display Name"]
			page.should have_field("Short Description", with: arg["Short Description"])
			puts "Verified   " + "Short Description" + ":  " + arg["Short Description"]
		end
		sleep 10
		puts "Created Play verified successfully"
	rescue Exception => ex
		puts "Error while Viewing Play"
		puts ex.message
	end
end


And(/^I edit the play$/) do
	begin
    sleep 3
		arg = getDetails "Play Details"
		sleep 4
		fill_in "Search:",:with => arg["Display Name"]
		sleep 4
		all(".dataRow").last.all("td")[0].first(:link,"Edit").click
		sleep 3
		fill_in "Short Description",:with => arg["Short Description"]
    sleep 4
		all('.btn')[0].click
		sleep 4
		puts "Successfully Edited Play"
    sleep 3
    if page.has_css?(".message")
			if page.has_content?('Play has been saved')
				puts "Successfully see the saved confirmation message"
			else
				putstr "Failed to see the saved confirmation message"
			end
    else
			putstr "Failed to see the saved confirmation message"
    end
	rescue Exception => ex
		putstr "Error occurred while editing the existing play"
		putstr_withScreen  ex.message
	end
end


And(/^I delete the play from "([^"]*)"$/) do |play|
	begin
		sleep 3
		within all(".pbBody")[1] do
      within(".list") do
        sleep 3
        if first("tbody").all("tr").count > 0
          sleep 3
					first("tbody").all("tr")[2].all("td")[1].first("a").click
          sleep 3
        else
           puts "No #{play} records found"
        end
      end
		end
	rescue Exception => ex
		putstr "Error occurred while deleting the play from #{play}"
		putstr_withScreen  ex.message
	end
end

And(/^I fill the play details$/) do
	begin
		sleep 3
		arg = getDetails "Play Details"
    sleep 4
		fill_in "Display Name",:with => arg["Display Name"]
    sleep 3
		fill_in "Short Description",:with => arg["Short Description"]
    sleep 3
		find(:xpath, "//*[contains(@id, 'slObjectId')]").select(arg["Object"])
    sleep 3
    puts "Successfully fill the play details"
	rescue Exception => ex
		putstr "Error occurred while filling the play details"
		putstr_withScreen  ex.message
	end
end

And(/^I "([^"]*)" the play creation$/) do |action|
	begin
    sleep 3
		within(".pbButtonb") do
			click_on action
		end
		sleep 4
		puts "Successfully #{action} the play creation"
	rescue Exception => ex
		putstr "Error occurred while canceling the #{action} play creation"
		putstr_withScreen  ex.message
	end
end


And(/^I delete the Play$/) do
	begin
		slee 3
		sleep 3
		arg = getDetails "Play Details"
		sleep 3
		fill_in "Search:",:with => arg["Display Name"]
		sleep 4
		if all(".dataRow").count > 0
			all(".dataRow").last.all("td")[0].first(:link,"Delete").click
			sleep 4
		end
		begin
			driver.switch_to.alert.accept
			sleep 3
			puts "Successfully Deleted Play"
		rescue Exception => ex
			puts "Delete confirmation not displayed"
		end
	rescue Exception => ex
		putstr "Error occurred while deleting the play"
		putstr_withScreen  ex.message
	end
end

And(/^I cancel the delete play$/) do
	begin
    slee 3
		sleep 3
		arg = getDetails "Play Details"
		sleep 3
		fill_in "Search:",:with => arg["Display Name"]
		sleep 4
		if all(".dataRow").count > 0
			all(".dataRow").last.all("td")[0].first(:link,"Delete").click
			sleep 4
		end
		begin
			driver.switch_to.alert.dismiss
      sleep 3
      puts "Successfully Deleted Play"
		rescue Exception => ex
			puts "Delete confirmation not displayed"
		end
	rescue Exception => ex
		putstr "Error occurred while cancel the delete play"
		putstr_withScreen  ex.message
	end
end


And(/^I verify the "([^"]*)" field under "([^"]*)" section$/) do |record_type, section|
	begin
   sleep 3
	 arg = getDetails "CreateTaskFields"
	 sleep 4
	 if page.has_content?(arg["DefinePlayTasksSection"])
		 puts "Successfully see the #{arg["DefinePlayTasksSection"]} section"
		 sleep 3
		 if page.has_content?(record_type)
			 puts "Successfully see the #{record_type} field"
		 else
			 putstr "Failed to see the #{record_type} field"
     end
	 else
		 putstr "Failed to see the #{arg["DefinePlayTasksSection"]} section"
	 end
	 sleep 3
	rescue Exception => ex
		putstr "Error occurred while verifying the #{record_type} field under #{section} section"
		putstr_withScreen  ex.message
	end
end

And(/^I add the play task$/) do
	begin
    sleep 4
    arg = getDetails "CreateTaskFields"
		taskArg = getDetails "Play Tasks"
    sleep 4
		if page.has_content?(arg["DefinePlayTasksSection"])
			puts "Successfully see the #{arg["DefinePlayTasksSection"]} section"
			sleep 5
			click_on "Add Task"
			sleep 5
			find(:xpath, "//*[contains(@id, 'inputName')]").send_keys [:control, 'a'], :backspace
      sleep 3
      find(:xpath, "//*[contains(@id, 'inputName')]").set taskArg["TaskName"]
      sleep 3
			all(:xpath, "//*[contains(@id, 'playTaskComp:playTaskComp:pb1:taskList:0:coltype')]").last.select taskArg["Type"]
      sleep 5
      within(".BlogForce9TableADV") do
			 if first("tbody").all("tr").count > 0
          puts "Successfully see the Task Records"
          sleep 3
					first("tbody").all("tr")[0].all("td")[3].first("select").select arg["RecordTypeValue"]
       else
          puts "No Task Records Found"
			 end
      end
      sleep 3
			all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDesc')]").last.set taskArg["Description"]
      sleep 3
			all(".dataRow").last.all("td")[4].first("select").select(taskArg["AssignTo"])
      sleep 3
			all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDays')]").last.set taskArg["Days"]
      sleep 3
		else
			putstr "Failed to see the #{arg["DefinePlayTasksSection"]} section"
    end
		sleep 6
	rescue Exception => ex
		putstr "Error occurred while verifying adding the play task"
		putstr_withScreen  ex.message
	end
end

And(/^I add the play criteria$/) do
	begin
		sleep 4
		arg = getDetails "CreateTaskFields"
		sleep 4
		if page.has_content?(arg["DefinePlayCriteriaSection"])
			puts "Successfully see the #{arg["DefinePlayCriteriaSection"]} section"
			sleep 5
			if all(".dataRow").count > 0
				all(".dataRow").each do |row|
					if row.all("td")[1].text == arg["DefinePlayCriteriaFieldValue"]
						row.first(:link,"Delete").click
						break
					end
				end
			end
			sleep 5
			first(:xpath, "//*[contains(@id, 'slFieldId')]").select arg["DefinePlayCriteriaFieldValue"]
			sleep 8
			first(:xpath, "//*[contains(@id, 'outOperator')]").select arg["DefinePlayCriteriaOperator"]
			sleep 8
			first(:xpath, "//*[contains(@id, 'outValue')]").set arg["DefinePlayCriteriaValue"]
			sleep 8
		else
			putstr "Failed to see the #{arg["DefinePlayCriteriaSection"]} section"
    end
	rescue Exception => ex
		putstr "Error occurred while verifying adding the play criteria"
		putstr_withScreen  ex.message
	end
end

And(/^Select Plays link$/) do
	begin
		click_on "Plays"
		puts "Plays link clicked."
	rescue Exception => ex
		putstr "Error occurred while selecting Plays link."
		putstr_withScreen ex.message
	end
end

And(/^I click on Create Play button$/) do
	sleep 5
	begin
		click_on "Create Play"
		puts "Creating a new Play."
	rescue Exception => ex
		putstr "Error occurred while clicking Create Play button."
		putstr_withScreen ex.message
	end
end

And(/^I provide details and click Create button$/) do
	sleep 5
	begin
		arg = getDetails "Play Details"
		if page.has_content? ('Create Play')
			puts "Successfully redirected to Play Creation."
			fill_in "Display Name",:with => arg["Display Name"]
			fill_in "Short Description",:with => arg["Short Description"]
			find(:xpath, "//*[contains(@id, 'slObjectId')]").select(arg["Object"])
			sleep 3
			within all(".pbButton")[0] do
				click_on "Create"
			end
			puts "Create button clicked."
		else
			puts "Not redirected to Play Creation."
		end
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while providing details and clicking Create button."
		putstr_withScreen ex.message
	end
end

Then(/^I verify that Record Type field is available$/) do
	sleep 10
	begin
		if page.has_content? ('Edit Play')
			puts "Successfully redirected to Play Edit"
			sleep 2
			within(".dataTables_wrapper") do
				$taskrt = first("table").first("thead").first("tr").all("th")[3].first("div").first("div").text
			end
			puts $taskrt
			sleep 3
			if $taskrt.to_s == "Record Type"
				puts "Record type field is available."
			else
				puts "Record type field is not available."
			end
		else
			puts "Not redirected to Play Edit."
		end
	rescue Exception => ex
		putstr "Error occurred while verifying Record Type field."
		putstr_withScreen ex.message
	end
end


When(/^I goto Setup, customize, Activities, Task Record Types$/) do
	begin
		find("#userNavButton").click
		within("#userNavMenu") do
			click_on "Setup"
		end
		puts "Successfully clicked Setup."
		sleep 10
		within("#Customize") do
			all("a")[1].click
		end
		sleep 5
		within("#Customize_child") do
			all("div")[3].all("a")[1].click
		end
		sleep 5
		within("#Activity_child") do
			all("div")[7].first("a").click
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while navigating to Setup, customize, Activities, Task Record Types."
		putstr_withScreen ex.message
	end
end

And(/^I record the values$/) do
	sleep 5
	begin
		$recval = []
		if page.has_css? ("#RecordTypeList_body")
			puts "Redirected to Task Record Type Details page."
			within(".pbBody") do
				within(".list") do
					tr = first("tbody").all("tr")
					tr.each_with_index do |rec, index|
						next if index == 0
						$recval << rec.first("th").text
					end
				end
			end
			puts $recval
			$recval.each do |v|
				puts v
			end
		else
			puts "Not Redirected to Task Record Type Details page."
		end
	rescue Exception => ex
		putstr "Error occurred while recording the values."
		putstr_withScreen ex.message
	end
end

And(/^I record the Record Type dropdown values$/) do
	begin
		#$recdval = []
		if page.has_content? ('Edit Play')
			puts "Successfully redirected to Play Edit"
			sleep 1
			click_on "Add Task"
			puts "Add Task button clicked."
			sleep 5
			within(:xpath, "//*[contains(@id, 'taskList:tb')]") do
				$recdval = find(:xpath, "//*[contains(@name, 'j_id124')]").all("option").collect(&:text)
			end
			puts $recdval
			# $recdval.each do |x|
			#   puts x
			# end
		else
			puts "Not redirected to Play Edit."
		end
	rescue Exception => ex
		putstr "Error occurred while recording the Record Type dropdown values."
		putstr_withScreen ex.message
	end
end

Then(/^I verify Record Type values$/) do
	begin
		$recval.each do |v|
			puts v
			if $recdval.include? v
				puts "Record Type values verified successfully."
			else
				puts "Record Type values do not match."
			end
		end
	rescue Exception => ex
		putstr "Error occurred while verifying Record Type values."
		putstr_withScreen ex.message
	end
end

And(/^I select Record Type value and click Save$/) do
	begin
		if page.has_content? ('Edit Play')
			puts "Successfully redirected to Play Edit"
			within(:xpath, "//*[contains(@id, 'taskList:tb')]") do
				$dsel = first("tr").all("td")[3].first("select").first("option").text
			end
			puts $dsel
			find(:xpath, "//*[contains(@id, 'inputDays')]").send_keys "10"
			sleep 3
			within all(".pbHeader")[0] do
				click_on "Save"
			end
			puts "Save button clicked."
		else
			puts "Not redirected to Play Edit."
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while selecting Record Type and Saving."
		putstr_withScreen ex.message
	end
end

Then(/^I verify Play task creation with Record Type values$/) do
	begin
		arg = getDetails "PlayRecordTask"
		sleep 10
		if page.has_css? (".messageTable")
			within(".messageTable") do
				$msg1 = first("ul").all("li")[0].text
				$msg2 = first("ul").all("li")[1].text
			end
			puts $msg1
			puts $msg2
			if $msg1.include?(arg["SaveMsg2"]) && $msg2.include?(arg["SaveMsg3"])
				puts "Verified Play Task creation with Record Type values."
			else
				puts "Error message displayed when Play Task creation tried with Record Type values."
			end
			sleep 2
		else
			puts "Page not redirected back to Edit Play."
		end
	rescue Exception => ex
		putstr "Error occurred while Play Task Creation with Record Type values."
		putstr_withScreen ex.message
	end
end

Then(/^I verify that Record Type is accessible$/) do
	begin
		if page.has_content? ('Edit Play')
			puts "Successfully redirected to Play Edit"
			sleep 2
			click_on "Add Task"
			puts "Add Task button clicked."
			within(".dataTables_wrapper") do
				$taskrt = first("table").first("thead").first("tr").all("th")[3].first("div").first("div").text
			end
			puts $taskrt
			sleep 3
			if $taskrt.to_s == "Record Type"
				puts "Record type field is available."
			else
				puts "Record type field is not available."
			end
		else
			puts "Not redirected to Play Edit."
		end
	rescue Exception => ex
		putstr "Error occurred while Play Task Creation with Record Type values."
		putstr_withScreen ex.message
	end
end


And(/^I click on New to create Account Name$/) do
	begin
		click_on "New"
		puts "Creating a new Account."
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while selecting New to create Account Name."
		putstr_withScreen ex.message
	end
end


And(/^I provide details and click Save$/) do
	begin
		if page.has_content? ("New Account")
			puts "Page redirected to New Account Creation page."
			sleep 1
			within all(".detailList")[0] do
				first("tbody").all("tr")[1].all("td")[1].first("div").first("input").send_keys "AccountPlayTask"
				# within all(".requiredInput")[0] do
				#   first("input").send_keys "AccountPlayOne"
				# end
			end
			sleep 1
			within all(".pbButton")[0] do
				click_on "Save"
			end
			puts "Save button clicked."
			sleep 5
		else
			puts "Page not redirected to New Account Creation page."
		end
	rescue Exception => ex
		putstr "Error occurred while providing details and saving."
		putstr_withScreen ex.message
	end
end

And(/^I create New Task in Account$/) do
	begin
		sleep 5
		if page.has_content? ("Account")
			puts "Page redirected to the new Account page."
			sleep 2
			within all(".pbHeader")[5] do
				click_on "New Task"
			end
			puts "New Task button clicked."
		else
			puts "Page not redirected to the new Account page."
		end
	rescue Exception => ex
		putstr "Error occurred while creating New Task in Account."
		putstr_withScreen ex.message
	end
end

And(/^I select Record Type task and continue$/) do
	begin
		sleep 5
		if page.has_content? ("Select Task Record Type")
			puts "Page redirected to Select Task Record Type page."
			sleep 2
			within(".detailList") do
				$rtv = find(:xpath, "//*[contains(@selected, 'selected')]").text
				puts $rtv
			end
			within(".pbButtonb") do
				click_on "Continue"
			end
			sleep 5
		else
			puts "Page not redirected to Select Task Record Type page."
		end
	rescue Exception => ex
		putstr "Error occurred while selecting Record Type task and continue."
		putstr_withScreen ex.message
	end
end

And(/^I provide details and Save Task$/) do
	begin
		if page.has_content? ("New Task")
			puts "Redirected to New Task creation page."
			sleep 3
			within all(".detailList")[0] do
				find(:xpath, "//*[contains(@id, 'tsk12')]").select "In Progress"
			end
			sleep 2
			within all(".detailList")[0] do
				find(:xpath, "//*[contains(@id, 'tsk5')]").send_keys "call"
			end
			sleep 2
			within all(".pbButton")[0] do
				click_on "Save"
			end
			puts "Save button clicked."
			sleep 5
		else
			puts "Not redirected to New Task creation page."
		end
	rescue Exception => ex
		putstr "Error occurred while providing details and Saving Task."
		putstr_withScreen ex.message
	end
end


And(/^I click on Task Subject$/) do
	begin
		sleep 5
		if page.has_content? ("Account")
			puts "Page redirected to the Account page."
			sleep 2
			within all(".pbBody")[5] do
				trd = first("table").first("tbody").all("tr")
				trd.each_with_index do |tsk, index|
					next if index == 0
					tsk.first("th").first("a").click
					puts index
					break
				end
			end
			puts "Task Subject clicked."
		else
			puts "Page not redirected to the Account page."
		end
	rescue Exception => ex
		putstr "Error occurred while selecting Task Subject."
		putstr_withScreen ex.message
	end
end

Then(/^I verify Record Type field for Task$/) do
	begin
		sleep 5
		if page.has_content? ("Task")
			puts "Redirected to Task Page."
			sleep 3
			within all(".detailList")[0] do
				$rtval = first("tbody").all("tr")[5].all("td")[1].first("div").text
			end
			puts $rtval
			sleep 5
			if $rtval.to_s.include? ($rtv.to_s)
				puts "Verified Record Type field."
			else
				puts "Record Type field does not match."
			end
		else
			puts "Not redirected to Task page."
		end
	rescue Exception => ex
		putstr "Error occurred while verifying Record Type field."
		putstr_withScreen ex.message
	end
end

And(/^I create New Opportunity in Account$/) do
	begin
		sleep 5
		if page.has_content? ("Account")
			puts "Page redirected to the Account page."
			sleep 2
			within all(".pbHeader")[3] do
				click_on "New Opportunity"
			end
			puts "New Opportunity button clicked."
		else
			puts "Page not redirected to the Account page."
		end
	rescue Exception => ex
		putstr "Error occurred while creating New Opportunity in Account."
		putstr_withScreen ex.message
	end
end

And(/^I provide Opportunity details and Save$/) do
	begin
		sleep 3
		if page.has_content? ("New Opportunity")
			puts "Page redirected to New Opportunity page."
			sleep 1
			within all(".detailList")[0] do
				first("tbody").all("tr")[1].all("td")[1].first("div").first("input").send_keys "New Opportunity"
			end
			sleep 1
			within all(".detailList")[0] do
				find(:xpath, "//*[contains(@id, 'opp11')]").select "Qualification"
			end
			sleep 1
			within all(".detailList")[0] do
				first("tbody").all("tr")[0].all("td")[3].first("div").first("span").first("span").first("a").click
			end
			sleep 1
			within all(".pbButton")[0] do
				click_on "Save"
			end
			puts "Save button clicked."
			sleep 5
		else
			puts "Page not redirected to New Opportunity page."
		end
	rescue Exception => ex
		putstr "Error occurred while providing Opportunity details and Saving."
		putstr_withScreen ex.message
	end
end

And(/^I create New Task in Opportunity$/) do
	begin
		sleep 5
		if page.has_content? ("Opportunity")
			puts "Redirected to Opportunity page."
			sleep 2
			within all(".pbHeader")[2] do
				click_on "New Task"
			end
			puts "New Task button clicked."
		else
			puts "Not redirected to Opportunity page."
		end
	rescue Exception => ex
		putstr "Error occurred while creating New Task in Opportunity."
		putstr_withScreen ex.message
	end
end

And(/^I select an Account Name$/) do
	begin
		sleep 5
		within(".list") do
			first("tbody").all("tr")[1].first("th").first("a").click
		end
		puts "Account Name selected."
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while selecting an Account Name."
		putstr_withScreen ex.message
	end
end

And(/^I click on Opportunity Name$/) do
	begin
		sleep 5
		if page.has_content? ("Account")
			puts "Redirected to Account page."
			sleep 2
			within all(".pbBody")[3] do
				trd = first("table").first("tbody").all("tr")
				trd.each_with_index do |tsk, index|
					next if index == 0
					tsk.first("th").first("a").click
					puts index
					break
				end
			end
			puts "Opportunity Name clicked."
		else
			puts "Not redirected to Account page."
		end
	rescue Exception => ex
		putstr "Error occurred while selecting an Account Name."
		putstr_withScreen ex.message
	end
end

And(/^I click on Task Subject in Opportunity$/) do
	begin
		sleep 3
		if page.has_content? ("Opportunity")
			puts "Redirected to Opportunity page."
			sleep 2
			within all(".pbBody")[2] do
				trd = first("table").first("tbody").all("tr")
				trd.each_with_index do |tsk, index|
					next if index == 0
					tsk.first("th").first("a").click
					puts index
					break
				end
			end
			puts "Task Subject in Opportunity Name clicked."
		else
			puts "Not redirected to Opportunity page."
		end
	rescue Exception => ex
		putstr "Error occurred while clicking on Task Subject in Opportunity."
		putstr_withScreen ex.message
	end
end


And(/^I create New Case in Account$/) do
	begin
		sleep 5
		if page.has_content? ("Account")
			puts "Page redirected to the Account page."
			sleep 2
			within all(".pbHeader")[4] do
				click_on "New Case"
			end
			puts "New Case button clicked."
		else
			puts "Page not redirected to the Account page."
		end
	rescue Exception => ex
		putstr "Error occurred while creating New Case in Account."
		putstr_withScreen ex.message
	end
end

And(/^I provide details and Save Case$/) do
	begin
		sleep 2
		if page.has_content? ("New Case")
			puts "Redirected to New Case page."
			sleep 2
			within all(".detailList")[1] do
				find(:xpath, "//*[contains(@id, 'cas11')]").select "Email"
			end
			sleep 3
			within all(".pbButton")[0] do
				click_on "Save"
			end
			puts "Save button clicked."
			sleep 3
		else
			puts "Not redirected to New Case page."
		end
	rescue Exception => ex
		putstr "Error occurred while providing details and Saving Case."
		putstr_withScreen ex.message
	end
end

And(/^I create New Task in Case$/) do
	begin
		sleep 5
		if page.has_content? ("Case")
			within(".ptBody") do
				$casename = all("div")[0].first("h2").text
			end
			puts $casename
			puts "Redirected to Case page."
			sleep 2
			within all(".pbHeader")[2] do
				click_on "New Task"
			end
			puts "New Task button clicked."
		else
			puts "Not redirected to Case page."
		end
	rescue Exception => ex
		putstr "Error occurred while creating New Task in Case."
		putstr_withScreen ex.message
	end
end

And(/^I click on Case Name$/) do
	begin
		sleep 5
		if page.has_content? ("Account")
			puts "Page redirected to the Account page."
			sleep 2
			within all(".pbBody")[4] do
				trd = first("table").first("tbody").all("tr")
				trd.each_with_index do |tsk, index|
					next if index == 0
					$cname =  tsk.first("th").first("a").text
					if $cname.to_s == $casename.to_s
						tsk.first("th").first("a").click
					end
					puts index
					break
				end
			end
			puts "Case Name clicked."
		else
			puts "Page not redirected to the Account page."
		end
	rescue Exception => ex
		putstr "Error occurred while selecting Case Name."
		putstr_withScreen ex.message
	end
end

And(/^I click on Task Subject in Case$/) do
	begin
		sleep 3
		if page.has_content? ($casename)
			puts "Redirected to Case page."
			sleep 2
			within all(".pbBody")[2] do
				trd = first("table").first("tbody").all("tr")
				trd.each_with_index do |tsk, index|
					next if index == 0
					tsk.first("th").first("a").click
					puts index
					break
				end
			end
			puts "Task Subject in Case clicked."
		else
			puts "Not redirected to Case page."
		end
	rescue Exception => ex
		putstr "Error occurred while clicking Task Subject in Case."
		putstr_withScreen ex.message
	end
end

And(/^I create New Success Plan in Account$/) do
	begin
		sleep 5
		if page.has_content? ("Account")
			puts "Page redirected to the Account page."
			sleep 2
			within all(".pbHeader")[1] do
				click_on "New Success Plan"
			end
			puts "New Success Plan button clicked."
		else
			puts "Page not redirected to the Account page."
		end
	rescue Exception => ex
		putstr "Error occurred while creating New Success Plan in Account."
		putstr_withScreen ex.message
	end
end

And(/^I provide details and Save Plan$/) do
	begin
		arg2 = getReference "Reference"
	    sptname = arg2["SPTemplate"]
		sleep 2
		if page.has_content? ("New Success Plan")
			puts "Redirected to New Success Plan page."
			sleep 2
			within all(".detailList")[0] do
				first("tbody").all("tr")[0].all("td")[1].first("div").first("span").first("input").send_keys sptname
			end
			sleep 2
			within all(".detailList")[0] do
				first("tbody").all("tr")[0].all("td")[3].first("div").first("span").first("span").first("a").click
			end
			sleep 2
			within all(".pbButton")[0] do
				click_on "Save"
			end
			puts "Save button clicked."
			sleep 3
		else
			puts "Not redirected to New Success Plan page."
		end
	rescue Exception => ex
		putstr "Error occurred while providing details and Saving Success plan."
		putstr_withScreen ex.message
	end
end

And(/^I create New Task in Success Plan$/) do
	begin
		sleep 5
		if page.has_content? ("Customer Success")
			puts "Redirected to Success Plan page."
			find(:xpath, "//*[contains(@id, 'taskFilters')]").select "All"
			sleep 2
			within all(".container")[0] do
				click_on "Create Task"
			end
			sleep 10
		else
			puts "Not redirected to Success Plan page."
		end
	rescue Exception => ex
		putstr "Error occurred while creating New Task in Success plan."
		putstr_withScreen ex.message
	end
end

And(/^I provide details for New Task$/) do
	begin
		sleep 5
		if page.has_text? ("New TASK")
			puts "Task pop-up window displayed."
			find(:xpath, "//*[contains(@id, 'taskStatusValue1')]").select "In Progress"
			sleep 5
			popup = window_opened_by do
				within(".detailList") do
					first("tbody").first("tr").first("td").first("a").click
				end
			end
			sleep 3
			within_window(popup) do
				click_on "Call"
			end
			sleep 5
			popup = window_opened_by do
				within(".detailList") do
					first("tbody").all("tr")[2].first("td").first("span").first("a").click
				end
			end
			sleep 3
			within_window(popup) do
				page.driver.browser.switch_to.frame("resultsFrame")
				click_on "PN-0000305"
			end
			sleep 5
			within all(".pbButton")[0] do
				click_button "SAVE"
			end
			puts "Save Button clicked."
			sleep 5
		else
			puts "Task pop-up window not displayed."
		end
	rescue Exception => ex
		putstr "Error occurred while providing details for New Task."
		putstr_withScreen ex.message
	end
end



And(/^I record details and Save Task for Plan$/) do
	begin
		sleep 5
		if page.has_text? ("Task")
			puts "Redirected to Task creation page."
			sleep 5
			within all(".pbSubsection")[1] do
				$rtskval = first("tbody").all("tr")[5].all("td")[1].text
			end
			puts $rtskval
			sleep 5
			within all(".pbButton")[0] do
				click_on "Save"
			end
			puts "Save button clicked."
			sleep 5
		else
			puts "Not redirected to Task creation page."
		end
	rescue Exception => ex
		putstr "Error occurred while providing details and Saving Task for Plan."
		putstr_withScreen ex.message
	end
end


And(/^I click on Task Subject in Success Plan$/) do
	begin
		sleep 5
		if page.has_content? ("Customer Success")
			puts "Redirected to Success Plan page."
			find(:xpath, "//*[contains(@id, 'taskFilters')]").select "All"
			sleep 2
			unless page.has_content? ("No matching records found.")
				puts "Task created is displayed."
				within(:id, 'actionSpGrid') do
					first("tbody").first("tr").all("td")[2].first("a").click
				end
			else
				puts "Task created does not get displayed."
			end
			sleep 5
		else
			puts "Not redirected to Success Plan page."
		end
	rescue Exception => ex
		putstr "Error occurred while clicking on Task Subject in Success plan."
		putstr_withScreen ex.message
	end
end


Then(/^I verify Record Type field for Task of Success Plan$/) do
	begin
		sleep 5
		if page.has_content? ("Task")
			puts "Redirected to Task Page."
			sleep 3
			within all(".detailList")[0] do
				$retval = first("tbody").all("tr")[5].all("td")[1].first("div").text
			end
			puts $retval
			sleep 5
			if $retval.to_s.include? ($rtskval.to_s)
				puts "Verified Record Type field."
			else
				puts "Record Type field does not match."
			end
		else
			puts "Not redirected to Task page."
		end
	rescue Exception => ex
		putstr "Error occurred while verifying Record Type field of Success Plan."
		putstr_withScreen ex.message
	end
end


And(/^I provide different User credentials to login$/) do
	begin
		sleep 10
		arg = getDetails "Play Details"
		if page.has_css? ("#Login")
			puts "Login Page displayed."
			fill_in "username",:with => arg["userName"]
			fill_in "Password",:with => arg["pwd"]
			puts "Entered Credentials"
			find(:id,"Login").click
			sleep 10
		else
			puts "Login Page not displayed."
		end
	rescue Exception => ex
		putstr "Error occurred while providing different User credentials to login."
		putstr_withScreen ex.message
	end
end


And(/^I click on edit link of a Play$/) do
	begin
		sleep 10
		within(:xpath, "//*[contains(@class, 'dataTables_wrapper')]") do
			$lnkname = first("table").first("tbody").all("tr")[0].all("td")[0].all("a")[0].text
			puts $lnkname
			first("table").first("tbody").all("tr")[0].all("td")[0].all("a")[0].click
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while providing different User credentials to login."
		putstr_withScreen ex.message
	end
end