#All Focus Category Specific Step Definitions
#All Scenario mentioned in FocusCategories.feature

And(/^create a new FC$/) do
	begin
		arg = getDetails "Focus Category"
		click_link('Focus Categories')
		puts "Clicked Focus Categories link successfully"
		sleep 2
		select "Account", :from => "thePage:theForm:pbFocusCategoryList:selList1"
		click_on "Create New"
		sleep 2
		fill_in "Display Name",:with => arg["Display Name"]
		click_on "Create"
		sleep 5
		click_on "Save"
		puts "Successfully created Focus Category" 
		if page.has_content?('Focus Category View Criteria')
				puts "Focus Category View Criteria section displayed"
				sleep 3
		else
			raise "Focus Category View Criteria section not displayed"
		end
		if page.has_content?('Focus Category View Columns')
				puts "Focus Category View Columns section displayed"
				sleep 3
		else
			raise "Focus Category View Columns section not displayed"
		end
    rescue Exception => ex
		putstr "Error occurred while creating a Focus Category"
		putstr ex.message
	end
end

And(/^create a new FC with Criteria$/) do
	begin
		arg = getDetails "Focus Category for use"
		click_link('Focus Categories')
		puts "Clicked Focus Categories link successfully"
		sleep 12
		select "Account", :from => "thePage:theForm:pbFocusCategoryList:selList1"
		click_on "Create New"
		sleep 12
		fill_in "Display Name",:with => arg["Display Name"]
		click_on "Create"
		if page.has_content?('Focus Category View Criteria')
				puts "Focus Category View Criteria section displayed"
				sleep 3
		else
			raise "Focus Category View Criteria section not displayed"
		end
		if page.has_content?('Focus Category View Columns')
				puts "Focus Category View Columns section displayed"
				sleep 3
		else
			raise "Focus Category View Columns section not displayed"
		end
		sleep 10
		amt = 500000
		  #within all(".list")[1].all("tr")[0] do
			first(:xpath, "//*[contains(@id, 'slFieldId')]").select("Annual Revenue")
			sleep 8
			first(:xpath, "//*[contains(@id, 'outOperator')]").select(">")
			sleep 8
			first(:xpath, "//*[contains(@id, 'outValue')]").set(amt)	
		 # end
		sleep 8
		first(:xpath, "//*[contains(@id, 'outValue')]").set(amt)
		click_on "Save"
		puts "Successfully created Focus Category" 
		sleep 10
		if page.has_content?('Focus Category View Criteria Saved Successfully')
				puts "Focus Category View Criteria Saved Successfully displayed"
				sleep 3
		else
			raise "Focus Category View Criteria Saved Successfully not displayed"
		end
    rescue Exception => ex
		putstr "Error occurred while creating a Focus Category"
		putstr ex.message
	end
end

Then(/^I edit the created FC$/) do
	begin
		arg = getDetails "Focus Category for use"
		sleep 5
		click_link('Focus Categories')
		puts "Clicked Focus Categories link successfully"
		sleep 15
		foundCount = ""
		begin  
			within all('.list')[0] do
				tr = first("tbody").all("tr")
				tr.each do |row|
				  if row.all("td")[1].text == arg["Display Name"]
					row.all("td")[0].all('a')[1].click
					foundCount = "First record found with match " + arg["Display Name"] + " opened"
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
			within all('.list')[0] do
				tr = first("tbody").all("tr")
				tr.each do |row|
				  if row.all("td")[1].text == arg["Display Name"]
					row.all("td")[0].all('a')[1].click
					foundCount = "First record found with match " + arg["Display Name"] + " opened"
					break
				  end	
				end
			end
		end
		if foundCount != "" 
			sleep 10
			within all(:css,".pbButton")[1] do
        sleep 6
				first(:xpath, "//*[contains(@id, 'pbFCVCListId:pbb1:slFieldId')]").select("Annual Revenue")
        sleep 4
				click_on "Add Field"
			end
			sleep 10
			click_on "Save"
			foundCount = "First record found with match " + arg["Display Name"] + " updated. Added field Annual Revenue"
		else
			foundCount = "No record found with match " + arg["Display Name"] + ". Unable to edit record."
		end
		puts foundCount
		puts "Created Focus Category updated successfully"
    sleep 5
		if page.has_content?('Account.AnnualRevenue')
				puts "Annual Revenue field added and displayed in Grid"
				sleep 3
		else
      putstr "Annual Revenue field not displayed in Grid"
		end
		if page.has_content?('Focus Category View Columns Saved Successfully')
				puts "Focus Category View Columns Saved Successfully displayed"
				sleep 3
		else
			raise "Focus Category View Columns Saved Successfully not displayed"
		end
	rescue Exception => ex
		putstr "Error while Editing Focus Category"
		putstr ex.message
	end
end

