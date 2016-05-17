#All Service Source Setup - Opportunity generation specific Step definitions
#All Scenario mentioned in OpportunityGeneration.feature

Then (/^I Specify the conditions when renewal opportunities are generated for "(.*?)"$/) do |arg1|
	begin
		arg = getDetails arg1
		all(".dataRow")[0].all(".dataCell")[2].select(arg["Fieldvalue1"])			
		sleep 8		
		all(".dataRow")[0].all(".dataCell")[3].select(arg["Operator1"])					
		sleep 10			
		all(".dataRow")[0].all(".dataCell")[4].first("input").set(arg["Value1"])		
		sleep 5		
		
		all(".dataRow")[1].all(".dataCell")[2].select(arg["Fieldvalue2"])		
		sleep 8
		all(".dataRow")[1].all(".dataCell")[3].select(arg["Operator2"])		
		sleep 10				
		all(".dataRow")[1].all(".dataCell")[4].first("input").set(arg["Value2"])
		sleep 5		
		
		all(".dataRow")[2].all(".dataCell")[2].select(arg["Fieldvalue3"])		
		sleep 8
		all(".dataRow")[2].all(".dataCell")[3].select(arg["Operator3"])		
		sleep 10		
		all(".dataRow")[2].all(".dataCell")[4].first("input").set((arg["Value3"]))
		sleep 5	
		within(:css ,".pbButton") do	
			click_on "Save"
		end
		if page.has_content?("Renewal Opportunity configuration has been saved.")
			puts "criteria is set and saved"
		else
			putstr "criteria is not saved and set"
		end
	rescue Exception => ex
		puts "Error in setting criteria"
		putstr_withScreen  ex.message
	end
end

Then (/^I Specify the conditions for generation of renewal opportunities$/) do
	begin
		all(".dataRow")[0].all(".dataCell")[2].select("Name")			
		sleep 8		
		all(".dataRow")[0].all(".dataCell")[3].select("LIKE")					
		sleep 10			
		all(".dataRow")[0].all(".dataCell")[4].first("input").set("Sourceopp")		
		sleep 5		
		
		within(:css ,".pbButton") do	
			click_on "Save"
		end
	rescue Exception => ex
		puts "Error in setting criteria"
		putstr_withScreen  ex.message
	end
end


Then (/^I edit the filter Logic for "(.*?)"$/) do |arg1|
begin
	arg2 = getDetails arg1+"Param"
	within all(".pbSubsection")[arg2["section"]] do	
		if find(:xpath,".//input[contains(@id,'bool_filter')]").value == "1 AND 2 AND 3"	
			first(:xpath,"//*[contains(@id,'bool_filter')]").first("input").set("1 OR 2 OR 3")		
		end
		if find(:xpath,".//input[contains(@id,'bool_filter')]").value == "1 AND 2"			
			first(:xpath,"//*[contains(@id,'bool_filter')]").first("input").set("1 OR 2")
		end
	end
	within(:css ,".pbButton") do	
		click_on "Save"
	end
	if page.has_content?("Renewal Opportunity configuration has been saved.")
		puts "criteria is set and saved"
	else
		putstr "criteria is not saved and set"
	end	
	rescue Exception => ex
		puts "Error in editing filter criteria"
		putstr_withScreen  ex.message
	end
end

Then (/^I set the Default name of generated renewal opportunity$/) do
begin
	arg = getDetails "OpportunityGeneration"
	all(".dataRow")[0].all(".dataCell")[4].first("input").set(arg["RenewalOpp"])	
	sleep 5
	within (".pbButton") do
		click_on "Save"
	end
rescue Exception => ex
	puts "Error in setting the Default name of generated renewal opportunity"
	putstr_withScreen  ex.message
end
end

