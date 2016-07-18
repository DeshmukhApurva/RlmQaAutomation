#All Opportunity Management - Renewal Opportunity Fields specific Step definitions
#All Scenario mentioned in RenewalOpportunityFields.feature

Then(/^I should able to see the opportunity detail fields$/) do
  begin
    sleep 6
    arg = getDetails "RenewalOpportunityFields"
    within all(".pbSubsection")[0] do
      opportunity_name_field = all("tr")[0].first("td").text
      account_name_field = all("tr")[1].first("td").text
      type_field = all("tr")[2].first("td").text
      earliest_expiration_date_field = all("tr")[3].first("td").text
      expiration_quarter_field = all("tr")[4].first("td").text
      expiration_year_fields = all("tr")[5].first("td").text

      if all("tr")[1].all("td")[3].first("img")[:title] == "Checked"
        puts "Opportunity Renewal checkbox is checked"
      else
        puts "Opportunity Renewal checkbox is not checked"
      end

      unless opportunity_name_field.to_s == arg["OpportunityNameField"].to_s
        putstr "Failed to see the #{opportunity_name_field} field"
      else
        puts "Successfully see the #{opportunity_name_field} field"
      end
      sleep 5

      unless account_name_field.to_s == arg["AccountNameField"].to_s
        putstr "Failed to see the #{account_name_field} field"
      else
        puts "Successfully see the #{account_name_field} field"
      end
      sleep 5

      unless type_field.to_s == arg["TypeField"].to_s
        putstr "Failed to see the #{type_field} field"
      else
        puts "Successfully see the #{type_field} field"
      end
      sleep 5

      unless earliest_expiration_date_field.to_s == arg["EarliestExpirationDateField"].to_s
        putstr "Failed to see the #{earliest_expiration_date_field} field"
      else
        puts "Successfully see the #{earliest_expiration_date_field} field"
      end
      sleep 5

      unless expiration_quarter_field.to_s == arg["ExpirationQuarterField"].to_s
        putstr "Failed to see the #{expiration_quarter_field} field"
      else
        puts "Successfully see the #{expiration_quarter_field} field"
      end
      sleep 5

      unless expiration_year_fields.to_s == arg["ExpirationYearField"].to_s
        putstr "Failed to see the #{expiration_year_fields} field"
      else
        puts "Successfully see the #{expiration_year_fields} field"
      end
      sleep 5

      opportunity_owner_field = all("tr")[0].all("td")[2].text
      renewal_field = all("tr")[1].all("td")[2].text
      stage_field = all("tr")[2].all("td")[2].text
      close_date_field = all("tr")[3].all("td")[2].text
      renewal_target_field = all("tr")[4].all("td")[2].text
      probability_field = all("tr")[5].all("td")[2].text

      unless opportunity_owner_field.to_s == arg["OpportunityOwnerField"].to_s
        putstr "Failed to see the #{opportunity_owner_field} field"
      else
        puts "Successfully see the #{opportunity_owner_field} field"
      end
      sleep 5

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
      sleep 5

      unless close_date_field.to_s == arg["CloseDateField"].to_s
        putstr "Failed to see the #{close_date_field} field"
      else
        puts "Successfully see the #{close_date_field} field"
      end
      sleep 5

      unless renewal_target_field.to_s == arg["RenewalTargetField"].to_s
        putstr "Failed to see the #{renewal_target_field} field"
      else
        puts "Successfully see the #{renewal_target_field} field"
      end
      sleep 5

      unless probability_field.to_s == arg["ProbabilityField"].to_s
        putstr "Failed to see the #{probability_field} field"
      else
        puts "Successfully see the #{probability_field} field"
      end
      sleep 5

      if page.has_content?(arg["AmountField"])
        puts "Successfully see the #{arg["AmountField"]} field"
      else
        putstr "Failed to see the #{arg["AmountField"]} field"
      end
      sleep 5
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the opportunity detail fields"
    putstr_withScreen  ex.message
  end
end

