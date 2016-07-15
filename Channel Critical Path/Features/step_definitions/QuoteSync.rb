#All Quote Sync - Step definitions
#All Scenario mentioned in QuoteSyncing.feature

And(/^I create new quote by OOB$/) do
  begin
    time = Time.new
    quoteDateTime = time.hour.to_s + time.min.to_s + time.sec.to_s
    sleep 4
    arg = getDetails "QuoteSyncCreateNewQuote"
    sleep 7
    click_on "New Quote"
    sleep 5
    within all(".pbSubsection")[0] do
      first(:xpath, "//*[contains(@name, 'Name')]").send_keys arg["QuoteName"] + "_" + quoteDateTime
      sleep 5
      fill_in "Partner Opportunity",:with => arg["PartnerOpportunity"]

      first(:xpath, "//*[contains(@name, 'save')]").click
      puts "New Quote created"
      sleep 5
    end
  rescue Exception => ex
    putstr "Error occurred while creating new quote"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the quote is synced and update the custom fields on opportunity$/) do
  begin
    arg = getDetails "QuoteSyncOppFields"
    isQuoteSynced = 0

    if page.has_content?('Synced Quote')
      synced_quote_name = find(:xpath, '//td[text()="Synced Quote"]/following-sibling::td/div/a', :match => :prefer_exact).text
      sleep 5
      puts " #{synced_quote_name} Quote is already synced with opportunity"
      isQuoteSynced = 1
    end

    if isQuoteSynced == 1
      first(:xpath, "//*[contains(@name, 'edit')]").click
      sleep 5
      fill_in "Automation_Cust_Text",:with => arg["Automation_Cust_Text"]
      sleep 3
      fill_in "Automation_Cust_Email",:with => arg["Automation_Cust_Email"]
      sleep 3
      fill_in "Automation_Cust_Currency",:with => arg["Automation_Cust_Currency"]
      sleep 3
      fill_in "Automation_Cust_Phone",:with => arg["Automation_Cust_Phone"]
      sleep 3
      fill_in "Automation_Cust_Date",:with => arg["Automation_Cust_Date"]
      sleep 3
      fill_in "Automation_Cust_DateTime",:with => arg["Automation_Cust_DateTime"]
      sleep 3
      select(arg["Automation_Cust_Picklist"], :from => 'Automation_Cust_Picklist')
      sleep 3

      first(:xpath, "//*[contains(@name, 'save')]").click
      puts "Opportunity Custom field data saved"
      sleep 5

      $opp_auto_Custom_Text = find(:xpath, '//td[text()="Automation_Cust_Text"]/following-sibling::td/div', :match => :prefer_exact).text
      sleep 3
      puts "#{$opp_auto_Custom_Text}"

      $opp_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
      sleep 3
      puts "#{$opp_auto_Custom_Email}"

      $opp_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
      sleep 3
      puts "#{$opp_auto_Custom_Currency}"

      $opp_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
      sleep 3
      puts "#{$opp_auto_Custom_Phone}"

      $opp_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
      sleep 3
      puts "#{$opp_auto_Custom_Date}"

      $opp_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
      sleep 3
      puts "#{$opp_auto_Custom_DateTime}"

      $opp_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
      sleep 3
      puts "#{$opp_auto_Custom_Picklist}"

    end
  rescue Exception => ex
    putstr "Error occurred while updating custom fields on opportunity"
    putstr_withScreen  ex.message
  end
end

And(/^I update the standard fields on opportunity$/) do
  begin
    arg = getDetails "QuoteSyncOppFields"

    first(:xpath, "//*[contains(@name, 'edit')]").click
    sleep 7

    fill_in "Description",:with => arg["Automation_Description"]
    sleep 3
    fill_in "Earliest Expiration Date",:with => arg["Automation_Expiration_Date"]
    sleep 3

    first(:xpath, "//*[contains(@name, 'save')]").click
    sleep 5

    $opp_auto_Description = find(:xpath, '//td[text()="Description"]/following-sibling::td/div', :match => :prefer_exact).text
    puts "#{$opp_auto_Description} saved"

    $opp_auto_ExpirationDate = find(:xpath, '//td[text()="Earliest Expiration Date"]/following-sibling::td/div', :match => :prefer_exact).text
    puts "#{$opp_auto_ExpirationDate} saved"

  rescue Exception => ex
    putstr "Error occurred while updating standard fields on opportunity"
    putstr_withScreen  ex.message
  end

