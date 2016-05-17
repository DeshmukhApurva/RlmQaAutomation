#All Opportunity Management - Search and Add Assets specific Step definitions
#All Scenario mentioned in SearchAndAddAssets.feature

And(/^I add asset "([^"]*)" search criteria$/) do |search_criteria|
  begin
    sleep 6
    within(".pbSubsection") do
      within(".detailList") do
        first("select").select search_criteria
        sleep 3
        puts "Successfully selected the #{search_criteria} search criteria"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{search_criteria} search criteria"
    putstr_withScreen  ex.message
  end
end

And(/^I add asset search criteria and multiple filters "([^"]*)" and "([^"]*)"$/) do |asset_filter1, asset_filter2|
  begin
    sleep 6
    arg = getDetails "AssetDetails"
    sleep 5
    all(:xpath,'//td/input[@value="Add Criteria"]')[0].click
    sleep 5
    within all(".pbBody")[1] do
      within(".list") do
        tr = first("tbody").all(".dataRow")
        (1..3).each do |counter|
          unless tr.count >= 3
            sleep 6
            puts "Count Number:#{counter}"
            all(:xpath,'//td/input[@value="Add Criteria"]')[0].click
            sleep 5
          else
            sleep 5
            all(:xpath, ".//*[contains(@id, 'slFieldId')]")[0].select arg["FirstAssetFieldValue"]
            sleep 5
            all(:xpath, ".//*[contains(@id, 'outOperator')]")[0].select arg["FirstAssetOperator"]
            sleep 5
            all(:xpath, ".//*[contains(@id, 'outValue')]")[0].send_keys [:control, 'a'], :backspace
            sleep 5
            all(:xpath, ".//*[contains(@id, 'outValue')]")[0].send_keys arg["FirstAssetValue"]
            sleep 5
            all(:xpath, ".//*[contains(@id, 'slFieldId')]")[1].select arg["SecondAssetFieldValue"]
            sleep 5
            all(:xpath, ".//*[contains(@id, 'outOperator')]")[1].select arg["SecondAssetOperator"]
            sleep 5
            all(:xpath, ".//*[contains(@id, 'outValue')]")[1].send_keys [:control, 'a'], :backspace
            sleep 5
            all(:xpath, ".//*[contains(@id, 'outValue')]")[1].send_keys arg["SecondAssetValue"]
            sleep 5
            all(:xpath, ".//*[contains(@id, 'slFieldId')]")[2].select arg["ThirdAssetFieldValue"]
            sleep 5
            all(:xpath, ".//*[contains(@id, 'outOperator')]")[2].select arg["ThirdAssetOperator"]
            sleep 5
            all(:xpath, ".//*[contains(@id, 'outValue')]")[2].send_keys [:control, 'a'], :backspace
            sleep 5
            all(:xpath, ".//*[contains(@id, 'outValue')]")[2].send_keys arg["ThirdAssetValue"]
            sleep 5
          end
        end
      end
    end
    sleep 5
    all(:xpath,'//td/input[@value="Add Criteria"]')[0].click
    sleep 6
    within all(".pbBody")[1] do
      sleep 8
      filter_data = '//div/div/div[1]/a'
      if "#{all(:xpath,filter_data)[1].text}".to_s == arg["AddFilterLogicAssetText"].to_s
        sleep 6
        all(:xpath,'//tbody/tr[position() <= 2]/td[6]', :visible => false).each do |asset|
          if asset.text.to_s == arg["SearchAndAddAssetVisibleText"].to_s
            puts "Successfully see the AND text"
            break
          else
            putstr "Failed to see the AND text"
          end
        end
        sleep 5
        all(:xpath,filter_data)[1].click
      else
        sleep 5
        all(:xpath,filter_data)[1].click
        sleep 5
        all(:xpath,'//tbody/tr[position() <= 2]/td[6]', :visible => false).each do |asset|
          if asset.text.to_s == arg["SearchAndAddAssetVisibleText"].to_s
            puts "Successfully see the AND text"
            break
          else
            putstr "Failed to see the AND text"
          end
        end
        sleep 5
        all(:xpath,filter_data)[1].click
      end
    end
    sleep 6
    filter_search = '//div/div[1]/span/input'
    find(:xpath,filter_search).send_keys [:control, 'a'], :backspace
    sleep 5
    find(:xpath,filter_search).set asset_filter1
    sleep 5
    find(:xpath,filter_search).send_keys [:control, 'a'], :backspace
    sleep 5
    find(:xpath,filter_search).set asset_filter2
    sleep 5
    puts "Successfully set the add asset search criteria and multiple filters logics"
  rescue Exception => ex
    putstr "Error occurred while add asset search criteria and multiple filters logics"
    putstr_withScreen  ex.message
  end
end


Then(/^I verify the "([^"]*)","([^"]*)" and "([^"]*)" field values$/) do |field_values1, field_values2, field_values3|
  begin
  within all(".pbSubsection")[0] do
    within('.detailList') do
      sleep 5
      result = false
      all(:xpath, ".//*[contains(@id, 'slFieldId')]")[0].all('option').each do |asset|
       if asset.text.to_s.include?field_values1.to_s
          sleep 5
          puts "Successfully find the #{field_values1} field value"
          result = true
          break
       end
      end
      putstr "Unable to find the #{field_values1} field value" unless result
      sleep 5
      result = false
      all(:xpath, ".//*[contains(@id, 'slFieldId')]")[0].all('option').each do |asset|
        if asset.text.to_s.include?field_values2.to_s
          sleep 5
          puts "Successfully find the #{field_values2} field value"
          result = true
          break
        end
      end
      putstr "Unable to find the #{field_values2} field value" unless result
      sleep 5
      result = false
      all(:xpath, ".//*[contains(@id, 'slFieldId')]")[0].all('option').each do |asset|
        if asset.text.to_s.include?field_values3.to_s
          sleep 5
          puts "Successfully find the #{field_values3} field value"
          result = true
          break
        end
      end
      putstr "Unable to find the #{field_values3} field value" unless result
    end
  end
  rescue Exception => ex
  puts "Error while verifying the #{field_values1},#{field_values2} and #{field_values3}"
  putstr_withScreen  ex.message
  end
