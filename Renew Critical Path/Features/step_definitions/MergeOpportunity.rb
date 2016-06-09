#All Opportunity Management - Merge Opportunity specific Step definitions
#All Scenario mentioned in MergeOpportunity.feature

And(/^I click on "([^"]*)" button from opportunity page$/) do |button_text|
  begin
  sleep 5
  within (".fBody") do
    click_button button_text
    sleep 6
    puts "Successfully click the #{button_text} button"
  end
  rescue Exception => ex
    putstr "Error occurred while clicking on the #{button_text} button"
    putstr ex.message
  end
end


And(/^I click on "([^"]*)" button from "([^"]*)" page$/) do |button_text, merge_opportunity|
  begin
    sleep 5
    within(".pbHeader") do
      sleep 3
      click_on button_text
      sleep 5
    end
    puts "Successfully set the #{merge_opportunity} page and click the #{button_text} button"
  rescue Exception => ex
    putstr "Error occurred while clicking on the #{button_text} button"
    putstr_withScreen  ex.message
  end
end


And(/^I select the opportunities$/) do
  begin
    sleep 10
    within(".x-panel-bwrap") do
      sleep 5
      opportunity_checkbox = all(:xpath, '//div/table/tbody/tr/td[1]/div/input')
      sleep 5
      edit_action = all(:xpath, '//div/table/tbody/tr/td[3]/div/a[1]/span')
      sleep 5
      delete_action = all(:xpath, '//div/table/tbody/tr/td[3]/div/a[2]/span')
      sleep 5
      opportunity_name = all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span')
      sleep 5
      account_name = all(:xpath, '//div/table/tbody/tr/td[5]/div/a/span')
      sleep 5
      amount = all(:xpath, '//div/table/tbody/tr/td[6]/div')
      sleep 5
      close_date = all(:xpath, '//div/table/tbody/tr/td[7]/div')
      sleep 5
      stage = all(:xpath, '//div/table/tbody/tr/td[8]/div')
      sleep 5
      opportunity_owner_alias = all(:xpath, '//div/table/tbody/tr/td[9]/div')
      sleep 5
      $product = []
      sleep 5
      opportunity_checkbox.each_with_index do |product , i|
        $product << {
            'opportunity_checkbox' => opportunity_checkbox[i],
            'edit_action' => edit_action[i],
            'delete_action' => delete_action[i],
            'opportunity_name' => opportunity_name[i].text,
            'account_name' => account_name[i],
            'amount' => amount[i].text,
            'close_date' => close_date[i].text,
            'stage' => stage[i].text,
            'opportunity_owner_alias' => opportunity_owner_alias[i].text,
        }
      end
      $product
    end
  rescue Exception => ex
    putstr "Error occurred while reading the opportunity records"
    putstr_withScreen  ex.message
  end
end



And(/^I select the opportunities those are having same currency and same pricebook$/) do
  begin
    sleep 10
    arg = getReference "MergeOpportunity"
    count = 0
    $product.each do |product|
      sleep 5
      if product['amount'].to_s.include? arg["CurrencyCode"].to_s
        puts "Successfully see the same currency opportunity"
        count = count + 1
        product['opportunity_checkbox'].click
        puts "Successfully selected the same currency opportunity"
        if count ==2
          break
        end
      else
        puts "Failed to see the same currency opportunity"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the same currency and same pricebook"
    putstr_withScreen  ex.message
  end
end


And(/^I select more than two opportunities$/) do
  begin
    within (".x-panel-bwrap") do
      all('input[type=checkbox]').each do |checkbox|
        unless checkbox.checked?
          checkbox.click
          sleep 5
          puts "Successfully enabled the opportunity checkbox"
        else
        #  puts "opportunity checkbox is already enabled"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the more than two opportunities"
    putstr_withScreen  ex.message
  end
end


Then(/^I should able to see the "([^"]*)" message$/) do |alert_message|
  begin
    sleep 5
    if page.driver.browser.switch_to.alert.text.to_s == alert_message.to_s
      puts "Successfully see the #{alert_message} message"
      page.driver.browser.switch_to.alert.accept
    else
      putstr "Failed to see the #{alert_message} message"
    end
  rescue Exception => ex
    putstr "Error occurred while validating #{alert_message} message"
    putstr_withScreen  ex.message
  end