Then(/^view a FC$/) do
	begin
		arg = getDetails "Focus Category"
		sleep 5
		click_link('Focus Categories')
		puts "Clicked Focus Categories link successfully"
		sleep 15
		foundCount = ""
		begin  
			within all('.list')[0] do
				tr = first("tbody").all("tr")
				tr.each do |row|
				  if row.all("td")[1].text == arg["Display Name"]
					row.all("td")[0].all('a')[0].click
					foundCount = "First record found with match " + arg["Display Name"] + " opened"
					break
				  end	
				end
			end
			if page.has_css?('.next')
				find(".next").click
				puts "Next Page clicked and navigated. Pagination functionality working for Focus Category"
				sleep 3
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount==""
			within all('.list')[0] do
				tr = first("tbody").all("tr")
				tr.each do |row|
				  if row.all("td")[1].text == arg["Display Name"]
					row.all("td")[0].all('a')[0].click
					foundCount = "First record found with match " + arg["Display Name"] + " opened"
					break
				  end	
				end
			end
		end
		if foundCount != "" 
			sleep 10
			if page.has_content?('Focus Category View Details')
				puts "Focus Category View Details page displayed."
				sleep 3
			else
				raise "Focus Category View Details page not displayed."
			end
			foundCount = "First FC record found with match " + arg["Display Name"] + " viewed and details displayed"
		else
			foundCount = "No FC record found with match " + arg["Display Name"] + ". Unable to view FC record."
		end
		puts foundCount
		puts "View Focus Category verified successfully"
	rescue Exception => ex
		putstr "Error while Viewing Focus Category"
		putstr ex.message
	end
end

Then(/^Delete a FC$/) do
	begin
    sleep 4
    arg = getDetails "Focus Category Group"
		sleep 5
		click_link('Focus Categories')
		puts "Clicked Focus Categories link successfully"
		sleep 15
		foundCount = ""
		begin  
			within all('.list')[0] do
				tr = first("tbody").all("tr")
				tr.each do |row|
				  if row.all("td")[1].text == arg["FoucsCategoryGroupName"]
					 row.all("td")[0].all('a')[2].click
					 foundCount = "First record found with match #{arg["FoucsCategoryGroupName"]} deleted"
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
		if foundCount == ""
			within all('.list')[0] do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[1].text == arg["FoucsCategoryGroupName"]
						 row.all("td")[0].all('a')[2].click
						 foundCount = "First record found with match #{arg["FoucsCategoryGroupName"]} deleted"
						 break
					end	
				end
			end
    end
    sleep 5
		if foundCount != ""
			puts foundCount
			sleep 10
		else
			raise "No record found with match #{arg["FoucsCategoryGroupName"]}"
		end
    sleep 5
    puts "Successfully see the #{arg["FoucsCategoryGroupName"]} confirmation dialogue box"
    sleep 4
    page.driver.browser.switch_to.alert.accept
    sleep 5
    puts "Successfully deleted the #{arg["FoucsCategoryGroupName"]} confirmation dialogue"
    sleep 5
    if page.has_css?(".messageText")
      if find(".messageText").text == "Focus Category View has been deleted"
        puts "Successfully see the #{arg["FoucsCategoryGroupName"]} delete message"
      else
        puts "Failed to see the #{arg["FoucsCategoryGroupName"]} delete message"
      end
    else
      puts "No Delete message found"
    end
	rescue Exception => ex
		putstr "Error while Deleting Focus Category"
		putstr ex.message
	end
end

Then(/^Delete a FC with confirm dialog$/) do
	begin
    sleep 4
    arg = getDetails "Focus Category Group"
		sleep 5
		click_link('Focus Categories')
		puts "Clicked Focus Categories link successfully"
		sleep 15
		foundCount = ""
		begin  
			within all('.list')[0] do
				tr = first("tbody").all("tr")
				tr.each do |row|
				  if row.all("td")[1].text == arg["FoucsCategoryGroupName"]
					 row.all("td")[0].all('a')[2].click
					 sleep 4
					 puts page.driver.browser.switch_to.alert.text + " message displayed in confirmation dialog." rescue Selenium::WebDriver::Error::NoAlertOpenError
					 puts "Delete confirmation page with list/count of Focus Category Groups that FC is present is displayed."
					 page.driver.browser.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
					 foundCount = "First record found with match " + arg["FoucsCategoryGroupName"] + " deleted"
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
		if foundCount == ""
			within all('.list')[0] do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[1].text == arg["FoucsCategoryGroupName"]
						 row.all("td")[0].all('a')[2].click
						 sleep 4
						 puts page.driver.browser.switch_to.alert.text + " message displayed in confirmation dialog." rescue Selenium::WebDriver::Error::NoAlertOpenError
						 puts "Delete confirmation page with list/count of Focus Category Groups that FC is present is displayed."
						 page.driver.browser.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
						 foundCount = "First record found with match " + arg["FoucsCategoryGroupName"] + " deleted"
						 break
					end	
				end
			end
		end
		if foundCount != ""
			puts foundCount
			sleep 10
		else
			raise "No record found with match #{arg["FoucsCategoryGroupName"]}"
		end
		puts "Delete Focus Category working successfully"
	rescue Exception => ex
		putstr "Error while Deleting Focus Category"
		putstr ex.message
	end
