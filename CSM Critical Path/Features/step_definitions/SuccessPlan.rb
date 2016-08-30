#All Success Plan Specific Step Definitions
#All Scenario mentioned in SuccessPlan.feature

Then(/^I create a "(.*?)" SuccessPlan$/) do |arg1|
begin
	click_on arg1
	arg = getDetails "SuccessPlan"
	arg.each do |key,val|
		fill_in key,:with => val
	end
	arg2 = getReference "Reference"
	sptname = arg2["SPTemplate"]
	accname = getDetails "Account"
	fill_in "Success Plan Template", :with => sptname
	if arg1=="New"
		 fill_in "Account",:with => arg2["Account"]
	end
	within(:id,"topButtonRow") do
		click_on "Save"
	end
	sleep 15
	puts "Successfully created Success Plan" 
    rescue Exception => ex
		putstr "Error occurred while creating Success Plan"
		putstr_withScreen ex.message
	end
end	

Then (/^I select the first SP$/) do
begin
   sleep 5
	within('.list') do
		first(:link).click
	end
	sleep 10
	rescue Exception => ex
		putstr "Error occurred while opening a SuccessPlan"
		putstr_withScreen ex.message
	end
end

And (/^I select the SP created from Account$/) do
begin
   sleep 5
   arg = getDetails "Account"
   spName = arg["Account Name"]+" Success Plan"
	select "All", :from => "fcf"
		sleep 3
		within(".fBody") do
			click_on "Go!"
		end
		sleep 5
		foundCount = ""
		begin
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
				  if row.all("td")[3].text==spName
					row.all("td")[2].all('a')[0].click
					foundCount = "found"
					break
				  end
				end
			end
			if page.has_css?('.next')
				find(".next").click
				sleep 3
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount==""
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
				 if row.all("td")[3].text==spName
					row.all("td")[2].all('a')[0].click
					foundCount = "found"
					break
				  end	
				end
			end
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while opening a SuccessPlan"
		putstr_withScreen ex.message
	end
end

When (/^I select the created SP$/) do
begin
   sleep 5
   arg = getReference "Reference"
   spName = arg["Account"]+" Success Plan"
	select "All", :from => "fcf"
		sleep 3
		within(".fBody") do
			click_on "Go!"
		end
		sleep 5
		foundCount = ""
		begin  
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
				  if row.all("td")[3].text==spName
					row.all("td")[2].all('a')[0].click
					foundCount = "found"
					break
				  end	
				end
			end
			if page.has_css?('.next')
				find(".next").click
				sleep 3
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount==""
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
				 if row.all("td")[3].text==spName
					row.all("td")[2].all('a')[0].click
					foundCount = "found"
					break
				  end	
				end
			end
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while opening a SuccessPlan"
		putstr_withScreen ex.message
	end
end

And (/^I edit first SuccessPlan$/) do
	begin
	    if all(".pass").count > 0
			all(".pass").each do |pass|
				puts "<b>Indicator pass criteria displayed successfully "+pass.first("h6").text+"</b>"
			end
		else
			    puts "No Indicators with pass criteria displayed"
		end 
		  if all(".fail").count > 0
		      all(".fail").each do |fail|
				puts "<b>Indicator fail criteria displayed successfully "+fail.first("h6").text+"</b>"
			  end
		else
			    puts "No Indicators with fail criteria displayed"
		end 
		sleep 10
		click_link "Details"
		sleep 5

		spDisplayName = first("h2").text
		arg = getDetails "EditSuccessPlan"
		find(:xpath, "//input[@value='#{spDisplayName}']").set(arg["Display Name"])
		click_on "Save"
		
		sleep 5
		puts "Successfully updated Success Plan" 
	rescue Exception => ex
		putstr "Error occurred while editing a SuccessPlan"
		putstr_withScreen ex.message
	end
end

And (/^I delete first SuccessPlan$/) do
	begin
		sleep 3
		arg = getDetails "EditSuccessPlan"
		select "All", :from => "fcf"
		sleep 3
		within(".fBody") do
			click_on "Go!"
		end
		sleep 5
		foundCount = ""
		begin  
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
					if row.all("td")[3].text==arg["Display Name"]
						page.accept_confirm { row.first(:link,"Del").click }
						foundCount = "found"
						break
					end	
				end
			end
			if page.has_css?('.next')
				find(".next").click
				sleep 3
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount==""
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
					if row.all("td")[3].text==arg["Display Name"]
						page.accept_confirm { row.first(:link,"Del").click }
						foundCount = "found"
						break
					end	
				end
			end
		end

		sleep 5
		puts "Success Plan <b>#{arg['Display Name']}</b> Deleted"
	rescue Exception => ex
		putstr "Error occurred while deleting a SuccessPlan"
		putstr_withScreen ex.message
	end
end

And (/^I delete an Account SuccessPlan$/) do
begin
   within all(:css,".listRelatedObject")[0] do
		#click_on "Success Plan Name"
		sleep 2
		page.accept_confirm { first(:link, "Del").click }
		sleep 5
   end
rescue Exception => ex
	putstr "Error occurred while deleting Account SuccessPlan"
	putstr_withScreen ex.message
end
end

And (/^I select an Account SuccessPlan$/) do
begin
	within all(:css,".listRelatedObject")[0] do
		first(:link, "Edit").click
	end
	sleep 10
	puts "Successfully selected Success Plan" 
rescue Exception => ex
	putstr "Error occurred while selecting Account SuccessPlan"
	putstr_withScreen ex.message
end
end

And (/^I edit Account SuccessPlan$/) do
	begin
		sleep 10
		fill_in "Plan Comments",:with => "Edited SuccessPlan from Accounts"
		within(:id,"topButtonRow") do
			click_on "Save"
		end
		sleep 5
		puts "Successfully updated Success Plan" 
	rescue Exception => ex
		putstr "Error occurred while editing a SuccessPlan"
		putstr_withScreen ex.message
	end
end

Then(/^create new Task for SP$/) do
	begin
		sleep 5
		arg = getDetails "Taskdetails"
		arg2 = getDetails "CreateTaskFields"
		spPlay = getReference "Reference"
		sleep 2
    	click_on "Create Task"
		sleep 10
		within all('.pbSubsection').last do
			sleep 5	
			sleep 5				
			first(:xpath, "//*[contains(@id, 'dueValue')]").set(arg["DueDate"])
			sleep 5			
			first(:xpath, "//*[contains(@id, 'taskNameValue')]").click			
			first(:xpath, "//*[contains(@id,'taskNameValue')]").set("Call")
			
			first(:xpath, "//*[contains(@id,'playValue')]").set(spPlay["Play"])
			first(:xpath, "//*[contains(@id, 'commentsValue')]").click
			first(:xpath, "//*[contains(@id, 'commentsValue')]").set(arg["CommentsValue"])
			first(:xpath, "//*[contains(@id, 'taskStatusValue1')]").select(arg["Status"])
			
			
      sleep 5
		end
			sleep 10
     within(".pbButtonb") do
			click_on "SAVE"
			puts"Created task"
		end
		within(".pbButtonb") do
			click_on "Save"
		end
      sleep 10
		puts "Created new task for Success Plan"		 
	 rescue Exception =>ex
		puts "Error while creating the new task for SP"
		puts ex.message
	end
end

Then(/^I filter tasks "(.*?)"$/) do |arg1|
	begin
    sleep 4
		find(:xpath, "//*[contains(@id, 'taskFilters')]").select(arg1)
		sleep 10
		if all(".checkEnabled").count > 0
			puts "Task filter working for <b>#{arg1}</b>"
		else
			putstr "Task filter not working for #{arg1}"
		end
	rescue Exception =>ex
		putstr "Error while creating the new task for SP"
		putstr_withScreen ex.message
	end
end

And(/^I verify the "([^"]*)" details$/) do |sp|
	begin
		sleep 5
		$tasksCount = all(".checkEnabled").count
		click_on "Activity Stream"
		sleep 5
		begin
			$activityCount = find(".pagination-info").text.split("of").last.split("rows").last.to_i
		rescue
			$activityCount = 0
		end
	rescue Exception => ex
		putstr "Error occurred while verifying the #{sp} details"
		putstr_withScreen ex.message
	end
end



And (/^I complete the first task$/) do
	begin
    sleep 3
		arg = getDetails "Taskdetails"
		arg2 = getDetails "CreateTaskFields"
		sleep 4
		$ispopwindow = 0
		unless page.has_css?(".no-records-found")
			within("#actionSpGrid") do
				sleep 3
				if first("tbody").all("tr").count > 0
					sleep 3
					first(".checkEnabled").click
          sleep 3
					$ispopwindow = 1
				else
					puts "Failed to see the tasks"
				end
			end
			sleep 5
			if $ispopwindow > 0
				find(:xpath, "//*[contains(@id, 'riskReasonValue')]").find(:xpath, 'option[2]').select_option
				sleep 3
				find(:xpath, "//*[contains(@id, 'commentsValue')]").click
				find(:xpath, "//*[contains(@id, 'commentsValue')]").set(arg["CommentsValue"])
				sleep 4
				first(:xpath, "//*[contains(@id, 'taskStatusValue')]").select arg2["CompletedStatusfield"]
				sleep 5
				within all(".pbButton")[0] do
					click_on "SAVE"
				end
				sleep 5
				puts "Successfully complete the task"
			else
				putstr "Complete Task pop up is not displayed"
			end
		else
			puts "No matching records found"
		end
		sleep 5
	rescue Exception =>ex
		putstr "Error while completing task from Success Plan"
		putstr_withScreen ex.message
	end
