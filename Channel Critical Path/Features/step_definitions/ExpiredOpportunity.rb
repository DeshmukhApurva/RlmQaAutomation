#All Overview - Expired Opportunity specific Step definitions
#All Scenario mentioned in ExpiredOpportunity.feature

And(/^I verify the "(.*?)" display$/) do |arg|
	begin
		sleep 3
    arg1 = getDetails "SalesStages"
    unAvailableStages =  arg1["Unavailablestages"].split(",")

		totalOpp = 0
		totalAmount = 0.0
		oppSum = 0
		amountSum = 0.0
		oppCount = 0
		rowPresent = 0
		stageOppCount = 0
    rowStage = ""
    isStageExists = 0
		OppStage = Array.new
		
		if page.has_content? arg
			puts "#{arg} is present on Overview page"
		else
			puts "#{arg} is not present on Overview page"
		end
		
		within(".opp-stats-table") do 
			if first("tbody").all("tr").count > 0
			
				firstRow = first("tbody").all("tr")[0]
				
				totalOpp = firstRow.first("td").first("a").text.to_i
				puts "Total expired Opportunities: #{totalOpp}"
				
				opp = firstRow.all("td")[1].text
				
				totalAmount = firstRow.all("td")[2].text.to_f
				puts "Total amount of all the expired Opportunities: #{totalAmount}"
				
				rows = first("tbody").all("tr")
				rowCount = rows.count
				
				if rowCount > 1
					1.upto(rowCount - 1) do |i|
						oppSum += first("tbody").all("tr")[i].first("td").first("a").text.to_i
						OppStage << first("tbody").all("tr")[i].all("td")[1].text
						amountSum += first("tbody").all("tr")[i].all("td")[2].text.to_f
					end
					
					puts "Expired Opportunities are segmented into the Stages : #{OppStage}"

        if OppStage.size > 1
          if OppStage.include?(unAvailableStages).to_s
            puts "Stages #{unAvailableStages} which are under Hidden from Pipeline & Not Available to Partners are visible"
          else
            puts "Stages #{unAvailableStages} which are under Hidden from Pipeline & Not Available to Partners are not visible"
          end
        end

					if totalOpp == oppSum
						puts "Successfully verified the Opportunity count"
					else
						puts "Opportunity count is not matching"
					end
					
					if totalAmount == amountSum
						puts "Successfully verified the Opportunity Amount"
					else
						puts "Opportunity Amount is not matching"
					end
					
					stageOppCount = first("tbody").all("tr")[1].first("td").first("a").text.to_i
					@stage = first("tbody").all("tr")[1].all("td")[1].text
					first("tbody").all("tr")[1].first("td").first("a").click
					puts "Clicked on the Opportunity count for #{@stage}"
					sleep 5
					
					rowPresent = 1
					
				else
					puts "No expired Opportunities found"
				end
			else
				puts "No expired Opportunities found"
			end	
		end
		
		# if rowPresent > 0
			# within all(".ui-grid-canvas")[1] do
				# if all(:css, ".ui-grid-row.ng-scope").count > 0
        # 
					# oppCount = all(:css, ".ui-grid-row.ng-scope").count
					# puts "No.of Opportunities on Opportunity grid: #{oppCount}"
          # 
          # rows = all(:css, ".ui-grid-row.ng-scope")[0]
          # if rows.all(".ng-binding.ng-scope")[1].text != ""
            # rowStage = rows.all(".ng-binding.ng-scope")[1].text
            # isStageExists = 1
          # else
            # isStageExists = 0
          # end
          # 
				# else
					# oppCount = 0
				# end
			# end
		# end
		if rowPresent > 0
      #if gridCount == 2
      gridCanvasCount = all(".ui-grid-canvas").count
      puts "gridCanvasCount: #{gridCanvasCount}"
      if gridCanvasCount == 2
        puts "Grid count is 2"
        within all(".ui-grid-canvas")[1] do
          if all(:css, ".ui-grid-row.ng-scope").count > 0
            oppCount = all(:css, ".ui-grid-row.ng-scope").count
            puts "No.of Opportunities on Opportunity grid: #{oppCount}"
    
            rows = all(:css, ".ui-grid-row.ng-scope")[0]
            if rows.all(".ng-binding.ng-scope")[1].text != ""
              rowStage = rows.all(".ng-binding.ng-scope")[1].text
              isStageExists = 1
            else
              isStageExists = 0
            end
          else
            oppCount = 0
          end
        end
      else
        puts "Grid count is 1"
        within all(".ui-grid-canvas")[0] do
          if all(:css, ".ui-grid-row.ng-scope").count > 0
            oppCount = all(:css, ".ui-grid-row.ng-scope").count
            puts "No.of Opportunities on Opportunity grid: #{oppCount}"    
            rows = all(:css, ".ui-grid-row.ng-scope")[0]
            if rows.all(".ng-binding.ng-scope")[1].text != ""
              rowStage = rows.all(".ng-binding.ng-scope")[1].text
              isStageExists = 1
            else
              isStageExists = 0
            end
          else
            oppCount = 0
          end
        end
      end
    end

    if isStageExists > 0
      if (rowStage.to_s == @stage.to_s)
        puts "Opportunities dispalyed in the grid has Sales stage same as Selected Expired Opportunity Sales Stage : #{@stage}"
      else
        putstr "Opportunities dispalyed in the grid has Sales stage different from Selected Expired Opportunity Sales Stage "
      end

      if unAvailableStages.to_s.include?(rowStage).to_s
        puts "Stages #{unAvailableStages} which are under Hidden from Pipeline & Not Available to Partners are visible"
      else
        puts "Stages #{unAvailableStages} which are under Hidden from Pipeline & Not Available to Partners are not visible"
      end


    else
      puts "Sales stage is not present for the selected opportunity to verify"
    end


		if stageOppCount == oppCount
			puts "The record count for #{@stage} and Opportunity grid is Same"
		else
			putstr "The record count for #{@stage} and Opportunity grid is not Same"
		end
		
	rescue Exception => ex
		putstr "Error while verifying #{arg} on Overview Page"
		putstr_withScreen  ex.message
	end
