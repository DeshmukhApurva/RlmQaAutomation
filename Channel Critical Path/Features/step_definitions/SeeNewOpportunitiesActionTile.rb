#All Overview - See New Opportunities Action Tile specific Step definitions
#All Scenario mentioned in SeeNewOpportunitiesActionTile.feature

And(/^I click on "(.*?)" action tile$/) do |arg|
	begin
		sleep 3
		
		recordCount = 0
		oppCount = 0
		
		dataCount = all(".big-badge-container")[0].first("div")['data-number']
		
		if dataCount == ""
			dataCount = 0
			puts "No.of Opportunities user has not yet seen : #{dataCount}"
		else
			puts "No.of Opportunities user has not yet seen : #{dataCount}"
		end
		
		
		find(:css, ".srevicon-coins-lg").click
		puts "Clicked on #{arg}"
		
		sleep 8
		
		within("h4") do
			if page.has_content? "Opportunities"
				puts "Successfully navigated to Opportunity Page"
			else
				putstr "Failed to navigate to Opportunity Page"
			end
		end
		sleep 5

    within all(".ui-select-match")[2] do
      defaultFilter = first("span").first("span").text
      if defaultFilter.to_s == "New Last Week".to_s
        puts "The default filter value present on #{arg} : New Last Week"
      else
        putstr "Failed to see New Last Week as default value on #{arg}"
      end
    end

    sleep 5
		within all(".ui-grid-canvas")[1] do
      if all(:css, ".ui-grid-row.ng-scope").count > 0
				oppCount = all(:css, ".ui-grid-row.ng-scope").count
				puts "No.of Opportunities on Opportunity grid: #{dataCount}"
			else
				oppCount = 0
			end
		end
		
		if dataCount.to_i == oppCount.to_i
			puts "The record count on #{arg} Action Tile and Opportunity grid is Same"
		else
			putstr "The record count on #{arg} Action Tile and Opportunity grid is not Same"
		end
		
		if oppCount.to_i > 0
		
			click_on "Overview"
			sleep 3
			puts "Navigated to Overview page"
			
			recordCount = all(".big-badge-container")[1].first("div")['data-number']
			if recordCount == ""
				puts "See New Opportunities count is disappeared"
			else
				putstr "See New Opportunities count is not disappeared"
			end
		else
			puts "No new Opportunities to see"
		end
		
	rescue Exception => ex
		putstr "Error while verifying #{arg} on Overview Page"
		putstr_withScreen  ex.message
	end
end