#All Service Source setup - Update Opportunity From Assets specific Step definitions
#All Scenario mentioned in UpdateOpportunityFromAssets.feature

And(/^I select Renew View$/) do
  begin
    select "Renew View", :from => "fcf"       
  end
end

And(/^I select the "([^"]*)" checkbox on opp generation$/) do |checkbox_name|
  begin
  sleep 5
  within all(".pbSubsection")[0] do
    within('.detailList') do
    all('input[type=checkbox]').each do |checkbox|
      if checkbox.checked?
        sleep 3
        puts "#{checkbox_name} is already enabled"
      else
        sleep 3
        checkbox.click
        sleep 3
        puts "Enabled the #{checkbox_name}"
        break
      end
    end
   end
  end
  sleep 5
  find(:xpath,"//td[@class='pbButtonb ']/input[1]").click
  sleep 5
  rescue Exception => ex
    putstr "Error occurred while enabled #{checkbox_name} on Opportunity Generation"
    putstr_withScreen  ex.message
  end
end


And(/^I select the "([^"]*)"$/) do |checkbox_name|
  begin
    sleep 5
    within (".detailList") do
      all('input[type=checkbox]').each do |checkbox|
        unless checkbox.checked?
          checkbox.click
          sleep 5
          puts "Enabled the #{checkbox_name}"
          break
        else
          puts "#{checkbox_name} is already enabled"
        end
      end
    end
    sleep 5
    find(:xpath,"//td[@class='pbButtonb ']/input[1]",:wait => 50).click
    sleep 5
    rescue Exception => ex
    putstr "Error occurred while enabled #{checkbox_name}"
    putstr_withScreen  ex.message
 end
end


And(/^I add multiple criteria for asset fields and clear filter logic$/) do
  begin
    sleep 5
    arg = getDetails "AssetDetails"
    all(:xpath,'//td/input[@value="Add Criteria"]')[0].click
    sleep 5
    within all(".pbBody")[2] do
      sleep 5
      filter_data = '//div/div/div[1]/a'
      if "#{all(:xpath,filter_data)[1].text}".to_s == arg["AddFilterLogicAssetText"].to_s
        sleep 5
        all(:xpath,filter_data)[1].click
      else
        sleep 5
        all(:xpath,filter_data)[1].click
        sleep 5
        all(:xpath,filter_data)[1].click
      end
    end
    sleep 5
    within(".Asset_To_Renew_Opportunity_Product") do
      expect(first("input").value).to eq(arg["FilterLogic"])
    end
    sleep 5
    all(:xpath, ".//*[contains(@id, 'slFieldId')]")[0].select arg["FirstAssetFieldValue"]
    sleep 5
    all(:xpath, ".//*[contains(@id, 'outOperator')]")[0].select arg["AllAssetOperator"]
    sleep 5
    all(:xpath,'//td/input[@value="Add Criteria"]')[0].click
    sleep 5
    puts "Successfully created multiple asset fields and match the default filter logic"
  rescue Exception => ex
    putstr "Error occurred while creating multiple asset fields and match the default filter logic"
    putstr_withScreen  ex.message
  end
end


