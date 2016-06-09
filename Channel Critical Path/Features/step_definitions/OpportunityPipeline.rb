#All Overview - Opportunity Pipeline specific Step definitions
#All Scenario mentioned in OpportunityPipeline.feature

And(/^I check the default filter for "(.*?)"$/) do |arg|
	begin
		sleep 5
		arg1 = getReference arg
		defaultFilter = arg1["presentQuarter"]
		menuOptions = Array.new

		within(:css, ".pull-left.clearfix") do
			within all(".ui-select-match")[0] do
				if all(".ui-select-match-close").count > 0
					defaultValue = find(:css, ".ng-binding.ng-scope").text
					if defaultFilter == defaultValue
						puts "The default filter value present on #{arg} : #{defaultValue}"
					else
						puts "Failed to see #{defaultFilter} as default value on #{arg}"
					end
					sleep 2
					all(".ui-select-match-close").each do |text|
						text.click
						sleep 3				
					end	
					puts "Cleared all the filters on #{arg}"
				end
			end
			sleep 3
		end
		
		all("input[role='combobox']")[0].click
		sleep 5
		
		all(".ui-select-choices-row-inner").each do |menu|
			menuOptions << menu.first("span").text
		end
		puts "All the available Quarters in the dropdown are: #{menuOptions}"
		
	rescue Exception => ex
		putstr "Error while verifying default filter for #{arg}"
		putstr_withScreen  ex.message
	end
end

And(/^I verify "(.*?)" filter on Opportunity Pipeline chart$/) do |arg|
	begin
		sleep 5
		
		arg1 = getReference arg
		arg2 = getDetails arg
		index = arg2["filterIndex"]
		filter = arg1["filterValues"].split(",")
		menuOptions = Array.new
		
		within(:css, ".pull-left.clearfix") do
			within all("input[role='combobox']")[index] do
				if all(".ui-select-match-close").count > 0
					all(".ui-select-match-close").each do |text|
						text.click
						sleep 3				
					end	
					puts "Cleared all the filters on #{arg}"
				else
					puts "No filter is applied on #{arg}"
				end
			end
			sleep 3
		
		
			if arg != "Expiration Quarter"
				
				all("input[role='combobox']")[index].click
				sleep 5
				
				all(".ui-select-choices-row-inner").each do |menu|
					menuOptions << menu.first("span").text
				end
				
				puts "All the available values in #{arg} dropdown are: #{menuOptions}"
			
				# if menuOptions.to_s.include? filter.to_s
				# 	puts "Successfully verified the #{arg} dropdown"
				# else
				# 	putstr "Failed to verify the #{arg} dropdown"
				# end
			end
			
			filter.each do |value|
				all("input[role='combobox']")[index].send_keys value
				puts "Selected #{value} as #{arg} filter"
				sleep 3
				
				all("input[role='combobox']")[index].send_keys :enter
				sleep 3
			end
			
			click_on "Go"
			puts "Clicked on Go"
			sleep 5
		end
		
		
	rescue Exception => ex
		putstr "Error while verifying #{arg} filter on Opportunity Pipeline chart"
		putstr_withScreen  ex.message
	end
end


Then(/^I clear all the filters$/) do 
	begin
		sleep 3
		within(:css, ".pull-left.clearfix") do
			all("input[role='combobox']").each do
				if all(".ui-select-match-close").count > 0
					all(".ui-select-match-close").each do |text|
						text.click
						sleep 3				
					end	
				end
				sleep 2
			end
			puts "Successfully cleared all the Filters on Opportunity Pipeline"
			
			click_on "Go"
			puts "Clicked on Go"
			sleep 5
		end
	rescue Exception => ex
		putstr "Error while clearing all the filters"
		putstr_withScreen  ex.message
	end
end

And(/^I verify data display on charts$/) do
	begin
		sleep 3
    arg1 = getDetails "SalesStages"
    unAvailableStages =  arg1["Unavailablestages"].split(",")

		SalesStages = Array.new
		if all(".highcharts-xaxis-labels").count > 0
			within(".highcharts-xaxis-labels") do
				if all("text").count > 0
					xaxis = all("text")
					xaxis.each do |stage|
						SalesStages << stage.text
						sleep 2
					end
				else
					puts "No X-axis to display"
				end
			end
			puts "Sales Stages displayed on X-axis of Opportunity Pipeline Chart : #{SalesStages}"

    if SalesStages.size > 1
      if SalesStages.include?(unAvailableStages)
        puts "Stages #{unAvailableStages} which are under Hidden from Pipeline & Not Available to Partners are visible"
      else
        puts "Stages #{unAvailableStages} which are under Hidden from Pipeline & Not Available to Partners are not visible"
      end
    end

		else
			puts "Opportunity Pipeline chart is not available"
		end
	rescue Exception => ex
		putstr "Error while verifying data display on Opportunity Pipeline chart"
		putstr_withScreen  ex.message
	end