end


And(/^I verify the "([^"]*)" dismiss details$/) do |sp|
	begin
		sleep 5
		$tasksCount = all(".removeEnabled").count
		click_on "Activity Stream"
		sleep 5
		$activityCount = find(".pagination-info").text.split("of").last.split("rows").last.to_i
		sleep 3
	rescue Exception => ex
		putstr "Error occurred while verifying the #{sp} details"
		putstr_withScreen ex.message
	end
end


And (/^I dismiss the first task$/) do
	begin
		sleep 5
		$ispopwindow = 0
		unless page.has_css?(".no-records-found")
			within("#actionSpGrid") do
				sleep 3
				if first("tbody").all("tr").count > 0
					sleep 3
					first(".removeEnabled").click
          sleep 3
					$ispopwindow = 1
				else
					puts "Failed to see the tasks"
				end
      end
			sleep 5
			if $ispopwindow > 0
				first(:xpath, "//*[contains(@id, 'riskReasonValue')]").find(:xpath, 'option[2]').select_option
				sleep 5
				within all(".pbBottomButtons")[0] do
					if page.has_content?("SAVE")
						puts "Successfully see the save button on dismiss task"
						click_on "SAVE"
					else
						putstr "Failed to see the save button on dismiss task"
					end
				end
			  sleep 5
        puts "Successfully dismiss the task"
			else
				putstr "Complete Task pop up is not displayed"
			end
		else
			puts "No matching records found"
		end
		sleep 5
	rescue Exception =>ex
		putstr "Error while dismissing task from Success Plan"
		putstr_withScreen ex.message
	end
end

And (/^I send email for SP Task$/) do
	begin
		sleep 5
		first(".envEnabled").click
		sleep 5
		fill_in 'Subject', :with => 'Send Email'
		arg = getReference "Reference"
		fill_in 'To', :with => arg["emailContact"]
		 within(:id, 'topButtonRow') do
			click_button('Send')
			puts "Email sent"
			sleep 5
		 end
		sleep 10
		if all(".envEnabled").count > 0 
			puts "Email sent successfully"
		else
      puts "Email could not be sent"
		end	
	rescue Exception =>ex
		putstr "Error while sending task email from Success Plan"
		putstr_withScreen ex.message
	end
end

And (/^I verify widgets for SP Task$/) do
	begin
		sleep 5
		first(".detailEnabled").click
		sleep 5
		# within all('.bs')[0].all('tbody')[0] do
			# rows = all('tr')
			# puts rows[0].text
		# end
		contactMatch = 0
		arg = getReference "Reference"
		begin
			within(:id,'tbodyA') do 
				rows = all("tr")
				rows.each do |row|
					if row.text == arg["AdditionalContactName"]
						contactMatch = 1
						break
					end
				end
				#rows[0].all('a')[1].click
				sleep 5
			end
		rescue Exception =>ex1
		   puts "Verification issue"
		end
		# within(:id,'CreatedBy_ileinner') do
			# @acc = find('a').text
			# puts @acc
		# end
		
		if contactMatch > 0
			puts "Contact Widget Verified"
		else
			puts "Contact Widget verification completed"
		end
	rescue Exception =>ex
		putstr "Error while verifying Contact Widget from Success Plan"
		putstr_withScreen ex.message
	end
end

And (/^I verify activity stream$/) do
	begin
		sleep 5
		click_on "Activity Stream"
		sleep 5
		puts find(".pagination-info").text
		puts "Activity Stream verified"
	rescue Exception =>ex
		putstr "Error while verifying Activity Stream from Success Plan"
		putstr_withScreen ex.message
	end
end

And (/^I verify usage$/) do
	begin
		sleep 5
		click_on "Usage"
		sleep 5
		page.should have_xpath("//img[contains(@src, 'csm_app_health_alert_banner.png')]")
		#page.should have_xpath("//*[contains(@src,'csm_app_health_alert_banner.png\']")
		page.should have_xpath("//a[@href='http://www.servicesource.com/revenue-analytics-software/']")
		puts "Usage verified "
	rescue Exception =>ex
		putstr "Error while verifying Usage from Success Plan"
		putstr_withScreen ex.message
	end
end

And (/^I verify Details Section$/) do
	begin
		sleep 5
		click_on "Details"
		sleep 5
		if page.has_content?('Success Plan Details')
			puts "Success Plan Details section displayed"
		else
			raise "Success Plan Details section not displayed"
		end
		if page.has_content?('Account Details')
			puts "Account Details section displayed"
		else
			raise "Account Details section not displayed"
		end
		if page.has_content?('Playbooks')
			puts "Playbooks section displayed"
		else
			raise "Playbooks section not displayed"
		end
		if page.has_content?('Opportunities')
			puts "Opportunities section displayed"
		else
			raise "Opportunities section not displayed"
		end
		puts "Details Section of Success Plan verified "
	rescue Exception =>ex
		putstr "Error while verifying Details Sections from Success Plan"
		putstr_withScreen ex.message
	end
end

And (/^I add new SP Opportunity$/) do
begin
	click_link "Details"
	sleep 5
	click_link "New Opportunity"
	sleep 5
	arg=getDetails "Opportunity Details"
	sleep 2
	puts "Creating a new opportunity"
	arg.each do |key,val|
		fill_in key,:with => val
		puts "Filled value for " + key + " column"
		#sleep 1
	end
	select "Qualification", :from => "Stage"
	sleep 1
	within(:id,"topButtonRow") do
		click_on "Save"
	end
	puts "Successfully created Opportunity" 
	rescue Exception =>ex
		putstr "Error while creating Opportunity from Success Plan"
		putstr_withScreen ex.message
	end
end

And  (/^I edit SuccessPlan Opportunity$/) do
	begin
		click_link "Details"
		sleep 5
		within(:id,"opportunitySPGrid") do
			first(".actionLink").click
    end
    sleep 4
    if page.has_content?("Opportunity Name")
		  fill_in "Opportunity Name",:with => " Edited Opportunity"
      sleep 3
		 within(:id,"topButtonRow") do
			 click_on "Save"
		 end
		  puts "Successfully updated Success Plan Opportunity"
    else
      puts "Edit SuccessPlan Opportunity not displayed"
    end
    sleep 3
	rescue Exception =>ex
		putstr "Error while Editing Opportunity from Success Plan"
		putstr_withScreen ex.message
	end
end

And  (/^I delete SuccessPlan Opportunity$/) do
	begin
		click_link "Details"
		sleep 5
		within(:id,"opportunitySPGrid") do
			page.accept_confirm { first(:link, "Del").click }
		end
		puts "Successfully deleted Opportunity" 
		rescue Exception =>ex
			putstr "Error while Deleting Opportunity from Success Plan"
			putstr_withScreen ex.message
		end
end

And(/^I add new SP Playbook$/) do 
	begin
		strPB = getDetails "PlayBook Details"
		click_link "Details"
		sleep 5
		click_on "Add Playbook"
		sleep 5
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("td")[1].text == strPB["Display Name"]
					row.all("td")[0].all('a')[0].click
					page.driver.switch_to.alert.confirm rescue Selenium::WebDriver::Error::NoAlertOpenError
					break
				end                        
			end
		end
		puts "Added Playbook Sucessfully"
		sleep 5
		first(:link, "Save").click
		puts "Saved Success Plan"
		sleep 5

    rescue Exception => ex
		putstr "Error occurred while adding Playbook for Success Plan"
		putstr_withScreen ex.message
	end
end


Then(/^I verify the completed the task$/) do
  begin
  sleep 4
	unless page.has_css?(".no-records-found")
		if $ispopwindow > 0
			newtasksCount = all(".checkEnabled").count
			sleep 5
			click_on "Activity Stream"
			sleep 5
			newactivityCount = find(".pagination-info").text.split("of").last.split("rows").last.to_i
			if ($tasksCount-newtasksCount)==1 || (newactivityCount-$activityCount)==1
				puts "Task completed and removed from Grid"
			else
				putstr "Task not removed from Grid after Complete click"
			end
			sleep 3
		else
			putstr "Complete Task pop up is not displayed"
		end
	else
		puts "No matching records found"
	end
  sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the completed task"
		putstr_withScreen ex.message
  end
end


And(/^I verify the dismiss the task$/) do
  begin
	 sleep 6
	 unless page.has_css?(".no-records-found")
		 if $ispopwindow > 0
				newtasksCount = all(".removeEnabled").count
				sleep 5
				click_on "Activity Stream"
				sleep 5
				newactivityCount = find(".pagination-info").text.split("of").last.split("rows").last.to_i
				unless ($tasksCount-newtasksCount)==1 and (newactivityCount-$activityCount)==1
					puts "Task dismissed and removed from Grid"
				else
					putstr "Task not removed from Grid after Dismiss click"
				end
				sleep 4
		 else
			 putstr "Complete Task pop up is not displayed"
		 end
	 else
		 puts "No matching records found"
	 end
	 sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the dismiss task"
		putstr_withScreen ex.message
 end
