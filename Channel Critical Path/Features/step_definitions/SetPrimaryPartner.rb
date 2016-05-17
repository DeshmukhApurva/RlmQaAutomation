#All Partner Opportunity - Set Primary Partner specific Step definitions
#All Scenario mentioned in SetPrimaryPartner.feature

Then (/^I select the "(.*?)"$/) do |data|
	begin
	sleep 10
	arg = getReference data
	select "My Opportunities", :from => "fcf"
		sleep 3
		within(".fBody") do
			click_on "Go!"
		end
		sleep 5
		foundCount = 0
		begin  
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")				
				tr.each do |row|
				  if row.all("td")[2].text == arg["Name"]
					row.all("td")[2].all('a')[0].click					
					foundCount = 1
					break
				  end	
				end
			end
			if foundCount==0
				if page.has_css?('.next')
					find(".next").click
					sleep 3
				else
					break
				end
			else
				break
			end
		end until (page.has_css?('.nextoff'))
		if foundCount==0
			within(".x-grid3-body") do
				tr = all(".x-grid3-row")
				tr.each do |row|
				#puts row.all("td")[2].text
				 if row.all("td")[2].text == arg["Name"]
					row.all("td")[2].all('a')[0].click					
					foundCount = 1
					break
				  end	
				end
			end
		end
	sleep 5
	if foundCount==0
		puts "Opportunity not found."
	else
		puts "Opened Opportunity #{arg['Name']} Successfully."
	end
	rescue Exception => ex
		puts "Error in Selecting the #{data}"
		putstr_withScreen  ex.message
	end
end

Then(/^I set the "(.*?)" Partner opportunity as primary$/) do |data|
	begin
		sleep 3		
		arg = getDetails 'PartnerOpportunity'
		arg1 = getReference 'PartnerOpportunity'
		PartnerOpp = arg1[data]
		tr = all('.dataRow')
		tr.each do |row|	
			if ((row.all(".dataCell")[0].text == PartnerOpp) && (row.all(".dataCell")[5].first("img")[:title] == "Checked"))
				puts "Partner Opportunity '#{PartnerOpp}' is already a primary"
			else
				row.first('input[type=checkbox]').set(true)
				click_on "Set as Primary"	
				sleep 5
				puts "Partner Opportunity '#{PartnerOpp}' is made primary"
			end
			break
		end
	rescue Exception => ex
		puts "Error in setting the partner opportunity as primary"
		putstr_withScreen  ex.message
	end 
end

Then(/^I set the "(.*?)" Partner opportunity as Remove primary$/) do |data|
	begin
		sleep 3		
		arg = getDetails 'PartnerOpportunity'
		arg1 = getReference 'PartnerOpportunity'
		PartnerOpp = arg1[data]
		tr = all('.dataRow')
		tr.each do |row|	
			if ((row.all(".dataCell")[0].text == PartnerOpp) && (row.all(".dataCell")[5].first("img")[:title] != "Checked"))
				puts "Partner Opportunity '#{PartnerOpp}' is not a primary opportunity"
			else
				row.first('input[type=checkbox]').set(true)
				click_on "Remove Primary"	
				sleep 5
				puts "Partner Opportunity '#{PartnerOpp}' is made not primary"
			end
			break
		end
	rescue Exception => ex
		puts "Error in setting the partner opportunity as primary"
		putstr_withScreen  ex.message
	end 
end
Then(/^I verify that newly selected quote \(By Channel user\)is get set as primary quote but syncing flag is false$/) do
	begin
	arg1 = getReference 'PartnerOpportunity'	
	tr = all('.dataRow')
	tr.each do |row|	
		if ((row.all(".dataCell")[1].text == arg1['Quote Name'])&& (row.all(".dataCell")[5].first("img")[:title] != "Checked")) 
			puts "Synched quote flag is set to false"
		end
	end
	rescue Exception => ex
		puts "Error in setting the partner opportunity as primary"
		putstr_withScreen  ex.message
	end
end
Then (/^I change the values of selected Partner opportunity$/) do
	begin	
	arg = getDetails 'PartnerOpportunity'
	arg1 = getReference 'PartnerOpportunity'
		tr = all('.dataRow')	
	if  all('.dataRow')[0].all('.dataCell')[0].text == arg1['First']
		all('.dataRow')[0].all('.dataCell')[0].click
	else
		putstr "'#{arg1['First']}' partner opportunity is not found."
	end	
	
	sleep 3
	within(:id,'topButtonRow') do
		click_on('Edit')
	end
	within all(".pbSubsection")[0] do		
		fill_in "Amount",:with=> arg['Amount']		
	end
	sleep 3
	within(:id,'topButtonRow') do
		click_on('Save')
		puts "Saved changes made for the '#{arg1['First']}' Partner Opportunity"
	end	
	rescue Exception => ex
		puts "Error in changing values of selected Partner opportunity"
		putstr_withScreen  ex.message
	end
end

And (/^I add New Partner Opportunity$/) do
	begin
	arg1 = getReference "PartnerAccount"
	#lookup		
		main = page.driver.browser.window_handles.first
		find("img[alt='Partner Account 1 Lookup (New Window)']").click
		sleep 5
		page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
		sleep 10
		page.driver.browser.switch_to.frame("resultsFrame")
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("th")[0].text == arg1['AccountName']
					row.all("th")[0].all('a')[0].click
					puts "Selected Partner Account"
					break
				end                        
			end
		end
		sleep 3
		page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
        sleep 5	
	#lookup
	within all(".detailList")[1] do
		first("input[type='checkbox']").set(true)
		sleep 3
		puts "Checked primary checkbox"		
	end
	#lookup
		main = page.driver.browser.window_handles.first
		find("img[alt='Partner Account 1 Contact Lookup (New Window)']").click
		sleep 5
		page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
		sleep 10
		page.driver.browser.switch_to.frame("resultsFrame")
		within('.list') do
			tr = first("tbody").all("tr")
			tr.each do |row|
				if row.all("th")[0].text == arg1['ContactName']
					row.all("th")[0].all('a')[0].click
					puts "Selected partner contact"
					break
				end                        
			end
		end
		sleep 3
		page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
        sleep 5
	#lookup
	click_on('Grant Access')
	puts "Partner Opportunity is added"
	rescue Exception => ex
		puts "Error in adding add New Partner Opportunity"
	end
end