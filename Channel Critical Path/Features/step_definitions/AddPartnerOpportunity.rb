#All Partner Opportunity - Add Partner Opportunity specific Step definitions
#All Scenario mentioned in AddPartnerOpportunity.feature


Then(/^I verify the "([^"]*)" name and corresponding "([^"]*)" name$/) do |opportunity , account|
  begin
    sleep 4
    #opportunity_name = find(:xpath, "//*[contains(@id, 'OppNameLable')]").text
    opportunity_name = find(:xpath, "//*/th[text()='Opportunity Name']/following-sibling::td/span",:match => :prefer_exact ).text
    puts "Opportunity Name: #{opportunity_name}"
    sleep 3
    #account_name = find(:xpath, "//*[contains(@id, 'AccountNameLable')] | //*/th[text()='Account Name']/following-sibling::td/span",exact: true).text
    account_name = find(:xpath, "//*/th[text()='Account Name']/following-sibling::td/span",  :match => :prefer_exact).text
    puts "Account Name: #{account_name}"
    sleep 3
    if opportunity_name.include? opportunity
      puts "Successfully see the #{opportunity_name} name"
    else
      putstr "Failed to see the #{opportunity_name} name"
    end
    sleep 4
    if account_name.include? account
      puts "Successfully see the #{account} name"
    else
      putstr "Failed to see the #{account} name"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{opportunity_name} and #{account} names"
    putstr_withScreen  ex.message
  end
end

When(/^I navigate to "([^"]*)" section$/) do |section|
  begin
   sleep 4
   if page.has_content?(section)
     puts "Successfully see the #{section} section"
   else
     putstr "Failed to see the #{section} section"
   end
   sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the #{section} section"
    putstr_withScreen  ex.message
 end
end

And(/^I select the "([^"]*)" from the accounts lookup list$/) do |partner_accounts|
  begin
    arg = getDetails "AddPartnerOpportunity"
    arg2 = getReference "AddPartnerOpportunity"
    sleep 4
    within all(".pbSubsection")[1] do
     if page.has_content?(arg["PartnerAccount1FieldName"])
       puts "Successfully see the #{arg["PartnerAccount1FieldName"]} field"
     else
       putstr "Failed to see the #{arg["PartnerAccount1FieldName"]} field"
     end
   sleep 4
   if page.has_content?(arg["PartnerAccount2FieldName"])
     puts "Successfully see the #{arg["PartnerAccount2FieldName"]} field"
   else
     putstr "Failed to see the #{arg["PartnerAccount2FieldName"]} field"
   end
  end
   sleep 4
   if page.has_css?(".lookupIcon")
     puts "Successfully see the #{arg["PartnerAccount1FieldName"]} and #{arg["PartnerAccount2FieldName"]} lookup Icons"
       sleep 8
       main = page.driver.browser.window_handles.first
       sleep 5
       find("img[alt='Partner Account 1 Lookup (New Window)']").click
       sleep 8
       page.driver.browser.manage.window.maximize
       sleep 5
       page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
       sleep 10
       page.driver.browser.switch_to.frame("resultsFrame")
       sleep 4
       within('.list') do
         click_link arg2["PartnerAccount1Name"]
       end
       sleep 5
       page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
       sleep 5
       puts "Successfully Selected the #{arg["PartnerAccount1FieldName"]} from #{arg["PartnerOpportunityName"]} page"
       sleep 8
       main = page.driver.browser.window_handles.first
       sleep 5
       find("img[alt='Partner Account 2 Lookup (New Window)']").click
       sleep 8
       page.driver.browser.manage.window.maximize
       sleep 5
       page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
       sleep 10
       page.driver.browser.switch_to.frame("resultsFrame")
       within('.list') do
         click_link arg2["PartnerAccount2Name"]
       end
       sleep 5
       page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
       sleep 5
       puts "Successfully Selected the #{arg["PartnerAccount2FieldName"]} from #{arg["PartnerOpportunityName"]} page"
       sleep 8
   else
     putstr "Failed to see the #{arg["PartnerAccount1FieldName"]} and #{arg["PartnerAccount2FieldName"]} lookup Icons"
   end
   sleep 4
  rescue Exception => ex
    putstr "Error occurred while clicking the #{arg["PartnerAccount1FieldName"]} and #{arg["PartnerAccount2FieldName"]} lookup Icons and #{partner_accounts}"
    putstr_withScreen  ex.message
  end