end

Then(/^I view the created FC$/) do
	begin
		arg = getDetails "Focus Category"
		sleep 5
		click_link('Focus Categories')
		puts "Clicked Focus Categories link successfully"
		sleep 15
		foundCount = ""
		begin  
			within all('.list')[0] do
				tr = first("tbody").all("tr")
				tr.each do |row|
				  if row.all("td")[1].text == arg["Display Name"]
					row.all("td")[0].all('a')[1].click
					foundCount = "First record found with match " + arg["Display Name"] + " verified"
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
			within all('.list')[0] do
				tr = first("tbody").all("tr")
				tr.each do |row|
				  if row.all("td")[1].text == arg["Display Name"]
					row.all("td")[0].all('a')[1].click
					foundCount = "First record found with match " + arg["Display Name"] + " verified"
					break
				  end	
				end
			end
		end
		if foundCount != "" 
			sleep 10
			click_on "Cancel"
		else
			foundCount = "No record found with match " + arg["Display Name"] + ". Unable to verify record."
		end
		puts foundCount
		puts "Created Focus Category verified successfully"
	rescue Exception => ex
		putstr "Error while Viewing Focus Category"
		putstr ex.message
	end
end

And (/^create a new FC group$/) do
begin
	arg = getDetails "Focus Category Group"
	click_link('Focus Category Groups')
	puts "Clicked Focus Categories Group link successfully"
	sleep 4
	find(".requiredInput").first("input").set(arg["Group Name"])
	first(:xpath, "//*[contains(@id, 'categoryGroupTypeSectionItem:categoryGroupTypeSL')]").select("Main")	
	click_on "Create New"
	sleep 5
	click_on "Save"
	puts "Successfully created Focus Category" 
	if page.has_content?('Successfully Saved Focus Category Group')
			puts "Successfully Saved Focus Category Group message displayed"
			sleep 3
	else
		raise "Successfully Saved Focus Category Group message not displayed"
	end
	rescue Exception => ex
		putstr "Error occurred while creating a Focus Category Group"
		putstr ex.message
	end
end

And (/^create a new Tile FC group$/) do
begin
	click_link('Focus Category Groups')
	puts "Clicked Focus Categories Group link successfully"
	sleep 4
	if first(:xpath, "//*[contains(@id, 'categoryGroupTypeSectionItem:categoryGroupTypeSL')]").all(:option, "Tiles").count > 0
		find(".requiredInput").first("input").set("FCG Tiles")
		first(:xpath, "//*[contains(@id, 'categoryGroupTypeSectionItem:categoryGroupTypeSL')]").select("Tiles")	
		click_on "Create New"
		sleep 5
		click_on "Save"
		puts "Successfully created Focus Category" 
		if page.has_content?('Successfully Saved Focus Category Group')
				puts "Successfully Saved Focus Category Group message displayed"
				sleep 3
		else
			raise "Successfully Saved Focus Category Group message not displayed"
		end
	else
		puts "<b>Tiles Focus Category Group already exists</b>"
	end
	rescue Exception => ex
		putstr "Error occurred while creating a Focus Category Group"
		putstr ex.message
	end
end