end

Then(/^I verify the quote fields on quote$/) do
  begin

    find(:xpath, '//td[text()="Synced Quote"]/following-sibling::td/div/a', :match => :prefer_exact).click
    puts "Navigated to quote details page"
    sleep 5

    $quote_auto_Custom_Text = find(:xpath, '//td[text()="Automation_Cust_Text"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_Custom_Text}"

    if $opp_auto_Custom_Text == $quote_auto_Custom_Text
      sleep 5
      puts "#{$opp_auto_Custom_Text} field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_Text} field NOT copied from opportunity to quote"
    end

    $quote_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_Custom_Email}"

    if $opp_auto_Custom_Email == $quote_auto_Custom_Email
      sleep 5
      puts "#{$opp_auto_Custom_Email} field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_Email} field NOT copied from opportunity to quote"
    end

    $quote_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_Custom_Currency}"

    if $opp_auto_Custom_Currency == $quote_auto_Custom_Currency
      sleep 5
      puts "#{$opp_auto_Custom_Currency} field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_Currency} field NOT copied from opportunity to quote"
    end

    $quote_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_Custom_Phone}"

    if $opp_auto_Custom_Phone == $quote_auto_Custom_Phone
      sleep 5
      puts "#{$opp_auto_Custom_Phone} field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_Phone} field NOT copied from opportunity to quote"
    end

    $quote_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_Custom_Date}"

    if $opp_auto_Custom_Date == $quote_auto_Custom_Date
      sleep 5
      puts "#{$opp_auto_Custom_Date} field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_Date} field NOT copied from opportunity to quote"
    end

    $quote_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_Custom_DateTime}"

    if $opp_auto_Custom_DateTime == $quote_auto_Custom_DateTime
      sleep 5
      puts "#{$opp_auto_Custom_DateTime} field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_DateTime} field NOT copied from opportunity to quote"
    end

    $quote_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_Custom_Picklist}"

    if $opp_auto_Custom_Picklist == $quote_auto_Custom_Picklist
      sleep 5
      puts "#{$opp_auto_Custom_Picklist} field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_Picklist} field NOT copied from opportunity to quote"
    end

    $quote_auto_Description = find(:xpath, '//td[text()="Description"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5

    if $opp_auto_Description == $quote_auto_Description
      sleep 5
      puts "#{$opp_auto_Description} field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Description} field NOT copied from opportunity to quote"
    end

    $quote_auto_ExpirationDate = find(:xpath, '//td[text()="Expiration Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_ExpirationDate}"

    if $opp_auto_ExpirationDate == $quote_auto_ExpirationDate
      sleep 5
      puts "#{$opp_auto_Custom_DateTime} field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_DateTime} field NOT copied from opportunity to quote"
    end

  rescue Exception => ex
    putstr "Error occurred while verifying custom fields on quote details page"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the quote is synced and update the custom fields on quote$/) do
  begin
    arg = getDetails "QuoteSyncQuoteFields"
    isQuoteSynced = 0

    if page.has_content?('Synced Quote')
      synced_quote_name = find(:xpath, '//td[text()="Synced Quote"]/following-sibling::td/div/a', :match => :prefer_exact).text
      sleep 5
      puts " #{synced_quote_name} Quote is already synced with opportunity"

      find(:xpath, '//td[text()="Synced Quote"]/following-sibling::td/div/a', :match => :prefer_exact).click
      sleep 5

      isQuoteSynced = 1
    end

    if isQuoteSynced == 1
      first(:xpath, "//*[contains(@name, 'edit')]").click
      sleep 5
      fill_in "Automation_Cust_Text",:with => arg["Automation_Cust_Text"]
      sleep 3
      fill_in "Automation_Cust_Email",:with => arg["Automation_Cust_Email"]
      sleep 3
      fill_in "Automation_Cust_Currency",:with => arg["Automation_Cust_Currency"]
      sleep 3
      fill_in "Automation_Cust_Phone",:with => arg["Automation_Cust_Phone"]
      sleep 3
      fill_in "Automation_Cust_Date",:with => arg["Automation_Cust_Date"]
      sleep 3
      fill_in "Automation_Cust_DateTime",:with => arg["Automation_Cust_DateTime"]
      sleep 3
      select(arg["Automation_Cust_Picklist"], :from => 'Automation_Cust_Picklist')
      sleep 3

      first(:xpath, "//*[contains(@name, 'save')]").click
      puts "Quote Custom field data saved "
      sleep 5

      $quote_1_auto_Custom_Text = find(:xpath, '//td[text()="Automation_Cust_Text"]/following-sibling::td/div', :match => :prefer_exact).text
      sleep 3
      puts "#{$quote_1_auto_Custom_Text}"

      $quote_1_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
      sleep 3
      puts "#{$quote_1_auto_Custom_Email}"

      $quote_1_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
      sleep 3
      puts "#{$quote_1_auto_Custom_Currency}"

      $quote_1_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
      sleep 3
      puts "#{$quote_1_auto_Custom_Phone}"

      $quote_1_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
      sleep 3
      puts "#{$quote_1_auto_Custom_Date}"

      $quote_1_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
      sleep 3
      puts "#{$quote_1_auto_Custom_DateTime}"

      $quote_1_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
      sleep 3
      puts "#{$quote_1_auto_Custom_Picklist}"

    end
  rescue Exception => ex
    putstr "Error occurred while updating custom fields on quote page"
    putstr_withScreen  ex.message
  end
end

And(/^I update the standard fields on quote$/) do
  begin
    arg = getDetails "QuoteSyncQuoteFields"

    first(:xpath, "//*[contains(@name, 'edit')]").click
    sleep 7

    fill_in "Description",:with => arg["Automation_Description"]
    sleep 3
    fill_in "Expiration Date",:with => arg["Automation_Expiration_Date"]
    sleep 3

    first(:xpath, "//*[contains(@name, 'save')]").click
    sleep 5

    $quote_1_auto_Description = find(:xpath, '//td[text()="Description"]/following-sibling::td/div', :match => :prefer_exact).text
    puts "#{$quote_1_auto_Description} saved"

    $quote_1_auto_ExpirationDate = find(:xpath, '//td[text()="Expiration Date"]/following-sibling::td/div', :match => :prefer_exact).text
    puts "#{$quote_1_auto_ExpirationDate} saved"

  rescue Exception => ex
    putstr "Error occurred while updating standard fields on quote"
    putstr_withScreen  ex.message
  end

end

Then(/^I verify the Opportunity fields on opportunity page$/) do
  begin

    find(:xpath, '//td[text()="Opportunity Name"]/following-sibling::td/div/a', :match => :prefer_exact).click
    puts "Navigated to opportunity details page"
    sleep 5

    $opp_1_auto_Custom_Text = find(:xpath, '//td[text()="Automation_Cust_Text"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_1_auto_Custom_Text}"

    if $opp_1_auto_Custom_Text == $quote_1_auto_Custom_Text
      sleep 5
      puts "#{$quote_1_auto_Custom_Text} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Text} field NOT copied from quote to opportunity"
    end

    $opp_1_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_1_auto_Custom_Email}"

    if $opp_1_auto_Custom_Email == $quote_1_auto_Custom_Email
      sleep 5
      puts "#{$quote_1_auto_Custom_Email} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Email} field NOT copied from quote to opportunity"
    end

    $opp_1_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_1_auto_Custom_Currency}"

    if $opp_1_auto_Custom_Currency == $quote_1_auto_Custom_Currency
      sleep 5
      puts "#{$quote_1_auto_Custom_Currency} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Currency} field NOT copied from quote to opportunity"
    end

    $opp_1_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_1_auto_Custom_Phone}"

    if $opp_1_auto_Custom_Phone == $quote_1_auto_Custom_Phone
      sleep 5
      puts "#{$quote_1_auto_Custom_Phone} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Phone} field NOT copied from quote to opportunity"
    end

    $opp_1_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_1_auto_Custom_Date}"

    if $opp_1_auto_Custom_Date == $quote_1_auto_Custom_Date
      sleep 5
      puts "#{$quote_1_auto_Custom_Date} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Date} field NOT copied from quote to opportunity"
    end

    $opp_1_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_1_auto_Custom_DateTime}"

    if $opp_1_auto_Custom_DateTime == $quote_1_auto_Custom_DateTime
      sleep 5
      puts "#{$quote_1_auto_Custom_DateTime} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_DateTime} field NOT copied from quote to opportunity"
    end

    $opp_1_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_1_auto_Custom_Picklist}"

    if $opp_1_auto_Custom_Picklist == $quote_1_auto_Custom_Picklist
      sleep 5
      puts "#{$quote_1_auto_Custom_Picklist} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Picklist} field NOT copied from quote to opportunity"
    end

    $opp_1_auto_Description = find(:xpath, '//td[text()="Description"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5

    if $opp_1_auto_Description == $quote_1_auto_Description
      sleep 5
      puts "#{$quote_1_auto_Description} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Description} field NOT copied from quote to opportunity"
    end

    $opp_1_auto_ExpirationDate = find(:xpath, '//td[text()="Earliest Expiration Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_1_auto_ExpirationDate}"

    if $opp_1_auto_ExpirationDate == $quote_1_auto_ExpirationDate
      sleep 5
      puts "#{$quote_1_auto_ExpirationDate} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_ExpirationDate} field NOT copied from quote to opportunity"
    end

  rescue Exception => ex
    putstr "Error occurred while verifying custom fields on opportunity details page"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the quote is synced and update the custom fields on opportunity line item$/) do
  begin
    arg = getDetails "QuoteSyncOppFields"
    isQuoteSynced = 0

    if page.has_content?('Synced Quote')
      synced_quote_name = find(:xpath, '//td[text()="Synced Quote"]/following-sibling::td/div/a', :match => :prefer_exact).text
      sleep 5
      puts " #{synced_quote_name} Quote is already synced with opportunity"
      isQuoteSynced = 1
    end

    within(".opportunityLineItemBlock")do
      first(:link,"Edit").click
      puts "Clicked on edit to update the OLI fields"
    end
    sleep 3
    within(".pbSubsection")do
      sleep 3
      fill_in "Automation_Cust_Text",:with => arg["Automation_Cust_Text"]
      sleep 3
      fill_in "Automation_Cust_Email",:with => arg["Automation_Cust_Email"]
      sleep 3
      fill_in "Automation_Cust_Currency",:with => arg["Automation_Cust_Currency"]
      sleep 3
      fill_in "Automation_Cust_Phone",:with => arg["Automation_Cust_Phone"]
      sleep 3
      fill_in "Automation_Cust_Date",:with => arg["Automation_Cust_Date"]
      sleep 3
      fill_in "Automation_Cust_DateTime",:with => arg["Automation_Cust_DateTime"]
      sleep 3
      #select('1', :from => 'Automation_Cust_Picklist')
      select(arg["Automation_Cust_Picklist"], :from => 'Automation_Cust_Picklist')

      sleep 3
      fill_in "Line Description",:with => arg["Automation_Description"]
      sleep 3
      fill_in "Discount",:with => arg["Automation_Discount"]
      sleep 3

    end
    sleep 3
    within(:id,"topButtonRow")do
      click_on "Save"
    end
    puts "Opportunity line item Custom field data saved"
    sleep 5

    within(".opportunityLineItemBlock")do
      find(:link, "Product A").click
      sleep 5
      puts "clicked on product link."
    end

    $oppli_auto_Custom_Text = find(:xpath, '//td[text()="Automation_Cust_Text"]/following-sibling::td/div', :match => :prefer_exact).text

    sleep 3
    puts "#{$oppli_auto_Custom_Text}"

    $oppli_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$oppli_auto_Custom_Email}"

    $oppli_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$oppli_auto_Custom_Currency}"

    $oppli_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$oppli_auto_Custom_Phone}"

    $oppli_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$oppli_auto_Custom_Date}"

    $oppli_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$oppli_auto_Custom_DateTime}"

    $oppli_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$oppli_auto_Custom_Picklist}"

    $oppli_auto_Description = find(:xpath, '//td[text()="Line Description"]/following-sibling::td/div', :match => :prefer_exact).text
    puts "#{$oppli_auto_Description} standard field saved"

    sleep 3

    $oppli_auto_Discount = find(:xpath, '//td[text()="Discount"]/following-sibling::td/div', :match => :prefer_exact).text
    puts "#{$oppli_auto_Discount} standard field saved"

    find(:xpath, '//td[text()="Opportunity"]/following-sibling::td/div/a', :match => :prefer_exact).click
    sleep 5

    puts "Navigated opportunity page"
  end