end


And(/^I select the "([^"]*)" from the contacts lookup list$/) do |partner_account_contacts|
  begin
    arg = getDetails "AddPartnerOpportunity"
    arg2 = getReference "AddPartnerOpportunity"
    sleep 4
    within all(".pbSubsection")[2] do
      if page.has_content?(arg["PartnerAccount1ContactFieldName"])
        puts "Successfully see the #{arg["PartnerAccount1ContactFieldName"]} field"
      else
        putstr "Failed to see the #{arg["PartnerAccount1ContactFieldName"]} field"
      end
      sleep 4
      if page.has_content?(arg["PartnerAccount2ContactFieldName"])
        puts "Successfully see the #{arg["PartnerAccount2ContactFieldName"]} field"
      else
        putstr "Failed to see the #{arg["PartnerAccount2ContactFieldName"]} field"
      end
    end
      sleep 4
      if page.has_css?(".lookupIcon")
        puts "Successfully see the #{arg["PartnerAccount1ContactFieldName"]} and #{arg["PartnerAccount2ContactFieldName"]} lookup Icons"
        sleep 8
        main = page.driver.browser.window_handles.first
        sleep 5
        find("img[alt='Partner Account 1 Contact Lookup (New Window)']").click
        sleep 8
        page.driver.browser.manage.window.maximize
        sleep 5
        page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
        sleep 10
        page.driver.browser.switch_to.frame("resultsFrame")
        sleep 4
        within('.list') do
          click_link arg2["PartnerAccount1Contact"]
        end
        sleep 5
        page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
        sleep 5
        puts "Successfully Selected the #{arg["PartnerAccount1ContactFieldName"]} from #{arg["PartnerOpportunityName"]} page"
        sleep 8
        main = page.driver.browser.window_handles.first
        sleep 5
        find("img[alt='Partner Account 2 Contact Lookup (New Window)']").click
        sleep 8
        page.driver.browser.manage.window.maximize
        sleep 5
        page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
        sleep 10
        page.driver.browser.switch_to.frame("resultsFrame")
        within('.list') do
          click_on arg2["PartnerAccount2Contact"]
        end
        sleep 5
        page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
        sleep 5
        puts "Successfully Selected the #{arg["PartnerAccount2ContactFieldName"]} from #{arg["PartnerOpportunityName"]} page"
        sleep 8
      else
        putstr "Failed to see the #{arg["PartnerAccount1ContactFieldName"]} and #{arg["PartnerAccount2ContactFieldName"]} lookup Icons"
      end
      sleep 4
  rescue Exception => ex
    putstr "Error occurred while clicking the #{arg["PartnerAccount1ContactFieldName"]} and #{arg["PartnerAccount2ContactFieldName"]} lookup Icons and #{partner_account_contacts}"
    putstr_withScreen  ex.message
  end
end


And(/^I select the account as "([^"]*)" or "([^"]*)"$/) do |account1, account2|
  begin
  sleep 5
  within all(".pbSubsection")[1] do
      sleep 4
      result = false
      # account_list = first("tbody").first("tr").all("td")[1].first("select").all('option').collect(&:text)
      # puts account_list
      first("tbody").first("tr").all("td")[1].first("select").all('option').each do |accounts|
      if accounts.text.to_s.include?account1.to_s
        sleep 5
        puts "Successfully see the #{account1} field value"
        sleep 4
        first("tbody").first("tr").all("td")[1].first("select").select account1
        result = true
        break
      end
    end
    putstr "Failed to see the #{account1} field value" unless result
    sleep 8
    result = false
    first("tbody").all("tr")[1].all("td")[1].first("select").all('option').each do |accounts|
      if accounts.text.to_s.include?account2.to_s
        sleep 5
        puts "Successfully see the #{account2} field values"
        sleep 4
        first("tbody").all("tr")[1].all("td")[1].first("select").select account2
        result = true
        break
      end
    end
    putstr "Failed to see the #{account2} field value" unless result
  end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{account1} and #{account2} field values"
    putstr_withScreen  ex.message
  end
end

And(/^I select the "([^"]*)" checkbox$/) do |incumbent_checkbox|
  begin
    sleep 5
    within all(".pbSubsection")[1] do
      within('.detailList') do
        if find('input[type=checkbox]').checked?
          sleep 3
          puts "#{incumbent_checkbox} is already enabled"
        else
          sleep 4
          find('input[type=checkbox]').click
          sleep 3
          puts "Enabled the #{incumbent_checkbox}"
          break
        end
      end
    end
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while selecting #{incumbent_checkbox} checkbox"
    putstr_withScreen  ex.message
  end
