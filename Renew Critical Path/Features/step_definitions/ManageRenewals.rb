#All Opportunity - Manage Renewals specific Step definitions
#All Scenario mentioned in ManageRenewals.feature

When(/^I click on "([^"]*)" edit link$/) do |renewal_relationship|
  begin
    
    sleep 5
    within all(".pbBody")[2] do
      within(".list") do
        sleep 5
        unless page.has_css?(".noRowsHeader")
          first("tbody").all(".dataRow")[1].first("td").first("a").click
          sleep 3
        else
          puts "No records to display"
        end
      end
    end
    sleep 5
    if page.has_css?(".mainTitle")
      puts "Successfully see the #{renewal_relationship} edit page"
      within all(".pbSubsection")[0] do
        sleep 3
        product_line_id = first("tbody").all("tr")[2].all("td")[3].first("input")[:value]
        sleep 3
        # $renewal_product_line_id = product_line_id.chomp("AAH")

        lastchars = product_line_id.split(//).last(3).join
        $renewal_product_line_id = product_line_id.sub(lastchars,"")
        puts $renewal_product_line_id
      end
      sleep 4
      within("#bottomButtonRow") do
        sleep 3
        click_on 'Cancel'
        sleep 3
      end
    else
      putstr "Failed to see the #{renewal_relationship} edit page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while clicking the #{renewal_relationship} edit link"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the "([^"]*)" products$/) do |renewal_relationship|
  begin
    sleep 5
    within all(".pbBody")[2] do
      within(".list") do
        sleep 1
        unless page.has_css?(".noRowsHeader")
          $first_product_name = first("tbody").first(".dataRow").all("td")[1].first("a").text
          $second_product_name = first("tbody").all(".dataRow")[1].all("td")[1].first("a").text
          sleep 1
          puts $first_product_name
          puts $second_product_name

        else
          puts "No records to display"
        end
      end
    end
    sleep 5
    within all(".pbBody")[2] do
      within(".list") do
        sleep 1
        unless page.has_css?(".noRowsHeader")
          sleep 1
          opportunity_line_item = first("tbody").first(".dataRow").all("td")[1].first("a")[:href]
          sleep 1
          puts opportunity_line_item
          puts $renewal_product_line_id
          if opportunity_line_item.include?($renewal_product_line_id)
            puts "Successfully see the Valid #{renewal_relationship} Opportunity"
          else
            putstr "Failed to see the Valid #{renewal_relationship} Opportunity"
          end
        else
          puts "No records to display"
        end
      end
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the #{renewal_relationship} products"
    #putstr ex.backtrace
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" products$/) do |renewal_relationship|
  begin
    sleep 6
    if find(".pageDescription").text == renewal_relationship
      puts "Successfully see the #{renewal_relationship} edit page"
      sleep 5
      unless page.has_css?(".no-records-found")
        sleep 4
        if page.has_css?("#renewalRelationshipGrid")
          within("#renewalRelationshipGrid") do
            sleep 5
            if (first("tbody").all("tr")[0].all("td")[1].first("a").text.to_s == $first_product_name.to_s) || (first("tbody").all("tr")[1].all("td")[1].first("a").text.to_s == $second_product_name.to_s)
              puts "Successfully see the selected #{$first_product_name} #{$second_product_name} products"
            else
              putstr "Failed to see the selected #{$first_product_name} #{$second_product_name} products"
            end
          end
        else
          puts "No to renewal relationship grid"
        end
      else
        puts "No matching records found"
      end
    else
      putstr "Failed to see the #{renewal_relationship} edit page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{renewal_relationship} products"
    putstr_withScreen  ex.message
  end
end

And(/^I select the "([^"]*)" product field$/) do |renewal_relationship|
  begin
    sleep 6
    if find(".pageDescription").text == renewal_relationship
      puts "Successfully see the #{renewal_relationship} page"
      sleep 5
      unless page.has_css?(".no-records-found")
        sleep 4
        if page.has_css?("#renewalRelationshipGrid")
          sleep 4
          if first("input[name='btSelectItem']").checked?
            puts "#{renewal_relationship} product field is already checked"
          else
            first("input[name='btSelectItem']").click
            sleep 4
          end
        else
          puts "No to renewal relationship grid"
        end
      else
        puts "No matching records found"
      end
    else
      putstr "Failed to see the #{renewal_relationship} page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the #{renewal_relationship} product"
    putstr_withScreen  ex.message
  end
end

