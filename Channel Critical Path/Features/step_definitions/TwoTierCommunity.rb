When(/^I search for the "(.*?)" opportunities$/) do |arg1|
  begin
    sleep 3
    allTwoTierData = getReference "TwoTier"

    allExpQrtrArg = getReference "Expiration Quarter"
    allExpQuarters = allExpQrtrArg["filterValues"].split(",")
    puts allExpQuarters

    allExpYearsArg = getReference "Expiration Year"
    allExpYears = allExpYearsArg["filterValues"].split(",")
    puts allExpYears

    allYears = getExpirationYears(10)

    within all(".ui-select-match")[1] do
      find(:css, ".close.ui-select-match-close")[0].click
      sleep 1
    end

    allExpQuarters.each do |value|
      find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[1]/div/div/div/input").click
      click_on(value)
      sleep 1
    end

    within all(".ui-select-match")[2] do
      find(:css, ".close.ui-select-match-close")[0].click
      sleep 1
    end

    allExpYears.each do |value|
      find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[2]/div/div/div/input").click
      click_on(value)
      sleep 1
    end
    sleep 5

    find(:xpath, "//div[2]/div/div[2]/div/div/div[1]/div[5]/input").send_keys [:control, 'a'], :space
    sleep 1
    find(:xpath, "//div[2]/div/div[2]/div/div/div[1]/div[5]/input").send_keys allTwoTierData["PartnerOpportunity"]
    sleep 1

    click_on allTwoTierData["PartnerOpportunity"]
    sleep 3

  rescue Exception => ex
    puts "Error while entering credentials"
    puts ex.message
  end
end

And(/^I verify "(.*?)" Quote$/) do |partnerType|
  begin
    allTwoTierData = getReference "TwoTier"

    if partnerType == "Reseller"
      if page.should have_content(allTwoTierData["ResellerQuoteNumber"])
        puts "#{allTwoTierData["ResellerQuote"]} has been verified successfully."
      end
      if page.has_content(allTwoTierData["DistributorQuoteNumber"])
        raise "#{allTwoTierData["DistributorQuote"]} is displayed to Reseller Partner Account"
      end
    elsif partnerType == "Distributor"
      if page.should have_content(allTwoTierData["DistributorQuoteNumber"]) and page.should have_content(allTwoTierData["ResellerQuoteNumber"])
        puts "#{allTwoTierData["DistributorQuote"]} and #{allTwoTierData["ResellerQuote"]} have been verified successfully."
      end
    end

  rescue Exception => ex
    puts "Error occured whilte verifying quotes"
    puts ex.message
  end
end

And(/^I Set "(.*?)" Quote as primary$/) do |quoteType|
  begin
    allTwoTierData = getReference "TwoTier"
    Capybara.ignore_hidden_elements = true
    
    if quoteType == "Reseller"
      if page.should have_content(allTwoTierData["ResellerQuoteNumber"])
        puts "#{allTwoTierData["ResellerQuote"]} has been verified successfully."
      end
      
      find(:xpath, "//a[text()=#{allTwoTierData["ResellerQuoteNumber"]}]/parent::div/parent::div/following-sibling::div/div/label").click
    elsif quoteType == "Distributor"
      sleep 4
      
      puts find(:xpath, "//a[text()=#{allTwoTierData["DistributorQuoteNumber"]}]/parent::div/parent::div/following-sibling::div/div/input[id()=\'cb-uiGrid-005S\']", visible: false).checked?
      
      puts find(:xpath, '//a[text()=#{allTwoTierData["DistributorQuoteNumber"]}]/parent::div/parent::div/following-sibling::div/div/label').text
      if find(:xpath, '//a[text()=#{allTwoTierData["DistributorQuoteNumber"]}]/parent::div/parent::div/following-sibling::div/div/label[contains(text()="after")]')
        raise "#{allTwoTierData["DistributorQuote"]} is already Primary Quote."
      else
      end
    elsif quoteType == "NonPrimary"
      
    end

  rescue Exception => ex
    puts "Error occured whilte verifying quotes"
    puts ex.message
  end
end

