#All ServiceSource Setup - Partner Data Sync specific Step definitions
#All Scenario mentioned in PartnerDataSync.feature

And(/^I Add Partner Opportunity field "(.*?)" and Opportunity Field "(.*?)"$/) do |field1, field2|
  begin
    sleep 3
    addDisabled = 1
    within all(".pbSubsection")[1] do
      if page.has_css?(".btnDisabled")
      addDisabled = 0
      end
    end
    sleep 5
    if (addDisabled > 0)
      within all(".pbSubsection")[1] do
        click_on "Add"
        puts "Add clicked"
      end
      sleep 8
      first(:xpath, ".//*[contains(@id, 'fieldsName')]").select(field1)
      sleep 8
      first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").select(field2)
      sleep 8
    # within all(".pbButton")[1] do
    # click_on 'Save'
    # end
    # sleep 5
    end
    puts "Added Partner Opportunity field"
  rescue Exception => ex
    putstr "Error occurred while adding Partner Opportunity field"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify message "(.*?)"$/) do |arg|
  begin
    sleep 3
    if page.has_content? arg
      puts "#{arg} message is displayed"
    else
      puts "#{arg} message is not displayed"
    end
  rescue Exception => ex
    putstr "Error while verifying Channel Management section display under ServiceSource Setup tab"
    putstr_withScreen  ex.message
  end
end

Then(/^Partner Opportunity field "(.*?)" should be present$/) do |field|
  begin
    within all(".pbSubsection")[1] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == field
            sleep 5
            puts "#{field} field is present on the grid"
            sleep 10
          break
          else
            puts "#{field} field is not present on the grid"
          end
        end
      end
    end
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while verifying Partner Opportunity fields"
    putstr_withScreen  ex.message
  end
end

And(/^I delete Partner Opportunity field "(.*?)"$/) do |action|
  begin
    sleep 2
    fieldPresent = 0
    within all(".pbSubsection")[1] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == action
            sleep 5
            fieldPresent = 1
            row.first(:link,"Delete").click
            puts "#{action} field found"
            #deleting field
            sleep 8
          break
          end
        end
      end
    end
    sleep 8
    if fieldPresent > 0
      puts "#{action} field deleted"
    else
      putstr "#{action} field was not present"
    end
    puts "Opportunity Field #{action} Deleted"
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while verifying and deleting Partner Opportunity field"
    putstr_withScreen  ex.message
  end
end

And(/^I edit Partner Opportunity field "(.*?)" mapping as "(.*?)"$/) do |field1, field2|
  begin
    within all(".pbSubsection")[1] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == field1
            row.all("td")[3].select(field2)
            puts "Partner Opportunity field - #{field1} mapped to Opportunity field - #{field2}"
            sleep 5
          break
          else
            puts "#{field1} field is not present on the grid"
          end
        end
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while editing Partner Opportunity field mapping"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify Partner Opportunity field "(.*?)" and Opportunity Field "(.*?)" is not saved$/) do |field1, field2|
  begin
    within all(".pbSubsection")[1] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if (row.all("td")[2].text == field1) && (row.all("td")[3].first('option[selected]').text != field2)
            puts "Edited mapping Partner Opportunity field - #{field1} to Opportunity field - #{field2} is not saved"
            sleep 3
          break
          else
            puts "Partner Opportunity field - #{field1} mapped to Opportunity field - #{row.all("td")[3].first('option[selected]').text}"
            sleep 3
          break
          end
        end
      end
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying edited mapping saved or not"
    putstr_withScreen  ex.message
  end
end

And(/^I verify available options "(.*?)" selected or not$/) do |label|
  begin
    if find_field(label).checked?
      puts "#{label} is selected"
    else
      puts "#{label} is not selected"
    end
    sleep 3
  rescue Exception => ex
    putstr label + " is not selected"
    putstr_withScreen  ex.message
  end
end

And(/^I choose "(.*?)" for Opportunity Quote$/) do |radio_button|
  begin
    within("table[role='presentation']") do
      first("input[value='Quote PDF']").set(true)
      sleep 2
    end
    puts "Successfully enabled #{radio_button}"
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while choosing #{radio_button}"
    putstr_withScreen  ex.message
  end
end

And(/^I click on the mapping button "(.*?)"$/) do |buttonName|
  begin
    if buttonName == "Save"
      find(:xpath, '//input[contains(@id,"addMappingBtn")]').click
      sleep 3
      puts "Successfully clicked on button #{buttonName}"
    elsif buttonName == "Cancel"
      find(:xpath, '//input[contains(@id,"addMappingBtn")]/following-sibling::input[contains(@value,"Cancel")]').click
      sleep 3
      puts "Successfully clicked on button #{buttonName}"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking #{buttonName}"
    putstr_withScreen  ex.message
  end
end