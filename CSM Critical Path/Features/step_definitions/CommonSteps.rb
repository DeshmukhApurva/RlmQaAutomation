#All Step Definitions which are common across modules


Given(/^that I navigate to the CRM application$/) do
	begin
    sleep 4
		visit env
		puts "Login as " + ENV['UserRole']
		arg=getCredentialInfo
		fill_in "username",:with => arg["userName"]
		fill_in "Password",:with => arg["pwd"]
		puts "Entered Credentials"
		find(:id,"Login").click
		page.driver.browser.manage.window.maximize
		# find(:id,"tsidButton").click
		# begin
			# click_on "ServiceSource Cloud Apps"
		# rescue Exception => ex
			# puts "Already in ServiceSource Cloud Apps"
		# end
		sleep 10
	rescue Exception => ex
		puts "Error  while entering credentials"
		puts ex.message
	end
end

Then(/^I should land on CRM home page$/) do
	begin
	 sleep 5
		
		if page.has_content? "Accounts"
			puts "User Logged in Successfully" 
		else 
			raise "Login Failed"
		end				
	rescue Exception => ex
		putstr "Error  occurred while login"
		putstr ex.message
	end
end

Then(/^I logout$/) do
	begin
		sleep 5
		click_on "Logout"
		sleep 5
		puts "Logged out"
	rescue Exception => ex
		puts "Error  occurred during Logout"
		puts ex.message
	end
end

Then(/^I create new Account$/) do
	begin
		arg=getDetails "Account"
		click_on "New"
		sleep 2
		puts "Creating a new Account"
		arg.each do |key,val|
			fill_in key,:with => val
			puts "Filled value for " + key + " column"
			sleep 1
		end
		find("option[value='Healthy']").click
		
		sleep 1
		within(:id,"topButtonRow") do
			click_on "Save"
		end
		
		puts "Account  successfully created" 
    rescue Exception => ex
		puts "Error occurred while creating Account"
		puts ex.message
	end
end

Then (/^I delete an Account$/) do
	begin
		select "My Accounts", :from => "fcf"
		sleep 5
		within(".fBody") do
			click_on "Go!"
		end
		sleep 5
		arg = getDetails "Account"	
		within(".x-grid3-body") do
			rows = all(".x-grid3-row")
			rows.each do |row|
				if row.all("td")[2].text==arg["Account Name"]		
					page.accept_confirm { row.first(:link,"Del").click }	
					break
				end
			end
			sleep 5
			puts "Account <b>#{arg['Account Name']}</b> Deleted"
		end
	rescue Exception => ex
		putstr "Error occurred while deleting a Account"
		putstr ex.message
	end
end

Then(/^I access contacts and create a new contact$/) do

	begin
		arg=getContactInfo
		click_link('Contacts')
		sleep 2
		click_on "New"
		sleep 2
		puts "Creating a new Contact"
		arg.each do |key,val|
			fill_in key,:with => val
			puts "Filled value for " + key + " column"
			#sleep 1
		end
		sleep 1
		within(:id,"topButtonRow") do
			click_on "Save"
		end
		puts "Contact successfully created" 
    rescue Exception => ex
		puts "Error occurred while creating contact"
		puts ex.message
	end
end
Then(/^I access Opportunity and create a new opportunity$/) do

	begin
		arg=getOpportunityInfo
		click_link('Opportunities')
		sleep 2
		click_on "New"
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
    rescue Exception => ex
		puts "Error occurred while creating Opportunities"
		puts ex.message
	end
end

Then(/^I view Opportunities$/) do
	begin
		arg=getOpportunityInfo
		click_link('Opportunities')
		sleep 2
		within(".list") do 
			first(:link, arg["Opportunity Name"]).click
		end
		sleep 1
		within(:id,"topButtonRow") do 
			click_on "Edit"
		end
		puts "Opening Opportunity to verify"
		arg.each do |key,val|
			page.should have_field(key, with: val)
			puts "verified " + key + ":" + val
			sleep 1
		end
		puts "Verified Opportunity successfully"
	rescue Exception  => ex
		puts "Error occurred while verifying account"
		puts ex.message
	end	
