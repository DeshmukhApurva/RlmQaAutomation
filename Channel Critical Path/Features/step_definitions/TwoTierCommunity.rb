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
      find(:css, ".close.ui-select-match-close").click
    end

    allExpQuarters.each do |value|
      find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[1]/div/div/div/input").click
      click_on(value)
      sleep 1
    end

    within all(".ui-select-match")[2] do
      find(:css, ".close.ui-select-match-close").click
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