And(/^I click on "([^"]*)" "([^"]*)" button$/) do |renewal_relationship, renewal_status|
  begin
    sleep 6
    if find(".pageDescription").text == renewal_relationship
      puts "Successfully see the #{renewal_relationship} page"
      sleep 5
      unless page.has_css?(".no-records-found")
        sleep 4
        within("#mainDiv") do
          unless page.has_css?(".disabled")
            puts "#{renewal_status} button is enabled"
            sleep 4
            click_on renewal_status
            sleep 4
            puts "Successfully click the #{renewal_status} button"
          else
            puts "#{renewal_status} button is disabled"
          end
        end
      else
        puts "No matching records found"
      end
    else
      putstr "Failed to see the #{renewal_relationship} page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while clicking the #{renewal_relationship} #{renewal_status} button"
    putstr_withScreen  ex.message
  end
end

And(/^I select the "([^"]*)" pick list "([^"]*)" value$/) do |renewal_status, renewal_status_value|
  begin
    sleep 4
    arg = getDetails "ManageRenewalsOpportunity"
    sleep 6
    unless page.has_css?(".no-records-found")
      sleep 5
      within("#mainDiv") do
        unless page.has_css?(".disabled")
          sleep 4
          if page.has_css?("#demolist")
            sleep 5
            within("#demolist") do
              sleep 5
              renewal_status_open = all("li")[0].first("a").text
              if renewal_status_open == arg["RenewalStatusOpen"]
                puts "Successfully see the #{renewal_status} value: #{arg["RenewalStatusOpen"]} "
              else
                putstr "Failed to see the #{renewal_status} value: #{arg["RenewalStatusOpen"]}"
              end
              sleep 3
              renewal_status_lost = all("li")[1].first("a").text
              if renewal_status_lost == arg["RenewalStatusLost"]
                puts "Successfully see the #{renewal_status} value: #{arg["RenewalStatusLost"]}"
              else
                putstr "Failed to see the #{renewal_status} value: #{arg["RenewalStatusLost"]}"
              end
              sleep 3
              renewal_status_won = all("li")[2].first("a").text
              if renewal_status_won == arg["RenewalStatusWon"]
                puts "Successfully see the #{renewal_status} value: #{arg["RenewalStatusWon"]}"
              else
                putstr "Failed to see the #{renewal_status} value: #{arg["RenewalStatusWon"]}"
              end
              sleep 3
            end
          else
            puts "Unable to see the #{renewal_status} pick list values"
          end
          sleep 4
          click_on renewal_status_value
          sleep 5
          puts "Successfully click the #{renewal_status} pick list value: #{renewal_status_value}"
        else
          puts "#{renewal_status} button is disabled"
        end
      end
    else
      puts "No matching records found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the #{renewal_status} pick list value: #{renewal_status_value}"
    putstr_withScreen  ex.message
  end
end

Then(/^user able to see the updated "([^"]*)" pick list "([^"]*)" value$/) do |renewal_status, renewal_status_value|
  begin
    sleep 6
    unless page.has_css?(".no-records-found")
      sleep 4
      if page.has_css?("#renewalRelationshipGrid")
        sleep 4
        within("#renewalRelationshipGrid") do
          updated_renewal_value = first("tbody").first("tr").all("td")[7].first("span").text
          sleep 4
          if updated_renewal_value == renewal_status_value
            puts "Successfully updated the #{renewal_status} value: #{renewal_status_value}"
          else
            putstr "Failed to see the #{renewal_status} updated value: #{renewal_status_value}"
          end
        end
      else
        puts "No to renewal relationship grid"
      end
    else
      puts "No matching records found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the updated #{renewal_status} #{renewal_status_value} value"
    putstr_withScreen  ex.message
  end
end

And(/^I select the multiple "([^"]*)" product fields$/) do |renewal_relationship|
  begin
    sleep 4
    arg = getDetails "ManageRenewalsOpportunity"
    sleep 6
    if find(".pageDescription").text == renewal_relationship
      puts "Successfully see the #{renewal_relationship} page"
      sleep 5
      unless page.has_css?(".no-records-found")
        sleep 4
        if page.has_css?("#renewalRelationshipGrid")
          sleep 6
          if all("input[name='btSelectItem']").count > 3
            all("input[name='btSelectItem']").each_with_index do |checkbox , index|
              if index.to_i == arg["ManageRenewalProductFirstIndex"].to_i
                sleep 5
                unless checkbox.checked?
                  sleep 3
                  checkbox.click
                  puts "Successfully enabled the the product"
                  break
                else
                  puts "#{renewal_relationship} product field is already checked"
                end
              else
                # puts "#{index}"
              end
            end
            sleep 4
            all("input[name='btSelectItem']").each_with_index do |checkbox , index|
              if index.to_i == arg["ManageRenewalProductSecondIndex"].to_i
                sleep 5
                unless checkbox.checked?
                  sleep 3
                  checkbox.click
                  puts "Successfully enabled the the product"
                  break
                else
                  puts "#{renewal_relationship} product field is already checked"
                end
              else
                # puts "#{index}"
              end
            end
          else
            puts "No matching records found"
          end
        else
          puts "No to renewal relationship grid"
        end
      else
        puts "No matching records found"
      end
    else
      putstr "Failed to see the #{renewal_relationship} page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the multiple #{renewal_relationship} products"
    putstr_withScreen  ex.message
  end
end

