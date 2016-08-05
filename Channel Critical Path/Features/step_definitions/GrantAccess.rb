#All Grant Access - Grant Access specific Step definitions
#All Scenario mentioned in GrantAccess.feature

Then (/^I select the "(.*?)" for Partner Opportunity$/) do |data|
  begin
    sleep 5
    arg = getReference data
    select "All Accounts", :from => "fcf"
    sleep 3
    if page.has_button?('Go!')
      click_on "Go!"
    end
    sleep 5
    foundCount = 0
    begin
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          if arg["AccountName"].include? row.all("td")[2].text
            row.all("td")[2].all('a')[0].click
            foundCount = 1
            break
          end
        end
      end
      if foundCount==0
        if page.has_css?('.next')
          find(".next").click
          sleep 3
        else
          break
        end
      else
        break
      end
    end until (page.has_css?('.nextoff'))
    if foundCount==0
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          puts row.all("td")[2].text
          if arg["AccountName"].include? row.all("td")[2].text
            row.all("td")[2].all('a')[0].click
            foundCount = 1
            break
          end
        end
      end
    end
    sleep 5
    if foundCount==0
      puts "Opportunity not found."
    else
      puts "Opened Opportunity #{arg['AccountName']} Successfully."
    end
  rescue Exception => ex
    puts "Error in Selecting the #{data}"
    putstr_withScreen  ex.message
  end
end

And (/^I select the contact$/) do
  begin
    arg1 = getReference 'PartnerAccount'
    found = 0
    within all(".bRelatedList")[0] do
      tr = all('.dataRow')
      tr.each do |row|
        if (row.all(".dataCell")[0].text == arg1['ContactName'])
          row.all(".dataCell")[0].all('a')[0].click
          found = 1

        end
      end
      if found == 1
        puts "Opened Opportunity #{arg1['ContactName']} Successfully."
      else
        putstr "not found"
      end
      sleep 5
    end
  rescue Exception => ex
    puts "Error in Selecting the #{arg1['ContactName']}"
    putstr_withScreen  ex.message
  end
end

And (/^I click on "(.*?)" primary button$/) do|data|
  begin
    within(:id,"bottomButtonRow") do
      find(:id,'workWithPortalButton').click
      sleep 5
      if page.has_content? "View Partner User"
        click_link('View Partner User')
        sleep 5
        puts "Clicked on '#{data}' button"
      else
        putstr "Could not button '#{data}'"
      end
    end
    within(:css,".oRight") do
      if page.has_content? "QA ChannelPartner"
        puts "Navigated to User page"
      else
        putstr "Could not Navigate to the user page"
      end
    end
  rescue Exception => ex
    puts "Error in Selecting the #{data}"
    putstr_withScreen  ex.message
  end
end

And (/^I Accept the GrantAcess popup$/) do
  begin
    alert_message = page.driver.browser.switch_to.alert.text
    if alert_message == "Grant Access to all Partner Opportunities for this User's Account?"
      page.driver.browser.switch_to.alert.accept
      puts "Granted Access to all Partner Opportunities"
    else
      page.driver.browser.switch_to.alert.deny
      putstr "Did not Grant Access to all Partner Opportunities"
    end
  rescue Exception=> ex
    puts "Error in accepting the GrantAccess popup"
    putstr_withScreen  ex.message
  end
end

And (/^I Deny the GrantAcess popup$/) do
  begin
    alert_message = page.driver.browser.switch_to.alert.text
    if alert_message == "Grant Access to all Partner Opportunities for this User's Account?"
      page.driver.browser.switch_to.alert.deny
      puts "Granted Access to all Partner Opportunities"
    else
      page.driver.browser.switch_to.alert.accept
      putstr "Did not Grant Access to all Partner Opportunities"
    end
  rescue Exception=> ex
    puts "Error in accepting the GrantAccess popup"
    putstr_withScreen  ex.message
  end
end