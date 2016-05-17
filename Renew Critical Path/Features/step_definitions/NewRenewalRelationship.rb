#All Opportunity Management -Renewal RelationShip specific Step definitions
#All Scenario mentioned in NewRenewalRelationShip.feature

Then (/^I edit the renewal relationship "(.*?)"$/) do|data|
  begin
    sleep 4
    arg1 = getDetails data
    within all(".customnotabBlock")[0]do
      first(:link,"Edit").click
    end
    sleep 6
    within all(".pbSubsection")[1]do
      fill_in "Existing Start Date",:with=>arg1["StartDate"]
      fill_in "Existing End Date",:with=>arg1["EndDate"]
    end
    sleep 4
    within(:id,"topButtonRow")do
      click_on "Save"
      puts "Start Date and End Date is set."
    end
  rescue Exception=>ex
    puts "Error in editing the renewal relationship"
    putstr_withScreen  ex.message
  end
end

And (/^I clear the renewal relationship date fields$/) do
  begin
    sleep 3
    within all(".customnotabBlock")[0]do
      first(:link,"Edit").click
    end
    sleep 5
    within all(".pbSubsection")[1]do
      fill_in "Existing Start Date",:with=>""
      fill_in "Existing End Date",:with=>""
    end
    sleep 4
    within(:id,"topButtonRow")do
      click_on "Save"
      puts "Cleared the date fields"
    end
  rescue Exception=>ex
    puts "Error in clearing the renewal relationship date fields"
    putstr_withScreen  ex.message
  end
end