When(/^I click on the "([^"]*)" button on "([^"]*)" page$/) do |back_button, renewal_relationship|
  begin
    if find(".pageDescription").text == renewal_relationship
      puts "Successfully see the #{renewal_relationship} page"
      sleep 5
      click_on back_button
      sleep 6
    else
      putstr "Failed to see the #{renewal_relationship} page"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{back_button} button on #{renewal_relationship} page"
    putstr_withScreen  ex.message
  end
end

Then(/^I navigate to the renewal opportunity page$/) do
  begin
    sleep 3
    arg = getReference "ManageRenewalsOpportunity"
    sleep 3
    if find(".pageDescription").text == arg["InvalidRenewalRelationshipOpportunity"]
      puts "Successfully navigate to the renewal opportunity #{arg["InvalidRenewalRelationshipOpportunity"]} page"
      sleep 5
    else
      putstr "Failed to navigate the renewal opportunity #{arg["InvalidRenewalRelationshipOpportunity"]} page"
    end
  rescue Exception => ex
    putstr "Error occurred while navigating to the renewal opportunity #{arg["InvalidRenewalRelationshipOpportunity"]} page"
    putstr_withScreen ex.message
  end
end

Then(/^I verify the renewal relationship currency metric field values$/) do
  begin
    sleep 3
    arg = getReference "AssetDetails"
    sleep 3
    new_opportunity_name= find(".pageDescription").text
    puts new_opportunity_name
    if new_opportunity_name.strip.to_s == arg["OpportunityName"].to_s
      puts "Successfully created the #{new_opportunity_name} new target opportunity"
    else
      putstr "Failed to created the #{new_opportunity_name} new target opportunity"
    end
    sleep 5
    within all(".pbSubsection")[0] do
      sleep 4
      $amount_field = all("tr")[6].all("td")[2].text
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the currency mettric values"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the recalculated currency metric fields$/) do
  begin
    sleep 4
    arg = getReference "AssetDetails"
    sleep 3
    new_opportunity_name= find(".pageDescription").text
    puts new_opportunity_name
    if new_opportunity_name.strip.to_s == arg["OpportunityName"].to_s
      puts "Successfully created the #{new_opportunity_name} new target opportunity"
    else
      putstr "Failed to created the #{new_opportunity_name} new target opportunity"
    end
    sleep 5
    within all(".pbSubsection")[0] do
      sleep 4
      amount = all("tr")[6].all("td")[2].text
      unless $amount_field == amount
        putstr "Not updated the currency metric fields"
      else
        puts "Updated the currency metric fields"
      end
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the currency mettric values"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" line items$/) do |renewal_relationship|
  begin
    sleep 3
    within all(".pbBody")[2] do
      within(".list") do
        sleep 5
        unless page.has_css?(".noRowsHeader")
          $renewal_relationship = first("tbody").first(".dataRow").first("th").first("a").text
          puts $renewal_relationship
          sleep 3
        else
          puts "No records to display"
        end
      end
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the #{renewal_relationship} line items for target opportunity"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" button$/) do |consolidate_opportunity|
  begin
    sleep 3
    if page.has_css?("#grid-toolbar")
      sleep 4
      if page.has_css?("#consolidatedRR")
        puts "Successfully see the #{consolidate_opportunity} button"
      else
        putstr "Failed to see the #{consolidate_opportunity} button"
      end
    else
      putstr "Failed to see the Split,Consolidate and Rebuild Opportunity buttons"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{consolidate_opportunity} button"
    putstr_withScreen  ex.message
  end
end