end

And(/^I verify the orange chart$/) do 
	begin
		sleep 3
    arg1 = getDetails "SalesStages"
    unAvailableStages =  arg1["Unavailablestages"].split(",")

    rowStage = Array.new
    isStageExists = 0
    oppCount = 0

		if all(".highcharts-legend-item").count > 0
			orangeLegendText = all(".highcharts-legend-item")[0].first("text").first("tspan").text
			puts "Orange colored Legend text is : #{orangeLegendText}"
			blueLegendText = all(".highcharts-legend-item")[1].first("text").first("tspan").text
			sleep 3
			
			if all(".highcharts-legend-item")[1].first("rect")[:fill] == "#40ADD1"
				all(".highcharts-tracker")[0].hover
				sleep 2
				
				within(".highcharts-tooltip") do
					salesStage = first("text").first("tspan").text
					puts "Sales Stage: #{salesStage}"
					oppAmount = first("text").all("tspan")[1].text
					puts "#{oppAmount}"
					currency = first("text").all("tspan")[2].text[-3, 3]
					puts "Currency of Logged in User : #{currency}"
					totalAmount = first("text").all("tspan")[2].text
					puts "#{totalAmount}"
					sleep 3
			    end	
				all(".highcharts-legend-item")[1].click
				puts "Disabled #{blueLegendText} legend"
				sleep 3
				all(".highcharts-tracker")[0].click
				puts "Clicked on Orange bar"
				
				sleep 5
		
				if page.has_css? (".view-heading-section")
					puts "Successfully navigated to Opportunity page"
				else
					putstr "Failed to navigate to Opportunity page"
				end

        if all(:css, ".ui-grid-row.ng-scope").count > 0
          within all(".ui-grid-canvas")[1] do

              oppCount = all(:css, ".ui-grid-row.ng-scope").count
              puts "No.of Opportunities on Opportunity grid: #{oppCount}"

              rows = all(:css, ".ui-grid-row.ng-scope")[0]
              if rows.all(".ng-binding.ng-scope")[1].text != ""
                rowStage = rows.all(".ng-binding.ng-scope")[1].text
                isStageExists = 1
              else
                isStageExists = 0
              end
          end
          within all(".ui-grid-canvas")[1] do
            within all("div[role='gridcell']")[12] do
              sleep 3
              if page.has_css? ".btn-orange"
                puts "Need Status Update button is available"
              else
                putstr "Need Status Update button is not available"
              end
            end
          end
        else
          oppCount = 0
       end

      if isStageExists > 0
        if unAvailableStages.to_s.include?(rowStage).to_s
          puts "Stages #{unAvailableStages} which are under Hidden from Pipeline & Not Available to Partners are visible"
        else
          puts "Stages #{unAvailableStages} which are under Hidden from Pipeline & Not Available to Partners are not visible"
        end
      else
        puts "Sales stage is not present for the selected opportunity to verify"
      end
			else
				puts "Blue Legend is not available" 
			end
		else
			puts "Legends are not available"
		end
		
	rescue Exception => ex
		putstr "Error while verifying Orange chart"
		putstr_withScreen  ex.message
	end
end

And(/^I verify the blue chart$/) do 
	begin
		sleep 3
		
		if all(".highcharts-legend-item").count > 0
			orangeLegendText = all(".highcharts-legend-item")[0].first("text").first("tspan").text
			blueLegendText = all(".highcharts-legend-item")[1].first("text").first("tspan").text
			puts "Blue colored Legend text is : #{blueLegendText}"
			sleep 3
			
			if all(".highcharts-legend-item")[0].first("rect")[:fill] == "#FA9241"
        sleep 4
				all(".highcharts-tracker")[1].hover
				sleep 2
        puts "hover on blue bar"
        all(".highcharts-tracker")[1].hover
        sleep 2

				within(".highcharts-tooltip") do
					salesStage = first("text").first("tspan").text
					puts "Sales Stage: #{salesStage}"
					oppAmount = first("text").all("tspan")[1].text
					puts "#{oppAmount}"
					currency = first("text").all("tspan")[2].text[-3, 3]
					puts "Currency of Logged in User : #{currency}"
					totalAmount = first("text").all("tspan")[2].text
					puts "#{totalAmount}"
					sleep 3
			    end	
				all(".highcharts-legend-item")[0].click
				puts "Disabled #{orangeLegendText} legend"
				sleep 3
				all(".highcharts-tracker")[0].click
				puts "Clicked on Blue bar"
				
				sleep 5
				
				if page.has_css? (".view-heading-section")
					puts "Successfully navigated to Opportunity page"
				else
					putstr "Failed to navigate to Opportunity page"
				end
				
				within all(".ui-grid-canvas")[1] do
					within all("div[role='gridcell']")[12] do
						sleep 3
						if !(page.has_css? ".btn-orange")
							puts "Need Status Update button is not available"
						else
							putstr "Need Status Update button is available"
						end
					end
				end
				
			else
				puts "Orange Legend is not available" 
			end
		else
			puts "Legends are not available"
		end
		
	rescue Exception => ex
		putstr "Error while verifying Blue chart"
		putstr_withScreen  ex.message
	end