end


And(/^I fill the required details$/) do
	begin
  sleep 4
	arg = getReference "Reference"
	arg2 = getDetails "SuccessPlan"
	sleep 4
	fill_in "Success Plan Template", :with => arg["SPTemplate"]
	sleep 3
	fill_in "Phase Start Date",:with => arg2["Phase Start Date"]
	sleep 5
	puts "Successfully fill the required details"
	rescue Exception => ex
		putstr "Error occurred while filling the required details"
		putstr_withScreen  ex.message
	end
end

And(/^I click on "([^"]*)" button from success plan creation$/) do |button|
	begin
		sleep 3
    within("#topButtonRow") do
		click_on button
    end
		sleep 5
		puts "Successfully clicked the #{button} button"
	rescue Exception => ex
		putstr "Error occurred while clicking the #{button} button"
		putstr_withScreen  ex.message
	end
end


And(/^I click on "([^"]*)" button from "([^"]*)" page$/) do |go_button, tab_name|
	begin
		sleep 4
		find('#fcf').select "All"
		sleep 5
		within (".fBody") do
			click_button go_button
		end
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while cliking the #{go_button} button from #{tab_name} page"
		putstr_withScreen  ex.message
	end
end


Then(/^I verify the success plan created or not$/) do
	begin
		sleep 3
		arg = getReference "Reference"
		sleep 5
		result = false
		all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
			unless activity.text.include? arg["SPTemplate"]
				puts "Success plan #{arg["SPTemplate"]} is not created"
				result = true
				break
			end
		end
		putstr "Success plan #{arg["SPTemplate"]} is created" unless result
	rescue Exception => ex
		putstr "Error occurred while verifying the #{arg["SPTemplate"]} success plan"
		putstr_withScreen  ex.message
	end
end


And(/^I edit the existing success plan$/) do
	begin
		sleep 5
		arg = getReference "Reference"
		sleep 5
		foundCount = 0
		begin
			within(".x-grid3-body") do
				tr = all(".x-grid3-row-table")
				tr.each do |row|
					if row.all("td")[2].text == arg["SuccessPlan"]
						row.all("td")[1].all('a')[0].click
						foundCount = 1
						break
					end
				end
			end
			if page.has_css?('.next')
				find(".next").click
				sleep 3
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount == 0
			within(".x-grid3-body") do
				tr = all(".x-grid3-row-table")
				tr.each do |row|
					if row.all("td")[2].text == arg["SuccessPlan"]
						row.all("td")[1].all('a')[0].click
						foundCount = 1
						break
					end
				end
			end
		end
		if foundCount > 0
			puts "Successfully click the delete #{arg["SuccessPlan"]} link"
		else
			putstr "Delete Success Plan #{arg["SuccessPlan"]} link not found"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while editing the Success Plan"
		putstr_withScreen ex.message
	end
end



And(/^I delete the existing success plan$/) do
	begin
		sleep 5
		arg = getReference "Reference"
		sleep 5
		foundCount = 0
		begin
			within(".x-grid3-body") do
				tr = all(".x-grid3-row-table")
				tr.each do |row|
					if row.all("td")[2].text == arg["SuccessPlan"]
						row.all("td")[1].all('a')[1].click
						foundCount = 1
						break
					end
				end
			end
			if page.has_css?('.next')
				find(".next").click
				sleep 3
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount == 0
			within(".x-grid3-body") do
				tr = all(".x-grid3-row-table")
				tr.each do |row|
					if row.all("td")[2].text == arg["SuccessPlan"]
						row.all("td")[1].all('a')[1].click
						foundCount = 1
						break
					end
				end
			end
		end
		if foundCount > 0
			puts "Successfully click the delete #{arg["SuccessPlan"]} link"
		else
			putstr "Success Plan #{arg["SuccessPlan"]} delete link not found"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while deleting the Success Plan"
		putstr_withScreen ex.message
	end
end

And(/^I cancel the delete success plan confirmation pop up$/) do
  begin
   sleep 4
	 begin
		 page.driver.browser.switch_to.alert.dismiss
		 sleep 4
		 puts "Successfully cancel the delete #{arg["SuccessPlan"]} confirmation pop up"
	 rescue Exception => ex
		 putstr "#{arg["SuccessPlan"]} confirmation not displayed"
	 end
	rescue Exception => ex
	  putstr "Error occurred while cancel the delete #{arg["SuccessPlan"]} confirmation pop up"
	  putstr_withScreen ex.message
 end
end

And(/^I select the existing success plan$/) do
	begin
		sleep 5
		arg = getReference "Reference"
    foundCount = 0
		begin
			within(".x-grid3-body") do
				tr = all(".x-grid3-row-table")
				tr.each do |row|
					if row.all("td")[2].text == arg["SuccessPlan"]
						row.all("td")[2].all('a')[0].click
						foundCount = 1
						break
					end
				end
			end
			if page.has_css?('.next')
				find(".next").click
				sleep 3
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount == 0
			within(".x-grid3-body") do
				tr = all(".x-grid3-row-table")
				tr.each do |row|
					if row.all("td")[2].text == arg["SuccessPlan"]
						row.all("td")[2].all('a')[0].click
						foundCount = 1
						break
					end
				end
			end
		end
		if foundCount > 0
			puts "Successfully open the #{arg["SuccessPlan"]}"
		else
			putstr "Success Plan #{arg["SuccessPlan"]} not found"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while selecting the Success Plan"
		putstr_withScreen ex.message
	end
end

And(/^I verify the task time line$/) do
  begin
  sleep 3
  if page.has_css?("#timeline-container")
		puts "Successfully see the Time line"
    sleep 3
		if page.has_css?(".vis-box")
			puts "Successfully see the task icon"
			sleep 4
			first(".srevicon-phone-md").hover
			sleep 4
			task_tool_tip = first(".item-tooltip-container").text
			puts "Task hover details: #{task_tool_tip}"
			sleep 4
      phase_count = all(".phase-3").count
      puts "Number of Phases: #{phase_count}"
      sleep 3
		else
			puts "Task icons not found"
		end
  else
		puts "Time line Section not found"
  end
  sleep 3
  if page.has_css?(".timeline-presets")
    puts "Successfully see the time line zoom"
    sleep 3
    click_on "Rolling Quarter"
    sleep 3
		phase_count = all(".phase-3").count
		puts "Number of Phases: #{phase_count}"
		sleep 3
    puts "Successfully verify the zoom in and zoom out the time line"
  else
		putstr "Failed to see the time line zoom"
  end
  sleep 3
	rescue Exception => ex
	  putstr "Error occurred while verifying task time line"
	  putstr_withScreen ex.message
 end
end

Then(/^I verify the time line buttons$/) do
	begin
   sleep 4
   if page.has_css?(".timeline-table")
     puts "Successfully see the time line buttons"
     sleep 3
     within(".timeline-table") do
			 first("tbody").first("tr").all("td")[0].click
     end
     sleep 5
		 if page.has_css?(".vis-box")
			 puts "Successfully see the task icon"
			 sleep 4
			 first(".srevicon-phone-md").hover
			 sleep 4
			 task_tool_tip = first(".item-tooltip-container").text
			 puts "Task hover details: #{task_tool_tip}"
			 sleep 4
			 phase_count = all(".phase-3").count
			 puts "Number of Phases: #{phase_count}"
			 sleep 3
		 else
			 puts "Task icons not found"
     end
		 within(".timeline-table") do
			 first("tbody").first("tr").all("td")[2].click
		 end
		 sleep 5
   else
		 putstr "Failed to see the time line buttons"
   end
	rescue Exception => ex
		putstr "Error occurred while verifying the time line buttons"
		putstr_withScreen ex.message
	end
end

And(/^I verify "([^"]*)" link range$/) do |link|
	begin
   sleep 4
   click_on link
   sleep 6
	 if page.has_css?("#timeline-container")
		 puts "Successfully see the Time line"
		 sleep 3
		 if page.has_css?(".vis-box")
			 puts "Successfully see the task icon"
			 sleep 4
     if page.has_css?(".srevicon-phone-md")
       sleep 3
			 puts "Successfully see the service phone icon"
			 first(".srevicon-phone-md").hover
			 sleep 3
     if page.has_css?(".item-tooltip-container")
       sleep 2
			 task_tool_tip = first(".item-tooltip-container").text
			 puts "Task hover details: #{task_tool_tip}"
			 sleep 3
			 phase_count = all(".phase-3").count
			 puts "Number of Phases: #{phase_count}"
			 sleep 3
     else
       puts "No icons to hover the tool tip details"
     end
     else
       puts "Service phone icon not found"
     end
		 else
			 puts "Task icons not found"
		 end
	 else
		 puts "Time line Section not found"
	 end
	 sleep 3
	rescue Exception => ex
		putstr "Error occurred while verifying the #{link} range"
		putstr_withScreen ex.message
	end
end