And(/^I open the renewal relationship opportunity$/) do
  begin
    sleep 6
    arg = getReference "ManageRenewalsOpportunity"
    find('#fcf').select "My Opportunities"
    sleep 5
    within (".fBody") do
      click_button 'Go!'
    end
    sleep 10
    if page.has_css?(".listItemPad")
      sleep 4
      puts "Successfully see the Alphabetic Pagination"
      all(".listItemPad")[15].click
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
      if activity.text.include? arg["RenewalRelationshipOpportunity"]
        puts "Successfully match the Renewal Opportunity name"
        activity.click
        puts "Successfully opened the #{arg["RenewalRelationshipOpportunity"]} Renewal Opportunity"
        result = true
        break
      end
    end
    putstr "Unable to find the #{arg["RenewalRelationshipOpportunity"]} Renewal Opportunity" unless result
  rescue Exception => ex
    putstr "Error occurred while clicking on existing #{arg["RenewalRelationshipOpportunity"]} Renewal Opportunity page"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" column fields$/) do |renewal_relationship|
  begin
    sleep 4
    arg = getDetails "ManageRenewalsOpportunity"
    sleep 4
    if page.has_content?(arg["ManageRenewalColumnField1"])
      puts "Successfully see the #{arg["ManageRenewalColumnField1"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField1"]} #{renewal_relationship} column field"
    end
    sleep 3
    if page.has_content?(arg["ManageRenewalColumnField2"])
      puts "Successfully see the #{arg["ManageRenewalColumnField2"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField2"]} #{renewal_relationship} column field"
    end
    sleep 3

    if page.has_content?(arg["ManageRenewalColumnField3"])
      puts "Successfully see the #{arg["ManageRenewalColumnField3"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField3"]} #{renewal_relationship} column field"
    end
    sleep 3

    if page.has_content?(arg["ManageRenewalColumnField4"])
      puts "Successfully see the #{arg["ManageRenewalColumnField4"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField4"]} #{renewal_relationship} column field"
    end
    sleep 3

    if page.has_content?(arg["ManageRenewalColumnField5"])
      puts "Successfully see the #{arg["ManageRenewalColumnField5"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField5"]} #{renewal_relationship} column field"
    end
    sleep 3

    if page.has_content?(arg["ManageRenewalColumnField6"])
      puts "Successfully see the #{arg["ManageRenewalColumnField6"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField6"]} #{renewal_relationship} column field"
    end
    sleep 3

    if page.has_content?(arg["ManageRenewalColumnField7"])
      puts "Successfully see the #{arg["ManageRenewalColumnField7"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField7"]} #{renewal_relationship} column field"
    end
    sleep 3

    if page.has_content?(arg["ManageRenewalColumnField8"])
      puts "Successfully see the #{arg["ManageRenewalColumnField8"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField8"]} #{renewal_relationship} column field"
    end
    sleep 3
    if page.has_content?(arg["ManageRenewalColumnField9"])
      puts "Successfully see the #{arg["ManageRenewalColumnField9"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField9"]} #{renewal_relationship} column field"
    end
    sleep 3
    if page.has_content?(arg["ManageRenewalColumnField10"])
      puts "Successfully see the #{arg["ManageRenewalColumnField10"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField10"]} #{renewal_relationship} column field"
    end
    sleep 3
    if page.has_content?(arg["ManageRenewalColumnField11"])
      puts "Successfully see the #{arg["ManageRenewalColumnField11"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField11"]} #{renewal_relationship} column field"
    end
    sleep 3
    if page.has_content?(arg["ManageRenewalColumnField12"])
      puts "Successfully see the #{arg["ManageRenewalColumnField12"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField12"]} #{renewal_relationship} column field"
    end
    if page.has_content?(arg["ManageRenewalColumnField13"])
      puts "Successfully see the #{arg["ManageRenewalColumnField13"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField13"]} #{renewal_relationship} column field"
    end
    sleep 3
    if page.has_content?(arg["ManageRenewalColumnField14"])
      puts "Successfully see the #{arg["ManageRenewalColumnField14"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField14"]} #{renewal_relationship} column field"
    end
    sleep 3
    if page.has_content?(arg["ManageRenewalColumnField15"])
      puts "Successfully see the #{arg["ManageRenewalColumnField15"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField15"]} #{renewal_relationship} column field"
    end
    sleep 3
    if page.has_content?(arg["ManageRenewalColumnField16"])
      puts "Successfully see the #{arg["ManageRenewalColumnField16"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField16"]} #{renewal_relationship} column field"
    end
    sleep 3
    if page.has_content?(arg["ManageRenewalColumnField17"])
      puts "Successfully see the #{arg["ManageRenewalColumnField17"]} #{renewal_relationship} column field"
    else
      putstr "Failed to see the #{arg["ManageRenewalColumnField17"]} #{renewal_relationship} column field"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the #{renewal_relationship} column fields"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the "([^"]*)" and "([^"]*)" fields as empty$/) do |original_opp, previous_opp|
  begin
    sleep 6
    unless page.has_css?(".no-records-found")
      sleep 3
      within("#renewalRelationshipGrid") do
        sleep 4
        if first("table").first("tr").all("td")[15].first("span") == ""
          puts "Successfully see the #{previous_opp} column field as empty"
        else
          putstr "Failed to see the #{previous_opp} column field as empty"
        end
      end
    else
      puts "No matching records found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{original_opp} and #{previous_opp} fields as empty"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the renewal relationship lines should be moved to the target opportunity$/) do
  begin
    sleep 3
    unless page.has_css?(".no-records-found")
      sleep 3
      within all(".pbBody")[2] do
        within(".list") do
          sleep 5
          unless page.has_css?(".noRowsHeader")
            renewal_line_item = first("tbody").first(".dataRow").first("th").first("a").text
            puts renewal_line_item
            sleep 3
            if renewal_line_item == $renewal_relationship
              puts "Successfully see the renewal relationship line items"
            else
              putstr "Failed to see the renewal relationship line items"
            end
          else
            puts "No records to display"
          end
        end
      end
    else
      puts "No matching records found"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the renewal relationship line items"
    putstr_withScreen  ex.message
  end
end

And(/^I select the "([^"]*)" opportunity option and fill the required fields$/) do |drop_down_value|
  begin
    sleep 3
    arg = getDetails "SplitOpportunity"
    arg2 = getReference "SplitOpportunity"
    sleep 5
    unless page.has_css?(".no-records-found")
      sleep 4
      find(:xpath,"//div/table/tbody/tr[1]/td/select").select drop_down_value
      sleep 6
      puts "Successfully selected the #{drop_down_value}"
      sleep 5
      within all(".pbSubsection")[1] do
        sleep 5
        all('input[type=text]')[0].set arg["TargetOpportunityName"]
        sleep 5
        all('input[type=text]')[2].set arg["TargetOpportunityCloseDate"]
        sleep 5
        find(".class_StageName").select arg["TargetOpportunityStage"]
        sleep 5
        all('input[type=text]')[3].set arg2["TargetOpportunityOwnerID"]
        sleep 5
        all('input[type=text]')[4].set arg["TargetOpportunityProbability"]
        sleep 5
      end
    else
      puts "No matching records found"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{drop_down_value}"
    putstr_withScreen  ex.message
  end
end

