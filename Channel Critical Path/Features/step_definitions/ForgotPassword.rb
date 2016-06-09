#All Community - Forgot Password specific Step definitions
#All Scenario mentioned in ForgotPassword.feature

And(/^I click on "(.*?)" link on Channel Portal Login screen$/) do |arg|
	begin
		sleep 3
		
		find(:link, arg).click
		puts "Clicked on #{arg}"
		sleep 3

		if page.has_content? "Reset Your Password"
			puts "Successfully navigated to Forgot Password Screen"
		else
			raise "Failed to navigate to Forgot Password Screen"
		end
		
		sleep 3
	rescue Exception => ex
		putstr "Error while clicking on #{arg} link on Channel Portal Login screen"
		putstr_withScreen ex.message
	end
end

Then(/^I verify Forgot Password screen UI$/) do
	begin
		sleep 3
		
		if page.has_content? "Enter your username and we'll send you a link to reset your password."
			puts "Enter your username and we'll send you a link to reset your password. text is displayed on Forgot Password screen UI"
		else
			putstr "Enter your username and we'll send you a link to reset your password. text is not displayed on Forgot Password screen UI"
		end
		
		sleep 2
		
		if page.has_field? "email"
			puts "Username is displayed on the Forgot Password screen"
		else
			putstr "Username is not displayed on the Forgot Password screen"
		end
		
		sleep 2
		
		if find(:link, "Back")
			puts "Back button is present on the Forgot Password screen"
		else
			putstr "Back button is not present on the Forgot Password screen"
		end
		
		sleep 2
		
		if find(:button, "Send Email")
			puts "Send Email button is present on the Forgot Password screen"
		else
			putstr "Send Email button is not present on the Forgot Password screen"
		end
		
	rescue Exception => ex
		putstr "Error while verifying Forgot Password screen UI"
		putstr_withScreen ex.message
	end
end


Then(/^I enter incorrect username format$/) do
	begin
		sleep 3
		
		fill_in "email",:with => ""
		puts "Username is empty"
		sleep 3
		
		click_on "Send Email"
		puts "Clicked on Send Email button"
		sleep 3
		
		if page.has_content? "Enter a valid email address."
			puts "Enter a valid email address. message is displayed"
		else
			putstr "Enter a valid email address. message is not displayed"
		end
		
		fill_in "email",:with => "qwerty@@xyz.com"
		puts "Entered incorrect Username format"
		sleep 3
		
		click_on "Send Email"
		puts "Clicked on Send Email button"
		sleep 3
		
		if page.has_content? "Enter a valid email address."
			puts "Enter a valid email address. message is displayed"
		else
			putstr "Enter a valid email address. message is not displayed"
		end
		
		sleep 2
		
		click_on "Back"
		puts "Clicked on Back button"
		sleep 8
		
		if page.has_content? "Welcome to the ServiceSource Channel Portal"
			puts "Successfully navigated to Channel Portal Login page"
		else
			putstr "Failed to navigate to Channel Portal Login page"
		end 
		
	rescue Exception => ex
		putstr "Error while entering incorrect Username format"
		putstr_withScreen ex.message
	end
end