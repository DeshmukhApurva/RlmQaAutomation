#All Opportunity Management -Opportunity Line Item Fiscal Year specific Step definitions
#All Scenario mentioned in OpportunityLineItemFiscalYear.feature

Then (/^I select the opportunity to set the date$/)do
  begin
    sleep 5
    arg = getReference "FiscalOpp"
    select "My Opportunities", :from => "fcf"
    sleep 3
    within(".fBody") do
      click_on "Go!"
    end
    sleep 5
    foundCount = ""
    begin
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          if row.all("td")[2].text==arg["Name"]
            row.all("td")[2].all('a')[0].click
            foundCount = "found"
            break
          end
        end
      end
      if page.has_css?('.next')
        find(".next").click
        sleep 3
      else
        break
      end
    end until (page.has_css?('.nextoff'))
    if foundCount==""
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          if row.all("td")[2].text==arg["Name"]
            row.all("td")[2].all('a')[0].click
            foundCount = "found"
            break
          end
        end
      end
    end
    sleep 5
  rescue Exception=>ex
    puts "Error in selecting opportunity to set the dates"
    putstr_withScreen  ex.message
  end
end

Then (/^I select a Opportunity Line Item with no date to set "(.*?)"$/)do|data|
  begin
    arg1 = getDetails data
    sleep 3
    within(".opportunityLineItemBlock")do
        first(:link,"Edit").click
    end
    sleep 3
    within(".pbSubsection")do
        fill_in "Start Date",:with=>arg1["StartDate"]
        fill_in "End Date",:with=>arg1["EndDate"]
    end
    sleep 3
    within(:id,"topButtonRow")do
        click_on "Save"
        puts "Start Date and End Date is set."
    end
  rescue Exception=>ex
    puts "Error in selecting a line item with no date"
    putstr_withScreen  ex.message
  end
end

And (/^I verify the quarter fields$/)do
  begin
    sleep 3
    within all(".pbSubsection")[0]do
        $expiration_Quarter = all("tbody")[0].all("tr")[4].all("td")[1].text
        $expiration_Year = all("tbody")[0].all("tr")[5].all("td")[1].text
    end
    sleep 4
    if ($expiration_Quarter == "" && $expiration_Year == "")
        putstr "Expiration Quarter:#{$expiration_Quarter} & ExpirationYear:#{$expiration_Year} is not populated"
    else
        puts "Expiration Quarter:#{$expiration_Quarter} & ExpirationYear:#{$expiration_Year} is populated"
    end
    sleep 3
  rescue Exception =>ex
    puts "Error in verifying the quarter fields"
    putstr_withScreen  ex.message
  end
end

And (/^I clear the date fields for FiscalOpp$/)do
  begin
    sleep 3
    within(".opportunityLineItemBlock")do
      first(:link,"Edit").click
    end
    sleep 4
    within (".pbSubsection")do
      fill_in "Start Date",:with=>""
      fill_in "End Date",:with=>""
    end
    sleep 3
    within(:id,"topButtonRow")do
      click_on "Save"
      puts "Cleared the date fields"
    end
  rescue Exception=>ex
    puts "Error in clearing the date fields for fiscal opportunity"
    putstr_withScreen  ex.message
  end
end