And(/^I add the account details$/) do
  begin
    sleep 3
		arg = getReference "Reference"
    sleep 4
		fill_in "Account",:with => arg["AdditionalAccount"]
    sleep 3
    # within all(".pbSubsection")[0] do
    #   sleep 3
			# all(:xpath,"//input[@type='text']")[2].send_keys [:control, 'a'], :backspace
    #   sleep 3
			# all(:xpath,"//input[@type='text']")[2].send_keys arg["AdditionalAccount"]
    #   sleep 3
    # end
		within("#topButtonRow") do
			click_on "Save"
		end
    sleep 5
	rescue Exception => ex
		putstr "Error occurred while adding the account details"
		putstr_withScreen ex.message
	end
end

Then(/^I should be able to see the play task$/) do
  begin
   unless page.has_css?(".no-records-found")
     within("#actionSpGrid") do
       sleep 3
       if first("tbody").all("tr").count > 0
				 task_name = first("tbody").first("tr").all("td")[2].first("a").text
				 puts "Successfully see the task: #{task_name}"
       else
				 puts "Failed to see the task"
       end
     end
   else
     puts "No matching records found"
   end
	rescue Exception => ex
	  putstr "Error occurred while verify the play tasks"
	  putstr_withScreen ex.message
 end
end

And(/^I fill the required task details$/) do
 begin
	sleep 3
	arg = getDetails "Taskdetails"
	arg2 = getDetails "CreateTaskFields"
	spPlay = getReference "Reference"
	AccountDetails = getReference "Reference"
  AccountDetail = AccountDetails["Account"]
  puts AccountDetail
  $SuccessPlanValue = spPlay["SuccessPlanPlay"]
  puts $SuccessPlanValue 
  sleep 4
	within all('.pbSubsection').last do
		sleep 5
		$current_date = "#{Time.now.strftime("%m-%d-%Y")}"
    sleep 1
	  first(:xpath, "//*[contains(@id, 'dueValue')]").set $current_date
		sleep 1
		first(:xpath, "//*[contains(@id, 'taskNameValue')]").click
		first(:xpath, "//*[contains(@id, 'taskNameValue')]").set("Call")
		#first(:xpath, "//*[contains(@id, 'taskNameValue')]").set("Call")
    first(:xpath, "//*[contains(@id,'successPlanPlayValue')]").click
    first(:xpath, "//*[contains(@id,'successPlanPlayValue')]").set(spPlay["SuccessPlanPlay"])
   	# find("img[alt='Related To Lookup (New Window)']").click
   	# page.driver.browser.manage.window.maximize
    # sleep 10
   	# find(:xpath,'//input[contains(@placeholder,"Search...")]').send_keys AccountDetail
   	# sleep 1
   	# if page.has_button?('Go!')
      # click_on "Go!"
    # end
    # sleep 3
    # first(:xpath,"//*[@id='new']/div/div[2]/div/div[2]/table/tbody/tr[2]/th/a").click
    # first(:xpath, "//*[contains(@title,'Related To')]").click
   	sleep 1
		#first(:xpath, "//*[contains(@id, 'taskTypeValue')]").click
		first(:xpath, "//*[contains(@id, 'taskTypeValue')]").select("Call")
		#first(:xpath, "//*[contains(@id, 'commentsValue')]").click
		first(:xpath, "//*[contains(@id, 'commentsValue')]").set(arg["CommentsValue"])
		sleep 1
		first(:xpath,"//*[contains(@id, 'taskStatusValue1')]").select arg2["NotStartedStatusfield"]
		sleep 1
		first(:xpath, "//*[contains(@title,'Related To')]").set(AccountDetails["Account"])
		sleep 3
	end
  puts "Successfully fill the task details"
	rescue Exception => ex
	  putstr "Error occurred while filling the required task details"
	  puts ex.backtrace.select { |x| x.match(/step_definitions/) }
	  putstr_withScreen ex.message
 end
end


And(/^I cancel the complete task$/) do
	begin
		sleep 3
		arg = getDetails "CreateTaskFields"
		sleep 5
		unless page.has_css?(".no-records-found")
			within("#actionSpGrid") do
				sleep 3
				if first("tbody").all("tr").count > 0
          sleep 3
					first(".checkEnabled").click
				else
					puts "Failed to see the tasks"
				end
			end
			sleep 5
			first(:xpath, "//*[contains(@id, 'taskStatusValue')]").select arg["CompletedStatusfield"]
			sleep 5
			within all(".pbBottomButtons")[0] do
       if page.has_button?("CANCEL")
				 puts "Successfully see the cancel button on complete task"
			  	click_on("CANCEL")
          sleep 3
				  puts "Successfully cancel the complete task"
       else
				 putstr "Failed to see the cancel button on complete task"
       end
      end
			sleep 5
		else
			puts "No matching records found"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while canceling the complete task"
		putstr_withScreen ex.message
	end
end


And(/^I cancel the dismiss task$/) do
	begin
		sleep 5
		unless page.has_css?(".no-records-found")
			within("#actionSpGrid") do
				sleep 3
				if first("tbody").all("tr").count > 0
					sleep 3
					first(".removeEnabled").click
				else
					puts "Failed to see the tasks"
				end
      end
			sleep 5
			first(:xpath, "//*[contains(@id, 'riskReasonValue')]").find(:xpath, 'option[2]').select_option
			sleep 5
			within all(".pbBottomButtons")[0] do
				if page.has_button?("CANCEL")
					puts "Successfully see the cancel button on dismiss task"
					click_on("CANCEL")
          sleep 3
					puts "Successfully cancel the dismiss task"
				else
					putstr "Failed to see the cancel button on dismiss task"
				end
			end
			sleep 5
		else
			puts "No matching records found"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while canceling the dismiss task"
		putstr_withScreen ex.message
	end
end

