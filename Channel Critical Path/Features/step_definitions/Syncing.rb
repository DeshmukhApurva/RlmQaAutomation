#All Partner Partner Opportunity Module Features - Step definitions
#All Scenario mentioned in Syncing.feature

And (/^I verify "(.*?)" button on Partner Opportunity Page$/) do |button_name|
	begin
		sleep 3		
		within all('.listRelatedObject')[0] do
			click_on button_name
		end
		sleep 10	
		alert_message = page.driver.browser.switch_to.alert.text		
		page.driver.browser.switch_to.alert.accept
			if alert_message != ""
				puts "'#{button_name}' button is present"
			else
				putstr "'#{button_name}' button is not present"
			end
			if alert_message == "Please select one Opportunity to proceed."
				puts "'#{alert_message}'alert message is populated."
			else
				putstr "'#{alert_message}' alert message is not populated."
			end
	rescue Exception=> ex
	puts "Error in verifying the '#{button_name}' button"
	putstr_withScreen  ex.message
	end
end

When (/^I select more than one Partner Opportunity$/) do
	begin
		within all('.listRelatedObject')[0] do
			first("input[type='checkbox']").set(true)
			click_on "Syncing"
			sleep 5			
		end
		alert_message = page.driver.browser.switch_to.alert.text		
		page.driver.browser.switch_to.alert.accept		
		if alert_message == "Please select only one Opportunity for Syncing."
			puts "'#{alert_message}'alert message is populated."
		else
			putstr "'#{alert_message}' alert message is not populated."
		end
		sleep 5
		within all('.listRelatedObject')[0] do
			first("input[type='checkbox']").set(false)			
		end
		sleep 3
	rescue Exception=>ex
	puts "Error in selecting more than one Partner Opportunity"
	putstr_withScreen ex.message
end
end

When (/^I select "(.*?)" Partner Opportunity$/) do |data|
  begin	
  sleep 5  
    arg1 = getReference "PartnerOpportunity"	
    within all('.listRelatedObject')[0] do
      tr = all(".dataRow")
      tr.each do |row|
				if row.all(".dataCell")[0].text == arg1[data]
					row.first("input[type='checkbox']").click
					puts "'#{arg1[data]}' partner opportunity is selected"
				end
      end   
    end
	
  rescue Exception => ex
    puts "Error in selecting the Partner Opportunity"
    putstr_withScreen  ex.message
  end
end

When (/^I select NewPartnerOpp Partner Opportunity$/) do
	begin
		sleep 5
		arg1 = getReference "PartnerOpportunity"
		sleep 3
		if page.has_css?(".pShowMore")
			first(".pShowMore").first("a").click
		end
		sleep 4
		within all('.listRelatedObject')[0] do
			tr = all(".dataRow")
			tr.each do |row|
        sleep 3
				row.all(".dataCell").each do |sync|
					#if sync.text == "#{arg1['NewPartnerOpp']}#{$Opp}"
          if sync.text == "#{arg1['First']}"
             sleep 3
             row.first("input[type='checkbox']").click
					   puts "#{arg1['NewPartnerOpp']} partner opportunity is selected"
             break
          end
        end
			end
		end
	rescue Exception => ex
		puts "Error in selecting the Partner Opportunity"
		putstr_withScreen  ex.message
	end
end

Then (/^I select the further options for syncing$/) do
	begin
		main = page.driver.browser.window_handles.first
		click_on("Syncing")
		puts "Clicked on the button 'Syncing'"
		sleep 5	
		popup = page.driver.browser.window_handles.last
		page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)		
		sleep 10
		page.driver.browser.switch_to.window(popup)
		sleep 5				
		if page.has_content? "Please select one option for Syncing"
			puts "Navigated to the pop up window."
		else
			putstr "Could not Navigate to the pop up window."
		end
		find(:xpath, ".//*[contains(@id, 'panelOpts')]").select("From Master Opportunity")		
		sleep 1
		click_on('Save')
		sleep 5		
		page.driver.browser.switch_to.window(main)
	rescue Exception => ex
		puts "Error in selecting further options for syncing"
		putstr_withScreen ex.message
	end
end

Then (/^I choose the sync options$/) do
  	begin
				main = page.driver.browser.window_handles.first
				click_on("Syncing")
				puts "Clicked on the button 'Syncing'"
				sleep 10
				popup = page.driver.browser.window_handles.last
				page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
				sleep 5
				#page.driver.browser.switch_to.window(popup)
				#sleep 5
				if page.has_content? "Please select one option for Syncing"
					puts "Navigated to the pop up window."
				else
					putstr "Could not Navigate to the pop up window."
				end
				find(:xpath, ".//*[contains(@id, 'panelOpts')]").select("To Master Opportunity")
				sleep 1
				click_on('Save')
				sleep 15
				page.driver.browser.switch_to.window(main)
    rescue Exception=> ex
      	puts "Error in choosing the sync options"
				putstr_withScreen ex.message
    end
end

And (/^I verify the changes after sync for "(.*?)" Partner Opportunity$/) do|data|
	begin
		within all('.detailList')[0] do
			$masterOppStageValue = page.find(:id,'opp11_ileinner').text
			puts $masterOppStageValue
		end
		arg1 = getReference "PartnerOpportunity"
		within all('.listRelatedObject')[0] do
		  tr = all(".dataRow")
		  tr.each do |row|
				puts row.all(".dataCell")[3].text
			  if row.all(".dataCell")[0].text == arg1[data]
				if row.all(".dataCell")[3].text == $masterOppStageValue	
					puts "Sync is successful"
				else
					putstr "Sync is not successful"
				end
			  end
		  end   
    end
	rescue Exception=> ex
		puts "Error in verifying the changes after sync"
		putstr_withScreen ex.message
	end