And(/^I click on "([^"]*)" button from renewal relationship page$/) do |consolidate|
  begin
    sleep 5
    unless page.has_css?(".no-records-found")
      sleep 4
      click_on consolidate
      sleep 8
      puts "Successfully click the #{consolidate} button"
    else
      puts "No matching records found"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{consolidate} button"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the column fields$/) do
  begin
    sleep 4
    arg = getDetails "ManageRenewalsOpportunity"
    sleep 3
    if page.has_css?(".keep-open")
      sleep 4
      puts "Successfully see the renewal relationship column fields button"
      sleep 4
      all(".dropdown-toggle")[1].click
      sleep 4
      within(".keep-open") do
        within(".dropdown-menu") do
          sleep 3
          existing_product = all("li")[0].first("label").text
          if existing_product == arg["ManageRenewalColumnField1"]
            puts "Successfully see the #{arg["ManageRenewalColumnField1"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField1"]} column field"
          end
          sleep 3
          asset = all("li")[1].first("label").text
          if asset == arg["ManageRenewalColumnField2"]
            puts "Successfully see the #{arg["ManageRenewalColumnField2"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField2"]} column field"
          end
          sleep 3
          quantity = all("li")[2].first("label").text
          if quantity == arg["ManageRenewalColumnField3"]
            puts "Successfully see the #{arg["ManageRenewalColumnField3"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField3"]} column field"
          end
          sleep 3
          previous_price = all("li")[3].first("label").text
          if previous_price == arg["ManageRenewalColumnField4"]
            puts "Successfully see the #{arg["ManageRenewalColumnField4"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField4"]} column field"
          end
          sleep 3
          total_price = all("li")[4].first("label").text
          if total_price == arg["ManageRenewalColumnField5"]
            puts "Successfully see the #{arg["ManageRenewalColumnField5"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField5"]} column field"
          end
          sleep 3
          renewal_target = all("li")[5].first("label").text
          if renewal_target == arg["ManageRenewalColumnField6"]
            puts "Successfully see the #{arg["ManageRenewalColumnField6"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField6"]} column field"
          end
          sleep 3
          renewal_status = all("li")[6].first("label").text
          if renewal_status == arg["ManageRenewalColumnField7"]
            puts "Successfully see the #{arg["ManageRenewalColumnField7"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField7"]} column field"
          end
          sleep 3
          created_date = all("li")[7].first("label").text
          if created_date == arg["ManageRenewalColumnField8"]
            puts "Successfully see the #{arg["ManageRenewalColumnField8"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField8"]} column field"
          end
          sleep 3
          existing_start_date = all("li")[8].first("label").text
          if existing_start_date == arg["ManageRenewalColumnField9"]
            puts "Successfully see the #{arg["ManageRenewalColumnField9"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField9"]} column field"
          end
          sleep 3
          existing_end_date = all("li")[9].first("label").text
          if existing_end_date == arg["ManageRenewalColumnField10"]
            puts "Successfully see the #{arg["ManageRenewalColumnField10"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField10"]} column field"
          end
          sleep 3
          expiration_quarter_year = all("li")[10].first("label").text
          if expiration_quarter_year == arg["ManageRenewalColumnField11"]
            puts "Successfully see the #{arg["ManageRenewalColumnField11"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField11"]} column field"
          end
          sleep 3
          expiration_quarter = all("li")[11].first("label").text
          if expiration_quarter == arg["ManageRenewalColumnField12"]
            puts "Successfully see the #{arg["ManageRenewalColumnField12"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField12"]} column field"
          end
          sleep 3
          expiration_year = all("li")[12].first("label").text
          if expiration_year == arg["ManageRenewalColumnField13"]
            puts "Successfully see the #{arg["ManageRenewalColumnField13"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField13"]} column field"
          end
          sleep 3
          source_opportunity = all("li")[13].first("label").text
          if source_opportunity == arg["ManageRenewalColumnField14"]
            puts "Successfully see the #{arg["ManageRenewalColumnField14"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField14"]} column field"
          end
          sleep 3
          previous_opportunity = all("li")[14].first("label").text
          if previous_opportunity == arg["ManageRenewalColumnField15"]
            puts "Successfully see the #{arg["ManageRenewalColumnField15"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField15"]} column field"
          end
          sleep 3
          renewal_opportunity = all("li")[15].first("label").text
          if renewal_opportunity == arg["ManageRenewalColumnField16"]
            puts "Successfully see the #{arg["ManageRenewalColumnField16"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField16"]} column field"
          end
          sleep 3
          renewal_product_line_id = all("li")[16].first("label").text
          if renewal_product_line_id == arg["ManageRenewalColumnField17"]
            puts "Successfully see the #{arg["ManageRenewalColumnField17"]} column field"
          else
            putstr "Failed to see the #{arg["ManageRenewalColumnField17"]} column field"
          end
        end
      end
      sleep 4
    else
      puts "Failed to see the renewal relationship column fields button"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the column fields"
    putstr_withScreen  ex.message
  end
end

