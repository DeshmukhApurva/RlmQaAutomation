#All Opportunities - Opportunity Expiration Filter specific Step definitions
#All Scenario mentioned in OpportunityExpirationFilter.feature

Then (/^I check the current expiration quarter and expiration year results$/) do
	begin
	arg1 = getDetails "ExpirationQuarter"
    inputCount = all(".ui-select-match").count
    puts "quarter and year - '#{inputCount}'"
		within all(".ui-select-match")[1] do
			if find(:css, ".ng-binding.ng-scope").text == arg1['CurrentQuarter']
				puts "Expiration quarter is in current quarter '#{arg1['CurrentQuarter']}'."
			end
    end
    within all(".ui-select-match")[2] do
      if find(:css, ".ng-binding.ng-scope").text == arg1['CurrentYear']
        puts "Expiration year is in current year '#{arg1['CurrentYear']}'."
      end
    end
		within all(".ui-grid-canvas")[1] do
			within all("div[role='gridcell']")[0] do
				sleep 3
				$currentQtrOpp = first("div").text
			end
		end			
		sleep 3
	rescue Exception => ex
		puts "Error in checking the results current '#{arg1['CurrentQuarter']}' expiration quarter results"
		putstr_withScreen  ex.message
	end
end

And (/^I verify after the expiration quarter and expiration year results$/) do
	begin	
    allExpQrtrArg = getReference "Expiration Quarter"
    allExpQuarters = allExpQrtrArg["filterValues"].split(",")
    arg1 = getDetails "ExpirationQuarter"
    changedQuarter = arg1['ChangedQuarter']
    changedYear = arg1['ChangedYear']
    allYears = getExpirationYears(10)
    # Change quarter - 
		within all(".ui-select-match")[1] do
			find(:css, ".close.ui-select-match-close").click 			
		end
		find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[1]/div/div/div/input").click
		click_on(changedQuarter)
		sleep 1
		within all(".ui-select-match")[1] do
      if find(:css, ".ng-binding.ng-scope").text == changedQuarter
        puts "Expiration quarter is in changed quarter '#{changedQuarter}'."
      end
    end
    sleep 1
    # Change year - 
    within all(".ui-select-match")[2] do
      find(:css, ".close.ui-select-match-close").click      
    end
    sleep 1
    find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[2]/div/div/div/input").click
    sleep 1
    click_on(changedYear)
    sleep 1
    within all(".ui-select-match")[2] do
      if find(:css, ".ng-binding.ng-scope").text == changedYear
        puts "Expiration year is in changed year '#{changedYear}'."
      end
    end
    sleep 1
    # Verify current quarter/year opportunity is present in changed quarter/year as well - 
    found = 0
    within all(".ui-grid-canvas")[1] do 
      tr = all(".ui-grid-row")      
      tr.each do |row|        
        if row.all("div[role='gridcell']")[0].text == $currentQtrOpp
          found = 1         
        else
          found = 0         
        end
      end
      if found == 1
        putstr "#{$currentQtrOpp} is present in the '#{changedQuarter}' and '#{changedYear}'"
      else
        puts "#{$currentQtrOpp} is not present in the '#{changedQuarter}' and '#{changedYear}'"
      end
    end 
    sleep 3
    # Set all available quarters in expiration quarter
    within all(".ui-select-match")[1] do
      find(:css, ".close.ui-select-match-close").click      
    end
    sleep 1
		allExpQuarters.each do |value|
      find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[1]/div/div/div/input").click
      sleep 1
      click_on(value)
      sleep 1
    end
    puts "Selected all available expiration quarters"
    # Set all available years in expiration year
    within all(".ui-select-match")[2] do
      find(:css, ".close.ui-select-match-close").click      
    end
    sleep 1
    allYears.each do |value|
      find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[2]/div/div/div/input").click
      sleep 1
      click_on(value)
      sleep 1
    end
    puts "Selected all available expiration years"
		sleep 3
		# Verify current quarter/year opportunity is present in all available quarters/years
		within all(".ui-grid-canvas")[1] do 
      tr = all(".ui-grid-row")
      tr.each do |row| 
        opptyName = row.all("div[role='gridcell']")[0].text
        if opptyName == $currentQtrOpp
          found = 1  
          break       
        else
          found = 0         
        end
      end
      if found == 1
        puts "#{$currentQtrOpp} is present in all available expiration quarters and expiration years"
      else
        putstr "#{$currentQtrOpp} is not present in all available expiration quarters and expiration years"
      end
    end 
	rescue Exception => ex
		puts "Error in verifying after changing the expiration quarter results"
		putstr_withScreen  ex.message
	end
end