end

And(/^I select the applicable assets or contract line item$/) do
  begin
   sleep 5
   arg = getDetails "SearchAndAddCriteria"
   within all(".th-inner ")[0] do
    all('input[type=checkbox]').each_with_index do |checkbox , index|
      if index.to_i == arg["AddAssetCheckboxIndex"].to_i
       unless checkbox.checked?
         checkbox.click
         puts "Successfully selected the specific assets or service contract line item"
       else
         puts "Specific asset checkbox is already selected"
       end
     else
       # puts "#{index}"
     end
   end
   end
   sleep 6
  rescue Exception => ex
    putstr "Error occurred while selecting the asset or contract line item"
    putstr_withScreen  ex.message
  end
end

And(/^I select all assets from search and asset page$/) do
  begin
    sleep 6
    unless page.has_content?("No matching records found")
    within all(".th-inner ")[0] do
      all('input[type=checkbox]').each do |checkbox|
        unless checkbox.checked?
          checkbox.click
          sleep 5
          puts "Successfully selected the all assets checkbox"
          break
        else
          puts "All asset checkbox is already selected"
        end
      end
    end
    sleep 4
    else
      putstr "No matching records found"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the all assets checkbox"
    putstr_withScreen  ex.message
  end
end

And(/^I select specific asset from search and asset page$/) do
  begin
   sleep 8
   unless page.has_content?("No matching records found")
   arg = getDetails "SearchAndAddCriteria"
   within(".bootstrap-table") do
     sleep 4
     all(".dropdown-toggle")[0].click
     sleep 4
   end
   within all(".dropdown-menu")[0] do
     all('input[type=checkbox]').each do |checkbox|
       unless checkbox.checked?
           sleep 4
           checkbox.click
           sleep 5
           puts "Successfully selected the assets and service contract line item"
         else
           puts "Assets and Service Contract Line Item checkboxes is already selected"
         end
       end
   end
   sleep 5
   within(".bootstrap-table") do
     sleep 4
     all(".dropdown-toggle")[0].click
     sleep 4
   end
   sleep 6
   all('input[type=checkbox]').each_with_index do |checkbox , index|
     if index.to_i == arg["AddAssetCheckboxIndex"].to_i
       sleep 5
       unless checkbox.checked?
         checkbox.click
         puts "Successfully selected the the asset"
       else
         puts "Asset is already selected"
       end
     else
      # puts "#{index}"
     end
   end
   sleep 4
   else
     putstr "No matching records found"
   end
  rescue Exception => ex
    putstr "Error occurred while selecting the specific asset"
    putstr_withScreen  ex.message
  end
end


