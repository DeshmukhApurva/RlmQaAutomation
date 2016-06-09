#All Overview - Action Tiles specific Step definitions
#All Scenario mentioned in ActionTiles.feature

And(/^I verify the "(.*?)" for Overview$/) do |arg|
	begin
		arg1 = getDetails arg
		OverviewTiles = arg1["tiles"].split(",")
		
		OverviewTiles.each do |value|
			if page.has_content? value
				puts "#{value} is displayed on Overview page"
			else
				raise "#{value} is not displayed on Overview page"
			end
		end
		
	rescue Exception => ex
		putstr "Error while verifying #{arg} on Overview Page"
		putstr_withScreen  ex.message
	end
end


And(/^I click on the "([^"]*)" action tile$/) do |completed_action_tile|
  begin
    sleep 3
    requestsCount = 0
    dataCount = all(".big-badge-container")[1].first("div")['data-number']
    if dataCount == ""
      dataCount = 0
      puts "No.of Opportunities needs Status update: #{dataCount}"
    else
      puts "No.of Opportunities needs Status update: #{dataCount}"
    end
    sleep 3
    find(:css, ".srevicon-done-lg").click
    puts "Clicked on #{completed_action_tile}"
    sleep 8
    within("h4") do
      if page.has_content? "Requests"
        puts "Successfully navigated to Requests Page"
      else
        putstr "Failed to navigate to Requests Page"
      end
    end
    sleep 4
    within(".view-content-section") do
    within all(".ui-select-match").last do
      defaultFilter = first("span").first("span").text
      if defaultFilter.to_s == "My Closed Requests".to_s
        puts "The default filter value present on #{completed_action_tile} : My Closed Requests"
      else
        putstr "Failed to see My Closed Requests as default value on #{completed_action_tile}"
      end
    end
   end
    sleep 3

    within all(".ui-grid-canvas")[1] do
      if all(:css, ".ui-grid-row.ng-scope").count > 0
        requestsCount = all(:css, ".ui-grid-row.ng-scope").count
        puts "No.of Requests on Requests grid: #{dataCount}"
      else
        requestsCount = 0
      end
    end
    sleep 3
  rescue Exception => ex
    putstr "Error while verifying #{completed_action_tile}"
    putstr_withScreen  ex.message
  end
end