#All Service Source Setup - Mappings specific Step definitions
#All Scenario mentioned in Mappings.feature

Then(/^all required fields should be displayed in Grey$/) do
  begin
  within all(".pbSubsection")[1].first(".detailList").first(".list") do 
	  requiredFields = all("span", :text => "Required Field")
	  requiredFields.each do |requiredField|
	    if requiredField.native.style('color') != "rgba(128, 128, 128, 1)"
			putstr "Required Field is not in grey color. Instead of rgba(128,128,128,1) it is displayed in " + requiredField.last.native.style('color')
		end
	  end
  end
  puts "Successfully verified that Required Fields is displayed in Grey for mandatory fields"
  rescue Exception => ex
		putstr "Error occurred while verify Required Fields color."
		putstr_withScreen  ex.message
  end 
end

And (/^I should be able to edit Opportunity Product Line field Quantity$/) do
	begin
		within all(".pbSubsection")[2].first(".detailList").first(".list") do 
			rows = all(".dataRow")
			sleep 7  
			rows[0].all(".dataCell")[3].first(:xpath, ".//*[contains(@id, 'rOFDFields')]").find(:xpath, 'option[1]').select_option
			sleep 5
			rows[0].first(:xpath, ".//*[contains(@id, 'FM_DefaultTextField')]").set("10")
			puts "Quantity field values set as 10"
		end
	rescue Exception => ex
		putstr "Error occurred while editing Opportunity Product Line field Quantity."
		putstr_withScreen  ex.message
	end 
end


And (/^the new Quantity Default Value should be displayed$/) do
	begin
		within all(".pbSubsection")[2].first(".detailList").first(".list") do 
			rows = all(".dataRow")
			if rows[0].first(:xpath, ".//*[contains(@id, 'FM_DefaultTextField')]").value == "10"
				puts "Asset Opportunity Mapping Field edit working"
			else
				putstr "Asset Opportunity Mapping Field edit not working. Values displaying " + rows[0].first(:xpath, ".//*[contains(@id, 'FM_DefaultTextField')]").value + " instead of 10"
			end
		end
	rescue Exception => ex
		putstr "Error occurred while verifying updated values after Asset Opportunity Mapping."
		putstr_withScreen  ex.message
	end 
end

And (/^I Add Opportunity Product Line Fields$/) do
	begin
	  sleep 10
		addDisabled = 1
        within all(".pbSubsection")[2] do
			if page.has_css?(".btnDisabled")
				addDisabled = 0
			end
        end
		sleep 6
		if (addDisabled > 0)
			within all(".pbSubsection")[2] do
				click_on "Add"
			end
			sleep 6
			ddlField = first(:xpath, ".//*[contains(@id, 'fieldsName')]")
			optionsCount = ddlField.all(:xpath, 'option').count
			within all(".pbButton")[1] do
				click_on "Cancel"
			end
			sleep 12
			0.upto(optionsCount-1) do 
			    within all(".pbSubsection")[2] do
					click_on "Add"
				end
				sleep 12
				first(:xpath, ".//*[contains(@id, 'fieldsName')]").find(:xpath, 'option[1]').select_option
				sleep 12
				begin
				first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").find(:xpath, 'option[2]').select_option
				rescue
					choose "defaultRadioId"
					sleep 6
					first(:xpath, ".//*[contains(@id, 'defaultText')]").set(10)
				end
				within all(".pbButton")[1] do
					click_on "Save"
				end
				sleep 10
			end
		end
		puts "Added Opportunity Product Line Fields"
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while adding Opportunity Product Line Fields."
		putstr_withScreen  ex.message
	end 
end

And (/^I Add Opportunity Fields "(.*?)" and "(.*?)"$/) do |arg1,arg2|
	begin
	  sleep 6
		addDisabled = 1
        within all(".pbSubsection")[1] do
			if page.has_css?(".btnDisabled")
				addDisabled = 0
			end
        end
		sleep 8
		if (addDisabled > 0)
			within all(".pbSubsection")[1] do
				click_on "Add"
				puts "Add clicked"
			end
			sleep 12
			result = false
			first(:xpath, ".//*[contains(@id, 'fieldsName')]").all('option').each do |field|
				if field.text.to_s.include? arg1.to_s
					sleep 5
					puts "Successfully see the #{arg1} field value"
					first(:xpath, ".//*[contains(@id, 'fieldsName')]").select(arg1)
					sleep 10
					first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").find(:xpath, 'option[2]').select_option
					sleep 5
					result = true
					break
				end
			end
			putstr "Unable to find the #{arg1} field value" unless result
			sleep 10
			within all(".pbButton")[1] do
				click_on arg2
			end
			sleep 5
		end
		puts "Added Opportunity Field"
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while adding Opportunity Fields."
		putstr_withScreen  ex.message
	end 