And(/^I change the earliest expiration date value and set the new date range$/) do
  begin
    sleep 5
    arg = getDetails "RenewalOpportunityFields"
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    sleep 5
    within all(".pbSubsection")[0] do
      sleep 5
      all("input[type='text']")[2].set arg["SetTheNewDateRange"]
      sleep 5
      puts "Successfully set the new Earliest Expiration Date"
    end
    sleep 3
    within("#bottomButtonRow") do
      sleep 3
      click_on 'Save'
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while setting up the new Earliest Expiration Date"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the renewals indicators fields$/) do
  begin
    sleep 6
    arg = getDetails "RenewalOpportunityFields"
    #within all(".pbSubsection") do

    unless page.has_content?(arg["DaysUntilExpirationField"])
      putstr "Failed to see the #{arg["DaysUntilExpirationField"]} field"
    else
      puts "Successfully see the #{arg["DaysUntilExpirationField"]} field"
    end
    sleep 5

    unless page.has_content?(arg["DIAContactedField"])
      putstr "Failed to see the #{arg["DIAContactedField"]} field"
    else
      puts "Successfully see the #{arg["DIAContactedField"]} field"
    end
    sleep 5

    unless page.has_content?(arg["DIAQuotedField"])
      putstr "Failed to see the #{arg["DIAQuotedField"]} field"
    else
      puts "Successfully see the #{arg["DIAQuotedField"]} field"
    end
    sleep 5

    unless page.has_content?(arg["DIAClosedField"])
      putstr "Failed to see the #{arg["DIAClosedField"]} field"
    else
      puts "Successfully see the #{arg["DIAClosedField"]} field"
    end
    sleep 5

    unless page.has_content?(arg["ConversionRateField"])
      putstr "Failed to see the #{arg["ConversionRateField"]} field"
    else
      puts "Successfully see the #{arg["ConversionRateField"]} field"
    end
    sleep 5

    unless page.has_content?(arg["LossRateField"])
      putstr "Failed to see the #{arg["LossRateField"]} field"
    else
      puts "Successfully see the #{arg["LossRateField"]} field"
    end
    #end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the renewals indicators fields"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the renewal tracking fields$/) do
  begin
    sleep 6
    arg = getDetails "RenewalOpportunityFields"
    within all(".pbSubsection")[2] do
      destination_renewal_opportunity_field = all("tr")[0].first("td").text
      first_contact_date_field = all("tr")[1].first("td").text
      first_quote_date_field = all("tr")[2].first("td").text
      resolution_date_field = all("tr")[3].first("td").text
      adds_amount_field = all("tr")[4].first("td").text
      adds_ratio_field = all("tr")[5].first("td").text
      conversion_delta_field = all("tr")[6].first("td").text
      created_by_field = all("tr")[7].first("td").text

      unless destination_renewal_opportunity_field.to_s == arg["DestinationRenewalOpportunityField"].to_s
        putstr "Failed to see the #{destination_renewal_opportunity_field} field"
      else
        puts "Successfully see the #{destination_renewal_opportunity_field} field"
      end
      sleep 5

      unless first_contact_date_field.to_s == arg["FirstContactDateField"].to_s
        putstr "Failed to see the #{first_contact_date_field} field"
      else
        puts "Successfully see the #{first_contact_date_field} field"
      end
      sleep 2

      unless first_quote_date_field.to_s == arg["FirstQuoteDateField"].to_s
        putstr "Failed to see the #{first_quote_date_field} field"
      else
        puts "Successfully see the #{first_quote_date_field} field"
      end
      sleep 2

      unless resolution_date_field.to_s == arg["ResolutionDateField"].to_s
        putstr "Failed to see the #{resolution_date_field} field"
      else
        puts "Successfully see the #{resolution_date_field} field"
      end
      sleep 2

      unless adds_amount_field.to_s == arg["AddsAmountField"].to_s
        putstr "Failed to see the #{adds_amount_field} field"
      else
        puts "Successfully see the #{adds_amount_field} field"
      end
      sleep 2

      unless adds_ratio_field.to_s == arg["AddsRatioField"].to_s
        putstr "Failed to see the #{adds_ratio_field} field"
      else
        puts "Successfully see the #{adds_ratio_field} field"
      end
      sleep 2

      unless conversion_delta_field.to_s == arg["ConversionDeltaField"].to_s
        putstr "Failed to see the #{conversion_delta_field} field"
      else
        puts "Successfully see the #{conversion_delta_field} field"
      end
      sleep 2

      unless created_by_field.to_s == arg["CreatedByField"].to_s
        putstr "Failed to see the #{created_by_field} field"
      else
        puts "Successfully see the #{created_by_field} field"
      end
      sleep 2

      #      $after_update_renewal_target = find(:xpath, "//td[text()='Renewal Target - Resolved']/following-sibling::td/div").text
      #
      #      if $before_update_renewal_target != $after_update_renewal_target
      #        putstr "Successfully updated Renewal Target - Resolved field"
      #      else
      #        putstr "Failed to update Renewal Target - Resolved field"
      #      end

      if page.has_content?(arg["DestinationServiceContractField"])
        puts "Successfully see the #{arg["DestinationServiceContractField"]} field"
      else
        putstr "Failed to see the #{arg["DestinationServiceContractField"]} field"
      end
      sleep 3
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
      sleep 3
      if page.has_content?(arg["RenewalTargetWonField"])
        puts "Successfully see the #{arg["RenewalTargetWonField"]} field"
      else
        putstr "Failed to see the #{arg["RenewalTargetWonField"]} field"
      end
      sleep 3
      if page.has_content?(arg["LastModifiedByField"])
        puts "Successfully see the #{arg["LastModifiedByField"]} field"
      else
        putstr "Failed to see the #{arg["LastModifiedByField"]} field"
      end
    end

    #$before_update_renewal_target = find(:xpath, "//td[text()='Renewal Target - Resolved']/following-sibling::td/div").text
    #puts $before_update_renewal_target

    sleep 5
    before_rt_won = find(:xpath, "//div[6]/table/tbody/tr[3]/td[4]/div[1]").text
    puts "before_rt_won = "
    puts find(:xpath, "//div[6]/table/tbody/tr[3]/td[4]/div[1]").text

    before_rt_lost = find(:xpath, "//div[6]/table/tbody/tr[5]/td[4]/div[1]").text
    puts "before_rt_lost = "
    puts find(:xpath, "//div[6]/table/tbody/tr[5]/td[4]/div[1]").text

    #find(:xpath,"(//a[contains(text(),'Edit')])[6]").click

    within all(".customnotabBlock")[0]do
      first(:link,"Edit").click
    end
    sleep 10
    visit(current_path)
    puts find(:xpath, "//div[@id='ep']/div[2]/div[2]/table/tbody/tr[4]/td[4]/span/select").value
    puts "--"
    RenStatus = find(:xpath, "//div[@id='ep']/div[2]/div[2]/table/tbody/tr[4]/td[4]/span/select").value
    if RenStatus == "Open"
      first(:option, 'Won').select_option
    elsif RenStatus == "Won"
      first(:option, 'Lost').select_option
    elsif RenStatus == "Lost"
      first(:option, 'Won').select_option
    end

    sleep 5
    puts find(:xpath, "//div[@id='ep']/div[2]/div[2]/table/tbody/tr[4]/td[4]/span/select").value
    first(:button, 'Save').click
    sleep 10
    if page.has_xpath?('//a[@title="ServiceSource Setup Tab"]')
      first(:link, 'RenewNetOpsTesting').click
    else
      first(:link, 'RenewTesting').click
    end
    sleep 5

    after_rt_won = find(:xpath, "//div[6]/table/tbody/tr[3]/td[4]/div[1]").text
    after_rt_lost = find(:xpath, "//div[6]/table/tbody/tr[5]/td[4]/div[1]").text

    #after_rt_won = find(:xpath, "//div[6]/table/tbody/tr[3]/td[4]/div[1]").text
    puts "after_rt_won = "
    puts find(:xpath, "//div[6]/table/tbody/tr[3]/td[4]/div[1]").text

    #after_rt_lost = find(:xpath, "//div[6]/table/tbody/tr[5]/td[4]/div[1]").text
    puts "after_rt_lost = "
    puts find(:xpath, "//div[6]/table/tbody/tr[5]/td[4]/div[1]").text

    if before_rt_won != after_rt_won
      puts "Renewal Target - Won updated/changed Successfully"
    end
    if before_rt_lost != after_rt_lost
      puts "Renewal Target - Lost updated/changed Successfully"
    end

    puts "Successfully updated Renewal Target - Won/Lost"
    sleep 5

    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the renewal tracking fields"
    putstr_withScreen  ex.message
  end
