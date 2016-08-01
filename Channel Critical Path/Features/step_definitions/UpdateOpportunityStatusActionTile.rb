#All Overview - Update Opportunities Status action tile specific Step definitions
#All Scenario mentioned in UpdateOpportunityStatusActionTile.feature

And(/^I open an opportunity for "(.*?)"$/) do |data|
	begin
		sleep 8
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
		putstr "Error while opening an Opportunity"
		putstr_withScreen  ex.message
	end
end
	
And(/^I enable the "(.*?)" field$/) do |arg|
	begin
		sleep 3
		arg1 = getReference arg
		partnerOpp = arg1["PartnerOpp"]
		
		within all(".customnotabBlock")[0] do
			rows = all(".dataRow")
			rows.each do |tr|
				if tr.all(".dataCell")[0].text == partnerOpp.to_s
					tr.all(".dataCell")[0].click
					puts "Partner opp #{partnerOpp} is selected"
					break
				end
			end
			sleep 2
		end
		
		sleep 5
		
		first("input[title='Edit']").click
		sleep 4
		puts "Clicked on Edit"
		
		within all(".pbSubsection")[0] do
			first("input[type='checkbox']").set(true)
			puts "Enabled Need Status Update field on Partner Opportunity"
		end
		
		within(:id,"bottomButtonRow") do
			click_on('Save') 
		end
		sleep 3
	rescue Exception => ex
		putstr "Error while enabling #{arg} field"
		putstr_withScreen  ex.message
	end
end

And(/^I click on "(.*?)" tile$/) do |arg|
	begin
		sleep 3
		arg1 = getReference "NeedStatusUpdate"
		arg = getDetails "OpportunityModule"
		sleep 4
		partnerOppName = arg1["PartnerOpp"]
		
		recordCount = 0
		oppCount = 0
		
		dataCount = all(".big-badge-container")[1].first("div")['data-number']
		
		if dataCount == ""
			dataCount = 0
			puts "No.of Opportunities needs Status update: #{dataCount}"
		else
			puts "No.of Opportunities needs Status update: #{dataCount}"
		end
		
		
		find(:css, ".srevicon-message").click
		puts "Clicked on #{arg}"
		
		sleep 8
		
		within("h4") do
			if page.has_content? "Opportunities"
				puts "Successfully navigated to Opportunity Page"
			else
				putstr "Failed to navigate to Opportunity Page"
			end
		end
		sleep 4
		within(".view-content-section") do
    within all(".ui-select-match").last do
      defaultFilter = first("span").first("span").text
      if defaultFilter.to_s == "Need Status Updates".to_s
        puts "The default filter value present on #{arg} : Need Status Updates"
      else
        putstr "Failed to see Need Status Updates as default value on #{arg}"
      end
     end
    end

		sleep 4
		$sum = 0
		begin
			unless page.has_css?('div.next.disabled')
				sleep 4
				within all(".ui-grid-canvas")[1] do
					if all(:css, ".ui-grid-row.ng-scope").count > 0
						$sum = $sum + all(:css, ".ui-grid-row.ng-scope").count
						puts "No.of Opportunities on Opportunity grid: #{$sum}"
						sleep 3
					end
				end
				sleep 5
				find(".next").click
				sleep 5
			else
				break
			end
			sleep 3
		end until (page.has_css?('div.next.disabled'))

		sleep 4
		within all(".ui-grid-canvas")[1] do
			if all(:css, ".ui-grid-row.ng-scope").count > 0
				$sum = $sum + all(:css, ".ui-grid-row.ng-scope").count
				puts "No.of Opportunities on Opportunity grid: #{$sum}"
				sleep 3
			end
		end
		
		if dataCount.to_i == $sum.to_i
			puts "The record count on Update Opportunity Status Action Tile and Opportunity grid is Same"
		else
			putstr "The record count on Update Opportunity Status Action Tile and Opportunity grid is not Same"
		end
		
		if $sum.to_i > 0
			find("input[placeholder='Search Opportunities...']").send_keys [:control, 'a'], :backspace
			sleep 3
			find("input[placeholder='Search Opportunities...']").send_keys partnerOppName
			sleep 3
			find("input[placeholder='Search Opportunities...']").send_keys :enter
			sleep 5
			rowcount = all(".ui-grid-row.ng-scope").count
			if rowcount > 0
				sleep 3
			if page.has_content?(arg["OpportunityModuleField10"])
				within all(".ui-grid-canvas")[1] do
					within all("div[role='gridcell']")[12] do
						sleep 3
						first("div").first("div").click
						puts "Successfully clicked the Needs Status Update button"
					end
				end
			else
				within all(".ui-grid-canvas")[1] do
					within all("div[role='gridcell']")[11] do
						sleep 3
						first("div").first("div").click
						puts "Successfully clicked the Needs Status Update button"
					end
				end
				sleep 3
			end
			
			within(".btns-update-status") do
				all("button")[0].click
				puts "Successfully clicked on No Change button"
			end
			
			sleep 3
			
			if page.has_content? "Opportunity status updated."
				puts "Opportunity status updated. message is displayed"
			else
				puts "Opportunity status updated. message is not displayed"
			end
			
			click_on "Overview"
			sleep 3
			puts "Navigated to Overview page"
			
			recordCount = all(".big-badge-container")[1].first("div")['data-number']
			if recordCount == ""
				recordCount = 0
			end
			
			if dataCount.to_i != recordCount.to_i
				puts "The record count on Update Opportunity Status Action Tile is changed from #{dataCount} to #{recordCount} after Opportunity is updated"
			else
				putstr "The record count on Update Opportunity Status Action Tile is not changed after Opportunity is updated"
      end
		else
			puts "No Opportunities records found"
    end
    sleep 3
		else
			puts "No Opportunities for Status update"
		end

	rescue Exception => ex
		putstr "Error while verifying #{arg} on Overview Page"
		putstr_withScreen  ex.message
	end
end