When(/^I select and deselect the column fields$/) do
  begin
    sleep 4
    arg = getDetails "ManageRenewalsOpportunity"
    sleep 3
    if page.has_css?(".keep-open")
      sleep 4
      puts "Successfully see the renewal relationship column fields button"
      sleep 5
      if page.has_xpath?("//div/button[@aria-expanded='false']")
        sleep 3
        all(".dropdown-toggle")[1].click
      else
        puts "Column Field Drop down is already Opened"
      end
      sleep 4
      within(".keep-open") do
        within(".dropdown-menu") do
          sleep 4
          if all("li")[0].first("input").checked?
            sleep 3
            all("li")[0].first("input").click
            sleep 3
          else
            puts "#{arg["ManageRenewalColumnField1"]} column field not selected"
          end
          sleep 8
          if all("li")[1].first("input").checked?
            sleep 3
            all("li")[1].first("input").click
            sleep 3
          else
            puts "#{arg["ManageRenewalColumnField2"]} column field not selected"
          end
          sleep 8
          if all("li")[2].first("input").checked?
            sleep 3
            all("li")[2].first("input").click
            sleep 3
          else
            puts "#{arg["ManageRenewalColumnField3"]} column field not selected"
          end
        end
      end
    else
      puts "Failed to see the renewal relationship column fields button"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting and deselecting the column fields"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the adding and removing column fields$/) do
  begin
    sleep 6
    arg = getDetails "ManageRenewalsOpportunity"
    sleep 5
    unless page.has_xpath?("//div/button[@aria-expanded='false']")
      sleep 3
      all(".dropdown-toggle")[1].click
    else
      puts "Column Field Drop down is already Opened"
    end
    sleep 5
    within("#renewalRelationshipGrid") do
      sleep 4
      sleep 3
      existing_product = first("thead").first("tr").all("th")[1].first("div").text
      unless existing_product == arg["ManageRenewalColumnField1"]
        puts "Successfully removed the #{arg["ManageRenewalColumnField1"]} column field"
      else
        putstr "Failed to removed the #{arg["ManageRenewalColumnField1"]} column field"
      end
      sleep 3
      asset = first("thead").first("tr").all("th")[2].first("div").text
      unless asset == arg["ManageRenewalColumnField2"]
        puts "Successfully removed the #{arg["ManageRenewalColumnField2"]} column field"
      else
        putstr "Failed to removed the #{arg["ManageRenewalColumnField2"]} column field"
      end
      sleep 3
      quantity = first("thead").first("tr").all("th")[3].first("div").text
      unless quantity == arg["ManageRenewalColumnField3"]
        puts "Successfully removed the #{arg["ManageRenewalColumnField3"]} column field"
      else
        putstr "Failed to removed the #{arg["ManageRenewalColumnField3"]} column field"
      end
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the added and removed column fields"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the renewal relationship & Metrics fields values$/) do
  begin
    sleep 6
    arg = getDetails "SplitOpportunity"
    sleep 5
    unless page.has_css?(".no-records-found")
      sleep 4
      unless (all(:xpath,"//table/tbody/tr/th/a")[0].text.to_s == $first_product_name.to_s) || (all(:xpath,"//table/tbody/tr/th/a")[1].text.to_s == $second_product_name.to_s)
        puts "Successfully see the selected #{$first_product_name} #{$second_product_name} products"
      else
        putstr "Failed to see the selected #{$first_product_name} #{$second_product_name} products"
      end
      sleep 5
      within all(".pbSubsection")[0] do
        sleep 4
        probability_field = all("tr")[5].all("td")[2].text
        unless probability_field.to_s == arg["ProbabilityField"].to_s
          putstr "Failed to see the #{probability_field} field"
        else
          puts "Successfully see the #{probability_field} field"
        end
      end
    else
      puts "No matching records found"
    end
  rescue Exception => ex
    putstr "Error occurred while new target opportunity and product details verification"
    putstr_withScreen  ex.message
  end
end

And(/^I select the "([^"]*)" opportunity and fill the required fields$/) do |drop_down_value|
  begin
    sleep 5
    arg = getReference "SplitOpportunity"
    sleep 4
    unless page.has_css?(".no-records-found")
      sleep 4
      find(:xpath,"//div/table/tbody/tr[1]/td/select").select drop_down_value
      sleep 6
      puts "Successfully selected the #{drop_down_value}"
      sleep 8
      within(".pbSubsection") do
        sleep 4
        find(".lookupIcon").click
        sleep 10
      end
      main = page.driver.browser.window_handles.first
      sleep 5
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      sleep 10
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.list') do
        click_on arg["SelectTargetOpportunity"]
      end
      sleep 5
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
      sleep 5
      puts "Successfully Select Target opportunity field"
      sleep 6
    else
      puts "No matching records found"
    end
  rescue Exception => ex
    putstr "Error occurred while Select Target Opportunity field"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" and "([^"]*)" section$/) do |target_opportunity_section, opportunity_products_section|
  begin
    sleep 6
    unless page.has_css?(".no-records-found")
      sleep 4
      within all(".opportunityLineItemBlock")[1] do
        within(".pbTitle") do
          sleep 4
          target_opportunity= first(".mainTitle").text
          if target_opportunity.to_s == target_opportunity_section.to_s
            puts "Successfully see the #{target_opportunity_section} section"
          else
            putstr "Failed to see the #{target_opportunity_section} section"
          end
        end
      end
      sleep 5
      within all(".opportunityLineItemBlock")[2] do
        within(".pbTitle") do
          sleep 4
          opportunity_products = first(".mainTitle").text
          unless opportunity_products.to_s == opportunity_products_section.to_s
            putstr "Failed to see the #{opportunity_products_section} section"
          else
            puts "Successfully see the #{opportunity_products_section} section"
          end
        end
      end
    else
      puts "No matching records found"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the product validation messages"
    putstr_withScreen  ex.message
  end
end

When(/^I select the all "([^"]*)" column fields$/) do |renewal_relationship|
  begin
    sleep 5
    if page.has_css?(".keep-open")
      sleep 4
      puts "Successfully see the renewal relationship column fields button"
      sleep 4
      if page.has_xpath?("//div/button[@aria-expanded='false']")
        sleep 3
        all(".dropdown-toggle")[1].click
      else
        puts "Column Field Drop down is already Opened"
      end
      sleep 5
      within(".keep-open") do
        within(".dropdown-menu") do
          sleep 8
          all('input[type=checkbox]').each do |checkbox|
            unless checkbox.checked?
              sleep 5
              checkbox.click
              puts "#{renewal_relationship} column filter is selected"
            else
              puts "#{renewal_relationship} column filter is already selected"
            end
          end
        end
      end
    else
      puts "Failed to see the renewal relationship column fields button"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{renewal_relationship} column fields"
    putstr_withScreen  ex.message
  end