end

Then(/^I access ServiceSource Setup and create a new ServiceSource Setup$/) do

	begin
		arg=getPlayBookInfo
		click_link('ServiceSource Setup')
		sleep 5
		click_link('Playbooks')
		puts "clicked successfully"
		sleep 2
		click_on "New"
		puts "Creating a new Playbook"
		sleep 2
		arg.each do |key,val|
			fill_in key,:with => val
			puts "Filled value for " + key + " column"
			sleep 1
		end
		select "Qualification", :from => "Stage"
		sleep 1
		within(:id,"topButtonRow") do
			click_on "Save"
		end
		puts "Successfully created Playbook" 
    rescue Exception => ex
		puts "Error occurred while creating Playbook"
		puts ex.message
	end 
end

Then(/^I edit Account$/) do
	begin
		arg=getDetails "Account"
		click_link('Accounts')
		sleep 2
		within(".list") do 
			first(:link, arg["Account Name"]).click
		end
		sleep 1
		within(:id,"topButtonRow") do 
			click_on "Edit"
		end
		puts "Opening account to verify"
		arg.each do |key,val|
			page.should have_field(key, with: val)
			puts "verified " + key + ":" + val
			sleep 1
		end
		puts "verified Account successfully"
	rescue Exception  => ex
		puts "Error occurred while verifying account"
		puts ex.message
	end	
end

Then(/^I view Account$/) do
	begin
	    sleep 5
		select "My Accounts", :from => "fcf"
		sleep 3
		if all(".fBody").count > 0
			within(".fBody") do
				click_on "Go!"
			end
		else
			  all(".btn",:text => "Go!").last.click
	    end
		sleep 5
		arg = getDetails "Account"	
		foundCount = ""
		begin  
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
				  if row.all("td")[2].text==arg["Account Name"]
					row.first(:link,arg["Account Name"]).click 
					foundCount = "First record found with match " + arg["Account Name"] + " opened"
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
				  if row.all("td")[2].text==arg["Account Name"]
					row.first(:link,arg["Account Name"]).click 
					foundCount = "First record found with match " + arg["Account Name"] + " opened"
					break
				  end	
				end
			end
		end
		sleep 5
		puts "Opened Account successfully. "+foundCount
	rescue Exception  => ex
		puts "Error occurred while verifying account"
		puts ex.message
	end	
end

Then(/^I view Contact$/) do
	begin
		arg=getContactInfo
		click_link('Contacts')
		sleep 2
		within(".list") do 
			first(:link, arg["Last Name"]+", "+arg["First Name"]).click
		end
		sleep 1
		within(:id,"topButtonRow") do 
			click_on "Edit"
		end
		puts "Opening contact to verify"
		arg.each do |key,val|
			page.should have_field(key, with: val)
			puts "verified " + key + ":" + val
			#sleep 1
		end
		puts "Contact details verified successfully"
	rescue Exception => ex
		puts "Error occurred while verifying contact"
		puts ex.message
	end	
end

And /^I create a new Account$/ do
	begin
		click_link('Accounts')
		click_on "New" 
		time1 = Time.new
		puts time1.inspect
		#fill_in Account Name,:with => 'test'
		fill_in('Account Name', :with => 'ABC')
		fill_in('Last Health Status', :with => time1.inspect)
		find("option[value='Healthy']").click
		within(:id,"topButtonRow") do
			click_on "Save"
		end
		sleep 10
		rescue Exception => ex
		puts ex.message
	end	
end


When(/^I Navigate to (.*?) tab$/) do |arg1|
  sleep 10
  first(:link, arg1).click
  sleep 2
  puts "Navigated to " + arg1 + " tab"
end

