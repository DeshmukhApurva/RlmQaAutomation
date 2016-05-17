#All ServiceSource Setup - Status Update Configuration specific Step definitions
#All Scenario mentioned in StatusUpdateConfiguration.feature

And(/^I check the "(.*?)"$/) do |arg|
	begin
		arg1 = getDetails arg+"Grid"
		text = arg1["Text"]
		gridCols = arg1["Cols"].split(",")
		addDisabled = 1
		
		if page.has_content? text.to_s
			puts "#{text} - is displayed under Status fields"
		else
			puts "#{text} - is not displayed under Status fields"
		end
		
		colHeader = Array.new
		within all(".bPageBlock")[1] do
			within(".list") do
				colHeader = first("thead").all("th").collect{ |column| column.text}
				puts "Columns on grid: #{colHeader}"
				
				gridCols.each do |value|
					v = value
					if colHeader.to_s.include? v.to_s
						puts "#{v} is displayed on the grid"
					else
						putstr "#{v} is not displayed on the grid"
					end
				end

				if (first("tbody").first("tr").all("td")[1].text == arg1["StageField"]) && (first("tbody").first("tr").all("td")[0].text == "Required Field")
					puts "#{arg1["StageField"]} is displayed and is Required"
				else
					puts "#{arg1["StageField"]} is not Required"
				end
			end
			if page.has_css?(".btnDisabled")
				addDisabled = 0
				puts "Add Criteria button is disabled"
			end
		end
		
		if (addDisabled > 0)
			puts "Add Criteria is not disabled" 
			# dropdownValues = first(:xpath, ".//*[contains(@id, 'slFieldId')]").all('option').collect{ |column| column.text}
			# puts dropdownValues
			
			# optionCount = first(:xpath, ".//*[contains(@id, 'slFieldId')]").all('option').count
			
		else	
			begin
				within all(".bPageBlock")[1].first(".list") do
					if all(:link,"Delete").count > 0
						rowText = first("tbody").all("tr")[1].all("td")[1].text
						first(:link,"Delete").click
						puts "Successfully deleted #{rowText} from the grid"
						sleep 5
					end
				end
				within all(".pbButton ")[0] do
					click_on 'Save'
					sleep 3
				end
			end until(all(:link,"Delete").count == 0)
		end
	rescue Exception => ex
		putstr "Error while verifying Status fields"
		putstr_withScreen  ex.message
	end
end

# And(/^I verify "(.*?)" text box$/) do |arg|
	# begin
		# wrongValue = ""
		# correctValue = 10
		
		# within all(".pbSubsection")[5] do
			# first(:xpath, ".//*[contains(@id, 'in_field_req')]").set(wrongValue)
		# end
			
		# within all(".pbButton ")[0] do
			# click_on 'Save'
			# sleep 3
		# end
		
		# if page.has_content? "Number of Days should be greater than or equal to 0."
			# puts "Number of Days should be greater than or equal to 0. message displayed when value #{wrongValue} is entered in Number of Days text box under Number of Days Between Updates section"
		# else
			# puts "Number of Days should be greater than or equal to 0. message is not displayed when value #{wrongValue} is entered in Number of Days text box under Number of Days Between Updates section"
		# end
		# sleep 3
		
		# within all(".pbSubsection")[5] do
			# first(:xpath, ".//*[contains(@id, 'in_field_req')]").set("10")
		# end
		
		# within all(".pbButton ")[0] do
			# click_on 'Save'
			# sleep 3
		# end
		
		# if page.has_content? "Opportunity Status Log data has been saved."
			# puts "Opportunity Status Log data has been saved. message displayed when value #{correctValue} is entered in Number of Days text box under Number of Days Between Updates section"
		# else
			# puts "Opportunity Status Log data has been saved. message is not displayed when value #{correctValue} is entered in Number of Days text box under Number of Days Between Updates section"
		# end
		# sleep 3
	# rescue Exception => ex
		# putstr "Error while verifying #{arg} section"
		# putstr_withScreen  ex.message
	# end
# end

And(/^I verify "(.*?)" text box with wrong data$/) do |arg|
	begin
		arg1 = getDetails arg
		section = arg1["Section"]
		saveMessage = arg1["IncorrectText"]
		
		within all(".pbSubsection")[section] do
			first(:xpath, ".//*[contains(@id, 'in_field_req')]").set(arg1["WrongValue"])
		end
			
		within all(".pbButton ")[0] do
			click_on 'Save'
			sleep 3
		end
		
		if page.has_content? saveMessage
			puts "#{saveMessage} message displayed when value #{arg1["WrongValue"]} is entered in Number of Days text box under #{arg} section"
		else
			puts "#{saveMessage} message is not displayed when value #{arg1["WrongValue"]} is entered in Number of Days text box under #{arg} section"
		end
		sleep 3
		
	rescue Exception => ex
		putstr "Error while verifying Number of Days text box under #{arg} section with wrong data"
		putstr_withScreen  ex.message
	end
end