end


And(/^I select two opportunities$/) do
  begin
    sleep 6
    arg = getDetails "MergeOpportunity"
    within(".x-grid3-scroller") do
      all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["FirstOpportunityCheckboxIndex"].to_i
          sleep 5
          unless checkbox.checked?
            checkbox.click
            puts "Successfully enabled the opportunity"
            break
          else
            puts "Opportunity is already enabled"
          end
        else
          # puts "#{index}"
        end
      end
    end
    sleep 5
    within(".x-grid3-scroller") do
      all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["SecondOpportunityCheckboxIndex"].to_i
          sleep 5
          unless checkbox.checked?
            checkbox.click
            puts "Successfully enabled the opportunity"
            break
          else
            puts "Opportunity is already enabled"
          end
        else
          # puts "#{index}"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the two opportunities"
    putstr_withScreen  ex.message
  end
end


And(/^I select the master record from "([^"]*)" page$/) do |merge_opportunity|
  begin
    sleep 6
    within("#updateableColumns") do
      within all("tr")[49] do
       price_book = find("th").text
       master_record = all("td")[0].text
       second_record = all("td")[1].text
       if master_record.to_s == second_record.to_s
         puts "Successfully see the same #{price_book}"
       else
         puts "Failed to see the same #{price_book}"
       end
      end
     end
    sleep 5
    within("#updateableColumns") do
      all("tr").each do |record|
        sleep 5
        record.all("td").each do |color|
          if color.native.style('background-color') == "rgba(227, 243, 255, 1)"
            sleep 3
            puts "Successfully see the conflicting data rows in blue color"
            sleep 3
            if first("input")[:type] == "radio"
              puts "Successfully see the radio button"
            else
              puts "Not able to see the radio button"
            end
          else
            # puts "Not able to see the conflicting data rows in blue color"
          end
        end
      end
    end
    sleep 5
    within("#updateableColumns") do
      sleep 3
      all("#selectLink").each do |color|
        sleep 5
        if color.first("font")[:color] == "#1E90FF"
          puts "Successfully see the select all link in blue color"
        else
          puts "Failed to see the select all link in blue color"
        end
      end
      sleep 4
      first("#selectLink").click
      sleep 5
    end
    puts "Successfully set the #{merge_opportunity} page"
  rescue Exception => ex
    putstr "Error occurred while selecting the master record from #{merge_opportunity} page"
    putstr_withScreen  ex.message
  end
end


Then(/^I user should be able to see the corresponding renewal relationship in master opportunity$/) do
  begin
    sleep 6
    arg = getDetails "RenewalOpportunityFields"
    sleep 3
    if page.has_css?(".pageDescription")
      puts "Successfully see the opportunity page"
    else
      puts "Failed to see the opportunity page"
    end
    sleep 5
    within all(".pbBody")[1] do
      sleep 3
    unless page.has_content?("No records to display")
      sleep 3
      after_product = all("tr")[1].first("th").first("a").text
      sleep 4
      if $before_product == after_product
        puts "Successfully see the renewal relationship products"
      else
        putstr "Failed to see the renewal relationship products"
      end
    else
      puts "No renewal relationship products"
    end
   end
    within all(".pbSubsection")[0] do
      sleep 4
      renewal_field = all("tr")[1].all("td")[2].text
      stage_field = all("tr")[2].all("td")[2].text
      sleep 4
      unless renewal_field.to_s == arg["RenewalField"].to_s
        putstr "Failed to see the #{renewal_field} field"
      else
        puts "Successfully see the #{renewal_field} field"
      end
      sleep 5
      unless stage_field.to_s == arg["StageField"].to_s
        putstr "Failed to see the #{stage_field} field"
      else
        puts "Successfully see the #{stage_field} field"
      end
    end
    sleep 5
    within all(".pbSubsection")[1] do
    conversion_rate_field = all("tr")[0].all("td")[2].text
    loss_rate_field = all("tr")[1].all("td")[2].text

    unless conversion_rate_field.to_s == arg["ConversionRateField"].to_s
      putstr "Failed to see the #{conversion_rate_field} filed"
    else
      puts "Successfully see the #{conversion_rate_field} filed"
    end
    sleep 5

    unless loss_rate_field.to_s == arg["LossRateField"].to_s
      putstr "Failed to see the #{loss_rate_field} filed"
    else
      puts "Successfully see the #{loss_rate_field} filed"
    end
   end
    sleep 5
    if page.has_content?(arg["ConsolidatedField"])
      puts "Successfully see the #{arg["ConsolidatedField"]} field"
    else
      putstr "Failed to see the #{arg["ConsolidatedField"]} field"
    end
    sleep 3
    if page.has_content?(arg["RenewalTargetLostField"])
      puts "Successfully see the #{arg["RenewalTargetLostField"]} field"
    else
      putstr "Failed to see the #{arg["RenewalTargetLostField"]} field"
    end
    sleep 3
    if page.has_content?(arg["RenewalTargetResolvedField"])
      puts "Successfully see the #{arg["RenewalTargetResolvedField"]} field"
    else
      putstr "Failed to see the #{arg["RenewalTargetResolvedField"]} field"
    end
    sleep 5
    rescue Exception => ex
    putstr "Error occurred while renewal relationship opportunity and product details verification"
    putstr_withScreen  ex.message
  end