And(/^I add renewal relationship criteria and multiple filters "([^"]*)" and "([^"]*)"$/) do |renewal_relationship1 , renewal_relationship2|
  begin
    sleep 6
    arg = getDetails "SearchAndAddCriteria"
    sleep 5
    all(:xpath,'//td/input[@value="Add Criteria"]')[1].click
    sleep 6
    all(:xpath, ".//*[contains(@id, 'slFieldId')]")[3].select arg["RenewalRelationshipFieldValue"]
    sleep 5
    all(:xpath, ".//*[contains(@id, 'outOperator')]")[3].select arg["RenewalRelationshipOperator"]
    sleep 5
    all(:xpath, ".//*[contains(@id, 'outValue')]")[3].send_keys [:control, 'a'], :backspace
    sleep 5
    all(:xpath, ".//*[contains(@id, 'outValue')]")[3].send_keys arg["RenewalRelationshipValue"]
    sleep 5
    all(:xpath, ".//*[contains(@id, 'slFieldId')]")[4].select arg["RenewalRelationshipFieldValue"]
    sleep 5
    all(:xpath, ".//*[contains(@id, 'outOperator')]")[4].select arg["RenewalRelationshipOperator"]
    sleep 5
    all(:xpath, ".//*[contains(@id, 'outValue')]")[4].send_keys [:control, 'a'], :backspace
    sleep 5
    all(:xpath, ".//*[contains(@id, 'outValue')]")[4].send_keys arg["RenewalRelationshipValue1"]
    sleep 5
    all(:xpath, ".//*[contains(@id, 'slFieldId')]")[5].select arg["RenewalRelationshipFieldValue"]
    sleep 5
    all(:xpath, ".//*[contains(@id, 'outOperator')]")[5].select arg["RenewalRelationshipOperator"]
    sleep 5
    all(:xpath, ".//*[contains(@id, 'outValue')]")[5].send_keys [:control, 'a'], :backspace
    sleep 5
    all(:xpath, ".//*[contains(@id, 'outValue')]")[5].send_keys arg["RenewalRelationshipValue2"]
    sleep 5
    within all(".pbBody")[2] do
      sleep 6
      filter_data = '//div/div/div[1]/a'
      if "#{all(:xpath,filter_data)[2].text}".to_s == arg["AddFilterLogicText"].to_s
        sleep 5
        all(:xpath,'//tbody/tr[position() <= 2]/td[6]', :visible => false).each do |asset|
          if asset['style'][3] == arg["AndVisibleServiceText"]
            puts "Successfully see the AND text"
            break
          else
            puts "Failed to see the AND text"
          end
        end
        sleep 5
        all(:xpath,filter_data)[2].click
      else
        sleep 5
        all(:xpath,filter_data)[2].click
        sleep 6
        all(:xpath,'//tbody/tr[position() <= 2]/td[6]', :visible => false).each do |asset|
          if asset['style'][3] == arg["AndVisibleAssetText"]
            puts "Successfully see the AND text"
            break
          else
            puts "Failed to see the AND text"
          end
        end
        sleep 5
        all(:xpath,filter_data)[2].click
      end
    end
    sleep 5
    filter_data = '//div/div/div[1]/a'
    all(:xpath,filter_data)[2].click
    sleep 5
    find(".SearchAddInstallBaseCLIRenewal__filterText").send_keys [:control, 'a'], :backspace
    sleep 5
    find(".SearchAddInstallBaseCLIRenewal__filterText").set renewal_relationship1
    sleep 5
    find(".SearchAddInstallBaseCLIRenewal__filterText").send_keys [:control, 'a'], :backspace
    sleep 5
    find(".SearchAddInstallBaseCLIRenewal__filterText").set renewal_relationship2
    sleep 5
    puts "Successfully added the renewal relationship criteria"
  rescue Exception => ex
    putstr "Error occurred while adding the renewal relationship criteria"
    putstr_withScreen  ex.message
  end
end


Then(/^I verify the "([^"]*)" and "([^"]*)" field values$/) do |field_values1 , field_values2|
  begin
    sleep 5
    arg = getDetails "AssetDetails"
    within all(".pbSubsection")[0] do
      within('.detailList') do
        sleep 5
        result = false
        find(:xpath, ".//*[contains(@id, 'theObject')]").all('option').each do |asset|
          if asset.text.to_s.include?field_values1.to_s
            sleep 5
            puts "Successfully find the #{field_values1} field value"
            result = true
            break
          end
        end
        putstr "Unable to find the #{field_values1} field value" unless result
        sleep 5
        result = false
        find(:xpath, ".//*[contains(@id, 'theObject')]").all('option').each do |asset|
          if asset.text.to_s.include?field_values2.to_s
            sleep 5
            puts "Successfully find the #{field_values2} field value"
            result = true
            break
          end
        end
        putstr "Unable to find the #{field_values2} field value" unless result
      end
    end

    within all(".pbBody")[1] do
      within(".list") do
       sleep 5
       all(:xpath, ".//*[contains(@id, 'slFieldId')]")[0].select arg["SecondAssetFieldValue"]
       sleep 5
       all(:xpath, ".//*[contains(@id, 'outOperator')]")[0].select arg["FirstAssetOperator"]
       sleep 5
       end
     end
     sleep 5
  rescue Exception => ex
    puts "Error while verifying the #{field_values1} and #{field_values2}"
    putstr_withScreen  ex.message
  end
end

Then(/^I should be able to see the "([^"]*)" message$/) do |message|
  begin
  sleep 5
  within(".bootstrap-table") do
    sleep 4
    no_records_found = find(".no-records-found").first("td").text
    sleep 4
    if no_records_found.to_s == message.to_s
      puts "Successfully find the #{message} message"
    else
      putstr "Failed to find the #{message} message"
    end
    sleep 4
  end
  rescue Exception => ex
    puts "Error while verifying the #{message} message"
    putstr_withScreen  ex.message
  end
