#All Common Step Definitions which are common across modules
#All scenarios mentioned in all features

# Given(/^that I navigate to the CRM application$/) do
	# begin
		# visit env
		# puts "Login as " + ENV['UserRole']
		# arg = getCredentialInfo
		# fill_in "username",:with => arg["userName"]
		# fill_in "Password",:with => arg["pwd"]
		# puts "Entered Credentials"
		# find(:id,"Login").click
		# page.driver.browser.manage.window.maximize
		# # find(:id,"tsidButton").click
		# # begin
		# # click_on "ServiceSource Cloud Apps"
		# # rescue Exception => ex
		# # puts "Already in ServiceSource Cloud Apps"
		# # end
		# sleep 10
	# rescue Exception => ex
		# puts "Error while entering credentials"
		# puts ex.message
	# end
# end

Given(/^that I navigate to the CRM application$/) do
	begin
		sleep 5
		arg = getCredentialInfo
		visit arg["url"]
		sleep 4
		#puts "Login as " + ENV['UserRole']
		
		if arg["url"] == "https://login.salesforce.com/"
			sleep 4
			fill_in "username",:with => arg["userName"]
			sleep 4
			fill_in "Password",:with => arg["pwd"]
			puts "Entered Credentials"
			find(:id,"Login").click
			page.driver.browser.manage.window.maximize
			sleep 10
		else
			sleep 4
			fill_in "username",:with => arg["userName"]
			sleep 4
			find("input[name='password']").send_keys arg["pwd"]
			puts "Entered Credentials"
			sleep 4
			click_on 'Sign In'
			sleep 5
			page.driver.browser.manage.window.maximize
			sleep 6
		end
	rescue Exception => ex
		puts "Error while entering credentials"
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
		putstr "Error occurred while login"
		putstr_withScreen  ex.message
	end
end

Then(/^I logout$/) do
	begin
		sleep 5
		click_on "Logout"
		sleep 5
		puts "Logged out"
	rescue Exception => ex
		puts "Error occurred during Logout"
		puts ex.message
	end
end

When(/^I Navigate to "(.*?)" tab$/) do |arg1|
	begin
		sleep 10
		first(:link, arg1).click
		sleep 5
		puts "Navigated to #{arg1} tab"
	rescue Exception => ex
		puts "Error occurred while navigating to #{arg1} tab"
		puts ex.message
	end
end

When(/^I click on "(.*?)" link$/) do |arg1|
	begin 
		first(:link, arg1).click
		sleep 5
		puts "Navigated to #{arg1}" 
	rescue Exception => ex
		puts "Error occurred while navigating to #{arg1}"
		puts ex.message
	end
end


Then(/^I clicked on "(.*?)" link$/) do |arg1|
	begin
		first(:link, arg1).click
		sleep 5
		puts "Clicked on #{arg1} link" 
	rescue Exception => ex
		puts "Error occurred while clicking #{arg1}"
		puts ex.message
	end
end


Then (/^I fetch the dropdown selected values$/) do 
	begin		
		putstr all(".dataRow")[0].find('option[selected]').text
	rescue Exception => ex
		puts "Error occurred while fetching the drop down selected values"
		putstr_withScreen  ex.message
	end
end


And(/^I enable "(.*?)" checkbox$/) do |labeltext|
	begin	
		find_field("#{labeltext}").set(true)
		puts "Successfully enabled #{labeltext}"
	rescue Exception => ex
		puts "Error occurred while enabling #{labeltext}"
		putstr_withScreen  ex.message
	end
end

And(/^I disable "(.*?)" checkbox$/) do |labeltext|
	begin	
		find_field("#{labeltext}").set(false)
		puts "Successfully disabled #{labeltext}"
	rescue Exception => ex
		puts "Error occurred while disabling #{labeltext}"
		putstr_withScreen  ex.message
	end
end

And(/^I click on "(.*?)"$/) do |button_text|
	begin
		sleep 3
		within all(".pbButton ")[0] do
			click_on button_text
			puts "Successfully clicked #{button_text}"
			sleep 5
		end
	rescue Exception => ex
		putstr "Error occurred while clicking on #{button_text}"
		putstr_withScreen  ex.message
	end 
end


And(/^I click on "(.*?)" button$/) do |button_text|
	begin
		sleep 3
		within all(".pbButton ")[1] do
			click_on button_text
			puts "Successfully clicked #{button_text}"
			sleep 5
		end
	rescue Exception => ex
		putstr "Error occurred while clicking on #{button_text}"
		putstr_withScreen  ex.message
	end 
end

And(/^I open the existing opportunity$/) do
	begin
		sleep 6
		arg = getReference "AddPartnerOpportunity"
		sleep 3
		find('#fcf').select "My Opportunities"
		sleep 5
		within (".fBody") do
			click_button 'Go!'
		end
		sleep 8
		if page.has_css?(".listItemPad")
			sleep 4
			puts "Successfully see the Alphabetic Pagination"
			all(".listItemPad")[15].click
			sleep 8
			all(".selectArrow")[0].click
			sleep 8
			within(".bottomNav") do
				first("table").all("tr")[4].click
			end
		else
			putstr "Failed to see the Alphabetic Pagination"
		end
		sleep 5
		result = false
		all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
			if activity.text.to_s == arg["PartnerOpportunityName"].to_s
				puts "Successfully match the Opportunity name"
				activity.click
				puts "Successfully opened the #{arg["PartnerOpportunityName"]} Opportunity"
				result = true
				break
			end
		end
		putstr "Unable to find the #{arg["PartnerOpportunityName"]} Opportunity" unless result
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while clicking on existing #{arg["PartnerOpportunityName"]} Opportunity page"
		putstr_withScreen  ex.message
	end
end



And(/^user login in to "([^"]*)" application$/) do |application|
	begin
		sleep 5
		arg = getCredentialInfo
		visit arg["oem_url"]
		sleep 4
		#puts "Login as " + ENV['UserRole']
		if arg["oem_url"] == "https://login.salesforce.com/"
			sleep 4
			fill_in "username",:with => arg["oem_userName"]
			sleep 4
			fill_in "Password",:with => arg["oem_pwd"]
			puts "Entered Credentials"
			find(:id,"Login").click
			sleep 4
			puts "Login in as #{application} application"
			sleep 3
			page.driver.browser.manage.window.maximize
			sleep 10
		end
	rescue Exception => ex
		puts "Error  while entering credentials"
		puts ex.message
	end
end

Then(/^I should able to see the "([^"]*)" home page$/) do |application|
	begin
		sleep 5
		if page.has_content? "Accounts"
			puts "User Logged in #{application} Successfully"
		else
			raise "Login Failed"
		end
	rescue Exception => ex
		putstr "Error occurred while login"
		putstr_withScreen  ex.message
	end
end

When(/^user logs out from channel partner community$/) do
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

When(/^I click on "(.*?)" tab$/) do |arg1|
	first(:link, arg1).click
	sleep 10
	puts "Navigated to " + arg1 + " tab"
end

And(/^I click on the "([^"]*)"$/) do |button_text|
  begin
    sleep 4
    click_on button_text
    sleep 8
    puts "Successfully click the #{button_text} button"
  rescue Exception => ex
    putstr "Error occurred while clicking on #{button_text} button"
    putstr_withScreen  ex.message
  end
end

When(/^user logout from "([^"]*)" application$/) do |environment|
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