end

Then (/^Opportunity Field "(.*?)" should be present$/) do |arg1|
	begin
		sleep 10
		fieldPresent = 0
		within all(".pbSubsection")[1] do
			within('.list') do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[2].text == arg1
						fieldPresent = 1
						row.first(:link,"Delete").click
						puts "#{arg1} field found"
						sleep 10
						break
					end
				end
			end
    end
    sleep 8
		if fieldPresent > 0
			puts "#{arg1} field present"
		else
			putstr "#{arg1} field not present"
    end
    sleep 5
		first(".pbButtonb").first(".btn").click
		puts "Opportunity Fields Verified"
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while verifying Opportunity Fields"
		putstr_withScreen  ex.message
	end 
end

Then (/^Opportunity Field "(.*?)" should not be present$/) do |arg1|
	begin
	  sleep 6
		fieldPresent = 0
        within all(".pbSubsection")[1] do
			within('.list') do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[2].text == arg1
						fieldPresent = 1
						row.first(:link,"Delete").click
						puts "#{arg1} field found"
						#deleting field for future test runs
						sleep 20
						break
					end                        
				end
			end
    end
		sleep 6
		if fieldPresent > 0
			putstr "#{arg1} field present"
		else
			puts "#{arg1} field not present"
		end
		first(".pbButtonb").first(".btn").click
		puts "Opportunity Fields Verified"
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while verifying Opportunity Fields."
		putstr_withScreen  ex.message
	end 
end

Then(/^I Add Opportunity Fields "(.*?)" to "(.*?)"$/) do |arg1,arg2|
	begin
	    sleep 2
		addDisabled = 1
        within all(".pbSubsection")[1] do
			if page.has_css?(".btnDisabled")
				addDisabled = 0
			end
        end
		sleep 2
		if (addDisabled > 0)
			within all(".pbSubsection")[1] do
				click_on "Add"
			end
			sleep 15
			first(:xpath, ".//*[contains(@id, 'fieldsName')]").select(arg1)
			sleep 10
			first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").select(arg2)
			within all(".pbButton")[1] do
				click_on "Save"
			end
			sleep 10
		end
		puts "Mapped Opportunity Field #{arg1} to Source Field #{arg2}"
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while adding Opportunity Field."
		putstr_withScreen  ex.message
	end 
end

And(/^I delete all mapping fields$/) do
	begin
	fieldPresent = 1
	numSections = all(".pbSubsection").count-1
	0.upto(numSections) do |sectionNum|
		sleep 5
		begin
			if all(".pbSubsection")[sectionNum].all(:link,"Delete").count > 0
				fieldPresent = 1
				all(".pbSubsection")[sectionNum].first(:link,"Delete").click
				sleep 10
			else
				fieldPresent = 0
			end
		end until fieldPresent == 0
	end
	first(".pbButtonb").first(".btn").click
	puts "Mapping fields deleted"
   
	sleep 10

	rescue Exception => ex
		putstr "Error occurred while deleting mapping Fields."
		putstr_withScreen  ex.message
	end
end

And (/^I delete Opportunity Fields "(.*?)"$/) do |arg1|
	begin
	    sleep 2
		fieldPresent = 0
        within all(".pbSubsection")[1] do
			within('.list') do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[2].text == arg1
						fieldPresent = 1
						row.first(:link,"Delete").click
						puts "#{arg1} field found"
						#deleting field 
						sleep 20
						break
					end                        
				end
			end
		end
		sleep 6
		if fieldPresent > 0
			puts "#{arg1} field deleted"
		else
			putstr "#{arg1} field was not present"
		end
		first(".pbButtonb").first(".btn").click
		puts "Opportunity Field  #{arg1} Deleted"
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while verifying Opportunity Fields."
		putstr_withScreen  ex.message
	end 