end

And(/^I click on RenewTesting link$/) do
  begin

    first(:link, 'RenewTesting').click
    #click_on 'RenewTesting'
    sleep 5

    before_rt_won = find(:xpath, "//div[6]/table/tbody/tr[3]/td[4]/div[1]").text
    puts "before_rt_won = "
    puts find(:xpath, "//div[6]/table/tbody/tr[3]/td[4]/div[1]").text

    before_rt_lost = find(:xpath, "//div[6]/table/tbody/tr[5]/td[4]/div[1]").text
    puts "before_rt_lost = "
    puts find(:xpath, "//div[6]/table/tbody/tr[5]/td[4]/div[1]").text

    find(:xpath,"(//a[contains(text(),'Edit')])[6]").click
    sleep 10
    visit(current_path)
    puts find(:xpath, "//div[@id='ep']/div[2]/div[2]/table/tbody/tr[4]/td[4]/span/select").value
    puts "--"
    RenStatus = find(:xpath, "//div[@id='ep']/div[2]/div[2]/table/tbody/tr[4]/td[4]/span/select").value
    if RenStatus == "Open"
      first(:option, 'Won').select_option
    elsif RenStatus == "Won"
      first(:option, 'Lost').select_option
    elsif RenStatus == "Lost"
      first(:option, 'Won').select_option
    end

    sleep 5
    puts find(:xpath, "//div[@id='ep']/div[2]/div[2]/table/tbody/tr[4]/td[4]/span/select").value
    first(:button, 'Save').click
    sleep 10
    first(:link, 'RenewTesting').click
    sleep 5

    after_rt_won = find(:xpath, "//div[6]/table/tbody/tr[3]/td[4]/div[1]").text
    after_rt_lost = find(:xpath, "//div[6]/table/tbody/tr[5]/td[4]/div[1]").text

    #after_rt_won = find(:xpath, "//div[6]/table/tbody/tr[3]/td[4]/div[1]").text
    puts "after_rt_won = "
    puts find(:xpath, "//div[6]/table/tbody/tr[3]/td[4]/div[1]").text

    #after_rt_lost = find(:xpath, "//div[6]/table/tbody/tr[5]/td[4]/div[1]").text
    puts "after_rt_lost = "
    puts find(:xpath, "//div[6]/table/tbody/tr[5]/td[4]/div[1]").text

    if before_rt_won != after_rt_won
      puts "Renewal Target - Won updated/changed Successfully"
    end
    if before_rt_lost != after_rt_lost
      puts "Renewal Target - Lost updated/changed Successfully"
    end

    puts "Successfully updated Renewal Target - Won/Lost"
    sleep 5

  end

end

And(/^I change renewal status of one of the line items to "([^"]*)"$/) do |stage|
  begin
    sleep 5
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    sleep 5
    within all(".pbSubsection")[0] do
      sleep 3
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
      sleep 5
      find("#opp11").select stage
      sleep 5
      puts "Successfully selected the renewal status of one of the line items"
    end
    sleep 3
    within("#bottomButtonRow") do
      sleep 3
      click_on 'Save'
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while change renewal status of one of the line items"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the "([^"]*)" section$/) do |title|
  begin
    sleep 5
    within all(".customnotabBlock")[0] do
      renewal_relationship_title = first(".pbTitle").text
      sleep 4
      unless renewal_relationship_title.to_s == title.to_s
        putstr "Failed to see the #{renewal_relationship_title} section"
      else
        puts "Successfully see the #{renewal_relationship_title} section"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the renewal relationship section"
    putstr_withScreen  ex.message
  end
end