end

And(/^I select the partner account$/) do
  begin
    arg = getDetails "AddPartnerOpportunity"
    arg2 = getReference "AddPartnerOpportunity"
    sleep 4
    within all(".pbSubsection")[1] do
      if page.has_content?(arg["PartnerAccount1FieldName"])
        puts "Successfully see the #{arg["PartnerAccount1FieldName"]} field"
      else
        putstr "Failed to see the #{arg["PartnerAccount1FieldName"]} field"
      end
      sleep 4
      puts "Successfully see the #{arg["PartnerAccount1FieldName"]} lookup Icon"
      sleep 4
    end
  if page.has_css?(".lookupIcon")
      puts "Successfully see the #{arg["PartnerAccount1FieldName"]} and #{arg["PartnerAccount2FieldName"]} lookup Icons"
      sleep 8
      main = page.driver.browser.window_handles.first
      sleep 5
      find("img[alt='Partner Account 1 Lookup (New Window)']").click
      sleep 8
      page.driver.browser.manage.window.maximize
      sleep 5
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      sleep 10
      page.driver.browser.switch_to.frame("resultsFrame")
      sleep 4
      within('.list') do
        click_link arg2["PartnerAccount1Name"]
      end
      sleep 5
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
      sleep 5
      puts "Successfully Selected the #{arg["PartnerAccount1FieldName"]} from #{arg["PartnerOpportunityName"]} page"
      sleep 8
  else
      putstr "Failed to see the #{arg["PartnerAccount1FieldName"]} lookup Icon"
  end
      sleep 4
  rescue Exception => ex
    putstr "Error occurred while selecting the #{arg["PartnerAccount1FieldName"]} lookup Icon"
    putstr_withScreen  ex.message
  end
end


