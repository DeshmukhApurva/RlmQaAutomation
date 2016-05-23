#All Overview - Opportunity Pipeline specific Step definitions
#All Scenario mentioned in OpportunityPipeline.feature

And(/^I check the default filter for "(.*?)"$/) do |arg|
  begin
    sleep 3
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
          sleep 1
          all(".ui-select-match-close").each do |text|
            text.click
            sleep 1
          end
          puts "Cleared all the filters on #{arg}"
        end
      end
      sleep 1
    end

    all("input[role='combobox']")[0].click
    sleep 3

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
    sleep 2

    arg1 = getReference arg
    arg2 = getDetails arg
    index = arg2["filterIndex"]
    filter = arg1["filterValues"].split(",")
    if arg == "Expiration Year"
      filter = getExpirationYears(1)
    end
    menuOptions = Array.new

    within(:css, ".pull-left.clearfix") do
      within all("input[role='combobox']")[index] do
        if all(".ui-select-match-close").count > 0
          all(".ui-select-match-close").each do |text|
            text.click
            sleep 1
          end
          puts "Cleared all the filters on #{arg}"
        else
          puts "No filter is applied on #{arg}"
        end
      end
      sleep 1

      if arg != "Expiration Quarter"

        all("input[role='combobox']")[index].click
        sleep 1

        all(".ui-select-choices-row-inner").each do |menu|
          menuOptions << menu.first("span").text
        end

        puts "All the available values in #{arg} dropdown are: #{menuOptions}"

        if menuOptions.to_s.include? filter.to_s
          puts "Successfully verified the #{arg} dropdown"
        else
          putstr "Failed to verify the #{arg} dropdown"
        end
      end

      filter.each do |value|
        all("input[role='combobox']")[index].send_keys value
        puts "Selected #{value} as #{arg} filter"
        sleep 1

        all("input[role='combobox']")[index].send_keys :enter
        sleep 1
      end

      click_on "Go"
      puts "Clicked on Go"
      sleep 3
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

      if all(".highcharts-legend-item")[0].first("rect")[:fill] == "#CCC"
        all(".highcharts-legend-item")[0].click
      end
      if all(".highcharts-legend-item")[1].first("rect")[:fill] == "#40ADD1"
        all(".highcharts-legend-item")[1].click
        puts "Disabled #{blueLegendText} legend"
      end
      sleep 5
      if all(".highcharts-legend-item")[0].first("rect")[:fill] == "#FA9241" and all(".highcharts-tracker").count > 0
        sleep 3

        all(".highcharts-tracker")[0].first("rect").hover
        puts "hover on Orange bar"
        sleep  2

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
        all(".highcharts-tracker")[0].click
        puts "Clicked on Orange bar"

        sleep 15

        if page.has_css? (".view-heading-section")
          puts "Successfully navigated to Opportunity page"

          puts find(:xpath, "//*/div[@class='ui-grid-canvas']/div/div[5]").text

          allAmountDiv = all(:xpath, "//*[contains(@id, '-uiGrid-00V1-cell')]")
          allMsrpDiv = all(:xpath, "//*[contains(@id, '-uiGrid-00V2-cell')]")
          allExpirationDatesDiv = all(:xpath, "//*[contains(@id, '-uiGrid-000C-cell')]")
          totalRec = allExpirationDatesDiv.count
          puts "Total #{totalRec} records searched: "
          if totalRec > 0

            if allAmountDiv.count < 1
              putstr "Amount field is not visible."
            end
            if allMsrpDiv.count < 1
              putstr "MSRP field is not visible."
            end

            yearFilter = getExpirationYears(1)
            rowData = '0'
            allExpirationDatesDiv.each do |row|
              isValidData = false
              yearFilter.each do |fData|
                rowData = row.first("div").text
                puts "Check filter year: #{fData} with row Expiration-Date: #{rowData}"
                if rowData.include? fData
                  isValidData = true
                  break
                end
              end
              if !isValidData
                putstr "Search Failed: Row is not matching with filter. [Year of #{rowData} is not in #{yearFilter}] "
                break
              end
            end
          end
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
        puts "Orange Legend is not available"
      end
    else
      puts "Legends are not available"
    end

  rescue Exception => ex
    putstr "Error while verifying Orange chart"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the blue chart when Account is "(.*?)" and Enable Two Tier Pricing is "(.*?)" set$/) do |accountType, isTierPriceEnabled|
  begin
    sleep 3

    if all(".highcharts-legend-item").count > 0
      orangeLegendText = all(".highcharts-legend-item")[0].first("text").first("tspan").text
      blueLegendText = all(".highcharts-legend-item")[1].first("text").first("tspan").text
      puts "Blue colored Legend text is : #{blueLegendText}"
      sleep 3

      if all(".highcharts-legend-item")[0].first("rect")[:fill] == "#FA9241"
        all(".highcharts-legend-item")[0].click
      end
      if all(".highcharts-legend-item")[1].first("rect")[:fill] == "#CCC"
        all(".highcharts-legend-item")[1].click
        puts "Disabled #{orangeLegendText} legend"
      end
      sleep 5
      if all(".highcharts-legend-item")[1].first("rect")[:fill] == "#40ADD1" and all(".highcharts-tracker").count > 0

        all(".highcharts-tracker")[0].first("rect").hover
        puts "hover on blue bar"
        sleep 4

        within(".highcharts-tooltip") do
          salesStage = first("text").first("tspan").text
          puts "Sales Stage: #{salesStage}"
          oppAmount = first("text").all("tspan")[1].text
          puts "#{oppAmount}"
          currency = first("text").all("tspan")[2].text[-3, 3]
          puts "Currency of Logged in User : #{currency}"
          totalAmount = first("text").all("tspan")[2].text
          puts "#{totalAmount}"
          #sleep 1
        end
        all(".highcharts-tracker")[0].click
        puts "Clicked on Blue bar"

        sleep 15
        amountColIndex = -1
        msrpColIndex = -1

        yearFilter = getExpirationYears(1)
        if page.has_css? (".view-heading-section")
          puts "Successfully navigated to Opportunity page"
          # If Enable 2 Tier Pricing is FALSE, MSRP field will not display but Amount, latestQuote field will be display for Reseller & Distributor both.
          # If Enable 2 Tier Pricing is TRUE,
          #   - latestQuote will not be displayed
          #   - for Distributor: MSRP and Amount both fields will be displayed
          #   - for Reseller only MSRP field will be displayed
          if all(:css, ".ui-grid-row.ng-scope").count > 0
            puts find(:xpath, "//*/div[contains(@id, '-grid-container')]/div[1]/div/div/div/div/div/div[5]/div/div[1]").text
            allAmountTxt = find(:xpath, "//*/div[contains(@id, '-grid-container')]/div[1]/div/div/div/div/div/div[5]/div/div[1]").text
            allMsrpTxt = find(:xpath, "//*/div[contains(@id, '-grid-container')]/div[1]/div/div/div/div/div/div[6]/div/div[1]").text
            latestQuote = find(:xpath, "//*/div[contains(@id, '-grid-container')]/div[1]/div/div/div/div/div/div[10]/div/div[1]").text
            puts "Logged in as: #{accountType} account type with Enable 2 Tier Pricing is enabled is: #{isTierPriceEnabled}. Col-5:#{allAmountTxt},  Col-6: #{allMsrpTxt},  Col-9: #{latestQuote} "

            iconColIndex = 10
            if isTierPriceEnabled == "true"
              if accountType   == 'Distributor'
                iconColIndex = iconColIndex + 1
                if allMsrpTxt   == 'Msrp' && allAmountTxt == 'Amount'
                  amountColIndex = 5
                  msrpColIndex = 6
                  puts "Amount and Msrp fields are visible for Distributor when Enable 2 Tier Pricing is enabled ."
                else
                  putstr "Amount and Msrp fields are not visible for Distributor when Enable 2 Tier Pricing is enabled ."
                end
              elsif accountType   == 'Reseller'
                if allAmountTxt   == 'Msrp'
                  msrpColIndex = 5
                  puts "Msrp field is visible for Reseller but not Amount field when Enable 2 Tier Pricing is enabled ."
                elsif allAmountTxt   == 'Amount'
                  putstr "Amount field is visible for Reseller Enable 2 Tier Pricing is enabled ."
                end
              else
                putstr "Some logical error..."
              end
              if latestQuote   == 'Latest Quote'
                putstr "Latest Quote field is visible when Tier Pricing is enabled ."
              else
                puts "Latest Quote field is not visible when Enable 2 Tier Pricing is enabled."
              end
            else
              if allMsrpTxt   == 'Msrp'
                amountColIndex = 5
                msrpColIndex = 6
                putstr "Msrp field is visible even though Enable 2 Tier Pricing is disabled ."
              else
                amountColIndex = 5
                puts "Msrp field is not visible when Tier Pricing is disabled ."
              end
              if latestQuote   == 'Latest Quote'
                puts "Latest Quote field is visible when Tier Pricing is disabled ."
              else
                putstr "Latest Quote field is not visible even though Enable 2 Tier Pricing is disabled."
              end
            end

            amountColTotal = 0
            msrpColTotal = 0
            puts "Row data validations for selected years"
            within all(".ui-grid-canvas")[1] do
              oppCount = all(:css, ".ui-grid-row.ng-scope").count
              puts "No.of Opportunities on Opportunity grid: #{oppCount}"

              all(:css, ".ui-grid-row.ng-scope").each do |row|
                #puts row.all(".ng-binding.ng-scope").count
                if row.all(".ng-binding.ng-scope").count > 5
                  expirationDateIndex = 3;
                  if amountColIndex > 0
                    #puts "amountColIndex: #{amountColIndex}"
                    amt = row.all(".ng-binding.ng-scope")[amountColIndex-2].text
                    amt = amt.sub('USD ', '')
                    amt = amt.sub(',', '')
                    if(amt != nil && amt != '')
                      amountColTotal = amountColTotal + amt.to_f
                    end
                    expirationDateIndex = expirationDateIndex + 1
                  end
                  if msrpColIndex > 0
                    #puts "msrpColIndex: #{msrpColIndex}"
                    amt = row.all(".ng-binding.ng-scope")[msrpColIndex-2].text
                    amt = amt.sub('USD ', '')
                    amt = amt.sub(',', '')
                    if(amt != nil && amt != '')
                      msrpColTotal = msrpColTotal + amt.to_f
                    end
                    expirationDateIndex = expirationDateIndex + 1
                  end

                  rowData = row.all(".ng-binding.ng-scope")[expirationDateIndex].text
                  isValidData = false
                  yearFilter.each do |fData|
                    if rowData.include? fData
                      isValidData = true
                      break
                    end
                  end
                  if !isValidData
                    puts "Check filter years: #{yearFilter} with row Expiration-Date: #{rowData}"
                    putstr "Search Failed: Row is not matching with filter. [Year of #{rowData} is not in #{yearFilter}] "
                    break
                  end
                  sleep 1
                  if row.has_css?".btn-round-sm.srevicon-pencil.ng-isolate-scope.btn-blu"                    
                    #puts "Need Status Update button is not available"
                  else
                    putstr "Need Status Update button is available"
                  end
                end
                # Row validation ends here
              end
            end
            puts "Calculated amountColTotal = #{amountColTotal}, msrpColTotal = #{msrpColTotal}"
          end
        else
          putstr "Failed to navigate to Opportunity page"
        end
      else
        puts "Blue Legend is not available"
      end
    else
      puts "Legends are not available"
    end

  rescue Exception => ex
    putstr "Error while verifying Blue chart"
    putstr_withScreen  ex.message
    putstr_withScreen ex.backtrace
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