end

And (/^I verify the changes after sync for NewPartnerOpp Partner Opportunity$/) do
	begin
		arg1 = getReference "PartnerOpportunity"
			within(:id,"topButtonRow") do
				click_on('Edit')
			end
			sleep 3
			within all(".pbSubsection")[0] do
        find(:id,"opp11").select("Value Proposition")
				sleep 3
			end
			within(:id,"topButtonRow") do
				click_on('Save')
			end
			sleep 10
		within all('.detailList')[0] do
			$newMasterOppStageValue = page.find(:id,'opp11_ileinner').text
			# puts $newMasterOppStageValue
    end
    sleep 3
		within all('.listRelatedObject')[0] do
			tr = all(".dataRow")
			tr.each do |row|
				if row.all(".dataCell")[0].text == arg1['NewPartnerOpp']+$Opp
					if row.all(".dataCell")[3].text == $newMasterOppStageValue
						puts "Sync is successful"
					else
						putstr "Sync is not successful"
					end
				end
			end
		end
	rescue Exception=> ex
		puts "Error in verifying the changes after sync for NewPartnerOpp Partner Opportunity"
		putstr_withScreen ex.message
	end
end

When (/^I grant access to "(.*?)" for new Partner Opportunity$/) do |syncPicklist|
	begin
		arg1 = getReference "PartnerAccount"
    arg = getDetails "PartnerOpportunity"
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
						# puts "Selected Partner Account"
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
			# puts "Checked primary checkbox"
			first("tbody").all("tr")[1].all("td")[2].first("select").send_keys "From Master Opportunity"
			sleep 3
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
						# puts "Selected partner contact"
						break
					end                        
				end
			end
			sleep 3
			page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
			sleep 5
		#lookup
		click_on('Grant Access')
    sleep 2
		within(:id,'topButtonRow') do
			click_on('Edit')
    end
    sleep 2
		within all(".pbSubsection")[0] do
			fill_in "Partner Opportunity",:with=>arg["NewPartnerOpp"]+$Opp
		end
		sleep 3
		within(:id,'topButtonRow') do
			click_on('Save')
			# puts "Saved changes made for the 'Master Opportunity' Partner Opportunity"
		end
		sleep 2
		within all(".pbSubsection")[0] do
			click_on('PES_CHL_Opp')
		end
		sleep 2
    puts "Partner Opportunity is added"
	rescue Exception=>ex
		puts "Error in granting access to sync for the PartnerOpportunity"
		putstr_withScreen ex.message
	end
end

And (/^I verify the master opportunity after changing the sync options$/) do
  	begin
    #arg1 = getReference "PartnerOpportunity"
    arg = getDetails "PartnerOpportunity"
		within all('.listRelatedObject')[0] do
			tr = all(".dataRow")
			tr.each do |row|
				if row.all(".dataCell")[0].text == arg['NewPartnerOpp']+$Opp
					row.all(".dataCell")[0].click
					puts "#{arg['NewPartnerOpp']}#{$Opp} partner opportunity is selected"
			  end
			end
		end
		sleep 5
		within(:id,'topButtonRow') do
		  click_on('Edit')
		end
		# within all(".pbSubsection")[0] do
			# #first("tbody").all('tr')[2].all("td")[3].first("select").send_keys arg['SalesStage']
			# first("tbody").all("tr")[3].all("td")[2].first("select").send_keys arg['SalesStage']
      # fill_in "Stage",:with=>arg['Prospecting']
      # #find(:xpath, "//*[contains(@label,'opp11')]").find(:xpath, 'option[1]').select_option
		# end
		# sleep 3
		within(:id,'topButtonRow') do
			click_on('Save')
			puts "Saved changes made for the 'Master Opportunity' Partner Opportunity"
		end
    sleep 3
	rescue Exception=> ex
		puts "Error in verifying the master opportunity after changing the sync options"
		putstr_withScreen ex.message
	end
end


Then (/^I stop the syncing$/) do
	begin
    sleep 3
		main = page.driver.browser.window_handles.first
		click_on("Syncing")
		puts "Clicked on the button 'Syncing'"
		sleep 5
		popup = page.driver.browser.window_handles.last
		page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
		sleep 10
		page.driver.browser.switch_to.window(popup)
		sleep 5
		if page.has_content? "Please select one option for Syncing"
			puts "Navigated to the pop up window."
		else
			putstr "Could not Navigate to the pop up window."
		end
		find(:xpath, ".//*[contains(@id, 'panelOpts')]").select("Stop Syncing")
		sleep 1
		click_on('Save')
		sleep 5
		page.driver.browser.switch_to.window(main)
    sleep 3
  rescue Exception=>ex
    puts "Error in stopping sync"
  end
end

Then(/^I verify the sync opportunity$/) do
  begin
  sleep 3
	arg = getDetails "PartnerOpportunity"
	  sleep 3
		within all('.detailList')[0] do
			$partnerOppStagevalue = page.find(:id,'opp11_ileinner').text
    end
    sleep 2
		if $partnerOppStagevalue == arg['SalesStage']
			puts "Sync is successful for the option 'To Master Opportunity'"
		else
		#	putstr "Sync is unsuccessful for the option 'To Master Opportunity' and Stop sync is enabled"
		end
  sleep 3
	rescue Exception=> ex
		puts "Error in verifying the master sync opportunity"
		putstr_withScreen ex.message
	end
end