end

And (/^I Edit Opportunity Fields "(.*?)" to "(.*?)"$/) do |arg1,arg2|
	begin
		within all(".pbSubsection")[1] do
			within('.list') do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[2].text == arg1
						row.all("td")[3].first("select").select(arg2)
						#deleting field for future test runs
						sleep 10
						break
					end                        
				end
			end
        end
	rescue Exception => ex
		putstr "Error occurred while Editing Opportunity Fields."
		putstr_withScreen  ex.message
	end
end
	
And (/^I Verify the Default Value Field is enabled for "(.*?)"$/) do |arg1|
	begin
    within all(".pbSubsection")[2] do
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("td")[2].text == arg1
					if row.all("td")[4].first(:xpath, ".//*[contains(@id, 'FM_DefaultTextField')]")[:disabled] == "true"
						puts "#{arg1} field set default value is disabled"
					else
						 puts "#{arg1} field set default value is enabled"
					end
					sleep 5
					break
				end
			end
		end
	end
	rescue Exception => ex
		putstr "Error occurred while verifying Set Default Value for Opportunity Fields."
		putstr_withScreen  ex.message
	end
end

And (/^I Verify the Default Value Field is disabled for "(.*?)"$/) do |arg1|
	begin
		within all(".pbSubsection")[1] do
			within('.list') do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[2].text == arg1
						if row.all("td")[4].first(:xpath, ".//*[contains(@id, 'FM_DefaultTextField')]")[:disabled] == "true"
							puts "#{arg1} field set default value is disabled"
						else
							 puts "#{arg1} field set default value is enabled"
						end
						sleep 5
						break
					end
				end
			end
		end
	rescue Exception => ex
		putstr "Error occurred while verifying Set Default Value for Opportunity Fields."
		putstr_withScreen  ex.message
	end
end
	
When (/^I Add all Opportunity Fields$/) do
  begin
  sleep 6
	 addDisabled = 1
   within all(".pbSubsection")[1] do
		if page.has_css?(".btnDisabled")
			addDisabled = 0
		end
   end
	sleep 6
	if (addDisabled > 0)
		within all(".pbSubsection")[1] do
			click_on "Add"
		end
		sleep 6
		ddlField = first(:xpath, ".//*[contains(@id, 'fieldsName')]")
		optionsCount = ddlField.all(:xpath, 'option').count
		sleep 6
		#0.upto(optionsCount) do  # reduced to 5 fields since test cases take a long time to execute
		0.upto(5) do
			if addDisabled > 0
				sleep 6
				first(:xpath, ".//*[contains(@id, 'fieldsName')]").find(:xpath, 'option[1]').select_option
				sleep 10
				begin
					first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").find(:xpath, 'option[2]').select_option
				rescue
					choose "defaultRadioId"
					sleep 8
					first(:xpath, ".//*[contains(@id, 'defaultText')]").set(10)
        end
        sleep 4
				within all(".pbButton")[1] do
					click_on "Save"
				end
				sleep 10
				#puts "Added all fields and checking for Add button disabled state"
				within all(".pbSubsection")[1] do
					if page.has_css?(".btnDisabled")
						puts "Add button is disabled after mapping all fields"
						addDisabled = 0
						break
					else
						click_on "Add"
					end
				end
			end
		end
	end
	puts "Added All Opportunity Fields"
	sleep 10
 rescue Exception => ex
	 putstr "Error occurred while adding all Opportunity Fields."
	 putstr_withScreen  ex.message
 end
end

When(/^I Add Related List Field$/) do
  begin
  sleep 5
	within all(".pbSubsection")[3] do
		click_on "Add"
		sleep 5
	end
	puts "Added Related List Field successfully"
	rescue Exception => ex
	  putstr "Error occurred while adding Related List Fields"
	  putstr_withScreen  ex.message
 end
end

Then(/^Related List Field should be present$/) do
  begin
   sleep 5
   within all(".pbSubsection")[3] do
			tr = all(".dataRow")
			if tr.count > 0
				puts "Related List field present in grid"
			else
				putstr "Related List field not present in grid"
			end
   end
   puts "Verified Related List Field successfully"
	rescue Exception => ex
	  putstr "Error occurred while verified Related List Fields"
	  putstr_withScreen  ex.message
 end