And(/^I verify the blue chart$/) do 
  begin
    sleep 3
    
    if all(".highcharts-legend-item").count > 0
      orangeLegendText = all(".highcharts-legend-item")[0].first("text").first("tspan").text
      blueLegendText = all(".highcharts-legend-item")[1].first("text").first("tspan").text
      puts "Blue colored Legend text is : #{blueLegendText}"
      sleep 3
      
      if all(".highcharts-legend-item")[0].first("rect")[:fill] == "#FA9241"
        all(".highcharts-legend-item")[0].click
      end
      if all(".highcharts-legend-item")[1].first("rect")[:fill] == "#CCC"
        all(".highcharts-legend-item")[1].click
        puts "Disabled #{orangeLegendText} legend"
      end
      sleep 5
      if all(".highcharts-legend-item")[1].first("rect")[:fill] == "#40ADD1" and all(".highcharts-tracker").count > 0
        all(".highcharts-legend-item")[0].click
        puts "Disabled #{orangeLegendText} legend"
        sleep 2
        all(".highcharts-tracker")[0].first("rect").hover
        puts "hover on blue bar"
        sleep 4

        within(".highcharts-tooltip") do
          salesStage = first("text").first("tspan").text
          puts "Sales Stage: #{salesStage}"
          oppAmount = first("text").all("tspan")[1].text
          puts "#{oppAmount}"
          currency = first("text").all("tspan")[2].text[-3, 3]
          puts "Currency of Logged in User : #{currency}"
          totalAmount = first("text").all("tspan")[2].text
          puts "#{totalAmount}"
          #sleep 1
          end 
        all(".highcharts-tracker")[0].click
        puts "Clicked on Blue bar"
        
        sleep 15
        
        if page.has_css? (".view-heading-section")
          puts "Successfully navigated to Opportunity page"
          allAmountDiv = all(:xpath, "//*[contains(@id, '-uiGrid-00V1-cell')]")
          allMsrpDiv = all(:xpath, "//*[contains(@id, '-uiGrid-00V2-cell')]")
          allExpirationDatesDiv = all(:xpath, "//*[contains(@id, '-uiGrid-000C-cell')]")
          totalRec = allExpirationDatesDiv.count
          puts "Total #{totalRec} records searched: "
          if totalRec > 0
            
            if allAmountDiv.count < 1
              putstr "Amount field is not visible." 
            end
            if allMsrpDiv.count < 1
              putstr "MSRP field is not visible." 
            end
            
            yearFilter = getExpirationYears(1)
            rowData = '0'
            allExpirationDatesDiv.each do |row|
              isValidData = false
              yearFilter.each do |fData|
                rowData = row.first("div").text
                puts "Check filter year: #{fData} with row Expiration-Date: #{rowData}"
                if rowData.include? fData
                  isValidData = true
                  break
                end
              end
              if !isValidData
                putstr "Search Failed: Row is not matching with filter. [Year of #{rowData} is not in #{yearFilter}] " 
                break
              end
            end
          end
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
        puts "Blue Legend is not available" 
      end
    else
      puts "Legends are not available"
    end
    
  rescue Exception => ex
    putstr "Error while verifying Blue chart"
    putstr_withScreen  ex.message
  end
end