Then(/^I verify the "([^"]*)" "([^"]*)" fields$/) do |task, field|
	begin
		sleep 3
		arg = getDetails "CreateTaskFields"
		sleep 4
		within all('.pbSubsection').last do
			sleep 5
			result = false
			all(:xpath, ".//*[contains(@id, 'taskStatusValue1')]")[0].all('option').each do |status|
				if status.text.to_s.include? arg["NotStartedStatusfield"].to_s
					sleep 5
					puts "Successfully find the #{arg["NotStartedStatusfield"]} field value"
					result = true
					break
				end
			end
			putstr "Unable to find the #{arg["NotStartedStatusfield"]} field value" unless result
			sleep 5
			result = false
			all(:xpath, ".//*[contains(@id, 'taskStatusValue1')]")[0].all('option').each do |status|
				if status.text.to_s.include?arg["InProgressStatusfield"].to_s
					sleep 5
					puts "Successfully find the #{arg["InProgressStatusfield"]} field value"
					result = true
					break
				end
			end
			putstr "Unable to find the #{arg["InProgressStatusfield"]} field value" unless result
			sleep 5
			result = false
			all(:xpath, ".//*[contains(@id, 'taskStatusValue1')]")[0].all('option').each do |status|
				if status.text.to_s.include?arg["CompletedStatusfield"].to_s
					sleep 5
					puts "Successfully find the #{arg["CompletedStatusfield"]} field value"
					result = true
					break
				end
			end
			putstr "Unable to find the #{arg["CompletedStatusfield"]} field value" unless result
			sleep 5
			result = false
			all(:xpath, ".//*[contains(@id, 'taskStatusValue1')]")[0].all('option').each do |status|
				if status.text.to_s.include?arg["WaitingStatusfield"].to_s
					sleep 5
					puts "Successfully find the #{arg["WaitingStatusfield"]} field value"
					result = true
					break
				end
			end
			putstr "Unable to find the #{arg["WaitingStatusfield"]} field value" unless result
			sleep 5
			result = false
			all(:xpath, ".//*[contains(@id, 'taskStatusValue1')]")[0].all('option').each do |status|
				if status.text.to_s.include?arg["DeferredStatusfield"].to_s
					sleep 5
					puts "Successfully find the #{arg["DeferredStatusfield"]} field value"
					result = true
					break
				end
			end
			putstr "Unable to find the #{arg["DeferredStatusfield"]} field value" unless result
		end
    sleep 4
	rescue Exception => ex
		putstr "Error occurred while verifying the #{task} in #{field} fields"
		putstr_withScreen ex.message
	end
end


Then(/^I verify the contact widget details$/) do
	begin
  sleep 4
	arg = getReference "Reference"
  sleep 3
  if page.has_content?("Contacts")
  sleep 3
  if page.has_css?("#tbodyA")
    sleep 3
		within("#tbodyA") do
			rows = all("tr")
			rows.each do |row|
				if row.text == arg["AdditionalContactName"]
					puts "Successfully see the #{arg["AdditionalContactName"]} contact details"
					break
				end
			end
    end
		sleep 3
    if page.has_css?(".contact-icon")
      puts "Successfully see the contact icon"
     if page.has_css?(".iconContact-contact-success")
			 puts "Successfully see the CSM Contacts"
     else
			 puts "Successfully see the Non-CSM Contacts"
     end
     else
			 putstr "Failed to see the contact icon"
    end
    sleep 3
		within("#tbodyA") do
			$contact_name = first(".ss_contact_name").text
      first(".ss_contact_name").click
    end
		puts "Successfully click contact name #{$contact_name}"
    sleep 5
    if page.has_css?(".pageDescription")
			puts "Successfully see the contact details page"
      if find(".pageDescription").text == $contact_name
				puts "Successfully open the #{$contact_name} contact details page"
      else
				putstr "Failed to see the #{$contact_name} contact details page"
      end
      sleep 3
    else
			putstr "Failed to see the contact details page"
    end
	else
		puts "Contact details not found"
	end
  else
		putstr "Failed to see the contact widget"
  end
	rescue Exception => ex
		putstr "Error occurred while verifying the contact widget details"
		putstr_withScreen ex.message
	end
end

Then(/^I verify the opportunities grid details$/) do
	begin
  within("#opportunitySPGrid") do
		unless page.has_css?(".no-records-found")
     if page.has_content?("Amount (USD)") || page.has_contains?("Amount (EUR)")
			 puts "Successfully see the currency field value"
       sleep 3
      if first("tbody").all("tr").count > 0
       currency_value = first("tbody").first("tr").all("td")[4].text
       puts "Successfully see the currency #{currency_value} value"
      else
				putstr "No Opportunity Records found"
     end
     else
			 putstr "Failed to see the currency field value"
     end
		else
		puts "No matching records found"
	end
	sleep 5
  end
	rescue Exception => ex
		putstr "Error occurred while verifying the opportunities grid details"
		putstr_withScreen ex.message
	end
end

Then(/^I verify the banner is displayed$/) do
	begin
    sleep 3
    if page.has_css?(".messageTable")
			puts "Successfully see the banner"
    else
			putstr "Failed to see the banner"
    end
    sleep 3
	rescue Exception => ex
		putstr "Error occurred while verifying the banner"
		putstr_withScreen ex.message
	end
end


Then(/^I should be able to see the custom fields$/) do
	begin
		sleep 3
		arg = getDetails "CreateTaskFields"
		sleep 4
		if page.has_content?(arg["CSMAdminCustomFields1"])
			puts "Successfully see the CSM Admin custom #{arg["CSMAdminCustomFields1"]} field"
		else
			putstr "Failed to see the CSM Admin custom #{arg["CSMAdminCustomFields1"]} field"
    end
    sleep 3
		if page.has_content?(arg["CSMAdminCustomFields2"])
			puts "Successfully see the CSM Admin custom #{arg["CSMAdminCustomFields2"]} field"
		else
			putstr "Failed to see the CSM Admin custom #{arg["CSMAdminCustomFields2"]} field"
		end
		sleep 3
		if page.has_content?(arg["CSMAdminCustomFields3"])
			puts "Successfully see the CSM Admin custom #{arg["CSMAdminCustomFields3"]} field"
		else
			putstr "Failed to see the CSM Admin custom #{arg["CSMAdminCustomFields3"]} field"
		end
		sleep 3
		if page.has_content?(arg["CSMAdminCustomFields4"])
			puts "Successfully see the CSM Admin custom #{arg["CSMAdminCustomFields4"]} field"
		else
			putstr "Failed to see the CSM Admin custom #{arg["CSMAdminCustomFields4"]} field"
		end
		sleep 3
		if page.has_content?(arg["CSMAdminCustomFields5"])
			puts "Successfully see the CSM Admin custom #{arg["CSMAdminCustomFields5"]} field"
		else
			putstr "Failed to see the CSM Admin custom #{arg["CSMAdminCustomFields5"]} field"
		end
		sleep 3
		if page.has_content?(arg["CSMAdminCustomFields6"])
			puts "Successfully see the CSM Admin custom #{arg["CSMAdminCustomFields6"]} field"
		else
			putstr "Failed to see the CSM Admin custom #{arg["CSMAdminCustomFields6"]} field"
		end
		sleep 3
		if page.has_content?(arg["CSMAdminCustomFields7"])
			puts "Successfully see the CSM Admin custom #{arg["CSMAdminCustomFields7"]} field"
		else
			putstr "Failed to see the CSM Admin custom #{arg["CSMAdminCustomFields7"]} field"
		end
		sleep 3
		if page.has_content?(arg["CSMAdminCustomFields8"])
			puts "Successfully see the CSM Admin custom #{arg["CSMAdminCustomFields8"]} field"
		else
			putstr "Failed to see the CSM Admin custom #{arg["CSMAdminCustomFields8"]} field"
		end
		sleep 3
	rescue Exception => ex
		putstr "Error occurred while verifying the CSM Admin custom fields"
		putstr_withScreen ex.message
	end
end

And(/^I verify the "([^"]*)"$/) do |app|
	begin
		sleep 3
		within("#usage") do
			if page.has_xpath?("//*[contains(@id, 'SCOUTCanvas')]")
				puts "Successfully see the #{app}"
			else
				putstr "Failed to see the #{app}"
			end
		end
		sleep 4
	rescue Exception => ex
		putstr "Error occurred while verifying the #{app}"
		putstr_withScreen ex.message
	end
end

Then(/^I verify "([^"]*)" tab default labels$/) do |tab|
	begin
		sleep 3
		arg = getDetails "CreateTaskFields"
		sleep 4
		if page.has_content?(arg["DetailsSubTabDefaultLabels1"])
			puts "Successfully see the #{arg["DetailsSubTabDefaultLabels1"]} field"
		else
			putstr "Failed to see the #{arg["DetailsSubTabDefaultLabels1"]} field"
		end
		sleep 3
		if page.has_content?(arg["DetailsSubTabDefaultLabels2"])
			puts "Successfully see the #{arg["DetailsSubTabDefaultLabels2"]} field"
		else
			putstr "Failed to see the #{arg["DetailsSubTabDefaultLabels2"]} field"
		end
		sleep 3
		if page.has_content?(arg["DetailsSubTabDefaultLabels3"])
			puts "Successfully see the #{arg["DetailsSubTabDefaultLabels3"]} field"
		else
			putstr "Failed to see the #{arg["DetailsSubTabDefaultLabels3"]} field"
		end
		sleep 3
		if page.has_content?(arg["DetailsSubTabDefaultLabels4"])
			puts "Successfully see the #{arg["DetailsSubTabDefaultLabels4"]} field"
		else
			putstr "Failed to see the #{arg["DetailsSubTabDefaultLabels4"]} field"
		end
		sleep 3
		if page.has_content?(arg["DetailsSubTabDefaultLabels5"])
			puts "Successfully see the #{arg["DetailsSubTabDefaultLabels5"]} field"
		else
			putstr "Failed to see the #{arg["DetailsSubTabDefaultLabels5"]} field"
		end
		sleep 3
		if page.has_content?(arg["DetailsSubTabDefaultLabels6"])
			puts "Successfully see the #{arg["DetailsSubTabDefaultLabels6"]} field"
		else
			putstr "Failed to see the #{arg["DetailsSubTabDefaultLabels6"]} field"
		end
		sleep 3
		if page.has_content?(arg["DetailsSubTabDefaultLabels7"])
			puts "Successfully see the #{arg["DetailsSubTabDefaultLabels7"]} field"
		else
			putstr "Failed to see the #{arg["DetailsSubTabDefaultLabels7"]} field"
		end
		sleep 3
		if page.has_content?(arg["DetailsSubTabDefaultLabels8"])
			puts "Successfully see the #{arg["DetailsSubTabDefaultLabels8"]} field"
		else
			putstr "Failed to see the #{arg["DetailsSubTabDefaultLabels8"]} field"
		end
		sleep 3
		if page.has_content?(arg["DetailsSubTabDefaultLabels9"])
			puts "Successfully see the #{arg["DetailsSubTabDefaultLabels9"]} field"
		else
			putstr "Failed to see the #{arg["DetailsSubTabDefaultLabels9"]} field"
		end
		sleep 3
		if page.has_content?(arg["DetailsSubTabDefaultLabels10"])
			puts "Successfully see the #{arg["DetailsSubTabDefaultLabels10"]} field"
		else
			putstr "Failed to see the #{arg["DetailsSubTabDefaultLabels10"]} field"
		end
		sleep 3
		if page.has_content?(arg["DetailsSubTabDefaultLabels11"])
			puts "Successfully see the #{arg["DetailsSubTabDefaultLabels11"]} field"
		else
			putstr "Failed to see the #{arg["DetailsSubTabDefaultLabels11"]} field"
		end
		sleep 3
		if page.has_content?(arg["DetailsSubTabDefaultLabels12"])
			puts "Successfully see the #{arg["DetailsSubTabDefaultLabels12"]} field"
		else
			putstr "Failed to see the #{arg["DetailsSubTabDefaultLabels12"]} field"
		end
		sleep 3
		if page.has_content?(arg["DetailsSubTabDefaultLabels13"])
			puts "Successfully see the #{arg["DetailsSubTabDefaultLabels13"]} field"
		else
			putstr "Failed to see the #{arg["DetailsSubTabDefaultLabels13"]} field"
		end
		sleep 3
	rescue Exception => ex
		putstr "Error occurred while verifying the #{tab} default labels"
		putstr_withScreen ex.message
	end
end

