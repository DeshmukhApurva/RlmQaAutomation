#All Service Source Setup - Mappings specific Step definitions
#All Scenario mentioned in Mappings.feature



When(/^I delete "([^"]*)" fields "([^"]*)"$/) do |mapping, action|
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
            sleep 20
            break
          end
        end
      end
    end
    sleep 8
    if fieldPresent > 0
      puts "#{action} field deleted"
      sleep 4
      first(".pbButtonb").first(".btn").click
      puts "Quote Opportunity Field #{action} Deleted"
      sleep 10
    else
      puts "#{action} field was not present"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying #{mapping} Fields"
    putstr_withScreen  ex.message
 end
end


And(/^I Add "([^"]*)" fields "([^"]*)" and "([^"]*)"$/) do |mapping, mapping_field, save|
  begin
    sleep 6
    addDisabled = 1
    within all(".pbSubsection")[1] do
      if page.has_css?(".btnDisabled")
        addDisabled = 0
      end
    end
    sleep 8
    if (addDisabled > 0)
      within all(".pbSubsection")[1] do
        click_on "Add"
        puts "Add clicked"
      end
      sleep 12
      result = false
      first(:xpath, ".//*[contains(@id, 'fieldsName')]").all('option').each do |field|
        if field.text.to_s.include? mapping_field.to_s
          sleep 5
          puts "Successfully see the #{mapping_field} field value"
          first(:xpath, ".//*[contains(@id, 'fieldsName')]").select mapping_field
          sleep 10
          first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").select mapping_field
          sleep 5
          result = true
          break
        end
      end
      putstr "Unable to find the #{mapping_field} field value" unless result
      sleep 10
      within all(".pbButton")[1] do
        click_on save
      end
      sleep 5
    end
    puts "Added Opportunity Field"
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while adding #{mapping} Fields"
    putstr_withScreen  ex.message
  end
end


And(/^I save the Mapping$/) do
  begin
    sleep 5
    first(".pbButtonb").first(".btn").click
    sleep 10
    puts "Saved Mapping"
  rescue Exception => ex
    putstr "Error occurred while saving Mapping"
    putstr_withScreen  ex.message
  end
end


Then(/^all required fields should be displayed in Grey$/) do
  begin
    within all(".pbSubsection")[1].first(".detailList").first(".list") do
      requiredFields = all("span", :text => "Required Field")
      requiredFields.each do |requiredField|
        if requiredField.native.style('color') != "rgba(128, 128, 128, 1)"
          putstr "Required Field is not in grey color. Instead of rgba(128,128,128,1) it is displayed in " + requiredField.last.native.style('color')
        end
      end
    end
    puts "Successfully verified that Required Fields is displayed in Grey for mandatory fields"
  rescue Exception => ex
    putstr "Error occurred while verify Required Fields color"
    putstr_withScreen  ex.message
  end
end


And(/^I should be able to set required field value for description as "(.*?)"$/) do |arg|
  begin
    within all(".pbSubsection")[1].first(".detailList").first(".list") do
      rows = all(".dataRow")
      sleep 7
      rows[0].all(".dataCell")[3].first(:xpath, ".//*[contains(@id, 'rOFDFields')]").select(arg)
      sleep 5
      puts "Required field value for Quantity field is set as : #{arg}"
    end
  rescue Exception => ex
    putstr "Error occurred while setting required field value for quote opportunity"
    putstr_withScreen  ex.message
  end
end


And(/^I Add "([^"]*)" fields "([^"]*)" to "([^"]*)"$/) do |mapping, field1, field2|
  begin
    sleep 2
    addDisabled = 1
    within all(".pbSubsection")[1] do
      if page.has_css?(".btnDisabled")
        addDisabled = 0
      end
    end
    sleep 2
    if (addDisabled > 0)
      within all(".pbSubsection")[1] do
        click_on "Add"
      end
      sleep 15
      first(:xpath, ".//*[contains(@id, 'fieldsName')]").select(field1)
      sleep 10
      first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").select(field2)
      within all(".pbButton")[1] do
        click_on "Save"
      end
      sleep 10
    end
    puts "Mapped Opportunity Field #{field1} to Source Field #{field2}"
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while adding #{mapping} Field"
    putstr_withScreen  ex.message
  end
end

And(/^I Edit "([^"]*)" fields "([^"]*)" to "([^"]*)"$/) do |mapping, field1, field2|
  begin
    within all(".pbSubsection")[1] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == field1
            row.all("td")[3].first("select").select(field2)
            #deleting field for future test runs
            sleep 10
            break
          end
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while Editing #{mapping} Fields"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the default value field is disabled for "([^"]*)"$/) do |mapping_field|
  begin
    within all(".pbSubsection")[1] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == mapping_field
            if row.all("td")[4].first(:xpath, ".//*[contains(@id, 'FM_DefaultTextField')]")[:disabled] == "true"
              puts "#{mapping_field} field set default value is disabled"
            else
              puts "#{mapping_field} field set default value is enabled"
            end
            sleep 5
            break
          end
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Set Default Value for Quote Opportunity Fields"
    putstr_withScreen  ex.message
  end