When(/^I click on "(.*?)" link$/) do |arg1|
  first(:link, arg1).click
  sleep 10
  puts "Navigated to " + arg1 + " tab"
end

And (/^I switch to new tab$/) do 
   page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
   sleep 10
end

And (/^I switch back to first tab$/)do
  page.driver.browser.close
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
  sleep 10
end


Then(/^I should be able to see help page$/) do
  sleep 15
  puts first("h1").text
  puts "Help page displayed"
end

And (/^I Verify hamburger icon$/) do
	begin
		find('.custom-btn-circle').click
		sleep 5
	rescue Exception => ex
	    puts "Hamburger icon not present"
	end
end

Then (/^I should see the hamburger icon$/) do
   arg = getDetails("HamburgerMenu")
   i = 0
   listMenu = find('.dropdown-menu-right')
   liText = listMenu.all('li')
   liText.each do | liItem |
	if liItem.text == arg[i]
		puts "Item " + liItem.text + " present"
	end
	i=i+1
   end
   puts "Hamburger icon displayed"
   liText[0].click
   find(:xpath, "//*[contains(@id, 'selectObjectType')]").select("Account")
   find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select("Account Owner")  
   find(:xpath, "//*[contains(@id, 'chboxSaveAsDefaultValue')]").click
   find(".lookupIcon").click
	sleep 10
	within_window(page.driver.browser.window_handles.last) do
	   within_frame "resultsFrame" do
		first(:link,"PES CSM User").click
	   end
	end
   sleep 15
   puts page.body
  # first(:link,"CSM Automation").click
   sleep 5
   within_window(page.driver.browser.window_handles.last) do
     puts page.body
    click_on "Save"
   end
   sleep 15
end



And (/^I cancel creation of new SuccessPlan$/) do
	click_on "New"
	arg = getDetails "SuccessPlan"
	arg.each do |key,val|
			fill_in key,:with => val
		end
	all('.btn')[2].click
	sleep 5
	puts "Successfully cancelled creation of new Success Plan" 
end	

And (/^I open on first SuccessPlan$/) do
	within('.hotListElement') do
		all('a')[0].click
	end
	sleep 15
	click_link "Details"
	sleep 5
	click_link "New Opportunity"
	sleep 5
	arg=getOpportunityInfo
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
end


And (/^I verify edit link of focus category$/) do 
	sleep 10
	arg1 =  getReference ("Reference")
  if all(:link,arg1["Account"]).count > 0
    first(:link,arg1["Account"]).hover
    all(:link, "Edit").last.click
    sleep 5
    all(:link, "Cancel").last.click
    # click_on "Cancel"
  end
	puts "FC Edit Link Verified"
end

Then (/^I add new Playbook for SP$/) do
	begin
		click_link "Details"
		sleep 5
		click_link "Add Playbook"
		sleep 5
		arg1 =  getDetails ("PlayBookForSP")
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("td")[1].text == arg1["Display Name"]
					page.accept_confirm { row.all("td")[0].all('a')[0].click }
					sleep 5
					break
				end                        
			end
		end
		puts "Added Playbook Sucessfully"
		sleep 10
	rescue Exception =>ex
		putstr "Error while adding Playbook for Success Plan"
		putstr ex.message
	end
end

Then (/^I verify Play task created for SP$/) do
  begin
      sleep 4
      click_link "Details"
      sleep 5
      arg = getDetails "PlayforSP"
      within all(:css,".pbSubsection")[2] do
        first('a').click
        puts "Selected the Associated Account"
      end
      sleep 2
      if page.has_content?("Account Detail")
          puts "Opened associated Account successfully for SuccessPlan"
      else
          raise "Error while Opening the associated Account for SuccessPlan"
      end
      sleep 3
      within all(:css,".taskBlock")[0] do
        @taskBefore = all(:css,"tr .dataRow").count
      end
      within(:id,"topButtonRow") do
        click_on "Edit"
      end
      sleep 3
      fill_in 'Annual Revenue', :with => arg["PlayCriteria"]
      within(:id,"topButtonRow") do
        click_on "Save"
      end
      sleep 3
      within all(:css,".taskBlock")[0] do
        @taskAfter = all(:css,"tr .dataRow").count
      end
      if @taskBefore!=@taskAfter
          puts "Play task is generated when PlayBook is added to SP which meets play criteria"
      else
        puts "Play task is not generated when PlayBook is added to SP which meets play criteria"
      end
     sleep 3
  rescue Exception =>ex
      putstr "Error while verifying that Play task is generated when PlayBook is added to SP"
      putstr ex.message
  end