end

And(/^I delete the created renewal opportunity$/) do
  begin
    sleep 8
    within("#bottomButtonRow") do
      click_on 'Delete'
    end
    sleep 6
    page.driver.browser.switch_to.alert.accept
    sleep 5
    puts "Successfully deleted the #{$create_new_opportunity} renewal opportunity"
    sleep 8
  rescue Exception => ex
    putstr "Error occurred while deleting the #{$create_new_opportunity} renewal opportunity"
    putstr_withScreen  ex.message
  end
end

And(/^I navigate to the "([^"]*)" opportunity$/) do |arg|
  begin
    sleep 6
    arg = getReference "ManageRenewalsOpportunity"
    find('#fcf').select "My Opportunities"
    sleep 5
    within (".fBody") do
      click_button 'Go!'
    end
    sleep 10
    if page.has_css?(".listItemPad")
      sleep 4
      puts "Successfully see the Alphabetic Pagination"
      all(".listItemPad")[15].click
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
      if activity.text.include? arg["InvalidRenewalRelationshipOpportunity"]
        puts "Successfully match the Renewal Relationship Opportunity name"
        activity.click
        puts "Successfully opened the #{arg["InvalidRenewalRelationshipOpportunity"]} Renewal Opportunity"
        result = true
        break
      end
    end
    putstr "Unable to find the #{arg["InvalidRenewalRelationshipOpportunity"]} Renewal Opportunity" unless result
  rescue Exception => ex
    putstr "Error occurred while clicking on existing #{arg["InvalidRenewalRelationshipOpportunity"]} Renewal Opportunity page"
    putstr_withScreen  ex.message
  end
end



And(/^I delete the opportunity product$/) do
  $rebuild_product_name = first(".opportunityLineItemBlock").first("tbody").first(".dataRow").first("th").first("a").text
  first(".opportunityLineItemBlock").first(:link,"Del").click
  sleep 3
  page.driver.browser.switch_to.alert.accept
  puts "Deleted product #{$rebuild_product_name}"
  sleep 5
end

And(/^I delete the "([^"]*)" opportunity product$/) do |renewal_relationship|
  begin
    sleep 8
    within all(".pbBody")[1] do
      sleep 5
      $rebuild_product_name = first("tbody").first(".dataRow").first("th").first("a").text
      sleep 3
      first("tbody").first(".dataRow").first("td").first(:link,"Del").click
      sleep 6
      page.driver.browser.switch_to.alert.accept
      sleep 5
      puts "Successfully deleted the #{renewal_relationship} opportunity product"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while deleting the #{renewal_relationship} opportunity product"
    putstr_withScreen  ex.message
  end
end

And(/^I click on renewal relationship "([^"]*)" button$/) do |rebuild|
  begin
    sleep 8
    unless page.has_css?(".no-records-found")
      sleep 4
      unless page.has_xpath?("//div/a[4][contains(@class, 'disabled')]")
        sleep 5
        puts "#{rebuild} button is enabled"
        sleep 4
        puts "Successfully see the Invalid Renewal Relationship"
        click_on rebuild
        sleep 5
        puts "Successfully click the #{rebuild} button"
      else
        puts "#{rebuild} button is disabled"
      end
      sleep 6
    else
      puts "No matching records found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while clicking the #{rebuild} button"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the invalid "([^"]*)" opportunity product$/) do |renewal_relationship|
  begin
    sleep 8
    within all(".pbBody")[1] do
      sleep 5
      invalid_rr_product = first("tbody").first(".dataRow").first("th").first("a").text
      sleep 5
      if invalid_rr_product == $rebuild_product_name
        puts "Successfully Rebuild the Opportunity Line Item"
      else
        puts "Failed to Rebuild the Opportunity Line Item"
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the invalid #{renewal_relationship} opportunity product"
    putstr_withScreen  ex.message
  end
end

And(/^I sync the quotes to renewal opportunity$/) do
  # begin
  sleep 4
  arg = getDetails "ManageRenewalsOpportunity"
  sleep 3
  isQuotePresent = 0
  within all(".pbBody")[10] do
    if page.has_css?(".noRowsHeader")
      puts "No Quote Records found"
      sleep 3
      isQuotePresent = 1
    else
      puts "Successfully see the quote records"
    end
  end
  sleep 3
  if isQuotePresent > 0
    sleep 4