And(/^I select the "([^"]*)" for "([^"]*)"$/) do |checkbox_name,data|
  begin
	arg = getDetails data
    sleep 5
    within all(".detailList")[arg['section']] do
      all('input[type=checkbox]').each do |checkbox|
        unless checkbox.checked?
          checkbox.click
          sleep 5
          puts "Enabled the #{checkbox_name}"
          break
        else
          puts "#{checkbox_name} is alreay enabled"
        end
      end
    end
    sleep 5
    find(:xpath,"//td[@class='pbButtonb ']/input[1]",:wait => 50).click
    sleep 5
    rescue Exception => ex
    putstr "Error occurred while enabled #{checkbox_name}"
    putstr_withScreen  ex.message
 end
end

Then (/^I select the Source Opportunity$/) do
	begin
	sleep 5
	arg = getDetails "RenewableOpportunityDetails"
	select "My Opportunities", :from => "fcf"
		sleep 5
		within(".fBody") do
			click_on "Go!"
		end
		sleep 5
		foundCount = ""
		begin  
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
				  if row.all("td")[2].text==arg["Opportunity Name"]+$Opp
					row.all("td")[2].all('a')[0].click
					foundCount = "found"
					break
				  end	
				end
			end
			if page.has_css?('.next')
				find(".next").click
				sleep 5
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount==""
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|				
				 if row.all("td")[2].text==arg["Opportunity Name"]+$Opp
					row.all("td")[2].all('a')[0].click_on
					foundCount = "found"
					break
				  end	
				end
			end
		end
	sleep 5	
	rescue Exception => ex
		puts "Error in Selecting the source opportunity"
		putstr_withScreen  ex.message
	end
end

Then (/^I select the Source Opportunity for "(.*?)"$/) do |arg1|
	begin
	sleep 5
	arg = getDetails arg1
	select "My Opportunities", :from => "fcf"
		sleep 5
		within(".fBody") do
			click_on "Go!"
		end
		sleep 5
		foundCount = ""
		begin  
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				puts arg["RenewalOpp"]
				tr.each do |row|
				  if row.all("td")[2].text==arg["RenewalOpp"]
					row.all("td")[2].all('a')[0].click
					foundCount = "found"
					break
				  end	
				end
			end
			if page.has_css?('.next')
				find(".next").click
				sleep 5
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount==""
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|				
				 if row.all("td")[2].text==arg["Name"]
					row.all("td")[2].all('a')[0].click_on
					foundCount = "found"
					break
				  end	
				end
			end
		end
	sleep 5	
	rescue Exception => ex
		puts "Error in Selecting the source opportunity"
		putstr_withScreen  ex.message
	end
end
	
Then(/^I enter the wrong details for the Renewal Product criteria$/) do
	begin
		arg1 = getDetails "RenewableProducts"
		all(".dataRow")[2].all(".dataCell")[2].select(arg1["Fieldvalue5"])		
		sleep 8
		all(".dataRow")[2].all(".dataCell")[3].select(arg1["Operator5"])		
		sleep 10		
		all(".dataRow")[2].all(".dataCell")[4].first("input").set((arg1["Value5"]))
		sleep 5	
		
		within(:css ,".pbButton") do	
			click_on "Save"
		end
		
		if page.has_content?"Value must be populated for Product Name" 
			puts "User is able to see the error message"
		else
			putstr "User is unable to see the error message"
		end
		
		within all(".pbSubsection")[0] do		
			first(:xpath,".//*[contains(@id,'bool_filter')]").first("input").set("1 OR 2 3")		
		end
		
		within(:css ,".pbButton") do	
			click_on "Save"
		end 
		
		if page.has_content?"Some filter conditions are defined but not referenced in your filter logic."
			puts "User is able to see the error message of filter criteria"
		else
			putstr "User is unable to see the error message of filter criteria"
		end
		
		all(".dataRow")[2].all(".dataCell")[2].select(arg1["Fieldvalue3"])		
		sleep 8
		all(".dataRow")[2].all(".dataCell")[3].select(arg1["Operator3"])		
		sleep 10		
		all(".dataRow")[2].all(".dataCell")[4].first("input").set((arg1["Value3"]))
		sleep 5	
		
		within all(".pbSubsection")[0] do		
			first(:xpath,"//*[contains(@id,'bool_filter')]").first("input").set("1 OR 2 OR 3")		
		end
		
		within(:css ,".pbButton") do	
			click_on "Save"
		end
		
		if page.has_content?("Renewal Opportunity configuration has been saved.")
			puts "criteria is set and saved"
		else
			putstr "criteria is not saved and set"
		end	
	rescue Exception => ex
		puts "Error in entering the wrong details for the criteria"
		putstr_withScreen  ex.message
	end
end

Then (/^I enter the wrong details for the "(.*?)" criteria$/) do |arg|
  begin
	arg1 = getDetails arg
	all(".dataRow")[5].all(".dataCell")[2].select(arg["wFieldvalue1"])		
	sleep 8
	all(".dataRow")[5].all(".dataCell")[3].select(arg["wOperator1"])		
	sleep 10		
	all(".dataRow")[5].all(".dataCell")[4].first("input").set(true)
	sleep 5	

	within(:css ,".pbButton") do	
		click_on "Save"
	end
	
	if page.has_content?"Operator not valid on one or more criterion."
			puts "User is able to see the error message of filter criteria"
	else
		putstr "User is unable to see the error message of filter criteria"
	end
	
	within all(".pbSubsection")[arg1["section"]] do		
		first(:xpath,".//*[contains(@id,'bool_filter')]").first("input").set("1 OR 2 3")		
	end
	
	within(:css ,".pbButton") do	
		click_on "Save"
	end 
	
	if page.has_content?"Some filter conditions are defined but not referenced in your filter logic."
		puts "User is able to see the error message of filter criteria"
	else
		putstr "User is unable to see the error message of filter criteria"
	end
	
	all(".dataRow")[5].all(".dataCell")[2].select(arg["Fieldvalue3"])		
	sleep 8
	all(".dataRow")[5].all(".dataCell")[3].select(arg["Operator3"])		
	sleep 10		
	all(".dataRow")[5].all(".dataCell")[4].first("input").set(false)
	sleep 5	
	
	within all(".pbSubsection")[arg1["section"]] do		
		first(:xpath,"//*[contains(@id,'bool_filter')]").first("input").set("1 OR 2 OR 3")		
	end
	
	within(:css ,".pbButton") do	
		click_on "Save"
	end
	
	if page.has_content?("Renewal Opportunity configuration has been saved.")
		puts "criteria is set and saved"
	else
		putstr "criteria is not saved and set"
	end	

rescue Exception => ex
	puts "error in entering the wrong details for the #{arg} criteria"
	putstr_withScreen  ex.message
end
end

Then (/^I Match the source opp criteria with the renewal opp generation criteria$/) do 
begin
	within(:id ,"bottomButtonRow ") do
		click_on "Edit"
	end
	sleep 5
	select "Closed Won" ,:from => "opp11"
	within(:id ,"bottomButtonRow ") do	
		click_on "Save"
	end
	sleep 5
	
	rescue Exception => ex
		puts "Error in Matching the source opp criteria with the renewal opp generation criteria"
		putstr_withScreen  ex.message
	end
end

Then (/^I Resolved the opportunity$/) do
begin
	within(:id ,"bottomButtonRow ") do
		click_on "Edit"
	end
	sleep 5	
	select "Closed Won" ,:from => "opp11"
	within(:id ,"bottomButtonRow ") do	
		click_on "Save"
	end
	
	if page.has_content?"Edit"
		puts "Successfully resolved the opportunity"
	else
    putstr "Opportunity is not resolved"
	end
	sleep 5
	rescue Exception => ex
		puts "Error in resolving the opportunity"
		putstr_withScreen  ex.message
	end
end

Then(/^I verify that renewal opportunity get generated from multiple criteria for "(.*?)"$/) do |arg|
  begin
		oppGen = getDetails arg
		# if find_field "Opportunity Name".text == oppGen["RenewalOpp"]
			# puts "renewal opportunity of #{arg} is generated"
		# end
		# if (page.has_css? ".checkImg") || (find_field "Stage".text == oppGen["Value1"])
			if page.has_css?'.checkImg'
				puts "verified it is a renewal opportunity"
			else
				putstr "renewal opportunity is not verified"
			end	
	rescue Exception => ex
		puts "Error in Verifying that renewed products getting display according to multiple criteria set for renewable product section"
		putstr_withScreen  ex.message
	end
end

Then (/^I click on Add criteria button for "(.*?)"$/) do |arg1|
	begin
		arg2 = getDetails arg1
		within all(".pbSubsection")[arg2["section"]] do	
			click_on "Add Criteria"
			puts "Clicked on ADD criteria"		
		end
		sleep 5
		all(".dataRow")[arg2["addRow"]].all(".dataCell")[2].select(arg2["Fieldvalue4"])		
		sleep 8
		all(".dataRow")[arg2["addRow"]].all(".dataCell")[3].select(arg2["Operator4"])		
		sleep 10
		all(".dataRow")[arg2["addRow"]].all(".dataCell")[4].set(true)		
		sleep 5
	rescue Exception => ex
		puts "Error in clicking on Add criteria button"
		putstr_withScreen  ex.message
	end
end


Then (/^I add products for the Opportunity$/) do
	begin
	click_on "Add Product"
	sleep 5
	within(:id,'lineItemView_wrapper')do
		check('Product B')
	end
	rescue Exception => ex
		putstr "Error in adding products to the Opportunity"
		putstr_withScreen  ex.message
	end
end


And(/^I add multiple criteria and filter logic "([^"]*)" and "([^"]*)" on opp generation$/) do |filter_logic1, filter_logic2|
	begin
		sleep 8
		arg = getDetails "InstallBaseDataRules"
		all(:xpath,'//td/input[@value="Add Criteria"]')[0].click
		sleep 5
		all(:xpath,'//td/input[@value="Add Criteria"]')[0].click
		sleep 5
		within all(".pbBody")[1] do
			within(".list") do
				sleep 5
				all(:xpath, ".//*[contains(@id, 'slFieldId')]")[0].select arg["FirstIBDRFieldValue"]
				sleep 5
				all(:xpath, ".//*[contains(@id, 'outOperator')]")[0].select arg["FirstIBDROperator"]
				sleep 5
				#all(:xpath, ".//*[contains(@id, 'outValue')]")[0].send_keys [:control, 'a'], :backspace
				#sleep 5
				all(:xpath, ".//*[contains(@id, 'outValue')]")[0].set(arg["FirstIBDRValue"])
				sleep 5
				all(:xpath, ".//*[contains(@id, 'slFieldId')]")[1].select arg["SecondIBDRFieldValue"]
				sleep 5
				all(:xpath, ".//*[contains(@id, 'outOperator')]")[1].select arg["SecondIBDROperator"]
				sleep 5
				#all(:xpath, ".//*[contains(@id, 'outValue')]")[1].send_keys [:control, 'a'], :backspace
				sleep 5
				all(:xpath, ".//*[contains(@id, 'outValue')]")[1].set(arg["SecondIBDRValue"])
				sleep 5
				all(:xpath, ".//*[contains(@id, 'slFieldId')]")[2].select arg["ThirdIBDRFieldValue"]
				sleep 5
				all(:xpath, ".//*[contains(@id, 'outOperator')]")[2].select arg["ThirdIBDROperator"]
				sleep 5
				#all(:xpath, ".//*[contains(@id, 'outValue')]")[2].send_keys [:control, 'a'], :backspace
				sleep 5
				all(:xpath, ".//*[contains(@id, 'outValue')]")[2].set(arg["ThirdIBDRValue"])
				sleep 5
			end
		end
		sleep 5
		within(".pbHeader") do
			click_on 'Save'
		end
		sleep 5
		within all(".pbBody")[1] do
			sleep 8
			filter_data = '//tr/td/span/div/div/div/div[1]/a'
			if "#{all(:xpath,filter_data)[0].text}".to_s == arg["AddFilterLogicIBDRText"].to_s
				sleep 5
				all(:xpath,filter_data)[0].click
				sleep 5
				#first(".Opportunity_To_Renew_Opportunity_filterText").send_keys [:control, 'a'], :backspace
				sleep 5
				first(".Opportunity_To_Renew_Opportunity_filterText").set filter_logic1
				sleep 5
				#first(".Opportunity_To_Renew_Opportunity_filterText").send_keys [:control, 'a'], :backspace
				sleep 5
				first(".Opportunity_To_Renew_Opportunity_filterText").set filter_logic2
				sleep 5
			else
				sleep 5
				#first('.Opportunity_To_Renew_Opportunity_filterText').send_keys [:control, 'a'], :backspace
				sleep 5
				first('.Opportunity_To_Renew_Opportunity_filterText').set filter_logic1
				sleep 5
				#first('.Opportunity_To_Renew_Opportunity_filterText').send_keys [:control, 'a'], :backspace
				sleep 5
				first('.Opportunity_To_Renew_Opportunity_filterText').set filter_logic2
				sleep 5
			end
		end
		sleep 6
		within(".pbHeader") do
			click_on 'Save'
		end
		sleep 10
		all(:xpath,'//td/input[@value="Add Criteria"]')[1].click
		sleep 5
		all(:xpath,'//td/input[@value="Add Criteria"]')[1].click
		sleep 5
		within all(".pbBody")[2] do
			within(".list") do
				sleep 5
				all(:xpath, ".//*[contains(@id, 'slFieldId')]")[0].select arg["IBDRProductField"]
				sleep 5
				all(:xpath, ".//*[contains(@id, 'outOperator')]")[0].select arg["IBDRProductOperator"]
				sleep 5
			#	all(:xpath, ".//*[contains(@id, 'outValue')]")[0].send_keys [:control, 'a'], :backspace
				sleep 5
				all(:xpath, ".//*[contains(@id, 'outValue')]")[0].set(arg["IBDRProductValue"])
				sleep 5
			end
		end
		sleep 5
		within(".pbHeader") do
			click_on 'Save'
		end
		sleep 6
		within all(".pbBody")[2] do
			sleep 8
			filter_data = '//tr/td/span/div/div/div/div[1]/a'
			if "#{all(:xpath,filter_data)[1].text}".to_s == arg["AddFilterLogicIBDRText"].to_s
				sleep 5
				all(:xpath,filter_data)[1].click
				sleep 5
				#first(".Opportunity_Product_To_Renew_Opportunity_Product_filterText").send_keys [:control, 'a'], :backspace
				sleep 5
				first(".Opportunity_Product_To_Renew_Opportunity_Product_filterText").set filter_logic1
				sleep 5
				#first(".Opportunity_Product_To_Renew_Opportunity_Product_filterText").send_keys [:control, 'a'], :backspace
				sleep 5
				first(".Opportunity_Product_To_Renew_Opportunity_Product_filterText").set filter_logic2
				sleep 5
			else
				sleep 5
				#first(".Opportunity_Product_To_Renew_Opportunity_Product_filterText").send_keys [:control, 'a'], :backspace
				sleep 5
				first(".Opportunity_Product_To_Renew_Opportunity_Product_filterText").set filter_logic1
				sleep 5
				#first(".Opportunity_Product_To_Renew_Opportunity_Product_filterText").send_keys [:control, 'a'], :backspace
				sleep 5
				first(".Opportunity_Product_To_Renew_Opportunity_Product_filterText").set filter_logic2
				sleep 5
			end
		end
		sleep 5
		within(".pbHeader") do
			click_on 'Save'
		end
		sleep 5
		puts "Successfully added the multiple criteria and filter logics"
	rescue Exception => ex
		putstr "Error occurred while adding the multiple criteria and filter logics"
		putstr_withScreen  ex.message
	end
end