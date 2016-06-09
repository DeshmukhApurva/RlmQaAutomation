#All Community - Login Page specific Step definitions
#All Scenario mentioned in LoginPage.feature

When(/^I navigate to the Channel Portal$/) do
	begin
		sleep 5
		arg = getCredentialInfo 
		visit arg["url"]
		sleep 4
		puts "Navigated to Channel Portal"
		page.driver.browser.manage.window.maximize
		sleep 8
	rescue Exception => ex
		putstr "Error while navigating to Channel Portal"
		putstr_withScreen ex.message
	end
end

Then(/^I verify Login screen UI$/) do
	begin
		sleep 3
		
		if page.has_content? "Welcome to the ServiceSource Channel Portal"
			puts "Welcome to the ServiceSource Channel Portal message is displayed on the Channel Portal Login screen"
		else
			putstr "Welcome to the ServiceSource Channel Portal message is not displayed on the Channel Portal Login screen"
		end 
		
		if page.has_field? "username"
			puts "Username is displayed on the Channel Portal Login screen"
		else
			putstr "Username is not displayed on the Channel Portal Login screen"
		end
		
		if page.has_field? "password"
			puts "Password is displayed on the Channel Portal Login screen"
		else
			putstr "Password is not displayed on the Channel Portal Login screen"
		end
		
		if page.has_link? "Forgot Password?"
			puts "Forgot Password? link is displayed on the Channel Portal Login screen"
		else
			putstr "Forgot Password? link is not displayed on the Channel Portal Login screen"
		end
		
		if find(:button, "Sign In")
			puts "Sign In button is present on the Channel Portal Login screen"
		else
			putstr "Sign In button is not present on the Channel Portal Login screen"
		end
	rescue Exception => ex
		putstr "Error while verifying Channel Portal Login screen UI"
		putstr_withScreen ex.message
	end
end

And(/^I enter incorrect credentials$/) do
	begin
		sleep 3
		arg = getCredentialInfo 
		
		sleep 2
		
		click_on "Sign In"
		puts "Clicked on Sign In button without entering Username & Password"
		
		if page.has_content? "Username is required"
			puts "Username is required message is displayed"
		else
			putstr "Username is required message is not displayed"
		end
		
		if page.has_content? "Password is required"
			puts "Password is required message is displayed"
		else
			putstr "Password is required message is not displayed"
		end
		
		fill_in "username",:with => ""
		puts "Username is empty"
		
		find("input[name='password']").set(arg["pwd"])
		puts "Entered only Password"
		sleep 3
		
		click_on 'Sign In'
		puts "Clicked on Sign In button"
		sleep 3
		
		if page.has_content? "Username is required"
			puts "Username is required message is displayed"
		else
			putstr "Username is required message is not displayed"
		end
		

		fill_in "username",:with => arg["userName"]
		puts "Entered only Username"
		sleep 3
		
		find("input[name='password']").set("")
		puts "Password is empty"
		
		click_on 'Sign In'
		puts "Clicked on Sign In button"
		sleep 3
		
		if page.has_content? "Password is required"
			puts "Password is required message is displayed"
		else
			putstr "Password is required message is not displayed"
		end
		
		fill_in "username",:with => arg["userName"]
		puts "Entered correct Username"
		sleep 3
		
		find("input[name='password']").set(arg["pwd"]+"qwerty")
		puts "Entered incorrect Password"
		sleep 3
		
		click_on 'Sign In'
		puts "Clicked on Sign In button"
		sleep 3
		
		if page.has_content? "Your login attempt has failed. Make sure the username and password are correct."
			puts "Your login attempt has failed. Make sure the username and password are correct. message is displayed"
		else
			putstr "Your login attempt has failed. Make sure the username and password are correct. message is not displayed"
		end
		
		fill_in "username",:with => arg["userName"]+"qwerty"
		puts "Entered incorrect Username"
		sleep 3
		
		find("input[name='password']").set(arg["pwd"])
		puts "Entered correct Password"
		sleep 3
		
		click_on 'Sign In'
		puts "Clicked on Sign In button"
		sleep 3
		
		if page.has_content? "Your login attempt has failed. Make sure the username and password are correct."
			puts "Your login attempt has failed. Make sure the username and password are correct. message is displayed"
		else
			putstr "Your login attempt has failed. Make sure the username and password are correct. message is not displayed"
		end
			
	rescue Exception => ex
		putstr "Error while entering incorrect credentials"
		putstr_withScreen ex.message
	end
end

And(/^I enter correct credentials$/) do
	begin
		sleep 3
		arg = getCredentialInfo
		
		sleep 2
		
		fill_in "username",:with => arg["userName"]
		puts "Entered correct Username"
		sleep 3
		
		find("input[name='password']").set(arg["pwd"])
		puts "Entered correct Password"
		sleep 3
		
		click_on 'Sign In'
		puts "Clicked on Sign In button"
		sleep 8
		
		if page.has_content? "Opportunity Pipeline"
			puts "User Logged in Successfully"
		else
			raise "Login Failed"
		end
		
	rescue Exception => ex
		putstr "Error while entering correct credentials to login to Channel Portal"
		putstr_withScreen ex.message
	end
end