And(/^I select the "([^"]*)" value from pick list in "([^"]*)" task$/) do |field, status|
	begin
		sleep 3
		arg = getDetails "CreateTaskFields"
		sleep 5
		$ispopwindow = 0
		unless page.has_css?(".no-records-found")
			within("#actionSpGrid") do
				sleep 3
				if first("tbody").all("tr").count > 0
					sleep 3
					first(".checkEnabled").click
          sleep 3
					$ispopwindow = 1
				else
					puts "Failed to see the tasks"
				end
      end
			sleep 5
		if $ispopwindow > 0
			$reason_code = "C - Support Issue - SPI"
			$current_date = "#{Time.now.strftime("%m-%d-%Y")}"
			sleep 4
			find(:xpath, "//*[contains(@id, 'completedOnValue')]").set $current_date
			sleep 4
			find(:xpath, "//*[contains(@id, 'riskReasonValue')]").select $reason_code
			sleep 4
			first(:xpath, "//*[contains(@id, 'taskStatusValue')]").select status
			sleep 5
		else
			putstr "Complete Task pop up is not displayed"
		end
		else
			puts "No matching records found"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while selecting the #{field} value from pick list"
		putstr_withScreen ex.message
	end
end


And(/^I "([^"]*)" the task$/) do |status|
	begin
		sleep 5
		unless page.has_css?(".no-records-found")
			if $ispopwindow > 0
				within all(".pbBottomButtons")[0] do
					sleep 3
					click_on "SAVE"
					sleep 3
					puts "Successfully #{status} the task"
				end
				sleep 3
			else
				putstr "#{status} Task pop up is not displayed"
			end
		else
			puts "No matching records found"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while saving the #{status} task"
		putstr_withScreen ex.message
	end
end


And(/^I select the "([^"]*)" value from pick list in dismiss task$/) do |field|
	begin
		sleep 4
		$ispopwindow = 0
		unless page.has_css?(".no-records-found")
			within("#actionSpGrid") do
				sleep 3
				if first("tbody").all("tr").count > 0
					sleep 3
					first(".removeEnabled").click
          sleep 3
					$ispopwindow = 1
				else
					puts "Failed to see the tasks"
				end
      end
			sleep 5
		if $ispopwindow > 0
			$reason_code = "D - Already Completed - ACD"
			$current_date = "#{Time.now.strftime("%m-%d-%Y")}"
			sleep 4
			find(:xpath, "//*[contains(@id, 'completedOnValue')]").set $current_date
			sleep 4
			first(:xpath, "//*[contains(@id, 'riskReasonValue')]").select $reason_code
			sleep 5
		else
			putstr "Complete Task pop up is not displayed"
		end
		else
			puts "No matching records found"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while verifying the dismiss task #{field}"
		putstr_withScreen ex.message
	end
end

And(/^I verify the "([^"]*)" task "([^"]*)" field$/) do |status, field|
	begin
  sleep 4
  iscompleteddate = 0
	if $ispopwindow > 0
  if page.has_css?("#ActivityHistory")
    sleep 4
		 within("#ActivityHistory") do
       sleep 3
		 if first("tbody").all("tr").count > 0
       puts "Successfully see the activity stream records"
       sleep 3
			 tr = first("tbody").all("tr")
			 tr.each do |row|
				 if row.all("td")[0].all('span')[0].text == $current_date
           sleep 3
					 $success_task = row.all("td")[2].all('a')[0].text
					 row.all("td")[2].all('a')[0].click
           sleep 3
					 iscompleteddate = 1
					 break
         else
           puts "Completed date is not matched"
				 end
       end
			 sleep 4
		 else
			 puts "No Activity Stream Records Found"
     end
    end
  else
		puts "No Activity Stream Records Found"
  end
  sleep 4
  if iscompleteddate > 0
		if find(".pageDescription").text == $success_task
			puts "Successfully see the success task #{$success_task} details page"
		else
			putstr "Failed to see the success task #{$success_task} details page"
		end
		sleep 4
		if page.has_content?(field)
			puts "Successfully see the #{field} field"
		else
			putstr "Failed to see the #{field} field"
		end
		sleep 3
		within all(".pbSubsection")[2] do
			reason_code = first("tbody").all("tr")[5].all("td")[1].text
			sleep 3
			if reason_code == $reason_code
				puts "Successfully see the #{status} task #{field} #{reason_code}"
			else
				putstr "Failed to see the #{status} task #{field} #{reason_code}"
			end
    end
  else
		puts "Completed date is not matched"
  end
	else
		putstr "#{status} Task pop up is not displayed"
	end
	rescue Exception => ex
		putstr "Error occurred while verifying the #{status} task #{field}"
		putstr_withScreen ex.message
	end
end



And(/^I select any filter from "([^"]*)" filter pick list$/) do |tab|
	begin
		sleep 3
		arg = getDetails "CreateTaskFields"
		sleep 4
		find(:xpath, "//*[contains(@id, 'taskFilters')]").select arg["ActionFilterField"]
		sleep 5
		puts "Successfully selected the #{arg["ActionFilterField"]} filter value from #{tab} tab"
		sleep 4
		unless page.has_css?(".no-records-found")
			within("#actionSpGrid") do
				sleep 3
				if first("tbody").all("tr").count > 0
					sleep 3
					first(".checkEnabled").click
				else
					puts "Failed to see the tasks"
				end
			end
			sleep 5
			first(:xpath, "//*[contains(@id, 'taskStatusValue')]").select arg["CompletedStatusfield"]
			sleep 5
			within all(".pbBottomButtons")[0] do
				if page.has_button?("CANCEL")
					puts "Successfully see the cancel button on complete task"
					click_on("CANCEL")
					sleep 3
					puts "Successfully cancel the complete task"
				else
					putstr "Failed to see the cancel button on complete task"
				end
			end
			sleep 5
		else
			puts "No matching records found"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while selecting the #{arg["ActionFilterField"]} value from #{tab} tab"
		putstr_withScreen ex.message
	end
end

Then(/^I verify the grid details are according to your filter selection$/) do
	begin
		sleep 3
		arg = getDetails "CreateTaskFields"
		sleep 4
		unless page.has_css?(".no-records-found")
			within("#actionSpGrid") do
				sleep 3
				if first("tbody").all("tr").count > 0
					sleep 3
					tr = first("tbody").all("tr")
					tr.each do |row|
						if row.all("td")[4].all('span')[0].text == arg["SucessPlanRelatedToField"]
							puts "Successfully see the #{arg["SucessPlanRelatedToField"]} related details"
            else
							puts "Failed to see the #{arg["SucessPlanRelatedToField"]} related details"
						end
					end
					sleep 4
				else
					puts "No Tasks Found"
				end
			end
		else
			puts "No matching records found"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while verifying the grid details"
		putstr_withScreen ex.message
	end
end


Then(/^I verify that user preference is saved as per last selection$/) do
	begin
		sleep 3
		arg = getDetails "CreateTaskFields"
		sleep 4
		unless page.has_css?(".no-records-found")
			within("#actionSpGrid") do
				sleep 3
				if first("tbody").all("tr").count > 0
					sleep 3
					tr = first("tbody").all("tr")
					tr.each do |row|
						if row.all("td")[4].all('span')[0].text == arg["SucessPlanRelatedToField"]
							puts "User prefernces is saved as per last selection"
						else
							puts "User prefernces is not saved as per last selection"
						end
					end
					sleep 4
				else
					puts "No Tasks Found"
				end
			end
		else
			puts "No matching records found"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while verifying the user saved prefernces"
		putstr_withScreen ex.message
	end
end

When(/^I select the default filter from "([^"]*)" filter pick list$/) do |tab|
	begin
		sleep 3
		arg = getDetails "CreateTaskFields"
		sleep 4
		find(:xpath, "//*[contains(@id, 'taskFilters')]").select arg["ActionDefaultFilterField"]
		sleep 5
		puts "Successfully selected the #{arg["ActionDefaultFilterField"]} filter value from #{tab} tab"
	rescue Exception => ex
		putstr "Error occurred while selecting the #{arg["ActionDefaultFilterField"]} value from #{tab} tab"
		putstr_withScreen ex.message
	end
end

And(/^I click on complete task$/) do
	begin
		sleep 4
		unless page.has_css?(".no-records-found")
			within("#actionSpGrid") do
				sleep 3
				if first("tbody").all("tr").count > 0
					sleep 3
					first(".checkEnabled").click
				else
					puts "Failed to see the tasks"
				end
			end
		else
			puts "No matching records found"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while clicking the complete task"
		putstr_withScreen ex.message
	end
end

Then(/^I verify the additional fields$/) do
	begin
	sleep 4
	unless page.has_css?(".no-records-found")
		if $ispopwindow > 0
		  if page.has_content?("Additional Fields")
				puts "Successfully see the additional fields"
        if page.has_xpath?("//*[contains(@id, 'taskIn_field')]")
					puts "Successfully see the additional fields"
        else
					putstr "Failed to see the additional fields"
        end
			else
				putstr "Failed to see the additional fields"
      end
  	else
			putstr "Pop up is not displayed"
	 end
	else
		puts "No matching records found"
	end
	sleep 5
	rescue Exception => ex
		putstr "Error occurred while verifying the additional fields"
		putstr_withScreen ex.message
	end
end