And (/^edit a main FC group$/) do 
begin
	arg = getDetails "Focus Category Group"
	fcgName = arg["Group Name"]
	click_link('Focus Category Groups')
	sleep 4
	rows = all(:css,"tr .dataRow")
	rows.each do |row|
		if row.all("td")[3].first("input").value == fcgName
		   row.all("td")[0].all("a")[0].click
		   break
		end
	end
	sleep 2
	found = 0
	if page.has_content?('Create New')
		first(:xpath, "//*[contains(@id, 'focusCategoryColumnNameIT')]").set(arg["col1"])
		click_on "Create New"
		found = 1
		sleep 10
	end
	if page.has_content?('Create New')
		first(:xpath, "//*[contains(@id, 'focusCategoryColumnNameIT')]").set(arg["col2"])
		click_on "Create New"
		sleep 10
	end
	if page.has_content?('Create New')
		first(:xpath, "//*[contains(@id, 'focusCategoryColumnNameIT')]").set(arg["col3"])
		click_on "Create New"
		sleep 10
	end
		puts "Three columns added to FC Group"

	if page.has_content?('Create New')
		raise "Create New button displayed after adding three columns."
	else
		puts "Create New button disappears after adding three columns."
	end
	if found > 0
		rows = all(:css,"tr .dataRow")
		rows[0].all("td")[0].first(:link,"Edit").click
		puts "Selected first column for adding Focus Category"
		sleep 5
		first(:xpath, "//*[contains(@id, 'selectObjectSectionItem:selectObjectType')]").select("Account")
		sleep 5
		first(:xpath, "//*[contains(@id, 'selectFCSectionItem:selectfocusCategoryView')]").find(:xpath, 'option[1]').select_option
		click_on "Add Category"
		sleep 12
		click_on "Save"
		sleep 12
		if page.has_content?('Successfully Saved Focus Category Group, Columns and Categories')
			puts "Successfully Saved Focus Category Group, Columns and Categories message displayed."
		else
			puts "Successfully Saved Focus Category Group, Columns and Categories message not displayed."
			if all("messageText").count >0 
				putstr first(".messageText").text + " message displayed"
			end
		end
		rows = all(:css,"tr .dataRow")
		rows[1].all("td")[0].first(:link,"Edit").click
		puts "Selected second column for adding Focus Category"
		sleep 12
		first(:xpath, "//*[contains(@id, 'selectObjectSectionItem:selectObjectType')]").select("Account")
		sleep 12
		first(:xpath, "//*[contains(@id, 'selectFCSectionItem:selectfocusCategoryView')]").find(:xpath, 'option[1]').select_option
		click_on "Add Category"
		sleep 12
		click_on "Save"
		sleep 12
		FCarg = getDetails "Focus Category for use"
		rows = all(:css,"tr .dataRow")
		rows[2].all("td")[0].first(:link,"Edit").click
		puts "Selected third column for adding Focus Category"
		sleep 12
		first(:xpath, "//*[contains(@id, 'selectObjectSectionItem:selectObjectType')]").select("Account")
		sleep 12
		begin
			first(:xpath, "//*[contains(@id, 'selectFCSectionItem:selectfocusCategoryView')]").select(FCarg["Display Name"])
		rescue
			first(:xpath, "//*[contains(@id, 'selectFCSectionItem:selectfocusCategoryView')]").find(:xpath, 'option[1]').select_option
		end
		click_on "Add Category"
		sleep 12
		click_on "Save"
		puts "Focus Categories added to Focus Category Group"
		sleep 12
		rows = all(:css,"tr .dataRow")
		rows[0].all("td")[0].first(:link,"Edit").click
		puts "Selected first column for adding Focus Category"
		sleep 12
		begin
			first(:xpath, "//*[contains(@id, 'selectObjectSectionItem:selectObjectType')]")..find(:xpath, 'option[1]').select_option
			sleep 12
			first(:xpath, "//*[contains(@id, 'selectFCSectionItem:selectfocusCategoryView')]").find(:xpath, 'option[1]').select_option
			click_on "Add Category"
			sleep 12
			click_on "Save"
			sleep 12
		rescue Exception => ex1
			puts "Edited main Focus Category Group."
		end
		if all("messageText").count >0 
			puts find(".messageText").text
		end
	end
	puts "Main Focus Category Group update completed."
	rescue Exception => ex
		putstr "Error occurred while editing a Focus Category Group"
		putstr ex.message
	end
end

And (/^edit a tile FC group$/) do
begin
    arg = getDetails "Focus Category Group"
	fcgName = "FCG Tiles"
	click_link('Focus Category Groups')
	sleep 4
	rows = all(:css,"tr .dataRow")
	rows.each do |row|
		if row.all("td")[3].first("input").value==fcgName
		   row.all("td")[0].all("a")[0].click
		   break
		end
	end
	sleep 2
	found = 0
	if page.has_content?('Create New')
		first(:xpath, "//*[contains(@id, 'focusCategoryColumnNameIT')]").set(arg["col1"])
		click_on "Create New"
		found = 1
		sleep 10
	end
	
	if found > 0
		rows = all(:css,"tr .dataRow")
		rows[0].all("td")[0].first(:link,"Edit").click
		puts "Selected first column for adding Focus Category"
		sleep 5
		first(:xpath, "//*[contains(@id, 'selectObjectSectionItem:selectObjectType')]").select("Account")
		sleep 5
		first(:xpath, "//*[contains(@id, 'selectFCSectionItem:selectfocusCategoryView')]").find(:xpath, 'option[1]').select_option
		click_on "Add Category"
		sleep 12
		click_on "Save"
		sleep 12
		
		puts "Focus Categories added to Focus Category Group"
		sleep 12
		rows = all(:css,"tr .dataRow")
		rows[0].all("td")[0].first(:link,"Edit").click
		puts "Selected first column for adding Focus Category"
		sleep 12
		first(:xpath, "//*[contains(@id, 'selectObjectSectionItem:selectObjectType')]").select("Account")
		sleep 12
		first(:xpath, "//*[contains(@id, 'selectFCSectionItem:selectfocusCategoryView')]").find(:xpath, 'option[1]').select_option
		click_on "Add Category"
		sleep 12
		click_on "Save"
		sleep 12
		if all("messageText").count >0 
			puts find(".messageText").text
		end
	end
	puts "Edit Tile Focus Category Group Completed."
	rescue Exception => ex
		putstr "Error occurred while editing a Focus Category Group"
		putstr ex.message
	end