end

And(/^I select all the filters$/) do
	begin
		
		arg1 = getReference "Opportunity Pipeline"
		
		quarter = arg1["Quarter"]
		country = arg1["Country"]
		reseller = arg1["Reseller Rep"]
		distributor = arg1["Distributor Rep"]
		
		within(:css, ".pull-left.clearfix") do
			
			all("input[role='combobox']").each do
				if all(".ui-select-match-close").count > 0
					all(".ui-select-match-close").each do |text|
						text.click
						sleep 3				
					end	
					puts "Cleared the applied filter"
				else
					puts "No filter is applied"
				end
			end
			sleep 3
		
			all("input[role='combobox']")[0].send_keys quarter
			puts "Selected #{quarter} as Expiration Quarter filter"
			sleep 3
			
			all("input[role='combobox']")[0].send_keys :enter
			sleep 3
			
			all("input[role='combobox']")[1].send_keys country
			puts "Selected #{country} as Country filter"
			sleep 3
			
			all("input[role='combobox']")[1].send_keys :enter
			sleep 3
			
			all("input[role='combobox']")[2].send_keys reseller
			puts "Selected #{reseller} as Reseller rep filter"
			sleep 3
			
			all("input[role='combobox']")[2].send_keys :enter
			sleep 3
			
			all("input[role='combobox']")[3].send_keys distributor
			puts "Selected #{distributor} as Distributor rep filter"
			sleep 3
			
			all("input[role='combobox']")[3].send_keys :enter
			sleep 3
			
			click_on "Go"
			puts "Clicked on Go"
			sleep 5
		end
	rescue Exception => ex
		putstr "Error while selecting all the filters"
		putstr_withScreen  ex.message
	end
end

And(/^I verify that filters Preserved or not$/) do
	begin
		
		arg1 = getReference "Opportunity Pipeline"
		
		quarter = arg1["Quarter"]
		country = arg1["Country"]
		reseller = arg1["Reseller Rep"]
		distributor = arg1["Distributor Rep"]
		isFilterPreserved = 0
		
		within(:css, ".pull-left.clearfix") do
			within all("input[role='combobox']")[0] do
				if all(".ui-select-match-close").count > 0
					quarterFilter = find(:css, ".ng-binding.ng-scope").text
					if quarter.to_s == quarterFilter.to_s
						puts "Expiration Quarter filter is preserved"
					else
						isFilterPreserved = 1
					end
					sleep 2
				end
			end
			sleep 3
			
			within all("input[role='combobox']")[1] do
				if all(".ui-select-match-close").count > 0
					countryFilter = find(:css, ".ng-binding.ng-scope").text
					if country.to_s == countryFilter.to_s
						puts "Country filter is preserved"
					else
						isFilterPreserved = 1
					end
					sleep 2
				end
			end
			sleep 3
			within all("input[role='combobox']")[2] do
				if all(".ui-select-match-close").count > 0
					resellerFilter = find(:css, ".ng-binding.ng-scope").text
					if reseller.to_s == resellerFilter.to_s
						puts "Reseller Rep filter is preserved"
					else
						isFilterPreserved = 1
					end
					sleep 2
				end
			end
			sleep 3
			within all("input[role='combobox']")[3] do
				if all(".ui-select-match-close").count > 0
					distributorFilter = find(:css, ".ng-binding.ng-scope").text
					if distributor.to_s == distributorFilter.to_s
						puts "Distributor Rep filter is preserved"
					else
						isFilterPreserved = 1
					end
					sleep 2
				end
			end
			sleep 3
		end
		
		if isFilterPreserved == 0
			puts "All the filter values are preserved."
		else
			putstr "All the filter values are not preserved."
		end
	
	rescue Exception => ex
		putstr "Error while verifying that filters Preserved or not"
		putstr_withScreen  ex.message
	end
end
