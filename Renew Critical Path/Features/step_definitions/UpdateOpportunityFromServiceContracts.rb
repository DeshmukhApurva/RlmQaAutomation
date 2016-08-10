#All Service Source setup - Update Opportunity From Service Contracts specific Step definitions
#All Scenario mentioned in UpdateOpportunityFromServiceContracts.feature

And(/^I select the "([^"]*)" checkbox$/) do |service_contracts|
  begin
    sleep 5
    arg = getDetails "ServiceContractDetails"
    within (".detailList") do
       all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["ServiceContractCheckboxIndex"].to_i
          sleep 6
          unless checkbox.checked?
             checkbox.click
             puts "enabled the #{service_contracts}"
          else
            puts "#{service_contracts} is already enabled"
          end
        else
          # puts "#{index}"
        end
      end
    end
    sleep 5
    find(:xpath,"//td[@class='pbButtonb ']/input[1]",:wait => 50).click
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while enabled the #{service_contracts}"
  putstr_withScreen  ex.message
  end
end



And(/^I add multiple criteria for service contract line item fields and clear filter logic$/) do
  begin
    sleep 5
    arg = getDetails "ServiceContractDetails"
    all(:xpath,'//td/input[@value="Add Criteria"]')[1].click
    sleep 6
    within all(".pbBody")[2] do
      sleep 5
      filter_data = '//div/div/div[1]/a'
      if "#{all(:xpath,filter_data)[2].text}".to_s == arg["AddFilterLogicText"].to_s
        sleep 5
        all(:xpath,filter_data)[2].click
      else
        sleep 5
        all(:xpath,filter_data)[2].click
        sleep 5
        all(:xpath,filter_data)[2].click
      end
    end
    sleep 5
    all(:xpath, ".//*[contains(@id, 'slFieldId')]")[3].find(:xpath, 'option[11]').select_option
    sleep 5
    all(:xpath, ".//*[contains(@id, 'outOperator')]")[3].find(:xpath, 'option[11]').select_option
    sleep 5
    all(:xpath,'//td/input[@value="Add Criteria"]')[1].click
    sleep 5
    puts "Successfully created multiple asset fields and match the default filter logic"
  rescue Exception => ex
    putstr "Error occurred while creating multiple asset fields and match the default filter logic"
  putstr_withScreen  ex.message
  end
end



And(/^I add asset criteria and multiple filters logic "([^"]*)" and "([^"]*)"$/) do |service_contracts1, service_contracts2|
   begin
   sleep 6
   arg = getDetails "ServiceContractDetails"
   within all(".pbBody")[2] do
     within(".list") do
   sleep 5
   all(:xpath, ".//*[contains(@id, 'slFieldId')]")[0].select arg["FirstServiceFieldValue"]
   sleep 5
   all(:xpath, ".//*[contains(@id, 'outOperator')]")[0].select arg["FirstServiceOperator"]
   sleep 5
   all(:xpath, ".//*[contains(@id, 'outValue')]")[0].send_keys [:control, 'a'], :backspace
   sleep 5
   all(:xpath, ".//*[contains(@id, 'outValue')]")[0].send_keys arg["FirstServiceValue"]
   sleep 5
   all(:xpath, ".//*[contains(@id, 'slFieldId')]")[1].select arg["SecondServiceFieldValue"]
   sleep 5
   all(:xpath, ".//*[contains(@id, 'outOperator')]")[1].select arg["SecondServiceOperator"]
   sleep 5
   all(:xpath, ".//*[contains(@id, 'outValue')]")[1].send_keys [:control, 'a'], :backspace
   sleep 5
   all(:xpath, ".//*[contains(@id, 'outValue')]")[1].send_keys arg["SecondServiceValue"]
   sleep 5
   all(:xpath, ".//*[contains(@id, 'slFieldId')]")[2].select arg["ThirdServiceFieldValue"]
   sleep 5
   all(:xpath, ".//*[contains(@id, 'outOperator')]")[2].select arg["ThirdServiceOperator"]
   sleep 5
   all(:xpath, ".//*[contains(@id, 'outValue')]")[2].send_keys [:control, 'a'], :backspace
   sleep 5
   all(:xpath, ".//*[contains(@id, 'outValue')]")[2].send_keys arg["ThirdServiceValue"]
   sleep 5
     end
   end
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
    sleep 6
    page.find('.Contract_Line_Item_To_Renew_Opportunity_Product_filterText').send_keys [:control, 'a'], :backspace
    sleep 5
    page.find('.Contract_Line_Item_To_Renew_Opportunity_Product_filterText').set service_contracts1
    sleep 5
    find(:xpath,"//td[@class='pbButtonb ']/input[1]",:wait => 50).click
    sleep 5
    page.find('.Contract_Line_Item_To_Renew_Opportunity_Product_filterText').send_keys [:control, 'a'], :backspace
    sleep 5
    page.find('.Contract_Line_Item_To_Renew_Opportunity_Product_filterText').set service_contracts2
    sleep 5
    find(:xpath,"//td[@class='pbButtonb ']/input[1]",:wait => 50).click
    sleep 5
    puts "Successfully created Service Contract Line Item Fields and Multiple Filters Logic"
   rescue Exception => ex
     putstr "Error occurred while creating Service Contract Line Item Fields and Multiple Filters Logic"
   putstr_withScreen  ex.message
  end
end



And(/^I unselect the "([^"]*)" checkbox on opp generation$/) do |service_contracts|
  begin
    sleep 6
    within all(".pbSubsection")[0] do
      all('input[type=checkbox]').each do |checkbox|
        if checkbox[:checked].to_s == "true".to_s
          sleep 5
          puts "#{service_contracts} is already enabled"
          checkbox.click
          sleep 5
          puts "enabled the #{service_contracts}"
          break
        else
          sleep 5
          puts "#{service_contracts} is already enabled"
        end
      end
    end
    sleep 5
    find(:xpath,"//td[@class='pbButtonb ']/input[1]").click
    sleep 6
  rescue Exception => ex
    putstr "Error occurred while enabled the #{service_contracts}"
  putstr_withScreen  ex.message
  end