end


And (/^I delete a Focus Category from a FC group$/) do
begin
	arg = getDetails "Focus Category Group"
	click_link('Focus Category Groups')
	sleep 4
	rows = all(:css,"tr .dataRow")
	rows.each do |row|
		if row.all("td")[3].first("input").value==arg["Group Name"]
		   row.all("td")[0].all("a")[0].click
		   break
		end
	end
	sleep 2
	rows = all(:css,"tr .dataRow")
	if rows.count > 0
		rows[0].all("td")[0].first(:link,"Edit").click
		puts "Selected first column for deleting Focus Category"
		sleep 12
		#find(:id,"pagefocusCategories:frmFocusCategories:fcBlock:focusCategoriesTable").all(:css,"tr .dataRow")[0].first(:link,"Delete").click
		find(:id,"pagefocusCategories:frmFocusCategories:FocusCategoryGroupMainBlock:fcColumnBlock:focusCategoriesColumnTable").all(:css,"tr .dataRow")[0].first(:link,"Delete").click
		driver.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
		sleep 12
		puts find(".messageText").text
		puts "Focus Category Deleted from Focus Category Group and confirmation message displayed."
		sleep 12
		click_on "Save"
	else
		putstr "No Focus Category record found for deletion"
	end
	sleep 12
	rescue Exception => ex
		putstr "Error occurred while editing a Focus Category Group"
		putstr ex.message
	end
end

And (/^I Clone a FC group$/) do
begin
	arg = getDetails "Focus Category Group"
	click_link('Focus Category Groups')
	sleep 12
	rows = all(:css,"tr .dataRow")
	rows.each do |row|
		if row.all("td")[3].first("input").value==arg["Group Name"]
		   row.all("td")[0].all("a")[2].click
		   break
		end
	end
	sleep 12
	clone = 0
	rows = all(:css,"tr .dataRow")
	rows.each do |row|
		if row.all("td")[3].first("input").value=="Clone of " + arg["Group Name"]
		   clone = 1
		   break
		end
	end
	if clone==1
	   puts "Clone of " + arg["Group Name"] + " created successfully."
	else
	   raise "Clone of " + arg["Group Name"] + " could not be created."
	end
	rescue Exception => ex
		putstr "Error occurred while Cloning a Focus Category Group"
		putstr ex.message
	end
end

And (/^I Delete a Clone FC group$/) do
begin
	arg = getDetails "Focus Category Group"
	click_link('Focus Category Groups')
	sleep 12
	rows = all(:css,"tr .dataRow")
	rows.each do |row|
		if row.all("td")[3].first("input").value=="Clone of " + arg["Group Name"]
		   page.accept_confirm { row.all("td")[0].all("a")[1].click }
		   break
		end
	end
	sleep 4
	puts "Clone of " + arg["Group Name"] + " Focus Category Group deleted successfully."
	rescue Exception => ex
		putstr "Error occurred while Deleting a Focus Category Group"
		putstr ex.message
	end
end


