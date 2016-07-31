#All Opportunities - Opportunity Split specific Step definitions
#All Scenario mentioned in OpportunitySplit.feature

And (/^I click on button "(.*?)"$/) do |data|
  begin
    sleep 6
    within(".opportunityLineItemBlock") do
      click_on data
    end
    sleep 3
    puts "Successfully click the #{data} button"
  rescue Exception=>ex
    putstr "Error on clicking #{data} button"
    putstr_withScreen  ex.message
  end
end

And (/^I clicked button "(.*?)"$/) do|data|
  sleep 5
  begin
    click_on data
    sleep 3
    puts "Successfully #{data} the existing split opportunity"
  rescue Exception=>ex
    putstr "Error in clicking the button #{data}"
    putstr_withScreen  ex.message
  end
end

And(/^I select one or more product from the grid$/) do
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
    sleep 5
    within("#undefined_grid") do
      all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["MultipleProductCheckboxIndex"].to_i
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
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[3]/input").set arg["ProductQuantity"]
    sleep 5
    all(:xpath,'//td/input[@value=" Save "]')[0].click
    sleep 6
  rescue Exception => ex
    putstr "Error occurred while selecting the product from grid, product quality and sales price"
    putstr_withScreen  ex.message
  end
end

And(/^I select the products$/) do
  begin
    sleep 5
    arg = getDetails "SplitOpportunity"
    sleep 5
    within(".opportunityLineItemBlock") do
      within(".list") do
        sleep 3
        $first_product_name = all(".dataRow")[0].all("th")[0].first("a").text
        $second_product_name = all(".dataRow")[1].all("th")[0].first("a").text
        sleep 3
      end
      sleep 5
      all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["FirstProductCheckboxIndex"].to_i
          sleep 5
          unless checkbox.checked?
            checkbox.click
            puts "Successfully enabled the the product"
          else
            puts "Product is already enabled"
          end
        else
        # puts "#{index}"
        end
      end
      sleep 5
      all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["SecondProductCheckboxIndex"].to_i
          sleep 5
          unless checkbox.checked?
            checkbox.click
            puts "Successfully enabled the the product"
          else
            puts "Product is already enabled"
          end
        else
        # puts "#{index}"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the products"
    putstr_withScreen  ex.message
  end
end