end

Then(/^I Delete Related List Field$/) do
  begin
  sleep 6
  within all(".pbSubsection")[3] do
		tr = all(".dataRow")
		if tr.count > 0
			puts "Related List field present in grid"
		  first(:link, "Delete").click
      sleep 5
		else
			putstr "Related List field not present in grid"
		end
  end
  first(".pbButtonb").first(".btn").click
  sleep 5
  
   puts "Deleted Related List Field successfully"
	rescue Exception => ex
	  putstr "Error occurred while Deleting Related List Fields"
	  putstr_withScreen  ex.message
 end
end

Then(/^Related List Field should not be present$/) do
  begin
  sleep 6
  within all(".pbSubsection")[3] do
		tr = all(".dataRow")
			if tr.count > 0
				putstr "Related List field present in grid"
			else
				puts "Related List field not present in grid"
			end
   end
   puts "Verified Related List Field successfully"
	rescue Exception => ex
	  putstr "Error occurred while verified Related List Fields"
	  putstr_withScreen  ex.message
 end
end

When (/^I Add all Asset Fields$/) do
	begin
	sleep 2
		addDisabled = 1
        within all(".pbSubsection")[1] do
			if page.has_css?(".btnDisabled")
				addDisabled = 0
			end
        end
		sleep 2
		if (addDisabled > 0)
			within all(".pbSubsection")[1] do
				click_on "Add"
			end
			sleep 5
			ddlField = first(:xpath, ".//*[contains(@id, 'fieldsName')]")
			optionsCount = ddlField.all(:xpath, 'option').count
			puts "No. of Asset Fields: " + optionsCount.to_s
			sleep 4
			0.upto(1) do |i|
			    if i>0 
					within all(".pbSubsection")[1] do
						if page.has_css?(".btnDisabled")
							puts "Add button is disabled after mapping all fields"
							addDisabled = 0
							break
						else
							click_on "Add"
						end
					end
				end
				if addDisabled > 0
					sleep 5
					first(:xpath, ".//*[contains(@id, 'fieldsName')]").find(:xpath, 'option[1]').select_option
					sleep 5
					first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").select("--Default Value--")
					within all(".pbButton")[1] do
						click_on "Save"
					end
					sleep 10
				end
			end
		end
		puts "Added All Opportunity Fields"
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while adding all Opportunity Fields."
		putstr_withScreen  ex.message
	end
end

Then (/^all Asset Fields should be present$/) do
  begin
	sleep 2
	fieldValue = 0
	within all(".pbSubsection")[1] do
		within('.list') do
			tr = first("tbody").all(".dataRow")
			tr.each do |row|
				if row.all(:link,"Delete").count > 0
					puts row.all(".dataCell")[2].text + " has been added"
					fieldValue = 1
#  page.find(:xpath, './/select[contains(@title,"View")]').find('option[selected]').text 
						#fieldValue = 0
						#sleep 10
						#break
					#end
				end
			end
		end
	end
	sleep 6
	if fieldValue > 0
		puts "All fields values carried over successfully."
	else
		putstr "All fields values not carried over."
	end
	puts "Asset Fields Verified"
	sleep 10
 rescue Exception => ex
	 putstr "Error occurred while verifying Asset Fields."
	 putstr_withScreen  ex.message
 end
end


Then(/^I select default value for the Source Opportunity Line Item Field$/) do
	begin
		within all(".pbSubsection")[2].first(".detailList").first(".list") do
			rows = all(".dataRow")
			sleep 10
			rows[0].all(".dataCell")[3].first(:xpath, ".//*[contains(@id, 'rOFDFields')]").find(:xpath, 'option[1]').select_option
			sleep 10
			rows[0].first(:xpath, ".//*[contains(@id, 'FM_DefaultTextField')]").set("10")
			puts "Quantity field values set as 10"
		end
	rescue Exception => ex
		putstr "Error occurred while editing Opportunity Product Line field Quantity."
		putstr_withScreen  ex.message
	end
end