end

Then (/^I delete a Playbook for SP$/) do
	begin
	arg1 =  getDetails ("PlayBookForSP")
	if all(".pagination-info").count > 0
		@SPtaskBefore = find(".pagination-info").text.split("of").last.split("rows").last.to_i
	end
	sleep 3
	click_link "Details"
	sleep 5
	all(:css,".form-control")[0].set(arg1["Display Name"])
	within(:id,"playbookSPGrid") do
		first(:link, "Del").click 
	end
	puts "Successfully deleted PlayBook" 
	if page.has_content?('Success Plan Template Playbook has been deleted')
		puts "Success Plan Template PlayBook has been deleted message displayed"
		sleep 3
	else
		raise "Success Plan Template PlayBook has been deleted message not displayed"
	end
	click_link "Actions"
	sleep 2
	if all(".pagination-info").count > 0
		@SPtaskAfter = find(".pagination-info").text.split("of").last.split("rows").last.to_i
	end
	sleep 2
	if @SPtaskAfter == @SPtaskBefore
		puts "Verified that Play Task is not deleted after deleting PlayBook for Success Plan"
	else
		raise "Play Task is deleted after deleting PlayBook for Success Plan"
	end
	rescue Exception =>ex
		putstr "Error while deleting PlayBook for Success Plan"
		putstr ex.message
	end
end

And (/^I select Edit View$/) do
   listMenu = find('.dropdown-menu-right')
   liText = listMenu.all('li')
   liText[0].click
   find(:xpath, "//*[contains(@id, 'selectObjectType')]").select("Account")
   find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select("Last Health Status")
   sleep 5
   within('.pbBottomButtons') do
	click_on "Save"
   end
   sleep 10
   puts "Edit View Saved"
end

And (/^I click check icon$/) do
  sleep 10
  find(:xpath, "//*[contains(@id, 'selTasks')]").select("Risk")
  sleep 5
  within all('.bs')[0] do 
	all('tbody')[0].all('tr')[0].find('.checkEnabled').click
  end
  sleep 20
end

And (/^I click choose icon$/) do
  sleep 10
  find(:xpath, "//*[contains(@id, 'selTasks')]").select("Task_Category")
  sleep 5
  within all('.bs')[0] do 
	all('tbody')[0].all('tr')[0].find('.detailEnabled').click
  end
  sleep 5
  all(".iconContact-phone")[0].hover
  puts all(".iconContact-phone")[0].text
  all(".iconContact-phone")[0].hover
  sleep 20
  first(:link,"SP1").click
  
end

And (/^I select Show_Hide Charts and Tiles$/) do
	begin
	  listMenu = find('.dropdown-menu-right')
	  puts "Selecting " + listMenu.all('li')[1].text
	  listMenu.all('li')[1].click
	  sleep 2   
	  rescue Exception => ex
			puts "Unable to select Show_Hide Charts and Tiles"
	  end
end

And (/^I Verify Chart and Tiles Visibility$/) do
	begin
	 if(find('#HideShowDiv',:visible => false)['style'].should_not include('display:none', 'display: none'))
	   puts "Chart and Tiles are not visible"
	 else
		puts "Chart and Tiles are visible"
	 end
	rescue Exception =>ex
		puts "Chart and Tiles are not visible"
	end
 sleep 5