And(/^I "(.*?)" verify Reseller and Distributor Quotes in Related To Quote field$/) do |partnerType|
  begin
    sleep 3
    allTwoTierData = getReference "TwoTier"
    sleep 2

    # Select Search Quote...
    find("div[placeholder='Select...']").click
    find("input[placeholder='Select...']").send_keys "Quote"
    find("input[placeholder='Select...']").send_keys :enter
    puts "Successfully selected the Quote in Related To"
    sleep 4

    if partnerType == "Distributor"
      #Verify Distributor Quote value
      find("div[placeholder='Search Quote...']").click
      sleep 2
      find("input[placeholder='Search Quote...']").send_keys [:control, 'a'], :backspace
      sleep 1
      find("input[placeholder='Search Quote...']").send_keys allTwoTierData["DistributorQuote"]
      sleep 1
      find("input[placeholder='Search Quote...']").send_keys :enter
      sleep 2
      puts "Successfully enter the #{allTwoTierData["DistributorQuote"]} value"
      sleep 2

      #Verify Reseller Quote value
      find("div[placeholder='Search Quote...']").click
      sleep 2
      find("input[placeholder='Search Quote...']").send_keys [:control, 'a'], :backspace
      sleep 1
      find("input[placeholder='Search Quote...']").send_keys allTwoTierData["ResellerQuote"]
      sleep 1
      find("input[placeholder='Search Quote...']").send_keys :enter
      sleep 2
      puts "Successfully enter the #{allTwoTierData["ResellerQuote"]} value"
      sleep 2
    elsif  partnerType == "Reseller"
      #Verify Reseller Quote value
      find("div[placeholder='Search Quote...']").click
      sleep 2
      find("input[placeholder='Search Quote...']").send_keys [:control, 'a'], :backspace
      sleep 1
      find("input[placeholder='Search Quote...']").send_keys allTwoTierData["ResellerQuote"]
      sleep 1
      find("input[placeholder='Search Quote...']").send_keys :enter
      sleep 2
      puts "Successfully enter the #{allTwoTierData["ResellerQuote"]} value"
      sleep 2

      #Verify Distributor Quote value
      find("div[placeholder='Search Quote...']").click
      sleep 2
      find("input[placeholder='Search Quote...']").send_keys [:control, 'a'], :backspace
      sleep 1
      find("input[placeholder='Search Quote...']").send_keys allTwoTierData["DistributorQuote"]
      sleep 2
      puts page.has_xpath?("//div/a/div/span")
      if page.has_xpath?("//div/a/div/span")
        raise "#{allTwoTierData["DistributorQuote"]} is visible to Reseller"
      end
      sleep 2
    end

  rescue Exception => ex
    putstr "Error occurred while selecting the Related To field value Reseller and Distributor Quotes"
    putstr_withScreen  ex.message
  end
end
#twotire opportunity

And(/^I select the partner accounts from the accounts lookup list for Two Tire$/) do
  begin
    #arg = getDetails "TwoTier"
    arg2 = getReference "TwoTier"
    sleep 2
    $partnerOppName = find(:xpath, ".//th/label[contains(text(), 'Partner Opportunity')]//parent::th//following-sibling::td/div/input").value
    puts $partnerOppName
    puts "Add partner accounts"
    sleep 5
    if page.has_css?(".lookupIcon")
      puts "Successfully see the lookup icons"
      sleep 1
      main = page.driver.browser.window_handles.first
      sleep 2
      find("img[alt='Partner Account 1 Lookup (New Window)']").click
      sleep 8
      page.driver.browser.manage.window.maximize
      sleep 3
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      sleep 3
      page.driver.browser.switch_to.frame("resultsFrame")
      sleep 3
      within('.list') do
        click_link arg2["DistributorAccount"]     
      end
      sleep 2
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
      sleep 1
      puts "Successfully Selected the first"
      sleep 1
      main = page.driver.browser.window_handles.first
      sleep 3
      find("img[alt='Partner Account 2 Lookup (New Window)']").click
      sleep 8
      page.driver.browser.manage.window.maximize
      sleep 3
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      sleep 5
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.list') do
        click_link arg2["ResellerAccount"]
      end
      sleep 5
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
      sleep 5
      puts "Successfully Selected the second account"
    else
      putstr "Failed to see the accounts fields"
    end
    sleep 4
    
    ####Add contacts for account
    puts "Add partner contacts"
    find(:xpath, "//label[contains(text(),'Partner Account 1 Contact')]/parent::th/following-sibling::td/span/input").send_keys arg2["DistributorContact"]
    sleep 2
    find(:xpath, "//label[contains(text(),'Partner Account 2 Contact')]/parent::th/following-sibling::td/span/input").send_keys arg2["ResellerContact"]
    sleep 2
    # if page.has_css?(".lookupIcon")
      # puts "Successfully see the ContactField lookup Icons"
      # sleep 2
      # main = page.driver.browser.window_handles.first
      # sleep 3
      # find("img[alt='Partner Account 1 Contact Lookup (New Window)']").click
      # sleep 8
      # page.driver.browser.manage.window.maximize
      # sleep 3
      # page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      # sleep 5
      # page.driver.browser.switch_to.frame("resultsFrame")
      # sleep 3
      # within('.list') do
        # click_link arg2["DistributorContact"]
      # end
      # sleep 5
      # page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
      # sleep 3
      # #puts "Successfully Selected the #{arg["PartnerAccount1ContactFieldName"]} from #{arg["PartnerOpportunityName"]} page"
      # puts "Successfully Selected the first contact"
      # sleep 8
      # main = page.driver.browser.window_handles.first
      # sleep 3
      # find("img[alt='Partner Account 2 Contact Lookup (New Window)']").click
      # sleep 8
      # page.driver.browser.manage.window.maximize
      # sleep 3
      # page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      # sleep 5
      # page.driver.browser.switch_to.frame("resultsFrame")
      # within('.list') do
        # click_on arg2["ResellerContact"]
      # end
      # sleep 5
      # page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
      # sleep 5
      # puts "Successfully Selected the second contact"
    # else
      # putstr "Failed to see the #{arg["PartnerAccount1ContactFieldName"]} and #{arg["PartnerAccount2ContactFieldName"]} lookup Icons"
    # end
    sleep 4
  rescue Exception => ex
    putstr_withScreen  ex.message
  end