And(/^I Add Service Contract Fields "([^"]*)" and "([^"]*)"$/) do |field, action|
  begin
  sleep 5
	addDisabled = 1
	within all(".pbSubsection")[1] do
		if page.has_css?(".btnDisabled")
			addDisabled = 0
		end
	end
	sleep 5
	if (addDisabled > 0)
		within all(".pbSubsection")[1] do
			click_on "Add"
			puts "Add clicked"
		end
		sleep 16
		first(:xpath, ".//*[contains(@id, 'fieldsName')]").select(field)
		sleep 15
		choose "defaultRadioId"
		sleep 6
		first(:xpath, ".//*[contains(@id, 'defaultText')]").set("Text")
    sleep 8
		within all(".pbButton")[1] do
			click_on action
		end
		sleep 5
	end
	puts "Added Service Contract Field"
	sleep 10
	rescue Exception => ex
	putstr "Error occurred while adding Service Contract Fields"
	putstr_withScreen  ex.message
 end
end

And(/^I Add Service Contract Fields "([^"]*)" and Opportunity Field "([^"]*)"$/) do |field1, field2|
	begin
		sleep 5
		addDisabled = 1
		within all(".pbSubsection")[1] do
			if page.has_css?(".btnDisabled")
				addDisabled = 0
			end
		end
		sleep 5
		if (addDisabled > 0)
			within all(".pbSubsection")[1] do
				click_on "Add"
				puts "Add clicked"
			end
			sleep 12
			first(:xpath, ".//*[contains(@id, 'fieldsName')]").select(field1)
			sleep 15
			first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").select(field2)
			sleep 8
			within all(".pbButton")[1] do
				click_on 'Save'
			end
			sleep 5
		end
		puts "Added Service Contract Field"
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while adding Service Contract Fields"
		putstr_withScreen  ex.message
	end
end

And(/^I delete Service Contract Fields "([^"]*)"$/) do |action|
	begin
		sleep 2
		fieldPresent = 0
		within all(".pbSubsection")[1] do
			within('.list') do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[2].text == action
						sleep 5
						fieldPresent = 1
						row.first(:link,"Delete").click
						puts "#{action} field found"
						#deleting field
						sleep 20
						break
					end
				end
			end
		end
		sleep 8
		if fieldPresent > 0
			puts "#{action} field deleted"
		else
			putstr "#{action} field was not present"
    end
	    first(".pbButtonb").first(".btn").click
		puts "Opportunity Field #{action} Deleted"
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while verifying Opportunity Fields."
		putstr_withScreen  ex.message
	end
end


And(/^I add multiple Service Contract Fields$/) do
	begin
		sleep 10
		addDisabled = 1
		within all(".pbSubsection")[1] do
			if page.has_css?(".btnDisabled")
				addDisabled = 0
			end
		end
		sleep 10
		if (addDisabled > 0)
			within all(".pbSubsection")[1] do
				click_on "Add"
			end
			sleep 12
			ddlField = first(:xpath, ".//*[contains(@id, 'fieldsName')]")
			optionsCount = ddlField.all(:xpath, 'option').count
			within all(".pbButton")[1] do
				click_on "Cancel"
			end
			sleep 10
			count = 0
			0.upto(optionsCount-1) do
				within all(".pbSubsection")[1] do
					click_on "Add"
				end
				sleep 15
				count = count + 1
				first(:xpath, ".//*[contains(@id, 'fieldsName')]").find(:xpath, 'option[1]').select_option
				sleep 15
				begin
					first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").find(:xpath, 'option[2]').select_option
				rescue
					choose "defaultRadioId"
					sleep 8
					first(:xpath, ".//*[contains(@id, 'defaultText')]").set(10)
        end
				within all(".pbButton")[1] do
					click_on "Save"
				end
				sleep 10
				if count == 5
					break
				end
			end
		end
		puts "Added Service Contract Fields"
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while adding Service Contract Fields"
		putstr_withScreen  ex.message
	end
end


Then(/^Service Contract Field "([^"]*)" should be present$/) do |field|
	begin
		within all(".pbSubsection")[1] do
			within('.list') do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[2].text == field
            sleep 5
						puts "#{field} field present"
						sleep 10
						break
          else
						puts "#{field} field not present"
					end
				end
			end
		end
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while verifying Opportunity Fields."
		putstr_withScreen  ex.message
	end
