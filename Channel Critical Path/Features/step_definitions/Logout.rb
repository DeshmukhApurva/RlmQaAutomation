#All Community - Logout specific Step definitions
#All Scenario mentioned in Logout.feature

Then(/^I verify user logged out from Channel Portal$/) do
	begin
		sleep 3
		
		if page.has_content? "Welcome to the ServiceSource Channel Portal"
			puts "Successfully logged out from Channel Portal"
		else
			putstr "Failed to logout from Channel Portal"
		end 
		
		sleep 2
		
		if !(page.has_link? "About Me")
			puts "About Me link is not displayed on the Channel Portal Login screen"
		else
			putstr "About Me link is displayed on the Channel Portal Login screen"
		end
		
	rescue Exception => ex
		putstr "Error occurred while verifying that user logged out from Channel Portal"
		putstr_withScreen ex.message
	end
end