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
    rescue Exception => ex
		putstr "Error occurred while creating a Play"
		putstr ex.message
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
		putstr ex.message
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
		putstr ex.message
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
		putstr ex.message
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
		putstr ex.message
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
		putstr ex.message
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
		 putstr ex.message
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
		putstr ex.message
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
		putstr ex.message
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
		putstr ex.message
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
		putstr ex.message
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
		putstr ex.message
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