And(/^I select the "([^"]*)" option from the "([^"]*)" list$/) do |drop_down_value, label|
  begin
    sleep 5
    find(:xpath,"//div/table/tbody/tr[1]/td/select").select drop_down_value
    sleep 6
    puts "Successfully selected the #{drop_down_value} from #{label} list"
  rescue Exception => ex
    putstr "Error occurred while selecting the #{drop_down_value} from #{label} list"
    putstr_withScreen  ex.message
  end
end

And(/^I fill the required fields$/) do
  begin
    sleep 5
    arg = getDetails "SplitOpportunity"
    arg2 = getReference "SplitOpportunity"
    within all(".pbSubsection")[1] do
      sleep 5
      all('input[type=text]')[0].set arg["TargetOpportunityName"]+$Opp
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
  rescue Exception => ex
    putstr "Error occurred while selected the search criteria"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the renewal relationship & Metrics fields values are recalculated on the opportunity$/) do
  begin
    sleep 6
    arg = getDetails "SplitOpportunity"
    sleep 3
    if page.has_css?(".pageDescription")
      puts "Successfully created the new target opportunity"
    else
      putstr "Failed to created the new target opportunity"
    end
    sleep 5
    within (".opportunityLineItemBlock")do
      within(".list") do
        tr = all(".dataRow")
        tr.each do |row|
          if ((row.all(".dataCell")[0].text == $first_product_name.to_s)||(row.all(".dataCell")[0].text == $second_product_name.to_s))
            puts "Successfully see the selected #{$first_product_name} #{$second_product_name} products"
          else
            putstr "Failed to see the selected #{$first_product_name} #{$second_product_name} products"
          end
        end
      end
    end
    sleep 5
    # within all(".pbSubsection")[0] do
    # sleep 4
    # probability_field = all("tr")[6].all("td")[2].text
    # unless probability_field.to_s == arg["ProbabilityField"].to_s
    # puts "Failed to see the #{probability_field} filed"
    # else
    # puts "Successfully see the #{probability_field} filed"
    # end
    # end
    if page.has_content?(arg["ProbabilityField"])
      puts "Successfully see the #{arg["ProbabilityField"]} filed"
    else
      putstr "Failed to see the #{arg["ProbabilityField"]} filed"
    end

  rescue Exception => ex
    putstr "Error occurred while new target opportunity and product details verification"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the validation error messages$/) do
  begin
    sleep 6
    arg = getDetails "SplitOpportunity"
    sleep 5
    name_error_message = all(:xpath,"//div/table/tbody/tr[2]/td[2]/span/ul/li")[0].text.strip
    close_date_error_message = all(:xpath,"//div/table/tbody/tr[2]/td[2]/span/ul/li")[1].text.strip
    stage_error_message = all(:xpath,"//div/table/tbody/tr[2]/td[2]/span/ul/li")[2].text.strip
    owner_id_error_message = all(:xpath,"//div/table/tbody/tr[2]/td[2]/span/ul/li")[3].text.strip
    probability_error_message = all(:xpath,"//div/table/tbody/tr[2]/td[2]/span/ul/li")[4].text.strip
    sleep 5
    expect(name_error_message).to eq(arg["TargetOpportunityNameErrorMessage"])
    puts "Successfully see the #{name_error_message} error message"
    sleep 5
    expect(close_date_error_message).to eq(arg["TargetOpportunityCloseDateErrorMessage"])
    puts "Successfully see the #{close_date_error_message} error message"
    sleep 5
    expect(stage_error_message).to eq(arg["TargetOpportunityStageErrorMessage"])
    puts "Successfully see the #{stage_error_message} error message"
    sleep 5
    expect(owner_id_error_message).to eq(arg["TargetOpportunityOwnerIDErrorMessage"])
    puts "Successfully see the #{owner_id_error_message} error message"
    sleep 5
    expect(probability_error_message).to eq(arg["TargetOpportunityProbabilityErrorMessage"])
    puts "Successfully see the #{probability_error_message} error message"
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the split opportunities validation messages"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the "([^"]*)" and "([^"]*)" section$/) do |target_opportunity_section, opportunity_products_section|
  begin
    sleep 6
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
  rescue Exception => ex
    putstr "Error occurred while verifying the product validation messages"
    putstr_withScreen  ex.message
  end
end