end


And(/^I select specific service contract line item$/) do
  begin
    sleep 8
    unless page.has_content?("No matching records found")
    arg = getDetails "SearchAndAddCriteria"
    within(".bootstrap-table") do
      sleep 4
      all(".dropdown-toggle")[0].click
      sleep 4
    end
    within all(".dropdown-menu")[0] do
      all('input[type=checkbox]').each do |checkbox|
        unless checkbox.checked?
          sleep 4
          checkbox.click
          sleep 5
          puts "Successfully selected the assets and service contract line item"
        else
          puts "assets and service contract line item checkboxes is already selected"
        end
      end
    end
    sleep 5
    arg = getDetails "SearchAndAddCriteria"
    within(".bootstrap-table") do
      sleep 4
      all(".dropdown-toggle")[0].click
      sleep 4
    end
    sleep 5
    all('input[type=checkbox]').each_with_index do |checkbox , index|
      if index.to_i == arg["AddServiceContractCheckboxIndex"].to_i
        sleep 5
        unless checkbox.checked?
          checkbox.click
          puts "Successfully selected the Service Contract line item"
        else
          puts "Service Contract line item is already selected"
        end
      else
        #puts "#{index}"
      end
    end
    sleep 4
    else
      putstr "No matching records found"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the service contract line item"
    putstr_withScreen  ex.message
  end
end

And(/^I select asset from search and asset page$/) do
  begin
    sleep 8
    unless page.has_content?("No matching records found")
    arg = getDetails "SearchAndAddCriteria"
    within(".bootstrap-table") do
      sleep 4
      all(".dropdown-toggle")[0].click
      sleep 4
    end
    within all(".dropdown-menu")[0] do
      all('input[type=checkbox]').each do |checkbox|
        unless checkbox.checked?
          sleep 4
          checkbox.click
          sleep 5
          puts "Successfully selected the Assets and Service Contract line item"
        else
          puts "Assets and Service Contract line item checkboxes is already selected"
        end
      end
    end
    sleep 5
    within(".bootstrap-table") do
      sleep 4
      all(".dropdown-toggle")[0].click
      sleep 4
    end
    sleep 5
    all('input[type=checkbox]').each_with_index do |checkbox , index|
      if index.to_i == arg["AddAssetCheckboxIndex"].to_i
        sleep 5
        unless checkbox.checked?
          checkbox.click
          puts "Successfully selected the the asset"
        else
          puts "Asset is already selected"
        end
    else
      #puts "#{index}"
      end
    end
    sleep 4
  else
    putstr "No matching records found"
  end
   sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the specific asset"
    putstr_withScreen  ex.message
  end
end

And(/^I click on "([^"]*)" and verify the opportunity$/) do |button_text|
  begin
    sleep 4
    unless page.has_content?("No matching records found")
    sleep 3
    click_on button_text
    sleep 5
    puts "Successfully click the #{button_text} button"
    sleep 4
    else
      putstr "No matching records found"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{button_text} button"
    putstr_withScreen  ex.message
  end
end