And(/^I "([^"]*)" and "([^"]*)" any previous term line item from the grid$/) do |deselect_all, select_all|
  begin
    sleep 5
    within all(".pbSubsection")[3] do
      sleep 5
      if page.has_css?("#selectDeselectTermLI")
        count = first("tbody").all("tr").count
      if count >= 0
        unless find("#selectDeselectTermLI").text.to_s == deselect_all.to_s
          sleep 3
          puts "Successfully see the #{deselect_all} button"
          click_on deselect_all
          sleep 4
          puts "Successfully deselect the Quote Line Items"
          sleep 3
          click_on select_all
          puts "Successfully select the Quote Line Items"
        else
          sleep 4
          puts "Successfully see the #{select_all} button"
          sleep 4
          click_on select_all
          puts "Successfully select the Quote Line Items"
        end
      else
        puts "No Previous Term Line Items fields found"
      end
     else
        puts "No Previous Term Line Items found"
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while deselecting the Previous Term Line Items fields"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the all term "([^"]*)" are selected$/) do |previous_term_line_item|
  begin
    sleep 5
    within all(".pbSubsection")[3] do
      sleep 5
      count = first("tbody").all("tr").count
      if count >= 0
        all('input[type=checkbox]').each do |checkbox|
          if checkbox.checked?
            sleep 3
            puts "#{previous_term_line_item} is selected"
          else
            sleep 3
            puts "#{previous_term_line_item} is not selected"
          end
        end
      else
        putstr "No #{previous_term_line_item} found"
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifing the #{previous_term_line_item} are selected"
    putstr_withScreen  ex.message
  end
end


And(/^I "([^"]*)" and "([^"]*)" any quote line item from the grid$/) do |deselect_all, select_all|
  begin
    sleep 5
    within all(".pbSubsection")[5] do
      sleep 5
    if page.has_css?("#selectDeselectQoteTerm")
      count = first("tbody").all("tr").count
    if count >= 0
      unless find("#selectDeselectQoteTerm").text.to_s == deselect_all.to_s
        sleep 3
        puts "Successfully see the #{deselect_all} button"
        click_on deselect_all
        sleep 4
        puts "Successfully deselect the Quote Line Items"
        sleep 3
        click_on select_all
        puts "Successfully select the Quote Line Items"
      else
         sleep 4
         puts "Successfully see the #{select_all} button"
         sleep 4
         click_on select_all
         puts "Successfully select the Quote Line Items"
      end
     else
      puts "No Quote Line Items fields found"
    end
    else
      puts "No Quote Line Items found"
    end
   end
   sleep 5
  rescue Exception => ex
    putstr "Error occurred while deselecting the Quote Line Items fields"
    putstr_withScreen  ex.message
  end
end


And(/^I add the "([^"]*)" attachment$/) do |url|
  begin
    sleep 4
    file_path = "#{Dir.pwd}/#{url}"
    sleep 10
    first(:xpath,"//*[contains(@name, 'attachmentLineSection')]").set(file_path)
    sleep 10
    puts "Successfully attached the file"
  rescue Exception => ex
    putstr "Error occurred while attaching the file"
    putstr_withScreen  ex.message
 end
end

Then(/^I verify the all "([^"]*)" are selected$/) do |quote_line_item|
  begin
    sleep 5
    within all(".pbSubsection")[5] do
      sleep 5
      count = first("tbody").all("tr").count
      if count >= 0
        all('input[type=checkbox]').each do |checkbox|
          if checkbox.checked?
            sleep 3
            puts "#{quote_line_item} is selected"
          else
            sleep 3
            puts "#{quote_line_item} is not selected"
          end
        end
      else
        putstr "No #{quote_line_item} found"
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifing the #{quote_line_item} are selected"
    putstr_withScreen  ex.message
  end
end



And(/^I select the "([^"]*)" account$/) do |partner_account|
  begin
    sleep 5
    arg = getDetails "AddPartnerOpportunity"
    arg2 = getReference "AddPartnerOpportunity"
    sleep 4
    if page.has_css?(".lookupIcon")
        puts "Successfully see the #{arg["PartnerAccount1FieldName"]} lookup Icon"
        sleep 8
        main = page.driver.browser.window_handles.first
        sleep 5
        find("img[alt='Partner Account 1 Lookup (New Window)']").click
        sleep 8
        page.driver.browser.manage.window.maximize
        sleep 5
        page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
        sleep 10
        page.driver.browser.switch_to.frame("resultsFrame")
        sleep 4
        within('.list') do
          click_link arg2["PartnerAccount1HierarchyName"]
        end
        sleep 5
        page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
        sleep 5
        puts "Successfully Selected the #{arg["PartnerAccount1FieldName"]} from #{arg["PartnerOpportunityName"]} page"
        sleep 8
    else
      putstr "Failed to see the #{arg["PartnerAccount1FieldName"]} lookup Icon"
    end
    sleep 4
  rescue Exception => ex
      putstr "Error occurred while clicking the #{arg["PartnerAccount1FieldName"]} lookup Icon and #{partner_account}"
      putstr_withScreen  ex.message
  end
end

And(/^I select the "([^"]*)" contact$/) do |partner_account|
  begin
  sleep 5
  arg = getDetails "AddPartnerOpportunity"
  arg2 = getReference "AddPartnerOpportunity"
  sleep 4
  if page.has_css?(".lookupIcon")
      puts "Successfully see the #{arg["PartnerAccount1ContactFieldName"]} lookup Icon"
      sleep 8
      main = page.driver.browser.window_handles.first
      sleep 5
      find("img[alt='Partner Account 1 Contact Lookup (New Window)']").click
      sleep 8
      page.driver.browser.manage.window.maximize
      sleep 5
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      sleep 10
      page.driver.browser.switch_to.frame("resultsFrame")
      sleep 4
      within('.list') do
        click_link arg2["PartnerAccount1HierarchyContact"]
      end
      sleep 5
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
      sleep 5
      puts "Successfully Selected the #{arg["PartnerAccount1ContactFieldName"]} from #{arg["PartnerOpportunityName"]} page"
      sleep 8
  else
    putstr "Failed to see the #{arg["PartnerAccount1ContactFieldName"]} lookup Icon"
  end
  sleep 4
  rescue Exception => ex
    putstr "Error occurred while clicking the #{arg["PartnerAccount1ContactFieldName"]} lookup Icon and #{partner_account}"
    putstr_withScreen  ex.message
 end