end


And(/^I select the Reseller Quote from the quote related list$/) do
  begin
    sleep 5
    puts 'checking the Distibuter quote checkbox'
    within("#bodyCell") do
      within(".quoteBlock") do
        puts $RenAutomationRO
        sleep 3
        find(:xpath,".//tr/td/a[contains(text(),'#{$RenAutomationRO}')]").click
      end
    end
  rescue Exception => ex
    raise "Error occurred while selecting Reseller Quote"
    putstr_withScreen  ex.message
  end
end

And(/^I check the distributor quote checkbox status for "([^"]*)"$/) do |partnerUser|
  begin
    sleep 5
    puts 'checking the Distibuter quote checkbox'
    if partnerUser == "reseller"
      distCheckBox = has_xpath?(".//tr/td[contains(text(),'Distributor Quote')]//following-sibling::td/div/img[@alt = 'Not Checked']")
      puts "For Reseller Distributor checkbox not checked: #{distCheckBox}"  
    else
      distCheckBox = has_xpath?(".//tr/td[contains(text(),'Distributor Quote')]//following-sibling::td/div/img[@alt = 'Checked']")
      puts "For Distributor checkbox checked: #{distCheckBox}"
    end
  rescue Exception => ex
    raise "Error occurred while checking the distributor quote checkbox status for #{partnerUser}"
    putstr_withScreen  ex.message
  end
end

And(/^I edit the quotename as "(.*?)"$/) do |arg|
  begin
    within ("#bottomButtonRow") do
      first(:xpath, "//*[contains(@name, 'edit')]").click
      sleep 5
    end
    fill_in "Name",:with => arg
    sleep 5
    within ("#bottomButtonRow") do
      first(:xpath, "//*[contains(@name, 'save')]").click
      puts "Quote renamed successfully"
    end
  rescue Exception => ex
    putstr "Error occurred while editing quotename"
    putstr_withScreen  ex.message
  end
end

And(/^I create Distributor Quote from Reseller Quote$/) do
  begin
    sleep 5
    page.execute_script "window.scrollBy(0,10000)"
    sleep 3
    first(:xpath, "//*[contains(@title, 'Create Distributor Quote')]").click
    sleep 10
    alert_message = page.driver.browser.switch_to.alert.text
    puts alert_message
    sleep 5
    page.driver.browser.switch_to.alert.accept
  rescue Exception => ex
    putstr "Error occurred while creating distributor quote"
    putstr_withScreen  ex.message
  end  
end

And(/^I check checkbox status for reseller and distributor quotes$/) do
  begin
    sleep 5
    TTResellerStatus = has_xpath?(".//tr/td/a[contains(text(),'TTReseller Quote')]//parent::td//parent::tr/td[8]/img[@alt = 'Not Checked']")    
    puts "TTResellerStatus Not Checked: #{TTResellerStatus}" 
    if TTResellerStatus == true
      puts "Checkbox is not checked for Reseller quote"
    else 
      puts "Checkbox is checked for Reseller quote"
    end
    TTDistributorStatus = has_xpath?(".//tr/td/a[contains(text(),'TTDistributor Quote')]//parent::td//parent::tr/td[8]/img[@alt = 'Checked']")
    puts "TTDistributorStatus Checked: #{TTDistributorStatus}" 
    if TTDistributorStatus == true
      puts "Checkbox is checked for Distributor quote"
    else
      puts "Checkbox is not checked for Distributor quote"
    end
  rescue Exception => ex
    putstr "Error while checking status for reseller and distributor quotes"
    putstr_withScreen  ex.message     
  end
end

And(/^I create new "([^"]*)" quote for TwoTire$/) do |resellerQuote|
  begin
    sleep 5
    click_on "New Quote"
    sleep 5
    within all(".pbSubsection")[0] do
      first(:xpath, "//*[contains(@name, 'Name')]").send_keys resellerQuote
      sleep 2
      fill_in "Partner Opportunity",:with => $partnerOppName
      sleep 2
    end
    within(".pbBottomButtons") do
      first(:xpath, "//*[contains(@name, 'save')]").click
      puts "New Quote created"
      sleep 5
    end
  rescue Exception => ex
    putstr "Error occurred while creating new quote"
    putstr_withScreen  ex.message
  end
end
