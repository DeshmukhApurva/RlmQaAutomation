#All Accounts - Account Search Text Entry Box specific Step definitions
#All Scenario mentioned in AccountSearchTextEntryBox.feature

Then(/^I verify Account search box$/) do
	begin
		defaultSearchText = "Search Accounts..."
		
		if page.has_css? (".nav-search-container")
			puts "Account Search box is present"
		else
			puts "Account Search box is not present"
		end
		
		if find(:xpath, '//div[7]/div/div/span/span[1]').text == defaultSearchText
			puts "Default text entry #{defaultSearchText} is displayed in Account Search Text box"
		else
			puts "Default text entry #{defaultSearchText} is not displayed in Account Search Text box"
		end
		
		searchterm = "ABC"
		
		find("div[placeholder='Search Accounts...']").click
		sleep 3
		
		find("input[placeholder='Search Accounts...']").send_keys searchterm
		sleep 3
		puts "Entered text #{searchterm} to search in Account search box"
		
		find("input[placeholder='Search Accounts...']").send_keys [:control, 'a'], :backspace
		puts "Cleared the search text in Account search box"
		
		click_on "Overview"
		sleep 5
		
		if find(:xpath, '//div[7]/div/div/span/span[1]').text == defaultSearchText
			puts "Default text entry #{defaultSearchText} is displayed in Account Search Text box"
		else
			puts "Default text entry #{defaultSearchText} is not displayed in Account Search Text box"
		end
		
	rescue Exception => ex
		putstr "Error while verifying Account Search Text box"
		putstr_withScreen  ex.message
	end
end

When(/^I search an Account$/) do
	begin
		arg1 = getReference "DefaultAccounts"
		AccountName = arg1["account"]
		AccountNumber = arg1["accountNumber"]
		
		find("div[placeholder='Search Accounts...']").click
		sleep 3
		
		find("input[placeholder='Search Accounts...']").send_keys [:control, 'a'], :backspace
		
		find("input[placeholder='Search Accounts...']").send_keys AccountName
		sleep 3
		puts "Entered text #{AccountName} to search in Account search box"
		
		if find(".account-number").count > 0
			accNum = find(".account-number").text
			if accNum != ""
				if accNum == AccountNumber
					puts "Successfully displayed Account number - #{accNum} in search results"
				end
			else
				puts "Account number is not present for the account #{AccountName}"
			end
		end
		
		find("input[placeholder='Search Accounts...']").send_keys :enter
		sleep 3
		
		within(".data-table") do
			searchData = first("tbody").first("tr").all("td")[1].text
			
			if searchData == AccountName
				puts "Successfully displayed the search #{AccountName} results"
			else
				putstr "Failed to display the search #{AccountName} results"
			end
		end

	rescue Exception => ex
		putstr "Error while verifying Account Search Text box"
		putstr_withScreen  ex.message
	end

end