end

Then(/^I verify the Quote line item fields on quote page$/) do
  begin
    find(:xpath, '//td[text()="Synced Quote"]/following-sibling::td/div/a', :match => :prefer_exact).click
    sleep 5
    puts "Navigated to quote details page"

    within(".quoteLineItemBlock")do
      find(:link, "Product A").click
      sleep 5
      puts "Clicked on quote line item link."
    end

    $quoteli_auto_Custom_Text = find(:xpath, '//td[text()="Automation_Cust_Text"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Custom_Text}"

    if $oppli_auto_Custom_Text == $quoteli_auto_Custom_Text
      sleep 5
      puts "#{$oppli_auto_Custom_Text} field copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Custom_Text} field NOT copied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Custom_Email}"

    if $oppli_auto_Custom_Email == $quoteli_auto_Custom_Email
      sleep 5
      puts "#{$oppli_auto_Custom_Email} field copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Custom_Email} field NOT copied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Custom_Currency}"

    if $oppli_auto_Custom_Currency == $quoteli_auto_Custom_Currency
      sleep 5
      puts "#{$oppli_auto_Custom_Currency} field copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Custom_Currency} field NOT copied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Custom_Phone}"

    if $oppli_auto_Custom_Phone == $quoteli_auto_Custom_Phone
      sleep 5
      puts "#{$oppli_auto_Custom_Phone} field copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Custom_Phone} field NOT copied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Custom_Date}"

    if $oppli_auto_Custom_Date == $quoteli_auto_Custom_Date
      sleep 5
      puts "#{$oppli_auto_Custom_Date} field copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Custom_Date} field NOT copied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Custom_DateTime}"

    if $oppli_auto_Custom_DateTime == $quoteli_auto_Custom_DateTime
      sleep 5
      puts "#{$oppli_auto_Custom_DateTime} field copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Custom_DateTime} field NOT copied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Custom_Picklist}"

    if $oppli_auto_Custom_Picklist == $quoteli_auto_Custom_Picklist
      sleep 5
      puts "#{$oppli_auto_Custom_Picklist} field copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Custom_Picklist} field NOT copied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Description = find(:xpath, '//td[text()="Line Item Description"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Description}"
    if $oppli_auto_Description == $quoteli_auto_Description
      sleep 5
      puts "#{$oppli_auto_Description} field copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Description} field NOTcopied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Discount = find(:xpath, '//td[text()="Discount"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Discount}"
    if $oppli_auto_Discount == $quoteli_auto_Discount
      sleep 5
      puts "#{$oppli_auto_Discount} field copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Discount} field NOT copied from opportunity line item  to quote line item"
    end
  end
end

And(/^I verify the quote is synced and update the custom fields on quote line item$/) do
  begin
    arg = getDetails "QuoteSyncQuoteFields"
    isQuoteSynced = 0

    if page.has_content?('Synced Quote')
      synced_quote_name = find(:xpath, '//td[text()="Synced Quote"]/following-sibling::td/div/a', :match => :prefer_exact).text
      sleep 5
      puts " #{synced_quote_name} Quote is already synced with opportunity"
      isQuoteSynced = 1
    end

    find(:xpath, '//td[text()="Synced Quote"]/following-sibling::td/div/a', :match => :prefer_exact).click
    sleep 5
    puts "Navigated to quote details page"

    within(".quoteLineItemBlock")do
      first(:link, "Edit").click
      sleep 5
    end
    puts "Clicked on edit to update quote line item fields."

    within(".pbSubsection")do
      fill_in "Automation_Cust_Text",:with => arg["Automation_Cust_Text"]
      sleep 3
      fill_in "Automation_Cust_Email",:with => arg["Automation_Cust_Email"]
      sleep 3
      fill_in "Automation_Cust_Currency",:with => arg["Automation_Cust_Currency"]
      sleep 3
      fill_in "Automation_Cust_Phone",:with => arg["Automation_Cust_Phone"]
      sleep 3
      fill_in "Automation_Cust_Date",:with => arg["Automation_Cust_Date"]
      sleep 3
      fill_in "Automation_Cust_DateTime",:with => arg["Automation_Cust_DateTime"]
      sleep 3
      select(arg["Automation_Cust_Picklist"], :from => 'Automation_Cust_Picklist')
      sleep 3
      fill_in "Line Item Description",:with => arg["Automation_Description"]
      sleep 3
      fill_in "Discount",:with => arg["Automation_Discount"]
      sleep 3
    end
    sleep 3
    within(:id,"topButtonRow")do
      click_on "Save"
    end
    puts "Quote line item Custom field data saved"
    sleep 5

    within(".quoteLineItemBlock")do
      find(:link, "Product A").click
      sleep 5
      puts "clicked on product link."
    end

    $quoteli_1_auto_Custom_Text = find(:xpath, '//td[text()="Automation_Cust_Text"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_1_auto_Custom_Text}"

    $quoteli_1_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_1_auto_Custom_Email}"

    $quoteli_1_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_1_auto_Custom_Currency}"

    $quoteli_1_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_1_auto_Custom_Phone}"

    $quoteli_1_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_1_auto_Custom_Date}"

    $quoteli_1_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_1_auto_Custom_DateTime}"

    $quoteli_1_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_1_auto_Custom_Picklist}"

    $quoteli_1_auto_Description = find(:xpath, '//td[text()="Line Item Description"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_1_auto_Description} standard field saved"

    $quoteli_1_auto_Discount = find(:xpath, '//td[text()="Discount"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{ $quoteli_1_auto_Discount} standard field saved"

    find(:xpath, '//td[text()="Quote Name"]/following-sibling::td/div/a', :match => :prefer_exact).click
    sleep 5
    puts "Navigated Quote page"

  end
end

Then(/^I verify the Opportunity line item fields on opportunity page$/) do

  find(:xpath, '//td[text()="Opportunity Name"]/following-sibling::td/div/a', :match => :prefer_exact).click
  sleep 5
  puts "Navigated Opportunity page"

  within(".opportunityLineItemBlock")do
    find(:link, "Product A").click
    sleep 5
    puts "clicked on product link."
  end

  $oppli_1_auto_Custom_Text = find(:xpath, '//td[text()="Automation_Cust_Text"]/following-sibling::td/div', :match => :prefer_exact).text
  sleep 5
  puts "#{ $oppli_1_auto_Custom_Text}"

  if $oppli_1_auto_Custom_Text == $quoteli_1_auto_Custom_Text
    sleep 5
    puts "#{$quoteli_1_auto_Custom_Text} field copied from quote line item  to opportunity line item"
  else
    puts "#{$quoteli_1_auto_Custom_Text} field NOT copied from quote line item  to opportunity line item"
  end

  $oppli_1_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
  sleep 5
  puts "#{ $oppli_1_auto_Custom_Email}"

  if $oppli_1_auto_Custom_Email == $quoteli_1_auto_Custom_Email
    sleep 5
    puts "#{$quoteli_1_auto_Custom_Email} field copied from quote line item  to opportunity line item"
  else
    puts "#{$quoteli_1_auto_Custom_Email} field NOT copied from quote line item  to opportunity line item"
  end

  $oppli_1_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
  sleep 5
  puts "#{$oppli_1_auto_Custom_Currency }"

  if $oppli_1_auto_Custom_Currency == $quoteli_1_auto_Custom_Currency
    sleep 5
    puts "#{$quoteli_1_auto_Custom_Currency} field copied from quote line item  to opportunity line item"
  else
    puts "#{$quoteli_1_auto_Custom_Currency} field NOT copied from quote line item  to opportunity line item"
  end

  $oppli_1_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
  sleep 5
  puts "#{$oppli_1_auto_Custom_Phone}"

  if $oppli_1_auto_Custom_Phone == $quoteli_1_auto_Custom_Phone
    sleep 5
    puts "#{$quoteli_1_auto_Custom_Phone} field copied from quote line item  to opportunity line item"
  else
    puts "#{$quoteli_1_auto_Custom_Phone} field NOT copied from quote line item  to opportunity line item"
  end

  $oppli_1_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
  sleep 5
  puts "#{ $oppli_1_auto_Custom_Date}"

  if $oppli_1_auto_Custom_Date == $quoteli_1_auto_Custom_Date
    sleep 5
    puts "#{$quoteli_1_auto_Custom_Date} field copied from quote line item  to opportunity line item"
  else
    puts "#{$quoteli_1_auto_Custom_Date} field NOT copied from quote line item  to opportunity line item"
  end

  $oppli_1_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
  sleep 5
  puts "#{$oppli_1_auto_Custom_DateTime}"

  if $oppli_1_auto_Custom_DateTime == $quoteli_1_auto_Custom_DateTime
    sleep 5
    puts "#{$quoteli_1_auto_Custom_DateTime} field copied from quote line item  to opportunity line item"
  else
    puts "#{$quoteli_1_auto_Custom_DateTime} field NOT copied from quote line item  to opportunity line item"
  end

  $oppli_1_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
  sleep 5
  puts "#{$oppli_1_auto_Custom_Picklist}"

  if $oppli_1_auto_Custom_Picklist == $quoteli_1_auto_Custom_Picklist
    sleep 5
    puts "#{$quoteli_1_auto_Custom_Picklist} field copied from quote line item  to opportunity line item"
  else
    puts "#{$quoteli_1_auto_Custom_Picklist} field NOT copied from quote line item  to opportunity line item"
  end

  $oppli_1_auto_Description = find(:xpath, '//td[text()="Line Description"]/following-sibling::td/div', :match => :prefer_exact).text
  sleep 5
  puts "#{$oppli_1_auto_Description}"
  if $oppli_1_auto_Description == $quoteli_1_auto_Description
    sleep 5
    puts "#{$quoteli_1_auto_Description} field copied from quote line item  to opportunity line item"
  else
    puts "#{$quoteli_1_auto_Description} field NOT copied from quote line item  to opportunity line item"
  end

  $oppli_1_auto_Discount = find(:xpath, '//td[text()="Discount"]/following-sibling::td/div', :match => :prefer_exact).text
  sleep 5
  puts "#{$oppli_1_auto_Discount}"
  if $oppli_1_auto_Discount == $quoteli_1_auto_Discount
    sleep 5
    puts "#{$quoteli_1_auto_Discount} field copied from opportunity line item  to quote line item"
  else
    puts "#{$quoteli_1_auto_Discount} field NOT copied from opportunity line item  to quote line item"
  end

end