end


And(/^I unselect the "([^"]*)" checkbox$/) do |service_contracts|
  begin
    sleep 6
    arg = getDetails "ServiceContractDetails"
    within (".detailList") do
      all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["ServiceContractCheckboxIndex"].to_i
          sleep 6
          unless checkbox.checked?
            checkbox.click
            puts "enabled the #{service_contracts}"
          else
            puts "#{service_contracts} is already enabled"
          end
        else
          # puts "#{index}"
        end
      end
    end
    sleep 5
    find(:xpath,"//td[@class='pbButtonb ']/input[1]",:wait => 50).click
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while enabled the #{service_contracts}"
  putstr_withScreen  ex.message
  end
end


And(/^I enter mandatory details$/) do
  begin
    sleep 5
    arg = getReference "ServiceContractDetails"
    within all(".pbSubsection")[0] do
      sleep 3
      all("input[type='text']")[0].set arg["ServiceContractName"]
      sleep 4
      all("input[type='text']")[3].set arg["ServiceContractAccountName"]
      sleep 3
    end
    sleep 5
    within("#bottomButtonRow") do
      click_on 'Save'
    end
    sleep 3
    puts "Successfully created the new service contract"
  rescue Exception => ex
    putstr "Error occurred while entering the mandatory details in new service contract page"
  putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the created "([^"]*)"$/) do |service_contract|
  begin
    sleep 6
    arg = getDetails "ServiceContractDetails"
    arg2 = getReference "ServiceContractDetails"
    new_service_contract_name= find(".pageDescription").text
    if new_service_contract_name.strip.to_s == arg2["ServiceContractName"].to_s
      puts "Successfully created the new #{new_service_contract_name} service contract"
    else
      putstr "Failed to created the new #{new_service_contract_name} service contract"
    end
    sleep 5
    within all(".pbSubsection")[0] do
      sleep 4
      line_items = all("tr")[5].all("td")[2].text
      unless line_items.to_s == arg["ServiceContractLineItem"].to_s
        putstr "Failed to see the #{line_items} filed"
      else
        puts "Successfully see the #{line_items} filed"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying #{service_contract} details"
    putstr ex.messag e
  end
end


And(/^I click on service contract link$/) do
  begin
    sleep 6
   # find(:xpath, "//th[text()='Service Contract']").find(:xpath, '..').all(:xpath, "following-sibling::tr/td[9]/a")[1].click
   find(:xpath,"//table[@class='list']/tbody/tr[2]/td[9]/a").click
    puts "Clicked on the SC"
    sleep 3
    puts "Successfully open the service contract page"
    
  rescue Exception => ex
    putstr "Error occurred while clicking on service contract link"
  putstr_withScreen  ex.message
  end
end

And(/^I update the service contract line item fields$/) do
  begin
    arg = getDetails "ServiceContractDetails"
    within("#bottomButtonRow") do
      click_on ' Edit '
      sleep 5
    end
    fill_in "Term (months)",:with => arg["ServiceContractTerm"]
    sleep 5
    fill_in "Shipping and Handling",:with => arg["ServiceContractShippingAndHandling"]
    sleep 5
    fill_in "Tax",:with => arg["ServiceContractTax"]
    sleep 6
    first("#bottomButtonRow").click_on ' Save '
    sleep 5
    puts "Successfully updated the service contract criteria"
  rescue Exception => ex
    putstr "Error occurred while updating the Service Contract line item fields"
  putstr_withScreen  ex.message
  end
end


Then(/^I verify that renewal opportunity update accordingly$/) do
  begin
    sleep 6
    arg = getDetails "ServiceContractDetails"
    within all(".pbSubsection")[0] do
      updated_term_months = all("tr")[3].all("td")[3].text
      if updated_term_months == arg["ServiceContractTerm"]
        puts "Successfully updated the service contract line item fields"
      else
        putstr "Failed to updated the service contract line item fields"
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while renewal relationship & Metrics fields values are recalculated on the opportunity"
  putstr_withScreen  ex.message
  end
end