And(/^I fill the required fields from "([^"]*)" page$/) do |page_file|
  begin
    sleep 5
    arg = getReference "SplitOpportunity"
    within(".pbSubsection") do
      sleep 4
      find(".lookupIcon").click
      sleep 10
    end
    main = page.driver.browser.window_handles.first
    sleep 5
    # page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    # sleep 10
    # page.driver.browser.switch_to.frame("resultsFrame")
    # within('.list') do
    # # first("tbody").all("tr")[1].first("th").first("a").click
    # click_on arg["SelectTargetOpportunity"]
    # end
    # sleep 5
    # page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
    # sleep 5

    page.driver.browser.manage.window.maximize
    sleep 4
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    sleep 7
    page.driver.browser.switch_to.frame("searchFrame")
    sleep 7
    fill_in "lksrch",:with => arg["SelectTargetOpportunity"]
    sleep 7
    click_on 'Go!'
    sleep 3
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    sleep 3
    page.driver.browser.switch_to.frame("resultsFrame")
    sleep 3
    within('.list') do
      click_link arg["SelectTargetOpportunity"]
    end
    sleep 5
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
    sleep 5
    puts "Successfully Select Target opportunity field from #{page_file} page"
    sleep 15
  rescue Exception => ex
    putstr "Error occurred while Select Target Opportunity field from #{page_file} page"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the opportunity details$/) do
  begin
    found =0
    sleep 4
    arg = getDetails "SplitOpportunity"
    sleep 5
    within (".opportunityLineItemBlock")do
      within(".list") do
        tr = all(".dataRow")
        tr.each do |row|
          if ((row.all(".dataCell")[0].text == $first_product_name.to_s)||(row.all(".dataCell")[0].text == $second_product_name.to_s))
          found = 1
          else
          found = 0
          end
        end
      end
    end
    sleep 3
    if (found == 1)
      puts "Successfully see the selected #{$first_product_name} #{$second_product_name} products"
    else
      putstr "Failed to see the selected #{$first_product_name} #{$second_product_name} products"
    end
    sleep 5
    # within all(".pbSubsection")[0] do
    # sleep 6
    # probability_field = all("tr")[5].all("td")[2].text
    # unless probability_field.to_s == arg["ProbabilityField"].to_s
    # putstr "Failed to see the #{probability_field} filed"
    # else
    # puts "Successfully see the #{probability_field} filed"
    # end
    # end
    if page.has_content?(arg["ProbabilityField"])
      puts "Successfully see the #{arg["ProbabilityField"]} filed"
    else
      putstr "Failed to see the #{arg["ProbabilityField"]} filed"
    end

    sleep 3
  rescue Exception => ex
    putstr "Error occurred while new target opportunity and product details verification"
    putstr_withScreen  ex.message
  end
end

And(/^I open existing opportunity$/) do
  begin
  # sleep 6
  # arg = getReference "SplitOpportunity"
  # find('#fcf').select "My Opportunities"
  # sleep 5
  # within (".fBody") do
  # click_button 'Go!'
  # end
  # sleep 6
  # result = false
  # oppName = arg["SplitOpportunityName"].to_s
  # oppInitial = oppName[0]
  # puts oppInitial
  # click_on oppInitial
  # #find(:xpath, '//a/span[text()="#{oppInitial}"]').click
  # sleep 5
  # all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
  # if activity.text.include? arg["SplitOpportunityName"]
  # puts "Successfully match the #{arg["SplitOpportunityName"]} Opportunity name"
  # activity.click
  # puts "Successfully opened the #{arg["SplitOpportunityName"]} Opportunity"
  # result = true
  # break
  # end
  # end
    sleep 6
    arg = getReference "SplitOpportunity"
    find(:xpath, '//input[contains(@placeholder,"Search...")]').click
    sleep 2
    find(:xpath, '//input[contains(@placeholder,"Search...")]').set arg["SplitOpportunityName"]
    sleep 2
    find(:xpath, '//input[contains(@id,"phSearchButton")]').click
    sleep 8
    within(".opportunityBlock") do
      within(".list") do
        if first("tbody").all(".dataRow")[0].all("th")[0].first("a").text == arg["SplitOpportunityName"]
          first("tbody").all(".dataRow")[0].all("th")[0].first("a").click
        end
      end
    end
    sleep 10
    puts "Successfully opened the #{arg["SplitOpportunityName"]} Opportunity"
  rescue Exception => ex
    putstr "Error occurred while clicking on existing #{arg["SplitOpportunityName"]} Opportunity page"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the "([^"]*)" alert message$/) do |alert_message|
  begin
    sleep 5
    if page.driver.browser.switch_to.alert.text.to_s == alert_message.to_s
      puts "Successfully see the #{alert_message} alert message"
      page.driver.browser.switch_to.alert.accept
    else
      putstr "Failed to see the #{alert_message} alert message"
      page.driver.browser.switch_to.alert.accept
    end
  rescue Exception => ex
    putstr "Error occurred while validating #{alert_message} alert message"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to cancel the split opportunity$/) do
  begin
    sleep 4
    if page.has_css?(".pageDescription")
      puts "Successfully cancel the existing split opportunity"
    else
      putstr "Failed to cancel the existing split opportunity"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while cancel the existing split opportunity"
    putstr_withScreen  ex.message
  end
end