end


When(/^I click on "([^"]*)" tab$/) do |tab|
  begin
    sleep 3
    click_on tab
    sleep 10
    puts "Successfully to open the #{tab} page"
  rescue Exception => ex
    putstr "Error occurred while clicking the #{tab} tab"
    putstr_withScreen  ex.message
 end
end

And(/^I click on "([^"]*)" button$/) do |button|
  begin
    sleep 3
    click_on button
    sleep 10
    puts "Successfully to clicked the #{button} button"
  rescue Exception => ex
    putstr "Error occurred while clicking the #{button} button"
    putstr_withScreen  ex.message
  end
end


And(/^I "([^"]*)" the "([^"]*)"$/) do |button, task|
	begin
		sleep 5
		within all(".pbButtonb")[0] do
			sleep 4
			click_on button
			sleep 4
		end
		sleep 6
		puts "Successfully see the #{button} the #{task}"
	rescue Exception => ex
		putstr "Error occurred while #{button} the #{task}"
		putstr_withScreen ex.message
	end
end

When(/^I click on "([^"]*)" from "([^"]*)" app$/) do |link, app|
	begin
		sleep 3
    if page.has_css?("#userNavButton")
			puts "Successfully see the #{app} app link"
      sleep 3
      first("#userNavButton").click
			sleep 5
			click_on link
			sleep 4
    else
			putstr "Failed to see the #{app} app link"
    end
		puts "Successfully click the #{link} from #{app} app"
	rescue Exception => ex
		putstr "Error occurred while clicking the #{link} from #{app} app"
		putstr_withScreen ex.message
	end
end

And(/^I click on "([^"]*)" link from "([^"]*)" page$/) do |field_name, custom_settings|
	begin
		sleep 4
		if page.has_content?(field_name)
			puts "Successfully see the #{field_name} field from #{custom_settings} page"
			sleep 4
			click_on field_name
			sleep 5
		else
			putstr "Failed to see the #{field_name} field from #{custom_settings} page"
		end
	rescue Exception => ex
		putstr "Error occurred while verifying the #{field_name} field from #{custom_settings} page"
		putstr_withScreen ex.message
	end
end

Then(/^I should be able to see the "([^"]*)" field$/) do |field|
	begin
		sleep 4
		if page.has_content?(field)
			puts "Successfully see the #{field} field"
		else
			putstr "Failed to see the #{field} field"
		end
	rescue Exception => ex
		putstr "Error occurred while verifying the #{field} field"
		putstr_withScreen ex.message
	end
end

When(/^I click on "([^"]*)" field$/) do |field|
	begin
		sleep 4
		if page.has_content?(field)
			puts "Successfully see the #{field} field"
			sleep 4
			click_on field
			sleep 5
		else
			putstr "Failed to see the #{field} field"
		end
	rescue Exception => ex
		putstr "Error occurred while verifying the #{field} field"
		putstr_withScreen ex.message
	end
end

Then(/^I should be able to see the "([^"]*)" is "([^"]*)"$/) do |value, status|
	begin
		sleep 3
    within all(".pbSubsection")[2] do
			if page.has_content?(value)
				puts "Successfully see the #{value} field"
			else
				putstr "Failed to see the #{value} field"
      end
      sleep 3
			if page.has_content?(status)
				puts "Successfully see the #{value} is #{status}"
			else
				putstr "Failed to see the #{value} is not #{status}"
			end
    end
    sleep 3
	rescue Exception => ex
		putstr "Error occurred while verifying the #{value} is #{status}"
		putstr_withScreen ex.message
	end
end


When(/^I user logout from "([^"]*)" application$/) do |environment|
	begin
		sleep 5
		find("#userNav-arrow").click
		sleep 6
		click_on "Logout"
		sleep 5
		puts "Successfully logout from the #{environment}"
	rescue Exception => ex
		puts "Error occurred while logout the #{environment} application"
		puts ex.message
	end
end