end



Then(/^"([^"]*)" Field "([^"]*)" should be present$/) do |mapping, field|
  begin
    within all(".pbSubsection")[1] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == field
            sleep 5
            puts "#{field} field present"
            sleep 10
            break
          else
            puts "#{field} field not present"
          end
        end
      end
    end
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while verifying #{mapping} Fields"
    putstr_withScreen  ex.message
  end
end


And(/^I add multiple "([^"]*)" Fields$/) do |mapping|
  begin
    sleep 10
    addDisabled = 1
    within all(".pbSubsection")[1] do
      if page.has_css?(".btnDisabled")
        addDisabled = 0
      end
    end
    sleep 10
    if (addDisabled > 0)
      within all(".pbSubsection")[1] do
        click_on "Add"
      end
      sleep 12
      ddlField = first(:xpath, ".//*[contains(@id, 'fieldsName')]")
      optionsCount = ddlField.all(:xpath, 'option').count
      within all(".pbButton")[1] do
        click_on "Cancel"
      end
      sleep 10
      count = 0
      0.upto(optionsCount-1) do
        within all(".pbSubsection")[1] do
          click_on "Add"
        end
        sleep 15
        count = count + 1
        first(:xpath, ".//*[contains(@id, 'fieldsName')]").find(:xpath, 'option[1]').select_option
        sleep 15
        begin
          first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").find(:xpath, 'option[2]').select_option
        rescue
          puts "Mapping saved"
        end
        within all(".pbButton")[1] do
          click_on "Save"
        end
        sleep 10
        if count == 5
          break
        end
      end
    end
    puts "Added #{mapping} Fields"
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while adding #{mapping} Fields"
    putstr_withScreen  ex.message
  end
end


And(/^I delete Quote Product Line field "([^"]*)"$/) do |action|
  begin
    sleep 5
    fieldPresent = 0
    within all(".pbSubsection")[2] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == action
            sleep 5
            fieldPresent = 1
            row.first(:link,"Delete").click
            puts "#{action} field found"
            #deleting field
            sleep 20
            break
          end
        end
      end
    end
    sleep 8
    if fieldPresent > 0
      puts "#{action} field deleted"
    else
      puts "#{action} field was not present on the grid"
    end
    first(".pbButtonb").first(".btn").click
    puts "Mapping Saved"
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while verifying quote opportunity fields"
    putstr_withScreen  ex.message
  end
end


And(/^I verify the validation message$/) do
  begin
    sleep 3
    errorMsg = "Unit Price and Total Price cannot be added together in mapping."
    sleep 3
    if page.has_content? errorMsg
      puts "#{errorMsg} - error message is displayed."
    else
      putstr "#{errorMsg} - error message is not displayed."
    end

  rescue Exception => ex
    putstr "Error occurred while verifying the Validation message"
    putstr_withScreen  ex.message
  end
end

And(/^I Add "([^"]*)" to "([^"]*)" from "([^"]*)"$/) do |field1, field2, mapping|
  begin
    sleep 3
    isfound = 1
    sleep 3
    within all(".pbSubsection")[2] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == field1
            isfound = 0
            break
          end
        end
      end
    end

    if isfound > 0
      addDisabled = 1
      within all(".pbSubsection")[2] do
        if page.has_css?(".btnDisabled")
          addDisabled = 0
        end
      end
      sleep 2
      if (addDisabled > 0)
        within all(".pbSubsection")[2] do
          click_on "Add"
        end
        sleep 15
        first(:xpath, ".//*[contains(@id, 'fieldsName')]").select(field1)
        sleep 10
        first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").select(field2)
        within all(".pbButton")[1] do
          click_on "Save"
        end
        sleep 10
      end
      puts "Mapped Quote Product Line Field #{field1} to #{field2}"
      sleep 10
    else
      puts "Quote Product Line Field #{field1} is already present on grid"
    end
  rescue Exception => ex
    putstr "Error occurred while adding #{mapping} fields"
    putstr_withScreen  ex.message
  end
end

And(/^I Edit "([^"]*)" to "([^"]*)" from "([^"]*)"$/) do |field1, field2, mapping|
  begin
    within all(".pbSubsection")[2] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == field1
            row.all("td")[3].first("select").select(field2)
            #deleting field for future test runs
            sleep 10
            break
          end
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while Editing #{mapping} Fields"
    putstr_withScreen  ex.message
  end
end

