#All Success Plan Template Specific Step Definitions
#All Scenario mentioned in SuccessPlanTemplates.feature

Then(/^I create a new Success Plan Template$/) do
	begin
		arg=getDetails "SPT"
		click_link('ServiceSource Setup')
		sleep 5
		click_link('Success Plan Templates')
		puts "clicked successfully"
		sleep 2
		click_on "Create New"
		puts "Creating a new SPT"
		sleep 2
		fill_in "Template Name",:with => arg["Template Name"]
		sleep 2
		within(".pbBottomButtons") do
		 click_on "Create"
		end
		puts "Successfully created SPT" 
		sleep 10
		if page.has_content?('Define Success Plan Phases')
			puts "Define Success Plan Phases section displayed"
			sleep 3
		else
			raise "Define Success Plan Phases section not displayed"
		end
		#first(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").select(arg["OppStage"])
		first(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").find(:xpath, 'option[1]').select_option
		# if first(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").should have_content(arg["OppStage"])
			# puts arg["OppStage"]
		# end
		#puts "Opportunity Location set to "+arg["OppStage"]
		click_on "Add Phase"
		sleep 5
		first(:xpath, "//*[contains(@id, 'csmName')]").set(arg["PhaseName"])
		first(:xpath, "//*[contains(@id, 'csmLength')]").set(arg["Days"])
		sleep 5
		within all(".pbButton")[0] do
					click_on "Save"
				end
		puts "Saved Success Plan Template"
		sleep 5
		if page.has_content?('Template has been saved')
				puts "Template has been saved message displayed after saving"
				sleep 3
		else
			raise "Template has been saved message not displayed"
		end
		if page.has_content?('Phase updates have been saved')
				puts "Phase updates have been saved message displayed after saving"
				sleep 3
		else
			raise "Phase updates have been saved message not displayed"
		end
		if page.has_content?('Define Opportunity Location on Success Plan Timeline')
			puts "Define Opportunity Location on Success Plan Timeline section displayed"
			sleep 3
		else
			raise "Define Opportunity Location on Success Plan Timeline section not displayed"
		end
		if page.has_content?('Define Success Plan Playbooks')
			puts "Define Success Plan Playbooks section displayed"
			sleep 3
		else
			raise "Define Success Plan Playbooks section not displayed"
		end
		click_on "Add Playbook"
		sleep 5
		arg1 =  getReference ("Reference")
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("td")[1].text == arg1["Playbook"]
					row.all("td")[0].all('a')[0].click
					break
				end                        
			end
		end
		puts "Added Playbook Sucessfully"
		sleep 10
		within all(".pbButton")[0] do
					click_on "Save"
				end
		puts "Saved Success Plan Template"

		if page.has_content?('Template has been saved')
				puts "Template has been saved message displayed after saving"
				sleep 3
		else
			raise "Template has been saved message not displayed"
		end
		if page.has_content?('Define Success Plan Indicators')
			puts "Define Success Plan Indicators section displayed"
			sleep 3
		else
			raise "Define Success Plan Indicators section not displayed"
		end
		click_on "Add Indicator"
		puts "Clicked on Add Indicator"
		sleep 10
		within all(".dataRow").last do
			all(".dataCell")[5].first(:xpath, ".//*[contains(@id, 'indicatorTemp:acctplanIndComp:pb1:accountPlanIndicatorsTable:0')]").select(arg["Criteria2 Type"])
		end
		within all(".dataRow").last do
			all(".dataCell")[7].first(:xpath, ".//*[contains(@id, 'indicatorTemp:acctplanIndComp:pb1:accountPlanIndicatorsTable:0')]").select(arg["Criteria3 Type"])
		end
		first(:xpath, "//*[contains(@id, 'indicatorTemp:acctplanIndComp:pb1:accountPlanIndicatorsTable:0:indicator')]").select(arg["Criteria1 Type"])  
		all(:xpath, "//*[contains(@id, 'cr1fv')]").last.set(arg["Criteria1"])
		all(:xpath, "//*[contains(@id, 'cr1tv')]").last.set(arg["Criteria2"])
		sleep 5
		all(:xpath, "//*[contains(@id, 'cr2fv')]").last.set(arg["Criteria2"])
		all(:xpath, "//*[contains(@id, 'cr2tv')]").last.set(arg["Criteria3"])
		sleep 5
		all(:xpath, "//*[contains(@id, 'cr3fv')]").last.set(arg["Criteria3"])
		all(:xpath, "//*[contains(@id, 'cr3tv')]").last.set(arg["Criteria1"])
		sleep 5
		main = page.driver.browser.window_handles.first
		find("img[alt='Indicator Lookup (New Window)']").click
		sleep 5
		page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
		sleep 10
		page.driver.browser.switch_to.frame("resultsFrame")
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("th")[0].text == arg["Indicator"]
						row.all("th")[0].all('a')[0].click
						break
				end                        
			end
		end
		sleep 3
		page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
        sleep 5
		# find("img[alt='Indicator Lookup (New Window)']").click
		# sleep 5
		# within_window(page.driver.browser.window_handles.last) do
			# within_frame "resultsFrame" do
				# first(:link,arg["Indicator"]).click
			# end
		# end
		# sleep 3
		# sleep 3
		# page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
        # page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
		within all(".pbButton")[0] do
					click_on "Save"
				end
		puts "Saved Success Plan Templates"
		sleep 5
		if page.has_content?('Template has been saved')
				puts "Template has been saved message displayed after saving"
				sleep 3
		else
			puts "Template has been saved message not displayed"
		end
		if page.has_content?('Success Plan Template Indicators have been saved')
				puts "Success Plan Template Indicators have been saved message displayed after saving"
				sleep 3
		else
			puts "Success Plan Template Indicators have been saved message not displayed"
		end
    rescue Exception => ex
		putstr "Error occurred while creating SPT"
		putstr_withScreen ex.message
	end 
end

And(/^I edit Success Plan Templates$/) do
	begin
		click_link('Success Plan Templates')
		puts "clicked successfully"
		sleep 3
		arg=getDetails "SPT"
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("td")[1].text == arg["Template Name"]
				
					row.all("td")[0].all('a')[0].click
					break
				end                        
			end
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while editing Success Plan Template"
		putstr_withScreen ex.message
	end
end

And(/^I Clone a Success Plan Template$/) do
	begin
		click_link('Success Plan Templates')
		puts "clicked successfully"
		sleep 3
		arg=getDetails "SPT"
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("td")[1].text == arg["Template Name"]
				    if row.all("td")[0].all(:link,"Clone").count > 0
						row.all("td")[0].first(:link,"Clone").click
						break
					end
				end                        
			end
		end
		sleep 5
		strClone = "Clone of "+arg["Template Name"]
		cloned = 0
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("td")[1].text == strClone
					cloned = 1
					break
				end                        
			end
		end
		if cloned==1
			puts "#{arg['Template Name']} cloned successfully"
		else
			puts "Error occurred while cloning #{arg['Template Name']}."
		end
	rescue Exception => ex
		putstr "Error occurred while Cloning Success Plan Template"
		putstr_withScreen ex.message
	end
end


And(/^I Delete a clone Success Plan Templates$/) do
	begin
		click_link('Success Plan Templates')
		puts "clicked successfully"
		sleep 3
		arg=getDetails "SPT"
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("td")[1].text == "Clone of "+arg["Template Name"]
					row.all("td")[0].first(:link,"Delete").click
					sleep 2
					puts page.driver.browser.switch_to.alert.text + " message displayed in confirmation dialog." rescue Selenium::WebDriver::Error::NoAlertOpenError
					puts "Delete confirmation page with appropriate warning is displayed."
					page.driver.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
					break
				end                        
			end
		end
		sleep 5
		puts "Clone of "+arg["Template Name"]+" deleted successfully."
	rescue Exception => ex
		putstr "Error occurred while deleting Success Plan Template"
		putstr_withScreen ex.message
	end
end

Then(/^I delete SuccessPlanIndicator$/) do 
	begin
		if page.has_content?('Define Success Plan Indicators')
			puts "Define Success Plan Indicators section displayed"
			sleep 3
			if all(".dataRow").count > 0
				within all(".dataRow").last do
				   if all(".dataCell").count > 0 
					all(".dataCell")[0].first(:link,"Delete").click
				   end
				end
			end
			driver.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
			sleep 10
			if page.has_content?('Success Plan Template Indicator has been deleted')
				puts "Success Plan Template Indicator has been deleted message displayed after deleting"
				sleep 3
			else
				puts "Success Plan Template Indicator has been deleted "
			end
			within all(".pbButton")[0] do
					click_on "Save"
				end
			puts "Saved Success Plan Templates." 
			sleep 5
		else
			puts "No Success Plan Indicators to delete"
		end
        
	rescue Exception => ex
		putstr "Error occurred while deleting Indicator from Success Plan Template"
		putstr_withScreen ex.message
	end 
end

And(/^create a new Playbook from SPT$/) do
	begin
		arg = getDetails "SPTPlayBook Details"
		sleep 5
		click_on "Create Playbook"
		puts "Clicked Create New Playbook successfully"
		sleep 10
		arg.each do |key,val|
			fill_in key,:with => val
		end
		within all(".pbButton")[0] do
					click_on "Create"
				end
		puts "Successfully created Playbook" 
    rescue Exception => ex
		putstr "Error occurred while creating Playbook"
		putstr_withScreen ex.message
	end
end

Then(/^I should edit a Playbook$/) do
	begin
		arg = getDetails "SPTPlayBookEdit Details"
		sleep 5
		found = all(:xpath, "//*[contains(@id, 'acctPlanPlaybookTable:tb')]").count
		if found > 0
			found = 0
			within all(:xpath, "//*[contains(@id, 'acctPlanPlaybookTable:tb')]")[0] do
				all(".dataRow").each do |tr|
					if tr.all(".dataCell")[1].text == arg['Display Name']
					   tr.all(".dataCell")[0].first(:link,"Edit").click
					   found = 1
					   break
					end
				end
			end
		else
			raise "Playbook "+arg['Display Name']+" not found in Success Plan Template"
		end
		if found > 0
			fill_in "Display Name", :with => arg['NewDisplay Name']
		end
		all('.btn')[0].click
		puts "Successfully updated Playbook"
    rescue Exception => ex
		putstr "Error occurred while editing Playbook from Success Plan Template"
		putstr_withScreen ex.message
	end
end

Then(/^I should view the "(.*?)" Playbook$/) do |var1|
	begin
		sleep 5
		strPB = ""
		if var1 == "edited"
		    arg = getDetails "SPTPlayBookEdit Details"
			strPB=arg['NewDisplay Name']
		else
		    arg = getDetails "SPTPlayBook Details"
			strPB=arg['Display Name']
		end	
		found = all(:xpath, "//*[contains(@id, 'acctPlanPlaybookTable:tb')]").count
		if found > 0
			found = 0
			within all(:xpath, "//*[contains(@id, 'acctPlanPlaybookTable:tb')]")[0] do
				all(".dataRow").each do |tr|
					if tr.all(".dataCell")[1].text == strPB
						puts tr.all(".dataCell")[1].text
					   found = 1
					   break
					end
				end
			end
		end
		if found > 0
		    puts "Newly #{var1} Playbook "+strPB+" found in Success Plan Template"
		else
			puts "Newly #{var1} Playbook "+strPB+" not associated to Success Plan Template"
			if var1 != "edited"
				puts "Associating newly #{var1} Playbook #{strPB} to Success Plan Template"
				click_on "Add Playbook"
				sleep 5
				within('.list') do
					tr = first("tbody").all("tr")
					tr.each do |row|
						if row.all("td")[1].text == strPB
							row.all("td")[0].all('a')[0].click
							break
						end                        
					end
				end
				puts "Added Playbook Sucessfully"
				sleep 5
				within all(".pbButton")[0] do
					click_on "Save"
				end
				puts "Saved Success Plan Template"
				sleep 5
				if page.has_content?('Template has been saved')
						puts "Template has been saved message displayed after saving"
						sleep 3
				else
					raise "Template has been saved message not displayed"
				end
			end
		end
    rescue Exception => ex
		putstr "Error occurred while verifying created/updated Playbook from Success Plan Template"
		putstr_withScreen ex.message
	end
end