end

Then(/^I should be able to see the partner opportunity details$/) do
  begin
    sleep 5
    arg = getReference "AddPartnerOpportunity"
    sleep 4
    if page.has_css?(".pageDescription")
      page_title = find(".pageDescription").text
      sleep 4
      puts "Successfully see the partner opportunity #{page_title} details page"
      sleep 5
      within all(".pbSubsection")[0] do
        sleep 4
        opportunity_name = first("tbody").all("tr")[1].all("td")[1].text
        if opportunity_name.to_s == arg["PartnerOpportunityName"].to_s
          puts "Successfully see the partner opportunity #{opportunity_name} name"
        else
          putstr "Failed to see the partner opportunity #{arg["PartnerOpportunityName"]} name"
        end
        sleep 5
      end
      sleep 5
      within all(".pbSubsection")[1] do
        sleep 5
        partner_account1 = first("tbody").first("tr").all("td")[1].text
        if partner_account1.to_s == arg["PartnerAccount1Name"].to_s
          puts "Successfully see the partner account1 #{partner_account1} name"
        else
          putstr "Failed to see the partner account1 #{arg["PartnerAccount1Name"]} name"
        end
      end
    else
      putstr "Failed to see the partner opportunity details page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the partner opportunity details page"
    putstr_withScreen  ex.message
  end
end

Then(/^I should be able to see the partner opportunity account details$/) do
  begin
    sleep 5
    arg = getReference "AddPartnerOpportunity"
    sleep 4
    if page.has_css?(".pageDescription")
      page_title = find(".pageDescription").text
      sleep 4
      puts "Successfully see the partner opportunity #{page_title} details page"
      sleep 5
      within all(".pbSubsection")[0] do
        opportunity_name = first("tbody").all("tr")[1].all("td")[1].text
        if opportunity_name.to_s == arg["PartnerOpportunityName"].to_s
          puts "Successfully see the partner opportunity #{opportunity_name} name"
        else
          putstr "Failed to see the partner opportunity #{arg["PartnerOpportunityName"]} name"
        end
      end
      sleep 5
      within all(".pbSubsection")[1] do
        partner_account1 = first("tbody").first("tr").all("td")[1].text
        if partner_account1.to_s == arg["PartnerAccount1Name"].to_s
          puts "Successfully see the partner account1 #{partner_account1} name"
        else
          putstr "Failed to see the partner account1 #{arg["PartnerAccount1Name"]} name"
        end
        sleep 5
        partner_contact1 = first("tbody").all("tr")[2].all("td")[1].text
        if partner_contact1.to_s == arg["PartnerAccount1Contact"].to_s
          puts "Successfully see the partner contact1 #{partner_contact1} name"
        else
          putstr "Failed to see the partner contact1 #{arg["PartnerAccount1Contact"]} name"
        end
        sleep 5
        if all("tr")[3].all("td")[1].first("img")[:title] == "Checked"
          puts "Incumbent checkbox is checked"
        else
          putstr "Incumbent checkbox is not checked"
        end
      end
    else
      putstr "Failed to see the partner opportunity details page"
   end
   sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the partner opportunity details page"
    putstr_withScreen  ex.message
  end
end