end


Then(/^I verify the opportunity which is merged with the master opportunity$/) do
  begin
   sleep 10
   arg = getDetails "RenewalOpportunityFields"
   sleep 3
   within all(".pbSubsection")[0] do
     opportunity_name_field = all("tr")[0].first("td").text
     account_name_field = all("tr")[1].first("td").text

     if all("tr")[1].all("td")[3].first("img")[:title] == "Checked"
       puts "Opportunity Renewal checkbox is checked"
     else
       puts "Opportunity Renewal checkbox is not checked"
     end
     sleep 3

     unless opportunity_name_field.to_s == arg["OpportunityNameField"].to_s
       putstr "Failed to see the #{opportunity_name_field} filed"
     else
       puts "Successfully see the #{opportunity_name_field} filed"
     end
     sleep 5

     unless account_name_field.to_s == arg["AccountNameField"].to_s
       putstr "Failed to see the #{account_name_field} filed"
     else
       puts "Successfully see the #{account_name_field} filed"
     end
     sleep 5
   end
  rescue Exception => ex
    putstr "Error occurred while verifying the opportunities which is merged with the master opportunity"
    putstr_withScreen  ex.message
  end
end


And(/^I open the first opportunity$/) do
  begin
    sleep 5
    within all(".x-grid3-row-table")[0] do
      sleep 3
      all("tr")[0].all("td")[2].first("a").click
      sleep 5
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on the second opportunity"
    putstr ex.message
  end
end

And(/^I open the second opportunity$/) do
  begin
    sleep 5
    within all(".x-grid3-row-table")[1] do
      sleep 3
      all("tr")[0].all("td")[2].first("a").click
      sleep 5
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on the first opportunity"
    putstr_withScreen  ex.message
  end
end


And(/^I select one renewal opportunity from the list$/) do
  begin
    sleep 6
    arg = getDetails "MergeOpportunity"
    arg2 = getReference "Pricebooks"
    within all(".pbBody")[1] do
      unless page.has_content?("No records to display")
        sleep 3
        $before_product = all("tr")[1].first("th").first("a").text
        sleep 3
      else
        puts "No products available in Consolidated opportunity"
      end
    end
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    sleep 5
    within all(".pbSubsection")[0] do
      sleep 4
      all('input[type=checkbox]').each do |checkbox|
        unless checkbox.checked?
          checkbox.click
          sleep 5
          puts "Successfully selected the renewal checkbox"
          break
        else
          puts "Renewal checkbox is already selected"
        end
      end
    end
    sleep 5
    find("#opp11").select arg["RenewalStage"]
    sleep 5
    within all(".pbSubsection")[1] do
      sleep 4
      checkbox = find("input[type='checkbox']")
      if checkbox.checked?
        sleep 3
        puts "Successfully"
        checkbox.click
        sleep 3
      else
        puts "Consolidated checkbox is not enabled"
      end
    end
    within("#bottomButtonRow") do
      sleep 3
      click_on 'Save'
    end
    sleep 5
    click_on 'Choose Price Book'
    sleep 8
    puts "Successfully click the Choose Price Book button"
    sleep 6
    first("#p1").select arg2["first"]
    sleep 4
    click_on "Save"
    sleep 5
    page.driver.browser.switch_to.alert.accept
    puts "Successfully choose the #{arg2["first"]} price book"
    sleep 6
  rescue Exception => ex
  putstr "Error occurred while selecting the renewal opportunity #{arg["RenewalStage"]}"
  putstr_withScreen  ex.message
 end