#    within all(".listRelatedObject")[8] do
#      within(".pbButton") do
        click_on arg["CreateQuote"]
#      end
#    end
    sleep 4
    within all(".pbSubsection")[0] do
      first("#Name").send_keys arg["QuoteName"]
    end
    sleep 5
    within("#bottomButtonRow") do
      click_on 'Save'
    end
    sleep 5
  else
    sleep 4
    within all(".pbBody")[10] do
      within(".list") do
        quote_name = first("tbody").all(".dataRow")[0].all("td")[1].first("a").text
        puts quote_name
        sleep 4
        first("tbody").all(".dataRow")[0].all("td")[1].first("a").click
        sleep 3
      end
    end
  end
  sleep 4
  if page.has_css?("#topButtonRow")
    within("#topButtonRow") do
      puts "Successfully quote sync page"
      sleep 3
      if page.has_css?(".syncStart")
        sleep 3
        click_on arg["StartSync"]
        sleep 4
        puts "Successfully start the syncing quote"
      else
        click_on arg["StopSync"]
        sleep 6
        click_on arg["StartSync"]
        sleep 4
        puts "Successfully start the syncing quote"
      end
    end
  else
    puts "Faield to see the quote sync page"
  end
  sleep 4
  if page.has_css?("#syncQuoteOverlay_buttons")
    puts "Successfully see the sync quote overlay"
    click_on 'Sync'
  else
    puts "Failed to see the sync quote overlay"
  end
  sleep 4
  if page.has_css?("#syncQuoteOverlayContent")
    puts "Sync completed"
    sleep 3
    click_on 'Done'
  else
    puts "Sync not completed"
  end
  sleep 3
  if page.has_css?(".pageDescription")
    within("#topButtonRow") do
      puts "Successfully completed the quote syncing"
    end
  else
    puts "Faield to complete the quote syncing"
  end
  sleep 4
  # rescue Exception => ex
  #   putstr "Error occurred while syncing the quote renewal opportunity"
  #   putstr_withScreen  ex.message
  # end
  find(:xpath, "//td[text()='Opportunity Name']").find(:xpath, "following-sibling::td/div/a").click
  sleep 5
end

Then(/^I should able to see the sync error message$/) do
  begin
    sleep 3
    arg = getDetails "ManageRenewalsOpportunity"
    sleep 3
    if page.has_content?(arg["SyncErrorMessage"])
      puts "Successfully see the sync error message"
    else
      putstr "Failed to see the sync error message"
    end
  rescue Exception => ex
    putstr "Error occurred while veriying the sync error message"
    putstr_withScreen  ex.message
  end
end

And(/^I stop the syncing the renewal opportunity$/) do
  begin
    sleep 4
    arg = getDetails "ManageRenewalsOpportunity"
    sleep 3
    isQuotePresent = 0
    within all(".pbBody")[10] do
      if page.has_css?(".noRowsHeader")
        puts "No Quote Records found"
        sleep 3
        isQuotePresent = 1
      else
        puts "Successfully see the quote records"
      end
    end
    sleep 3
    if isQuotePresent > 0
      sleep 4
      click_on arg["CreateQuote"]
      sleep 4
      fill_in "Quote Name", :with => arg["QuoteName"]
      sleep 4
      within("#bottomButtonRow") do
        click_on 'Save'
      end
    else
      sleep 4
      within all(".pbBody")[10] do
        within(".list") do
          quote_name = first("tbody").all(".dataRow")[0].all("td")[1].first("a").text
          puts quote_name
          sleep 4
          first("tbody").all(".dataRow")[0].all("td")[1].first("a").click
          sleep 3
        end
      end
    end
    sleep 4
    if page.has_css?("#topButtonRow")
      within("#topButtonRow") do
        puts "Successfully see the quote sync page"
        sleep 3
        if page.has_css?(".syncStop")
          sleep 3
          click_on arg["StopSync"]
          puts "Successfully stop sync the quote renewal opportunity"
          sleep 3
        else
          putstr "Failed to stop sync quote renewal opportunity"
        end
      end
    else
      puts "Faield to see the quote sync page"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while sync stoping the quote renewal opportunity"
    putstr_withScreen  ex.message
  end
end

And(/^I add the product$/) do
  begin
    sleep 6
    arg = getDetails "SplitOpportunity"
    within("#undefined_grid") do
      all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["SingleProductCheckboxIndex"].to_i
          sleep 5
          unless checkbox.checked?
            checkbox.click
            puts "Successfully enabled the the product"
            break
          else
            puts "Product is already enabled"
          end
        else
          # puts "#{index}"
        end
      end
    end
    sleep 4
    click_on 'Select'
    puts "Successfully select the product"
    sleep 6
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[3]/input").set arg["ProductQuantity"]
    sleep 5
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[6]/input").set arg["ProductSalesPrice"]
    sleep 5
    all(:xpath,'//td/input[@value=" Save "]')[0].click
    sleep 6
  rescue Exception => ex
    putstr "Error occurred while adding the product to renewal opportunity"
    putstr_withScreen  ex.message
  end
end