And(/^I add asset criteria and multiple filter logic "([^"]*)" and "([^"]*)"$/) do |asset_filter1, asset_filter2|
  begin
    sleep 8
    arg = getDetails "AssetDetails"
    arg2 = getReference "AssetDetails"
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
        all(:xpath, ".//*[contains(@id, 'outValue')]")[1].send_keys arg2["SecondAssetValue"]
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
        find(:xpath,"//td[@class='pbButtonb ']/input[1]",:wait => 50).click
        sleep 5
      end
     end
    within all(".pbBody")[2] do
      sleep 8
      filter_data = '//div/div/div[1]/a'
      if "#{all(:xpath,filter_data)[1].text}".to_s == arg["AddFilterLogicAssetText"].to_s
        sleep 6
        all(:xpath,'//tbody/tr[position() <= 2]/td[6]', :visible => false).each do |asset|
          if asset['style'] == arg["AndVisibleAssetText"]
            puts "Successfully see the AND text"
            break
          else
            puts "Failed to see the AND text"
          end
        end
        sleep 5
        all(:xpath,filter_data)[1].click
      else
        sleep 5
        all(:xpath,filter_data)[1].click
        sleep 5
        all(:xpath,'//tbody/tr[position() <= 2]/td[6]', :visible => false).each do |asset|
        if asset['style'] == arg["AndVisibleAssetText"]
          puts "Successfully see the AND text"
          break
         else
          puts "Failed to see the AND text"
        end
       end
        sleep 5
        all(:xpath,filter_data)[1].click
      end
  end
    sleep 5
    page.find('.Asset_To_Renew_Opportunity_Product_filterText').send_keys [:control, 'a'], :backspace
    sleep 5
    page.find('.Asset_To_Renew_Opportunity_Product_filterText').set asset_filter1
    sleep 5
    find(:xpath,"//td[@class='pbButtonb ']/input[1]",:wait => 50).click
    sleep 5
    page.find('.Asset_To_Renew_Opportunity_Product_filterText').send_keys [:control, 'a'], :backspace
    sleep 5
    page.find('.Asset_To_Renew_Opportunity_Product_filterText').set asset_filter2
    sleep 5
    find(:xpath,"//td[@class='pbButtonb ']/input[1]",:wait => 50).click
    sleep 5
    puts "Successfully created Add Asset Criteria fields and Multiple Filters Logic"
  rescue Exception => ex
    putstr "Error occurred while add filter and save record for Assert criteria."
    putstr_withScreen  ex.message
  end
end

And(/^I go to existing opportunities$/) do
  begin
    
    sleep 6
       arg = getReference "AssetDetails"
       find('#fcf').select "My Opportunities"
       sleep 5
       #within (".fBody") do
        click_button 'Go!'
       #end
       sleep 10
       if page.has_css?(".listItemPad")
         sleep 4
         puts "Successfully see the Alphabetic Pagination"
         all(".listItemPad")[13].click
         sleep 8
         all(".selectArrow")[0].click
         sleep 8
         within(".bottomNav") do
           first("table").all("tr")[4].click
         end
       else
         putstr "Failed to see the Alphabetic Pagination"
       end
    
        find(:xpath, "(//input[@type='checkbox'])[2]").set(true)
        puts "Successfully selected the Standard Pricebook Opportunity"
        find(:xpath, "(//input[@type='checkbox'])[3]").set(true)
        puts "Successfully selected the Test Pricebook Opportunity"
       
       click_on "Merge"
       puts "Clicked on Merge Button"
       sleep 10
       
  end
end

And(/^I go to existing renewal opportunities$/) do
  begin
   sleep 6
   arg = getReference "AssetDetails"
   find('#fcf').select "My Opportunities"
   sleep 5
#   within (".fBody") do
#    click_button 'Go!'
#   end
    if page.has_xpath?('//input[@name="go"]')
      first(:button, "Go").click
    end
   sleep 10
   if page.has_css?(".listItemPad")
     sleep 4
     puts "Successfully see the Alphabetic Pagination"
     all(".listItemPad")[17].click
     sleep 8
     all(".selectArrow")[0].click
     sleep 8
     within(".bottomNav") do
       first("table").all("tr")[4].click
     end
   else
     putstr "Failed to see the Alphabetic Pagination"
   end
   sleep 10
   result = false
   all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
     if activity.text.include? arg["OpportunityName"]
       puts "Successfully match the Renewal Opportunity name"
       activity.click
       puts "Successfully opened the #{arg["OpportunityName"]} Renewal Opportunity"
       result = true
       break
     end
   end
   putstr "Unable to find the #{arg["OpportunityName"]} Renewal Opportunity" unless result
   $before_total_amount = find(:id,"opp7_ileinner").text
   puts "$before_total_amount = " 
   puts $before_total_amount
  rescue Exception => ex
    putstr "Error occurred while clicking on existing #{arg["OpportunityName"]} Renewal Opportunity page"
    putstr_withScreen  ex.message
 end
end

And(/^I go to the existing renewal opportunities$/) do
  begin
   sleep 6
   arg = getReference "AssetDetails"
   find('#fcf').select "My Opportunities"
   sleep 5
   within (".fBody") do
    click_button 'Go!'
   end
   sleep 10
   if page.has_css?(".listItemPad")
     sleep 4
     puts "Successfully see the Alphabetic Pagination"
     all(".listItemPad")[17].click
     sleep 8
     all(".selectArrow")[0].click
     sleep 8
     within(".bottomNav") do
       first("table").all("tr")[4].click
     end
   else
     putstr "Failed to see the Alphabetic Pagination"
   end
   sleep 10
   result = false
   all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
     if activity.text.include? arg["OpportunityName"]
       puts "Successfully match the Renewal Opportunity name"
       activity.click
       puts "Successfully opened the #{arg["OpportunityName"]} Renewal Opportunity"
       result = true
       break
     end
   end
   putstr "Unable to find the #{arg["OpportunityName"]} Renewal Opportunity" unless result
   $after_total_amount = find(:id,"opp7_ileinner").text
     puts "$after_total_amount = " 
     puts $after_total_amount

  rescue Exception => ex
    putstr "Error occurred while clicking on existing #{arg["OpportunityName"]} Renewal Opportunity page"
    putstr_withScreen  ex.message
 end
end

And(/^I open the asset$/) do
  begin
    within all(".pbSubsection")[0] do
      sleep 5
      $before_updated_renewal_target = all("tr")[4].all("td")[2].text
      $before_updated_probability = all("tr")[5].all("td")[2].text
      sleep 3
    end
    $before_updated_amount = first("#opp7_ileinner").text
    sleep 5
    first(:xpath,"//table[@class='list']/tbody/tr[2]/td[3]/a",:wait => 40).click
    sleep 5
    puts "Successfully opened Asset page"
  rescue Exception => ex
    putstr "Error occurred while click on Asset link"
    putstr_withScreen  ex.message
  end
end

And(/^I click on asset link$/) do
  begin
    sleep 5
    arg = getDetails "AddOnRenewalOpportunity"
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    sleep 5
    within all(".pbSubsection")[0] do
      sleep 3
      find("#opp11").select arg["SourceOpportunityStageValue"]
    end
    sleep 5
    within("#bottomButtonRow") do
      sleep 3
      click_on 'Save'
    end
    within all(".pbSubsection")[0] do
    sleep 5
    $before_updated_renewal_target = all("tr")[4].all("td")[2].text
    $before_updated_probability = all("tr")[5].all("td")[2].text
    sleep 3
    end
    $before_updated_amount = first("#opp7_ileinner").text
    sleep 5
   first(:xpath,"//table[@class='list']/tbody/tr[2]/td[3]/a",:wait => 40).click
   sleep 5
   puts "Successfully opened Asset page"
  rescue Exception => ex
    putstr "Error occurred while click on Asset link"
    putstr_withScreen  ex.message
  end
end

And(/^I update the asset as per criteria set for asset field on opportunity generation$/) do
  begin
  arg = getDetails "AssetDetails"
  within("#bottomButtonRow") do
    click_on ' Edit '
    sleep 5
  end
  $priceofasset = find(:id, "Price").value.delete(',').to_i
#  puts find(:id, "Price").value
#  
#    puts $priceofasset
#    puts arg["AssetPrice"]
#    puts $priceofasset == arg["AssetPrice"]
#    puts arg["AssetNewPrice"]
#    puts $priceofasset == arg["AssetNewPrice"]
  
    if $priceofasset == arg["AssetPrice"]
    
  fill_in "Price",:with => arg["AssetNewPrice"]
  elsif $priceofasset == arg["AssetNewPrice"]
    
    fill_in "Price",:with => arg["AssetPrice"]
  end
  sleep 1
  
  first("#bottomButtonRow").click_on ' Save '
  sleep 5
  puts "Successfully updated the Asset criteria"
  rescue Exception => ex
    putstr "Error occurred while updating the Asset criteria on Opportunity Generation"
    putstr_withScreen  ex.message
  end
end

Then(/^I should see the Metrics fields values are recalculated on the opportunity$/) do
begin
  sleep 5
  within all(".pbSubsection")[0] do
  after_updated_renewal_target = all("tr")[4].all("td")[2].text
  after_updated_probability = all("tr")[5].all("td")[2].text
  unless $before_updated_renewal_target != after_updated_renewal_target
    puts "Successfully updated the Renewal Opportunity renewal target"
  else
    putstr "Failed to updated the Renewal Opportunity renewal target. Expected: #{$before_updated_renewal_target}, Actual: #{after_updated_renewal_target}"
  end
  sleep 5
#  unless $before_updated_probability == after_updated_probability
#    puts "Successfully updated the Renewal Opportunity probability"
#  else
#    putstr "Failed to updated the Renewal Opportunity probability. Expected: #{$before_updated_probability}, Actual: #{after_updated_probability}"
#  end
 end
 rescue Exception => ex
  putstr "Error occurred while Renewal Relationship & Metrics fields values are recalculated on the Opportunity"
  putstr_withScreen  ex.message
end
end

Then(/^I should see the renewal relationship & Metrics fields values are recalculated on the opportunity$/) do
  begin
    sleep 5
    arg = getDetails "AddOnRenewalOpportunity"
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    sleep 5
    within all(".pbSubsection")[0] do
      sleep 3
      find("#opp11").select arg["SourceOpportunityStageValue1"]
     end
    sleep 5
    within("#bottomButtonRow") do
      sleep 3
      click_on 'Save'
    end
    sleep 5
    within all(".pbSubsection")[0] do
    after_updated_renewal_target = all("tr")[4].all("td")[2].text
    after_updated_probability = all("tr")[5].all("td")[2].text
    unless $before_updated_renewal_target != after_updated_renewal_target
      puts "Successfully updated the Renewal Opportunity renewal target"
    else
      putstr "Failed to updated the Renewal Opportunity renewal target. Expected: #{$before_updated_renewal_target}, Actual: #{after_updated_renewal_target}"
    end
    sleep 5
    unless $before_updated_probability == after_updated_probability
      puts "Successfully updated the Renewal Opportunity probability"
    else
      putstr "Failed to updated the Renewal Opportunity probability. Expected: #{$before_updated_probability}, Actual: #{after_updated_probability}"
    end
   end
   rescue Exception => ex
    putstr "Error occurred while Renewal Relationship & Metrics fields values are recalculated on the Opportunity"
    putstr_withScreen  ex.message
  end
end


And(/^I unselect the "([^"]*)"$/) do |checkbox_name|
  begin
  sleep 5
    arg = getDetails "AssetDetails"
    within (".detailList") do
      all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["AssetContractCheckboxIndex"].to_i
          sleep 5
          unless checkbox.checked?
            checkbox.click
            puts "Enabled the #{checkbox_name}"
          else
            puts "#{checkbox_name} is already enabled"
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
    putstr "Error occurred while selecting the checkbox #{checkbox_name}"
    putstr_withScreen  ex.message
  end
end


Then(/^I should not able to see the updated renewal opportunity$/) do
  begin
    sleep 6
    within all(".pbSubsection")[1] do
      within all(".inlineEditLock")[1] do
        after_updated_conversion_rate = first("div").text
        if $before_updated_conversion_rate.to_i == after_updated_conversion_rate.to_i
          puts "Not updated the renewal opportunity conversion rate"
        else
          putstr "Updated the renewal opportunity conversion rate"
        end
      end
    end

    sleep 5
    within ("#opp7_ilecell") do
      sleep 5
      after_updated_amount = first("#opp7_ileinner").text
      if $before_updated_amount.to_i == after_updated_amount.to_i
        puts "Not updated the renewal opportunity amount"
      else
        puts "Updated the renewal opportunity amount"
      end
    end

  rescue Exception => ex
    putstr "Error occurred while updating the renewal opportunity"
    putstr_withScreen  ex.message
  end
end