And(/^I verify "(.*?)" text box with correct data$/) do |arg|
	begin
		arg1 = getDetails arg
		section = arg1["Section"]
		saveMessage = arg1["CorrectText"]
		
		within all(".pbSubsection")[section] do
			first(:xpath, ".//*[contains(@id, 'in_field_req')]").set(arg1["CorrectValue"])
		end
			
		within all(".pbButton ")[0] do
			click_on 'Save'
			sleep 3
		end
		
		if page.has_content? saveMessage
			puts "#{saveMessage} message displayed when value #{arg1["CorrectValue"]} is entered in Number of Days text box under #{arg} section"
		else
			puts "#{saveMessage} message is not displayed when value #{arg1["CorrectValue"]} is entered in Number of Days text box under #{arg} section"
		end
		sleep 3
		
	rescue Exception => ex
		putstr "Error while verifying Number of Days text box under #{arg} section"
		putstr_withScreen  ex.message
	end
end


Then(/^I move Sales stages from "(.*?)" to "(.*?)"$/) do |item1,item2|
	begin
		arg1 = getDetails "SalesStages"
		arg2 = getDetails "Number of Days Between Updates"
		arg3 = getDetails "Days Before Expiration"
		saveMessage = arg1["CorrectText"]
		
		within all(".divelement")[0] do 
			
			availableStages = find(:xpath, ".//*[contains(@id, 'destinationSelectList')]").all('option').collect(&:text)
			
			
			if availableStages.to_s.size > 0
				puts "SalesStages available in #{item2} : #{availableStages}"
				
				availableStages.each do |option|
					find(:xpath, ".//*[contains(@id, 'destinationSelectList')]").select(option)
					puts "Selected #{option}"
					sleep 2
				end
				
				find(:css, ".leftArrowIcon").click
				puts "Moved all the stages from #{item2} to #{item1}"
				sleep 2

			else
				puts "#{item2} is empty"
			end
		end
		
		sleep 5
		
		within all(".divelement")[0] do 
		
			LOV = find(:xpath, ".//*[contains(@id, 'targetSelectList')]").all('option').collect(&:text)
			
			if LOV.size > 0
				
				LOV.each do |option|
					find(:xpath, ".//*[contains(@id, 'targetSelectList')]").select(option)
					puts "Selected #{option}"
					sleep 2
				end
				
				find(:css, ".rightArrowIcon").click
				puts "Moved Sales stages from #{item1} to #{item2}"
				sleep 2

			else
				puts "No Sales stages to select to move from #{item1} to #{item2}"
			end
		end
		
		sleep 5
		
		within all(".pbSubsection")[5] do
			first(:xpath, ".//*[contains(@id, 'in_field_req')]").set(arg2["CorrectValue"])
			puts "Entered #{arg2["CorrectValue"]} in Number of Days Between Updates field"
		end
		
		within all(".pbSubsection")[6] do
			first(:xpath, ".//*[contains(@id, 'in_field_req')]").set(arg3["CorrectValue"])
			puts "Entered #{arg3["CorrectValue"]} in Days Before Expiration field"
		end
		
		within(".pbButtonb") do
			click_on "Save"
			puts "Clicked on Save button"
		end
		sleep 3
		
		if page.has_content? saveMessage
			puts "#{saveMessage} message displayed."
		else
			puts "#{saveMessage} message is not displayed."
		end
		sleep 3
		
	rescue Exception => ex
		putstr "Error occurred while moving Sales stages from #{item1} to #{item2}"
		putstr_withScreen ex.message
	end
end

Then(/^I move Sales stages again from "(.*?)" to "(.*?)"$/) do |item1,item2|
	begin
		arg1 = getDetails "SalesStages"
		arg2 = getDetails "Number of Days Between Updates"
		arg3 = getDetails "Days Before Expiration"
		
		unavailableStages = arg1["Unavailablestages"].split(",")
		
		stagesAvailable = Array.new
		saveMessage = arg1["CorrectText"]
		
		within all(".divelement")[0] do 
			
			stagesAvailable = find(:xpath, ".//*[contains(@id, 'destinationSelectList')]").all('option').collect(&:text)
			
			if stagesAvailable.size > 0
				puts "SalesStages available in #{item1} : #{stagesAvailable}"
				
				unavailableStages.each do |option|
				
					if stagesAvailable.to_s.include? option.to_s
						
						find(:xpath, ".//*[contains(@id, 'destinationSelectList')]").select(option)
						puts "Selected #{option}"
						sleep 2
					else
						puts "Sales Stages were already moved to Not Available to Partners"
					end
					
				end
				find(:css, ".leftArrowIcon").click
				puts "Moved Sales stages from #{item1} to #{item2}"
				sleep 2
			else
				puts "No Sales stages to select to move from #{item1} to #{item2}"
			end
		end
		
		sleep 5
		
		within all(".pbSubsection")[5] do
			first(:xpath, ".//*[contains(@id, 'in_field_req')]").set(arg2["CorrectValue"])
			puts "Entered #{arg2["CorrectValue"]} in Number of Days Between Updates field"
		end
		
		within all(".pbSubsection")[6] do
			first(:xpath, ".//*[contains(@id, 'in_field_req')]").set(arg3["CorrectValue"])
			puts "Entered #{arg3["CorrectValue"]} in Days Before Expiration field"
		end
		
		within(".pbButtonb") do
			click_on "Save"
		end
		sleep 3
		
		if page.has_content? saveMessage
			puts "#{saveMessage} message displayed."
		else
			puts "#{saveMessage} message is not displayed."
		end
		sleep 3
	
	rescue Exception => ex
		putstr "Error occurred while moving Sales stages from #{item1} to #{item2}"
		putstr_withScreen ex.message
	end
end