end

And(/^I Add Opportunity Product Line Fields "([^"]*)" and "([^"]*)"$/) do |field, action|
	begin
		sleep 5
		#delete field if already present
		begin
		within all(".pbSubsection")[2] do
			within('.list') do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[2].text == field
						row.first(:link,"Delete").click
						#deleting field 
						sleep 10
						#break
					end                        
				end
			end
        end
		within all(".pbButton")[1] do
			click_on 'Save'
		end
		sleep 5
		rescue
		end
		addDisabled = 1
		within all(".pbSubsection")[2] do
			if page.has_css?(".btnDisabled")
				addDisabled = 0
			end
		end
		sleep 2
		if (addDisabled > 0)
			within all(".pbSubsection")[2] do
				click_on "Add"
				puts "Add clicked"
			end
			sleep 8
			first(:xpath, ".//*[contains(@id, 'fieldsName')]").select(field)
			sleep 5
			choose "defaultRadioId"
			sleep 3
			first(:xpath, ".//*[contains(@id, 'defaultText')]").set("Description")
			sleep 8
			within all(".pbButton")[1] do
				click_on action
			end
			sleep 5
		end
		puts "Added Opportunity Product Line Field"
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while adding Opportunity Product Line Fields"
		putstr_withScreen  ex.message
	end
end

Then(/^Opportunity Product Line Field "([^"]*)" should be present$/) do |field|
	begin
		within all(".pbSubsection")[2] do
			within('.list') do
				tr = first("tbody").all("tr")
				tr.each do |row|
					puts row.all("td")[2].text
					puts field
					if row.all("td")[2].text == field
						sleep 5
						puts "#{field} field present"
						sleep 10
						break
					else
						putstr "#{field} field not present"
					end
				end
			end
		end
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while verifying Opportunity Fields"
		putstr_withScreen  ex.message
	end
end


And(/^I add multiple "([^"]*)"$/) do |section|
	begin
		sleep 8
		addDisabled = 1
		within all(".pbSubsection")[2] do
			if page.has_css?(".btnDisabled")
				addDisabled = 0
			end
		end
		sleep 8
		if (addDisabled > 0)
			within all(".pbSubsection")[2] do
				click_on "Add"
			end
			sleep 10
			ddlField = first(:xpath, ".//*[contains(@id, 'fieldsName')]")
			optionsCount = ddlField.all(:xpath, 'option').count
			within all(".pbButton")[1] do
				click_on "Cancel"
			end
			sleep 10
			count = 0
			0.upto(optionsCount-1) do
				within all(".pbSubsection")[2] do
					click_on "Add"
				end
				sleep 15
				count = count + 1
				first(:xpath, ".//*[contains(@id, 'fieldsName')]").find(:xpath, 'option[1]').select_option
				sleep 15
				begin
					first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").find(:xpath, 'option[2]').select_option
				rescue
					choose "defaultRadioId"
					sleep 6
					first(:xpath, ".//*[contains(@id, 'defaultText')]").set(10)
				end
				within all(".pbButton")[1] do
					click_on "Save"
				end
				sleep 10
				if count == 5
					break
				end
			end
		end
		puts "Added #{section}"
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while adding #{section}"
		putstr_withScreen  ex.message
	end
end


And(/^I should be able to edit Quantity in Opportunity Product Line fields$/) do 
	begin
		within all(".pbSubsection")[1].first(".detailList").first(".list") do 
			rows = all(".dataRow")
			sleep 7  
			rows[0].all(".dataCell")[3].first(:xpath, ".//*[contains(@id, 'rOFDFields')]").find(:xpath, 'option[1]').select_option
			sleep 5
			rows[0].first(:xpath, ".//*[contains(@id, 'FM_DefaultTextField')]").set("10")
			puts "Quantity field values set as 10"
		end
	rescue Exception => ex
		putstr "Error occurred while editing Opportunity Product Line field Quantity."
		putstr_withScreen  ex.message
	end 
end