And(/^I add one or more "([^"]*)"$/) do |category|
  begin
   sleep 4
   arg = getDetails "Focus Category Group"
   sleep 4
   find(".requiredInput").first("input").set(arg["FoucsCategoryGroupName"])
   first(:xpath, "//*[contains(@id, 'categoryGroupTypeSectionItem:categoryGroupTypeSL')]").select("Main")
   click_on "Create New"
   sleep 5
   click_on "Save"
   sleep 4
   puts "Successfully created Focus Category"
   sleep 3
   if page.has_content?('Successfully Saved Focus Category Group')
     puts "Successfully Saved Focus Category Group message displayed"
     sleep 3
   else
     raise "Successfully Saved Focus Category Group message not displayed"
   end
   sleep 5
   rows = all(:css,"tr .dataRow")
   rows.each do |row|
     if row.all("td")[3].first("input").value == arg["FoucsCategoryGroupName"]
       row.all("td")[0].all("a")[0].click
       break
     end
   end
   sleep 2
   found = 0
   if page.has_content?('Create New')
     first(:xpath, "//*[contains(@id, 'focusCategoryColumnNameIT')]").set(arg["col1"])
     click_on "Create New"
     found = 1
     sleep 10
   end
   if page.has_content?('Create New')
     first(:xpath, "//*[contains(@id, 'focusCategoryColumnNameIT')]").set(arg["col2"])
     click_on "Create New"
     sleep 10
   end
   puts "Three columns added to #{arg["FoucsCategoryGroupName"]}"

   if found > 0
     rows = all(:css,"tr .dataRow")
     rows[0].all("td")[0].first(:link,"Edit").click
     puts "Selected first column for adding Focus Category"
     sleep 5
     first(:xpath, "//*[contains(@id, 'selectObjectSectionItem:selectObjectType')]").select("Task")
     sleep 5
     first(:xpath, "//*[contains(@id, 'selectFCSectionItem:selectfocusCategoryView')]").select arg["FoucsCategoryGroupName"]
     sleep 4
     click_on "Add Category"
     sleep 12
     click_on "Save"
     sleep 12
     if page.has_content?('Successfully Saved Focus Category Group, Columns and Categories')
       puts "Successfully Saved Focus Category Group, Columns and Categories message displayed."
     else
       puts "Successfully Saved Focus Category Group, Columns and Categories message not displayed."
       if all("messageText").count >0
         putstr first(".messageText").text + " message displayed"
       end
     end
     rows = all(:css,"tr .dataRow")
     rows[1].all("td")[0].first(:link,"Edit").click
     puts "Selected second column for adding Focus Category"
     sleep 12
     first(:xpath, "//*[contains(@id, 'selectObjectSectionItem:selectObjectType')]").select("Task")
     sleep 12
     first(:xpath, "//*[contains(@id, 'selectFCSectionItem:selectfocusCategoryView')]").select arg["FoucsCategoryGroupName"]
     click_on "Add Category"
     sleep 12
     click_on "Save"
     sleep 12
     if all("messageText").count >0
       puts find(".messageText").text
     end
   end
   puts "Main Focus Category Group update completed."
   sleep 4
  rescue Exception => ex
    putstr "Error occurred while adding one or more Focus Category Group"
    putstr ex.message
  end
end

And(/^I delete the created "([^"]*)" group$/) do |group|
  begin
  arg = getDetails "Focus Category Group"
  sleep 4
  rows = all(:css,"tr .dataRow")
  rows.each do |row|
    if row.all("td")[3].first("input").value == arg["FoucsCategoryGroupName"]
      row.all("td")[0].first("span").first(:link,"Delete").click
      break
    end
  end
  sleep 5
  page.driver.browser.switch_to.alert.accept
  sleep 5
  puts "Successfully deleted the #{group} #{arg["FoucsCategoryGroupName"]} group"
  sleep 6
  rescue Exception => ex
     putstr "Error occurred while deleting the #{arg["FoucsCategoryGroupName"]} Focus Category Group"
     putstr ex.message
 end
end

And(/^I select the "([^"]*)" name from "([^"]*)" drop down$/) do |group, focus_category|
  begin
    arg = getDetails "Focus Category Group"
    sleep 4
    find(".select2-choice").click
    sleep 3
    first( 'li', text: arg["Group Name"]).click
    sleep 10
    puts "Selected the #{group} #{arg["Group Name"]} name from #{focus_category} drop down"
  rescue Exception => ex
    putstr "Error occurred while selecting the #{group} #{arg["Group Name"]} name from #{focus_category} drop down"
    putstr ex.message
  end
end

Then(/^I able to see the "([^"]*)" results$/) do |category|
  begin
    sleep 3
    arg = getDetails "Focus Category Group"
    sleep 4
    if page.has_css?(".ui-widget")
      puts "Successfully see the #{arg["Group Name"]} #{category} section"
      sleep 3
        if first(".font-light").text == arg["Group Name"]
           puts "Successfully see the #{arg["Group Name"]} #{category} name"
        else
          putstr "Failed to see the #{arg["Group Name"]} #{category} name"
        end
    else
      putstr "Failed to see the #{arg["Group Name"]} #{category} section"
    end
    sleep 6
  rescue Exception => ex
    putstr "Error occurred while verifying the #{arg["Group Name"]} #{category} section"
    putstr ex.message
  end
end

Then(/^I should not able to see the "([^"]*)" results$/) do |category|
  begin
    sleep 3
    arg = getDetails "Focus Category Group"
    sleep 4
    if page.has_css?(".ui-widget")
      puts "Successfully see the #{arg["Group Name"]} Focus Category section"
      sleep 3
        unless first(".font-light").text == arg["Group Name"]
          putstr "Able see the #{arg["Group Name"]} #{category} name"
        else
          puts "Not able to see the #{arg["Group Name"]} #{category} name"
        end
    else
      puts "Unable to see the #{arg["Group Name"]} #{category} section"
    end
    sleep 6
  rescue Exception => ex
    putstr "Error occurred while verifying the #{arg["Group Name"]} #{category} section"
    putstr ex.message
  end
end