And(/^I delete the "([^"]*)" attachment$/) do |attached_file_name|
  begin
    sleep 4
    within(".noStandardTab") do
      within(".pbBody") do
        sleep 4
      if page.has_css?("#noRowsHeader")
        sleep 4
        attachment_name = first(".dataRow").all("td")[1].first("a").text
        puts attachment_name
        if attachment_name.to_s == attached_file_name.to_s
          puts "Successfully see the attachment"
          sleep 3
          click_on 'Del'
          sleep 5
          page.driver.browser.switch_to.alert.accept
          sleep 6
          puts "Successfully deleted the attachment"
        else
          putstr "Failed to see the attachment"
        end
      else
        puts "No records to display"
      end
     end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the partner opportunity details page"
    putstr_withScreen  ex.message
  end
end



And(/^I set the "([^"]*)" opportunity$/) do |primary_checkbox|
  begin
  sleep 5
    tables_index,rows_index,columns_index = get_data_table_index('Primary')
    puts tables_index,rows_index,columns_index
  if page.has_css?(".customnotabBlock")
    within all(".pbBody")[1] do
      pos = all(:xpath, "//tr[1]/td[.='Primary']/position()").count
      put pos
      if all("tr")[1].all("td")[5].first("img")[:title] == "Checked"
        puts "Partner Opportunity primary checkbox is checked"
        break
      else
        sleep 4
        if all("input[type=checkbox]")[1].checked?
          puts "Successfully check the partner opportunity"
        else
          sleep 3
          all("input[type=checkbox]")[1].click
          sleep 5
        end
      end
    end
    sleep 5
    click_on primary_checkbox
    sleep 5
    puts "Successfully set the #{primary_checkbox} for partner opportunity"
    page.driver.browser.switch_to.alert.accept
    sleep 5
  else
    putstr "Failed to see the Partner Opportunities table"
  end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{primary_checkbox} partner opportunity"
    putstr_withScreen  ex.message
  end
end


Then(/^I should able to see the selected "([^"]*)" opportunity$/) do |primary_checkbox|
  begin
    sleep 5
    if page.has_css?(".customnotabBlock")
      within all(".pbBody")[1] do
        if all("tr")[1].all("td")[5].first("img")[:title] == "Checked"
          puts "Partner Opportunity primary checkbox is checked"
        else
          putstr "Partner Opportunity primary checkbox is not checked"
        end
      end
      sleep 5
    else
      puts "Failed to see the Partner Opportunities table"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{primary_checkbox} partner opportunity"
    putstr_withScreen  ex.message
  end
end

Then(/^I should be able to see the partner account hierarchy details$/) do
  begin
    sleep 5
    arg = getReference "AddPartnerOpportunity"
    sleep 4
    if page.has_css?(".pageDescription")
      page_title = find(".pageDescription").text
      sleep 4
      puts "Successfully see the partner opportunity #{page_title} details page"
      sleep 5
      within all(".pbSubsection")[0] do
        opportunity_name = first("tbody").all("tr")[1].all("td")[1].text
        if opportunity_name.to_s == arg["PartnerOpportunityName"].to_s
          puts "Successfully see the partner opportunity #{opportunity_name} name"
        else
          putstr "Failed to see the partner opportunity #{arg["PartnerOpportunityName"]} name"
        end
      end
      sleep 5
      within all(".pbSubsection")[1] do
        partner_account1 = first("tbody").first("tr").all("td")[1].text
        if partner_account1.to_s == arg["PartnerAccount1HierarchyName"].to_s
          puts "Successfully see the partner account1 #{partner_account1} name"
        else
          putstr "Failed to see the partner account1 #{arg["PartnerAccount1HierarchyName"]} name"
        end
        sleep 5
        partner_contact1 = first("tbody").all("tr")[2].all("td")[1].text
        if partner_contact1.to_s == arg["PartnerAccount1HierarchyContact"].to_s
          puts "Successfully see the partner contact1 #{partner_contact1} name"
        else
          putstr "Failed to see the partner contact1 #{arg["PartnerAccount1HierarchyContact"]} name"
        end
        sleep 5
        if all("tr")[3].all("td")[1].first("img")[:title] == "Checked"
          puts "Incumbent checkbox is checked"
        else
          putstr "Incumbent checkbox is not checked"
        end
      end
    else
      putstr "Failed to see the partner opportunity details page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the partner opportunity details page"
    putstr_withScreen  ex.message
  end
end