And(/^I verify the required fields$/) do
	begin
	sleep 4
	unless page.has_css?(".no-records-found")
		if $ispopwindow > 0
			if page.has_content?("Additional Fields")
				puts "Successfully see the additional fields"
				sleep 5
				first(:xpath, "//*[contains(@id, 'taskIn_field')]").send_keys [:control, 'a'], :backspace
				sleep 5
				within all(".pbBottomButtons")[0] do
						click_on "SAVE"
						sleep 3
						puts "Successfully complete the task"
        end
        sleep 4
        within all(".pbSubsection")[1] do
          if page.has_css?(".errorMsg")
						puts "Successfully see the required field error message"
          else
						putstr "Failed to see the required field error message"
          end
        end
      else
				putstr "Failed to see the required fields"
      end
		else
			putstr "Pop up is not displayed"
		end
	else
		puts "No matching records found"
	end
	sleep 4
	rescue Exception => ex
		putstr "Error occurred while verifying the required fields"
		putstr_withScreen ex.message
	end
end

And(/^I click on dismiss task$/) do
	begin
		sleep 4
		unless page.has_css?(".no-records-found")
			within("#actionSpGrid") do
				sleep 3
				if first("tbody").all("tr").count > 0
					sleep 3
					first(".removeEnabled").click
				else
					puts "Failed to see the tasks"
				end
			end
			sleep 4
		else
			puts "No matching records found"
		end
		sleep 4
	rescue Exception => ex
		putstr "Error occurred while clicking the dismiss task"
		putstr_withScreen ex.message
	end
end

Then(/^I verify the "([^"]*)" vf page component$/) do |custom_layout|
	begin
		sleep 10
    within all(".pbSubsection")[1] do
    if page.has_css?(".individualPalette")
      sleep 3
			puts "Successfully see the #{custom_layout} vf page component is displayed as blank"
		else
			putstr "#{custom_layout} vf page component is not displayed as blank"
    end
   end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while verifying the #{custom_layout} vf page component"
		putstr_withScreen ex.message
	end
end

And(/^I fill the account data$/) do
	begin
   sleep 3
	 arg = getDetails "CreateTaskFields"
   sleep 4
	 fill_in "Account Name",:with => arg["AccountName1"]
   sleep 3
	 puts "Successfully fill the account details"
	rescue Exception => ex
		putstr "Error occurred while filling the account data"
		putstr_withScreen ex.message
	end
end

And(/^I create the account$/) do
	begin
		sleep 4
		within("#topButtonRow") do
			click_on "Save"
		end
		sleep 4
		puts "Successfully created the Account"
	rescue Exception => ex
		putstr "Error occurred while creating the account"
		putstr_withScreen ex.message
	end
end

And(/^I open the created account$/) do
  begin
		sleep 5
		arg = getDetails "CreateTaskFields"
		sleep 5
		find('#fcf').select "My Accounts"
		sleep 5
		within (".fBody") do
			click_on "Go!"
		end
		sleep 10
		foundCount = 0
		begin
			within(".x-grid3-body") do
				tr = all(".x-grid3-row-table")
				tr.each do |row|
					if row.all("td")[2].text == arg["AccountName1"]
						row.all("td")[2].all('a')[0].click
						foundCount = 1
						break
					end
				end
			end
			if page.has_css?('.next')
				find(".next").click
				sleep 3
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount == 0
			within(".x-grid3-body") do
				tr = all(".x-grid3-row-table")
				tr.each do |row|
					if row.all("td")[2].text == arg["AccountName1"]
						row.all("td")[2].all('a')[0].click
						foundCount = 1
						break
					end
				end
			end
		end
		if foundCount > 0
			puts "Successfully open the #{arg["AccountName1"]}"
		else
			putstr "Account #{arg["AccountName1"]} not found"
		end
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while selecting the created account"
		putstr_withScreen ex.message
	end
end

When(/^I delete the created account$/) do
	begin
		sleep 4
		within("#topButtonRow") do
			click_on "Delete"
		end
		sleep 5
		puts "Successfully deleted the Account"
	rescue Exception => ex
		putstr "Error occurred while deleting the account"
		putstr_withScreen ex.message
	end
end


Then(/^I verify the success plan details in "([^"]*)" vf page$/) do |custom_layout|
	begin
		sleep 3
		arg = getDetails "CreateTaskFields"
		sleep 4
		if page.has_css?(".individualPalette")
			if page.has_content?(arg["DetailsSubTabDefaultLabels2"])
				puts "Successfully see the success plan details in #{custom_layout} vf page"
			else
				putstr "Failed to see the success plan details in #{custom_layout} vf page"
      end
			sleep 3
			if page.has_content?(arg["DetailsSubTabDefaultLabels3"])
				puts "Successfully see the success plan details in #{custom_layout} vf page"
			else
				putstr "Failed to see the success plan details in #{custom_layout} vf page"
			end
			sleep 3
		else
			putstr "Failed to see the #{custom_layout} vf page component"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while verifying the success plan details in #{custom_layout} vf page"
		putstr_withScreen ex.message
	end
end

When(/^I edit the success plan from account$/) do
  begin
  sleep 5
	arg = getReference "Reference"
  sleep 4
	within all(".listRelatedObject")[0] do
   within(".pbBody") do
     sleep 3
		 first("tbody").all(".dataRow")[0].all("td")[0].first("a").click
     sleep 4
    end
   end
	 sleep 3
	 fill_in "Account",:with => arg["Account"]
	 sleep 4
	  within("#topButtonRow") do
		  click_on "Save"
	  end
		sleep 6
		puts "Successfully to edited success plan from account page"
	rescue Exception => ex
  	putstr "Error occurred while editing the success plan from account page"
	  putstr_withScreen ex.message
 end
end

And(/^I verify the "([^"]*)" field$/) do |field|
	begin
   sleep 5
    if page.has_content?(field)
      puts "Successfully see the #{field} field"
      sleep 3
      within all(".pbSubsection")[1] do
				if first(".checkImg")['title'] == "Not Checked"
					puts "#{field} field is unchecked"
				else
					putstr "#{field} field is checked"
					sleep 4
        end
      end
    else
			putstr "Failed to see the #{field} field"
    end
   sleep 4
	rescue Exception => ex
		putstr "Error occurred while verifying the #{field} field"
		putstr_withScreen ex.message
	end
end

And(/^I navigate to the account page$/) do
	begin
		sleep 6
    if page.has_xpath?("//*[contains(@id, 'TheLink')]")
      puts "Successfully see the account"
      sleep 3
			account_name = find(:xpath,"//*[contains(@id, 'TheLink')]").text
      puts account_name
      sleep 3
      find(:xpath,"//*[contains(@id, 'TheLink')]").click
      sleep 3
    else
			putstr "Failed to see the account"
    end
	  sleep 3
	rescue Exception => ex
		putstr "Error occurred while navigating to the account page"
		putstr_withScreen ex.message
	end
end

And(/^I should able to see the "([^"]*)" field value$/) do |field|
	begin
		sleep 5
		if page.has_content?(field)
			puts "Successfully see the #{field} field"
			sleep 3
			within all(".pbSubsection")[1] do
				if first(".checkImg")['title'] == "Not Checked"
					puts "#{field} field is unchecked"
				else
					putstr "#{field} field is checked"
					sleep 4
					within("#topButtonRow") do
						click_on "Edit"
					end
					sleep 5
					within all(".pbSubsection")[3] do
						if find("input[type='checkbox']").checked?
							puts "#{field} is already enabled"
							sleep 4
						else
							sleep 4
							find("input[type='checkbox']").click
							sleep 4
							puts "Enabled the #{field}"
							break
						end
					end
					sleep 4
					within("#topButtonRow") do
						click_on "Save"
					end
					sleep 5
				end
			end
		else
			putstr "Failed to see the #{field} field"
		end
		sleep 4
	rescue Exception => ex
		putstr "Error occurred while verifying the #{field} field"
		putstr_withScreen ex.message
	end
end


And(/^I click on "([^"]*)" picker$/) do |column|
	begin
    sleep 5
     within(".keep-open") do
       first("button").click
     end
		# find("//div[@title='Columns']").click
    sleep 3
    puts "Successfully click the #{column}"
	rescue Exception => ex
		putstr "Error occurred while click on the #{column} picker"
		putstr_withScreen ex.message
	end
end

# And(/^I click column picker for Activity Stream$/) do |column|
  # begin
    # sleep 5
    # find(:xpath,"//*[contains(@class,'dropdown-toggle')]").click
    # puts "I successfully Clicked on Column Picker"
    # sleep 3
    # puts "Successfully click the column"
  # rescue Exception => ex
    # putstr "Error occurred while click on the column picker"
    # putstr_withScreen ex.message
  # end
# end