And(/^I delete "([^"]*)" from "([^"]*)"$/) do |mapping_field, mapping|
  begin
    sleep 2
    fieldPresent = 0
    within all(".pbSubsection")[2] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == mapping_field
            fieldPresent = 1
            row.first(:link,"Delete").click
            puts "#{mapping_field} field found"
            #deleting field
            sleep 20
            break
          end
        end
      end
    end
    sleep 6
    if fieldPresent > 0
      puts "#{mapping_field} field deleted"
    else
      putstr "#{mapping_field} field was not present"
    end
    first(".pbButtonb").first(".btn").click
    puts "Opportunity Field  #{mapping_field} Deleted"
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while verifying #{mapping} Fields"
    putstr_withScreen  ex.message
  end
end

Then(/^"([^"]*)" field on "([^"]*)" should be present$/) do |field, mapping|
  begin
    within all(".pbSubsection")[2] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == field
            sleep 5
            puts "#{field} field present"
            sleep 10
            break
          else
            puts "#{field} field not present"
          end
        end
      end
    end
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while verifying #{mapping} Fields"
    putstr_withScreen  ex.message
  end
end

And(/^I Add "([^"]*)" fields and "([^"]*)"$/) do |mapping_field, save|
  begin
    sleep 6
    addDisabled = 1
    within all(".pbSubsection")[2] do
      if page.has_css?(".btnDisabled")
        addDisabled = 0
      end
    end
    sleep 8
    if (addDisabled > 0)
      within all(".pbSubsection")[2] do
        click_on "Add"
        puts "Add clicked"
      end
      sleep 12
      result = false
      first(:xpath, ".//*[contains(@id, 'fieldsName')]").all('option').each do |field|
        if field.text.to_s.include? mapping_field.to_s
          sleep 5
          puts "Successfully see the #{mapping_field} field value"
          first(:xpath, ".//*[contains(@id, 'fieldsName')]").select mapping_field
          sleep 10
          first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").find(:xpath, 'option[1]').select_option
          sleep 5
          result = true
          break
        end
      end
      putstr "Unable to find the #{mapping_field} field value" unless result
      sleep 10
      within all(".pbButton")[1] do
        click_on save
      end
      sleep 5
    end
    puts "Added Opportunity Field"
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while adding product line fields"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the default value field is enabled for "([^"]*)"$/) do |field|
  begin
    within all(".pbSubsection")[1] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == field
            if row.all("td")[4].first(:xpath, ".//*[contains(@id, 'FM_DefaultTextField')]")[:disabled] == "true"
              puts "#{field} field set default value is disabled"
            else
              puts "#{field} field set default value is enabled"
            end
            sleep 5
            break
          end
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Set Default Value for Quote Opportunity Fields"
    putstr_withScreen  ex.message
  end
end


And(/^I verify the default field is disabled for "([^"]*)"$/) do |arg|
  begin
    within all(".pbSubsection")[2] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == mapping_field
            if row.all("td")[4].first(:xpath, ".//*[contains(@id, 'FM_DefaultTextField')]")[:disabled] == "true"
              puts "#{mapping_field} field set default value is disabled"
            else
              puts "#{mapping_field} field set default value is enabled"
            end
            sleep 5
            break
          end
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Set Default Value for Quote Opportunity Fields"
    putstr_withScreen  ex.message
  end
end


Then(/^"([^"]*)" all required fields should be displayed in grey$/) do |mapping|
  begin
    within all(".pbSubsection")[2].first(".detailList").first(".list") do
      requiredFields = all("span", :text => "Required Field")
      requiredFields.each do |requiredField|
        if requiredField.native.style('color') != "rgba(128, 128, 128, 1)"
          putstr "Required Field is not in grey color. Instead of rgba(128,128,128,1) it is displayed in " + requiredField.last.native.style('color')
        end
      end
    end
    puts "Successfully verified that #{mapping} Required Fields is displayed in Grey for mandatory fields"
  rescue Exception => ex
    putstr "Error occurred while verify Required Fields color"
    putstr_withScreen  ex.message
  end
end


And(/^I verify the default field is enabled for "([^"]*)"$/) do |field|
  begin
    within all(".pbSubsection")[2] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == field
            if row.all("td")[4].first(:xpath, ".//*[contains(@id, 'FM_DefaultTextField')]")[:disabled] == "true"
              puts "#{field} field set default value is disabled"
            else
              puts "#{field} field set default value is enabled"
            end
            sleep 5
            break
          end
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Set Default Value for Quote Opportunity Fields"
    putstr_withScreen  ex.message
  end
end