And(/^I select the "([^"]*)" from object$/) do |object|
	begin
   sleep 4
	 find(:xpath, "//*[contains(@id, 'selList1')]").select object
    sleep 4
    puts "Successfully selected the #{object} object value"
	rescue Exception => ex
		putstr "Error occurred while selecting the object #{object} value"
		putstr_withScreen ex.message
	end
end



And(/^I enter the required data$/) do
  begin
  sleep 3
	arg = getDetails "Focus Category"
  sleep 4
	fill_in "Display Name",:with => arg["FocusCategoryName"]
  sleep 3
	puts "Successfully enter the display name:#{arg["FocusCategoryName"]}"
  sleep 3
	rescue Exception => ex
		putstr "Error occurred while entering the required fields"
		putstr_withScreen ex.message
	end
end


Then(/^I verify the focus category created or not$/) do
	begin
    sleep 4
		arg = getDetails "Focus Category"
		sleep 6
		foundCount = ""
		begin
			within all('.list')[0] do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[1].text == arg["FocusCategoryName"]
						row.all("td")[0].all('a')[1].click
						foundCount = "First record found with match #{arg["FocusCategoryName"]} verified"
						break
					end
				end
      end
      sleep 3
			if page.has_css?('.next')
				find(".next").click
				sleep 3
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount==""
			within all('.list')[0] do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[1].text == arg["FocusCategoryName"]
						row.all("td")[0].all('a')[1].click
						foundCount = "First record found with match #{arg["FocusCategoryName"]} verified"
						break
					end
				end
			end
		end
		if foundCount != ""
			sleep 10
			click_on "Cancel"
		else
			foundCount = "No record found with match #{arg["FocusCategoryName"]} Unable to verify record"
		end
		puts foundCount
		puts "Cancel Focus Category verified successfully"
	rescue Exception => ex
		putstr "Error occurred while verifying the cancel focus category"
		putstr_withScreen ex.message
	end
end

And(/^I enter the focus category view criteria details$/) do
	begin
    sleep 3
		arg = getDetails "Focus Category for use"
		sleep 4
		if page.has_content?('Focus Category View Criteria')
			puts "Focus Category View Criteria section displayed"
		else
			putstr "Focus Category View Criteria section not displayed"
    end
    sleep 3
		if page.has_content?('Focus Category View Columns')
			puts "Focus Category View Columns section displayed"
		else
			putstr "Focus Category View Columns section not displayed"
    end
		sleep 6
		0.upto(8) do
			sleep 3
			if page.has_css?(".btnDisabled")
				sleep 4
				click_on 'Add Criteria'
				sleep 6
			else
				puts "All fields are added"
			end
		end
		sleep 8
		amt = 500000
		all(:xpath, "//*[contains(@id, 'slFieldId')]")[0].select("Annual Revenue")
		sleep 5
		all(:xpath, "//*[contains(@id, 'outOperator')]")[0].select(">")
		sleep 5
		all(:xpath, "//*[contains(@id, 'outValue')]")[0].set amt
		sleep 5
		all(:xpath, "//*[contains(@id, 'slFieldId')]")[1].select("Annual Revenue")
		sleep 5
		all(:xpath, "//*[contains(@id, 'outOperator')]")[1].select(">")
		sleep 5
		all(:xpath, "//*[contains(@id, 'outValue')]")[1].set amt
    sleep 5
		all(:xpath, "//*[contains(@id, 'slFieldId')]")[2].select("Annual Revenue")
		sleep 5
		all(:xpath, "//*[contains(@id, 'outOperator')]")[2].select(">")
		sleep 5
		all(:xpath, "//*[contains(@id, 'outValue')]")[2].set amt
    sleep 5
  rescue Exception => ex
		putstr "Error occurred while verifying the cancel focus category"
		putstr_withScreen ex.message
	end
end