end


And(/^I validate the "(.*?)" section$/) do |arg|
	begin
		currentDate = Date.today.strftime("%m-%d-%Y")
		isRowPresent = 0 
		totalOppAmount = 0.0
		recordCount = 0
		totalExpOpp = 0
		isExpDateExists = 0
		Stage = ""
		isStageExists = 0
		ExpirationDate = ""
		StageArray = []
		
		within(".opp-stats-table") do 
			if first("tbody").all("tr").count > 0
			
				firstRow = first("tbody").all("tr")[0]
				
				totalExpOpp = firstRow.first("td").first("a").text.to_i
				puts "Total expired Opportunities: #{totalExpOpp}"
				
				OppText = firstRow.all("td")[1].text
				
				totalOppAmount = firstRow.all("td")[2].text.to_f
				puts "Total amount of all the expired Opportunities: #{totalOppAmount}"


				firstRow.first("td").first("a").click
				puts "Clicked on Expired Opportunity count"
				sleep 5
				
				isRowPresent = 1
			else
				puts "No expired Opportunities found in Expired Opportunity section"
				totalExpOpp = 0
			end	
		end
		
		if isRowPresent > 0
			
			within all(".ui-grid-canvas")[1] do
				if all(:css, ".ui-grid-row.ng-scope").count > 0
					recordCount = all(:css, ".ui-grid-row.ng-scope").count
					puts "No.of Opportunities on Opportunity grid: #{recordCount}"
					
					rows = all(:css, ".ui-grid-row.ng-scope")[1]
					if rows.all(".ng-binding.ng-scope")[1].text != ""
						Stage = rows.all(".ng-binding.ng-scope")[1].text
						isStageExists = 1
					else
						isStageExists = 0
					end
					
					if rows.all(".ng-binding.ng-scope")[4].text != ""
						ExpirationDate = rows.all(".ng-binding.ng-scope")[4].text
						isExpDateExists = 1
					else
						isExpDateExists = 0
          end

          sleep 3
					StageArray << all(".ng-binding.ng-scope")[1].text
					if all(".ng-binding.ng-scope")[4].text != ""
						ExpirationDate << all(".ng-binding.ng-scope")[4].text
						isExpDateExists = 1
					end
				else
					recordCount = 0
					puts "No expired Opportunities found on Opportunity grid"
				end
			end
		end
		
		if recordCount == totalExpOpp
			puts "The record count on Expired Opportunities section and Opportunity grid is Same"
		else
			putstr "The record count on Expired Opportunities section and Opportunity grid is not Same"
		end
		
		puts "One of the Opportunity Sales stage on Opportunity grid : #{Stage}"
		puts ExpirationDate
		
		if isStageExists > 0
			if (Stage.to_s != "Closed Won") && (Stage.to_s != "Closed Lost")
				puts "Opportunities that has sales stage other than Closed Won/Closed Lost are displayed in Expired Opportunity section"
			else
				putstr "Opportunities that has sales stage Closed Won/Closed Lost are displayed in Expired Opportunity section"
			end
		else
			puts "Sales stage is not present for the selected opportunity to verify"
		end
		
		if isExpDateExists > 0
			if ExpirationDate < currentDate
				puts "Opportunities that has Earliest expiration date earlier than Current date are displayed in Expired Opportunity section"
			else
				putstr "Opportunities that has Earliest expiration date greater than Current date are displayed in Expired Opportunity section"
			end
		else
			puts "Earliest Expiration Date is not present for the selected opportunity to verify"
		end
		
	rescue Exception => ex
		putstr "Error while verifying #{arg} section"
		putstr_withScreen  ex.message
	end
end