end


Then(/^I should able to see the opportunity "([^"]*)" consolidated alert message$/) do |alert_message|
  begin
    sleep 5
    if page.driver.browser.switch_to.alert.text.to_s.include? alert_message.to_s
      puts "Successfully see the opportunity #{alert_message} alert message"
      page.driver.browser.switch_to.alert.accept
    else
      putstr "Failed to see the opportunity #{alert_message} alert message"
    end
  rescue Exception => ex
    putstr "Error occurred while validating opportunity #{alert_message} alert message"
    putstr_withScreen  ex.message
  end
end


And(/^I select two different price book opportunities$/) do
  begin
    sleep 10
    arg = getDetails "MergeOpportunity"
    count = 0
    $product.each do |product|
      sleep 5
      if product['opportunity_name'].to_s. == arg["NewMergeOpportunity"].to_s
        puts "Successfully see the same opportunity name"
        count = count + 1
        product['opportunity_checkbox'].click
        puts "Successfully selected the opportunity"
        if count ==2
          break
        end
      else
        # puts "Failed to see the opportunity name"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the same opportunity names"
    putstr_withScreen  ex.message
  end
end


When(/^I choose the "([^"]*)" Price book for the product$/) do |price_book|
  begin
    sleep 4
    first("#p1").select price_book
    sleep 4
    click_on "Save"
    sleep 5
    puts "Successfully choose the #{price_book} price book"
  rescue Exception => ex
    putstr "Error in choosing the pricebook for the product "
    putstr_withScreen  ex.message
  end
end