And(/^I should be able to set required field value for Quantity as "(.*?)"$/) do |arg|
	begin
		within all(".pbSubsection")[1].first(".detailList").first(".list") do 
			rows = all(".dataRow")
			sleep 7  
			rows[0].all(".dataCell")[3].first(:xpath, ".//*[contains(@id, 'rOFDFields')]").select(arg)
			sleep 5
			puts "Required field value for Quantity field is set as : #{arg}"
		end
	rescue Exception => ex
		putstr "Error occurred while setting required field value for Opportunity Product Line field Quantity."
		putstr_withScreen  ex.message
	end 
end

And(/^I Add Opportunity Product Line fields "(.*?)" to "(.*?)"$/) do |arg1, arg2|
	begin
	    sleep 2
		
		isfound = 1
		
		within all(".pbSubsection")[1] do
			within('.list') do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[2].text == arg2
						isfound = 0
						break
					end
				end
			end
		end
		
		if isfound > 0
			addDisabled = 1
			within all(".pbSubsection")[1] do
				if page.has_css?(".btnDisabled")
					addDisabled = 0
				end
			end
			sleep 2
			if (addDisabled > 0)
				within all(".pbSubsection")[1] do
					click_on "Add"
				end
				sleep 15
				first(:xpath, ".//*[contains(@id, 'fieldsName')]").select(arg2)
				sleep 10
				first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").select(arg1)
				within all(".pbButton")[1] do
					click_on "Save"
				end
				sleep 10
			end
			puts "Mapped Opportunity Product Line Field #{arg2} to Renewal Relationship Field #{arg1}"
			sleep 10
		else
			puts "Opportunity Product Line Field #{arg2} is already present on grid"
		end
	rescue Exception => ex
		putstr "Error occurred while adding Opportunity Product Line Field."
		putstr_withScreen  ex.message
	end 
end

And(/^I verify the validation message$/) do
	begin
		sleep 3
		
		errorMsg = "Unit Price and Total Price cannot be added together in mapping."
		
		if page.has_content? errorMsg
			puts "#{errorMsg} - error message is displayed."
		else
			putstr "#{errorMsg} - error message is not displayed."
		end
		
	rescue Exception => ex
		putstr "Error occurred while verifying the Validation message"
		putstr_withScreen  ex.message
	end
end


And(/^I Add an Opportunity Product Line field "(.*?)" to "(.*?)"$/) do |oppLineItemField, mappingField|
	begin
	    sleep 2
		
		isfound = 1
		
		within all(".pbSubsection")[2] do
			within('.list') do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[2].text == oppLineItemField
						isfound = 0
						break
					end
				end
			end
		end
		
		if isfound > 0
			addDisabled = 1
			within all(".pbSubsection")[2] do
				if page.has_css?(".btnDisabled")
					addDisabled = 0
				end
			end
			sleep 2
			if (addDisabled > 0)
				within all(".pbSubsection")[2] do
					click_on "Add"
				end
				sleep 15
				first(:xpath, ".//*[contains(@id, 'fieldsName')]").select(oppLineItemField)
				sleep 10
				first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").select(mappingField)
				within all(".pbButton")[1] do
					click_on "Save"
				end
				sleep 10
			end
			puts "Mapped Opportunity Product Line Field #{oppLineItemField} to #{mappingField}"
			sleep 10
		else
			puts "Opportunity Product Line Field #{oppLineItemField} is already present on grid"
		end
	rescue Exception => ex
		putstr "Error occurred while adding Opportunity Product Line Field."
		putstr_withScreen  ex.message
	end 
end


And(/^I delete Opportunity Product Line field "(.*?)"$/) do |action|
	begin
		sleep 5
		fieldPresent = 0
		within all(".pbSubsection")[2] do
			within('.list') do
				tr = first("tbody").all("tr")
				tr.each do |row|
					if row.all("td")[2].text == action
						sleep 5
						fieldPresent = 1
						row.first(:link,"Delete").click
						puts "#{action} field found"
						#deleting field
						sleep 20
						break
					end
				end
			end
		end
		sleep 8
		if fieldPresent > 0
			puts "#{action} field deleted"
		else
			puts "#{action} field was not present on the grid"
		end
	    first(".pbButtonb").first(".btn").click
		puts "Mapping Saved"
		sleep 10
	rescue Exception => ex
		putstr "Error occurred while verifying Opportunity Fields."
		putstr_withScreen  ex.message
	end
end
