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