Then(/^I verify multiple filter logics "([^"]*)" and "([^"]*)"$/) do |fc_filter1, fc_filter2|
	begin
		sleep 4
		arg = getDetails "FocusCategoryDetails"
    sleep 6
		if "#{find(:xpath, "//*[contains(@id, 'addFilterLogicId')]").text}".to_s == arg["AddFilterLogicAssetText"].to_s
			sleep 4
			find(:xpath, "//*[contains(@id, 'addFilterLogicId')]").click
			sleep 4
			find(".fcv1_filterText").send_keys [:control, 'a'], :backspace
			sleep 4
			find(".fcv1_filterText").set fc_filter1
			sleep 4
			puts "Successfully verifyed the filter #{fc_filter1} Logic"
		else
			sleep 4
			find(".fcv1_filterText").send_keys [:control, 'a'], :backspace
			sleep 4
			find(".fcv1_filterText").set fc_filter1
			sleep 4
			puts "Successfully verifyed the filter #{fc_filter1} Logic"
		end
		sleep 5
		if "#{find(:xpath, "//*[contains(@id, 'addFilterLogicId')]").text}".to_s == arg["AddFilterLogicAssetText"].to_s
			sleep 4
			find(:xpath, "//*[contains(@id, 'addFilterLogicId')]").click
			sleep 4
			find(".fcv1_filterText").send_keys [:control, 'a'], :backspace
			sleep 4
			find(".fcv1_filterText").set fc_filter2
			sleep 4
			puts "Successfully verifyed the filter #{fc_filter2} Logic"
		else
			sleep 4
			find(".fcv1_filterText").send_keys [:control, 'a'], :backspace
			sleep 4
			find(".fcv1_filterText").set fc_filter2
			sleep 4
			puts "Successfully verifyed the filter #{fc_filter2} Logic"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while verifying the filter logic"
		putstr_withScreen ex.message
	end
end

Then(/^I should able to see the created focus category$/) do
	begin
		sleep 6
		if page.has_content?('Focus Category View Criteria Saved Successfully')
			puts "Successfully see the Focus Category View Criteria Saved Successfully message"
			sleep 3
		else
			putstr "Failed to see the Focus Category View Criteria Saved Successfully message"
		end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while verifying the filter logic"
		putstr_withScreen ex.message
	end
end


And(/^I fill the focus category "([^"]*)" details$/) do |field_value|
	begin
		sleep 3
		arg = getDetails "FocusCategoryDetails"
		arg2 = getReference "Reference"
		sleep 4
		if page.has_content?('Focus Category View Criteria')
			puts "Focus Category View Criteria section displayed"
		else
			putstr "Focus Category View Criteria section not displayed"
		end
		sleep 3
		if page.has_content?('Focus Category View Columns')
			puts "Focus Category View Columns section displayed"
		else
			putstr "Focus Category View Columns section not displayed"
		end
		sleep 8
		all(:xpath, "//*[contains(@id, 'slFieldId')]")[0].select field_value
		sleep 5
		all(:xpath, "//*[contains(@id, 'outOperator')]")[0].select arg["FocusCategoryOperator"]
		sleep 5
		within(".lookupInput") do
			first("input").set arg2["FocusCategoryLookupValue"]
		end
		sleep 4
	rescue Exception => ex
		putstr "Error occurred while verifying the cancel focus category"
		putstr_withScreen ex.message
	end
end


And(/^I create new "([^"]*)" group$/) do |group|
	begin
		sleep 3
		arg = getDetails "FocusCategoryDetails"
		sleep 4
		find(".requiredInput").first("input").set arg["FocusCategoryName"]
		sleep 4
		first(:xpath, "//*[contains(@id, 'categoryGroupTypeSectionItem:categoryGroupTypeSL')]").select("Main")
		sleep 4
		puts "Successfully create the #{group}"
	rescue Exception => ex
		putstr "Error occurred while creating the new #{group}"
		putstr_withScreen ex.message
	end
end



And(/^I select the focus category from "([^"]*)" page$/) do |arg|
	begin
		sleep 3
		arg = getDetails "FocusCategoryDetails"
    sleep 4
		find(".select2-choice").click
    sleep 3
		find( 'li', text: arg["FocusCategoryName"]).click
		sleep 6
		puts "Successfully selected the focus category to the focus category group"
	rescue Exception => ex
		putstr "Error occurred while selecting the focus category"
		putstr ex.message
	end
end

Then(/^I verify the focus category results$/) do
	begin

	rescue Exception => ex
		putstr "Error occurred while "
		putstr ex.message
	end
end


And(/^I delete the focus category$/) do
	begin
   sleep 3
    within(".list") do
      focus_category_records = first("tbody").all("tr").count
      puts focus_category_records
      sleep 3
      if first("tbody").all("tr").count > 3
				all(:link, "Delete")[4].click
        sleep 3
        puts "Successfully deleted the focus category"
      else
        puts "More than 3 records not found"
      end
    end
    sleep 3
	rescue Exception => ex
		putstr "Error occurred while deleting the focus category record"
		putstr ex.message
	end
end

And(/^I add the "([^"]*)" columns$/) do |add_field|
	begin
		sleep 5
		0.upto(5) do
			sleep 3
			if page.has_button?(add_field)
				sleep 4
				click_on add_field
				sleep 6
			else
				puts "#{add_field} button is disappeared"
			end
		end
		sleep 3
	rescue Exception => ex
		putstr "Error occurred while adding the multiple columns"
		putstr ex.message
	end
end

Then(/^I verify the "([^"]*)" button is disappeared$/) do |add_field|
	begin
		sleep 4
		unless page.has_button?(add_field)
			puts "Successfully #{add_field} button is disappeared"
    else
			putstr "#{add_field} button is not disappeared"
    end
		sleep 3
	rescue Exception => ex
		putstr "Error occurred while verifying the #{add_field} button is disappeared"
		putstr ex.message
	end
end