And(/^I add multiple fields to "([^"]*)"$/) do |mapping|
  begin
    sleep 10
    addDisabled = 1
    within all(".pbSubsection")[2] do
      if page.has_css?(".btnDisabled")
        addDisabled = 0
      end
    end
    sleep 10
    if (addDisabled > 0)
      within all(".pbSubsection")[2] do
        click_on "Add"
      end
      sleep 12
      ddlField = first(:xpath, ".//*[contains(@id, 'fieldsName')]")
      optionsCount = ddlField.all(:xpath, 'option').count
      within all(".pbButton")[1] do
        click_on "Cancel"
      end
      sleep 10
      count = 0
      0.upto(optionsCount-1) do
        within all(".pbSubsection")[2] do
          click_on "Add"
        end
        sleep 15
        count = count + 1
        first(:xpath, ".//*[contains(@id, 'fieldsName')]").find(:xpath, 'option[1]').select_option
        sleep 15
        begin
          first(:xpath, ".//*[contains(@id, 'FM_sourceFieldId')]").find(:xpath, 'option[2]').select_option
        rescue
          puts "Mapping saved"
        end
        within all(".pbButton")[1] do
          click_on "Save"
        end
        sleep 10
        if count == 5
          break
        end
      end
    end
    puts "Added #{mapping} Fields"
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while adding #{mapping} Fields"
    putstr_withScreen  ex.message
  end
end

And(/^I delete all mapping fields$/) do
  begin
    sleep 5
    fieldPresent = 1
    numSections = all(".pbSubsection").count-1
    0.upto(numSections) do |sectionNum|
      sleep 5
      begin
        if all(".pbSubsection")[sectionNum].all(:link,"Delete").count > 0
          fieldPresent = 1
          all(".pbSubsection")[sectionNum].first(:link,"Delete").click
          sleep 10
        else
          fieldPresent = 0
        end
      end until fieldPresent == 0
    end
    first(".pbButtonb").first(".btn").click
    puts "Mapping fields deleted"
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while deleting mapping Fields"
    putstr_withScreen  ex.message
  end
end


Then(/^I should not able to see the "([^"]*)" mapping$/) do |mapping|
  begin
   sleep 4
   if page.has_content?(mapping)
     puts "Unable to see the #{mapping} mapping"
   else
     putstr "Able to see the #{mapping} mapping"
   end
   sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the #{mapping} mappings"
    putstr_withScreen  ex.message
  end
end

When(/^I click on "([^"]*)" from "([^"]*)" app$/) do |link, app|
  begin
    sleep 3
    if page.has_css?("#userNavButton")
      puts "Successfully see the #{app} app link"
      sleep 3
      first("#userNavButton").click
      sleep 5
      click_on link
      sleep 4
    else
      putstr "Failed to see the #{app} app link"
    end
    puts "Successfully click the #{link} from #{app} app"
  rescue Exception => ex
    putstr "Error occurred while clicking the #{link} from #{app} app"
    putstr_withScreen ex.message
  end
end


And(/^I check the "([^"]*)" settings$/) do |quote|
  begin
    sleep 4
    if page.has_css?(".pbBody")
      within(".pbBody") do
        if page.has_content?(quote)
          puts "Successfully see the #{quote} field"
          sleep 3
          unless first("input")[:disabled] == "true"
            sleep 3
            puts "#{quote} checkbox is enabled mode"
            if first("input").checked?
               puts "#{quote} checkbox is already selected"
            else
              sleep 3
              first("input").click
              puts "#{quote} checkbox is selected"
            end
          else
            putstr "#{quote} checkbox is disabled mode"
         end
        else
          putstr "Failed to see the #{quote} field"
        end
      end
    sleep 3
  else
    puts "#{quote} is not found"
  end
  sleep 3
  rescue Exception => ex
    putstr "Error occurred while checking #{quote} checkbox"
    putstr_withScreen ex.message
  end
end


Then(/^I should able to see the "([^"]*)" mapping$/) do |mapping|
  begin
    sleep 4
    if page.has_content?(mapping)
      puts "Successfully see the #{mapping} mapping"
    else
      putstr "Failed to see the #{mapping} mapping"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the #{mapping} mappings"
    putstr_withScreen  ex.message
  end
end


And(/^I uncheck the "([^"]*)" settings$/) do |quote|
  begin
    sleep 4
    if page.has_css?(".pbBody")
      within(".pbBody") do
        if page.has_content?(quote)
          puts "Successfully see the #{quote} field"
          sleep 3
          unless first("input")[:disabled] == "true"
            sleep 3
            puts "#{quote} checkbox is enabled mode"
            if first("input").checked?
              sleep 3
              find(:xpath,"//*[contains(@id, 'in_tier_pricing')]").click
              puts "#{quote} checkbox is not selected"
            else
              sleep 3
              puts "#{quote} checkbox is not selected"
            end
          else
            putstr "#{quote} checkbox is disabled mode"
          end
        else
          putstr "Failed to see the #{quote} field"
        end
      end
      sleep 3
    else
      puts "#{quote} is not found"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while un-checking #{quote} checkbox"
    putstr_withScreen ex.message
  end
end