Then(/^I verify the "([^"]*)" and "([^"]*)" fields$/) do |record_type, task_type|
	begin
		sleep 4
		if page.has_content?(record_type)
			puts "Successfully see the #{record_type} field"
		else
			putstr "Failed to see the #{record_type} field"
		end
		sleep 3

		if page.has_content?(task_type)
			puts "Successfully see the #{task_type} field"
		else
			putstr "Failed to see the #{task_type} field"
		end
		sleep 4
	rescue Exception => ex
		putstr "Error occurred while verifying the #{record_type} and #{task_type} fields"
		putstr_withScreen ex.message
	end
end

When(/^I select the "([^"]*)" and "([^"]*)" fields$/) do |record_type, task_type|
	begin
   sleep 4
   within all(".dropdown-menu")[0] do
     all("li").each do |column|
       sleep 3
       if column.first("label").text == record_type
         puts "Successfully see the #{record_type} field"
         sleep 3
				 column.first("input").click
         sleep 3
       end
       sleep 4
			 if column.first("label").text == task_type
				 puts "Successfully see the #{task_type} field"
				 sleep 3
				 column.first("input").click
				 sleep 3
			 end
     end
   end
   sleep 5
	rescue Exception => ex
		putstr "Error occurred while selecting the #{record_type} and #{task_type} fields"
		putstr_withScreen ex.message
	end
end

Then(/^I verify the "([^"]*)" and "([^"]*)" fields selection is saved or not$/) do |record_type, task_type|
	begin
		sleep 4
		within all(".dropdown-menu")[0] do
			all("li").each do |column|
				sleep 3
				if column.first("label").text == record_type
					puts "Successfully see the #{record_type} field"
					sleep 3
					if column.first("input").checked?
            puts "#{record_type} field is selected"
          else
						putstr "#{record_type} field is not selected"
          end
					sleep 3
				end
				sleep 4
				if column.first("label").text == task_type
					puts "Successfully see the #{task_type} field"
					sleep 3
					if column.first("input").checked?
						puts "#{task_type} field is selected"
					else
						putstr "#{task_type} field is not selected"
					end
					sleep 4
        end
			end
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while verifying the #{record_type} and #{task_type} fields selection is saved or not"
		putstr_withScreen ex.message
	end
end

Then(/^I verify the "([^"]*)" and "([^"]*)" user preference is saved$/) do |record_type, task_type|
	begin
		sleep 4
		within all(".dropdown-menu")[0] do
			all("li").each do |column|
				sleep 3
				if column.first("label").text == record_type
					puts "Successfully see the #{record_type} field"
					sleep 3
					if column.first("input").checked?
						puts "User preference selection is saved"
					else
						putstr "User preference selection is not saved"
					end
					sleep 3
				end
				sleep 4
				if column.first("label").text == task_type
					puts "Successfully see the #{task_type} field"
					sleep 3
					if column.first("input").checked?
						puts "User preference selection is saved"
					else
						putstr "User preference selection is not saved"
					end
					sleep 4
				end
			end
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while click verifying the #{record_type} and #{task_type} user preference is saved"
		putstr_withScreen ex.message
	end
end



And(/^I click on any Success Plan Name to navigate to Action Tab to verify tasks$/) do
	begin
		$i = 0
		sleep 5
		within(".list") do
			first("tbody").all("tr")[1].first("th").first("a").click
		end
		sleep 30
		if page.has_css? (".icons-container")
			puts "Tasks present on Action Tab."
			$i = 1
		else
			puts "No Tasks present on Action Tab."
			$i = 0
		end
	rescue Exception => ex
		putstr "Error occurred while clicking on Success Plan Name and verifying tasks."
		putstr_withScreen ex.message
	end
end

And(/^I click on Subject of any task on the Action Tab$/) do
	begin
		unless $i == 0
			sleep 2
			if page.has_css? (".icons-container")
				within(".fixed-table-body") do
					tr = first("table").first("tbody").all("tr")
					tr.each_with_index do |taskrow,index|
						unless taskrow.has_css? (".disabled")
							taskrow.all("td")[2].first("a").click
							puts "Subject link value clicked."
							sleep 15
							break
						else
							puts "No pending Tasks available on Action Tab page of Success Plan for selection."
						end
					end
				end
			else
			#	puts "No Tasks present."
			end
		else
			puts "No Tasks present on Action Tab."
			sleep 5
		end
	rescue Exception => ex
		putstr "Error occurred while clicking on Subject of any task on the Action Tab."
		putstr_withScreen ex.message
	end
end



Then(/^I verify "([^"]*)" is default unchecked in the column picker$/) do |playbook| 
  begin
    sleep 6
    within all(".dropdown-menu")[0] do
      all("li").each do |column|
        sleep 3
        if column.first("label").text == playbook
          puts "Successfully see the #{playbook} field"
          sleep 3
          if column.first("input").checked?
            puts "#{playbook} field is selected by Default"
          else
            puts "#{playbook} field is not selected by Default"
          end
          sleep 3
        end  
  end
  end
  rescue Exception => ex
    putstr "Error occurred while click verifying the #{Playbook} is by default Checked"
    putstr_withScreen ex.message
  end
end

And(/^I select Playbook from Column picker for Actions$/)do 
  begin
      sleep 3
      first(:xpath,"//*[contains(@class,'dropdown-toggle')]").click
      puts "Successfully clicked on Column Picker"
      sleep 6
      within('.dropdown-menu') do
      find(:xpath,"//li[4]/label[contains(text(),'Playbook')]/input").set(true)
      puts "Successfully selected the playbook column"    
      end
  rescue Exception => ex
    putstr "Error occurred while selecting the Playbook"
    putstr_withScreen ex.message
  end
end

And(/^I select Playbook from Column picker for Activity Stream$/)do 
  begin
      sleep 5
      first(:xpath,"//*[contains(@class,'dropdown-toggle')]").click
      puts "I successfully Clicked on Column Picker"
      sleep 6
      within('.dropdown-menu') do
      find(:xpath,"//li[5]/label[contains(text(),'Playbook')]/input").set(true)
      puts "Successfully selected the playbook column" 
      end
  rescue Exception => ex
    putstr "Error occurred while selecting the Playbook for Activity Stream"
    putstr_withScreen ex.message
  end
end


And(/^I verify Playbook for Action Tab$/) do 
  begin
    sleep 5
    page.execute_script "window.scrollBy(0,10000)"
    sleep 2
    within("#actionSpGrid")do
   if page.has_xpath? (".//div[text()='Playbook']")
        puts "Playbook Column is Visible"
      else
        puts "Playbook Column is not Visible "
   end
  end
  rescue Exception => ex
    putstr "Error occurred while verifying Playbook for Action Tab"
    putstr_withScreen ex.message
  end
end

And(/^I verify Playbook for Activity Stream Tab$/) do 
  begin
    sleep 5
    page.execute_script "window.scrollBy(0,10000)"
    within("#ActivityHistory")do
   if page.has_xpath? (".//div[text()='Playbook']")
          puts "Playbook Column is Visible"
      else
        puts "Playbook Column is not Visible "
   end
  end
  rescue Exception => ex
    putstr "Error occurred while verifying Playbook for Activity Stream Tab"
    putstr_withScreen ex.message
  end
end

And(/^I click on Playbook link and navigate to Playbook Detail page for Action Tab$/) do 
  begin
   find(:xpath,"//*[@id='actionSpGrid']/tbody/tr[1]/td[5]/a").click
   puts "Successfully clicked on Playbook and Navigated to Playbook Detail Page"
   sleep 10
   
   if page.has_text? ("Playbook")
      puts "Navigated to Playbook page."
    end
 
  rescue Exception => ex
    putstr "Error occurred while clicking on Playbook link"
    putstr_withScreen ex.message
  end
end

And(/^I click on Playbook link and navigate to Playbook Detail page for Activity Stream$/) do 
  begin
   first(:xpath,"//*[@id='ActivityHistory']/tbody/tr/td[5]/a").click
   puts "Successfully clicked on Playbook"
   
   if page.has_text? ("Playbook")
      puts "Navigated to Playbook page."
    end
     
   rescue Exception => ex
    putstr "Error occurred while clicking on Playbook link"
    putstr_withScreen ex.message
  end
end



And(/^I verify value in Task Detail Page$/) do
  begin
    if page.has_text? ("Task")
      puts "Navigated to task page."
    end
  sleep 5  
   TaskValue = find(:xpath,'//*/td[text()="Success Plan Play"]/following-sibling::td/div').text
   puts TaskValue
   if $SuccessPlanValue == TaskValue
    puts "Task Value verified Successfully"
   else
    puts "Task Value is not Verified"
    end
   sleep 3 
  rescue Exception => ex
    putstr "Error occurred while verifying Task State status."
    putstr_withScreen ex.message
  end
end



And(/^I save the Task and click on the Subject$/) do
  begin
    within(".pbButtonb") do
      click_on "SAVE"
     puts "Clicked on Save button"
    end
    
    find(:xpath,"//*[@id='actionSpGrid']/tbody/tr[1]/td[3]/a").click
    puts "Successfully click on the Subject"
  
  rescue Exception => ex
    putstr "Error occurred while verifying Task State status."
    putstr_withScreen ex.message
  end
end


And(/^I save the Task$/) do
  begin
   within(".pbButtonb") do
      click_on "SAVE"
     puts "Clicked on Save button"
    end
   sleep 8
  
   within(:id,"topButtonRow") do
      click_on "Save"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying saving the Task."
    putstr_withScreen ex.message
  end
end

And(/^I click on the Subject for Success Plan$/) do
  begin
   
   find(:xpath,"//*[@id='actionSpGrid']/tbody/tr[1]/td[3]/a").click
   puts "Successfully click on the Subject"
  
  rescue Exception => ex
    putstr "Error occurred while clicking on the Subject."
    putstr_withScreen ex.message
  end
end

And(/^I click on the Subject for Success Task$/) do
  begin
   
find(:xpath,"//*[@id='taskGrid']/tbody/tr[1]/td[4]/a").click
   puts "Successfully click on the Subject"
  
  rescue Exception => ex
    putstr "Error occurred while clicking on the Subject."
    putstr_withScreen ex.message
  end
end