When(/^I delete the created different price book opportunity$/) do
  begin
    sleep 6
    arg = getDetails "MergeOpportunity"
    result = false
    all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
      if activity.text == arg["NewMergeOpportunity"]
        puts "Successfully see the Opportunity"
        activity.click
        puts "Successfully opened the #{arg["NewMergeOpportunity"]} Opportunity"
        result = true
        break
      end
    end
    putstr "Failed to see the #{arg["NewMergeOpportunity"]} Opportunity" unless result
    sleep 8
    within("#bottomButtonRow") do
      click_on 'Delete'
    end
    sleep 6
    page.driver.browser.switch_to.alert.accept
    sleep 5
    puts "Successfully deleted the #{arg["NewMergeOpportunity"]} Opportunity"
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while deleting the opportunity"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the different price book "([^"]*)" alert message$/) do |alert_message|
  begin
    sleep 5
    if page.driver.browser.switch_to.alert.text.to_s.include? alert_message.to_s
      puts "Successfully see the different price book #{alert_message} alert message"
      page.driver.browser.switch_to.alert.accept
    else
      putstr "Failed to see the different price book #{alert_message} alert message"
    end
  rescue Exception => ex
    putstr "Error occurred while validating the different pricebook #{alert_message} alert message"
    putstr_withScreen  ex.message
  end
end

And(/^I create the new opportunity$/) do
  begin
    sleep 5
    arg = getDetails "MergeOpportunity"
    arg1 = getReference "newOpportunity"
    sleep 5
    # $new_merge_opportunity = "#{arg["NewMergeOpportunity"]} #{Time.now.strftime('%m%d_%H%M_%S')}"
    # sleep 4
    within all(".pbSubsection")[0] do
      sleep 3
      all("input[type='text']")[0].set arg["NewMergeOpportunity"]
      sleep 4
      all("input[type='text']")[1].set arg1["Account Name"]
      sleep 4
      all("input[type='text']")[3].set arg["OpportunityCloseDate"]
      sleep 3
      all("input[type='text']")[6].set arg["MergeAmount"]
      sleep 3
      find("#opp11").select arg["MergeOpportunityStageValue"]
    end
    sleep 5
    within("#bottomButtonRow") do
      click_on 'Save'
    end
    sleep 3
    puts "Successfully created the #{arg["NewMergeOpportunity"]} opportunity"
  rescue Exception => ex
    putstr "Error occurred while entering the mandatory details in #{arg["NewMergeOpportunity"]} opportunity page"
    putstr_withScreen  ex.message
  end
end


And(/^I navigate to the merge opportunity section$/) do
  begin
   sleep 10
   if page.has_css?(".listItemPad")
      sleep 4
      puts "Successfully see the Alphabetic Pagination"
      all(".listItemPad")[12].click
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
  rescue Exception => ex
     putstr "Error occurred while selecting the Alphabetic pagination"
     putstr_withScreen  ex.message
  end
end

And(/^I create the new opportunity with "(.*?)"$/) do |data|
  begin
    sleep 5
    arg = getDetails "MergeOpportunity"
    arg1 = getReference "newOpportunity"
	oppName = arg["NewMergeOpportunity"] + '_' +data
    sleep 5
    # $new_merge_opportunity = "#{arg["NewMergeOpportunity"]} #{Time.now.strftime('%m%d_%H%M_%S')}"
    # sleep 4
    within all(".pbSubsection")[0] do
      sleep 3
      all("input[type='text']")[0].set oppName
      sleep 4
      all("input[type='text']")[1].set arg1["Account Name"]
      sleep 4
      all("input[type='text']")[3].set arg["OpportunityCloseDate"]
      sleep 3
      all("input[type='text']")[6].set arg["MergeAmount"]
      sleep 3
      find("#opp11").select arg["MergeOpportunityStageValue"]
    end
    sleep 5
    within("#bottomButtonRow") do
      click_on 'Save'
    end
    sleep 3
    puts "Successfully created the #{oppName} opportunity"
  rescue Exception => ex
    putstr "Error occurred while entering the mandatory details in #{oppName} opportunity page"
    putstr_withScreen  ex.message
  end
end

And(/^I select "(.*?)" view and click on Go$/) do |view|
	begin
		select view, :from => "fcf"
		sleep 5
		within(".fBody") do
			click_on "Go!"
		end
	rescue Exception => ex
		putstr "Error occurred while selecting #{view}"
		putstr_withScreen  ex.message
	end
end

And(/^I select an Opportunity with "(.*?)"$/) do |data|
	begin
		arg = getDetails "MergeOpportunity"
		oppName = arg["NewMergeOpportunity"] + '_' + data
		
		sleep 5
		foundCount = ""
			begin  
				within(".x-grid3-body") do
					tr = all(".x-grid3-row")
					tr.each do |row|
					  if row.all("td")[2].text == oppName
						#row.all("td")[0].all('a')[0].click
						row.first('input[type=checkbox]').set(true)
						puts "Successfully selected the Opportunity #{oppName}"
						foundCount = "found"
						break
					  end	
					end
				end
				if page.has_css?('.next')
					find(".next").click
					sleep 5
				else
					break
				end
			end until (page.has_css?('.nextoff'))
			if foundCount==""
				within(".x-grid3-body") do
					tr = all(".x-grid3-row")
					tr.each do |row|				
					 if row.all("td")[2].text == oppName
						#row.all("td")[0].all('a')[0].click
						row.first('input[type=checkbox]').set(true)
						puts "Successfully selected the Opportunity #{oppName}"
						foundCount = "found"
						break
					  end	
					end
				end
			end
		sleep 5
	rescue Exception => ex
		putstr "Error occurred while selecting an Opportunity #{oppName}"
		putstr_withScreen  ex.message
	end
end


When(/^I delete opportunity with "(.*?)"$/) do |data|
  begin
    sleep 6
    arg = getDetails "MergeOpportunity"
	oppName = arg["NewMergeOpportunity"] + '_' +data
    result = false
    all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
      if activity.text == oppName
        puts "Successfully see the Opportunity"
        activity.click
        puts "Successfully opened the #{oppName} Opportunity"
        result = true
        break
      end
    end
    putstr "Failed to see the #{oppName} Opportunity" unless result
    sleep 8
    within("#bottomButtonRow") do
      click_on 'Delete'
    end
    sleep 6
    page.driver.browser.switch_to.alert.accept
    sleep 5
    puts "Successfully deleted the #{oppName} Opportunity"
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while deleting the opportunity"
    putstr_withScreen  ex.message
  end
end
