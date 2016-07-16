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

And(/^I verify synced quote name$/) do
  begin
    arg = getDetails "QuoteSyncOppFields"
    isQuoteSynced = 0

    if page.has_content?('Synced Quote')
      synced_quote_name = find(:xpath, '//td[text()="Synced Quote"]/following-sibling::td/div/a', :match => :prefer_exact).text
      sleep 5
      puts " #{synced_quote_name} Quote is already synced with opportunity"
      isQuoteSynced = 1
    end
  rescue Exception => ex
    putstr "Error occurred while checking teh synced quote name"
    putstr_withScreen  ex.message
  end
end

And(/^I update the fields on opportunity$/) do
  begin
    arg = getDetails "QuoteSyncOppFields"

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
    fill_in "Description",:with => arg["Automation_Description"]
    sleep 3
    fill_in "Earliest Expiration Date",:with => arg["Automation_Expiration_Date"]
    sleep 3

    first(:xpath, "//*[contains(@name, 'save')]").click
    puts "Opportunity field data saved"
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

    $opp_auto_Description = find(:xpath, '//td[text()="Description"]/following-sibling::td/div', :match => :prefer_exact).text
    puts "#{$opp_auto_Description}"

    $opp_auto_ExpirationDate = find(:xpath, '//td[text()="Earliest Expiration Date"]/following-sibling::td/div', :match => :prefer_exact).text
    puts "#{$opp_auto_ExpirationDate}"

  rescue Exception => ex
    putstr "Error occurred while updating fields on opportunity"
    putstr_withScreen  ex.message
  end
end

And(/^I navigate to synced quote details page from opportunity$/) do
  begin
    find(:xpath, '//td[text()="Synced Quote"]/following-sibling::td/div/a', :match => :prefer_exact).click
    puts "Navigated to quote details page"
    sleep 5

  rescue Exception => ex
    putstr "Error occurred while navigating synced quote page from opportunity page"
    putstr_withScreen  ex.message
  end
end
Then(/^I verify opportunity fields copied to quote fields on quote page$/) do
  begin

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
    putstr "Error occurred while copying opportunity fields to quote fields"
    putstr_withScreen  ex.message
  end
end

And(/^I update the fields on quote page$/) do
  begin
    arg = getDetails "QuoteSyncQuoteFields"

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
    fill_in "Description",:with => arg["Automation_Description"]
    sleep 3
    fill_in "Expiration Date",:with => arg["Automation_Expiration_Date"]
    sleep 3

    first(:xpath, "//*[contains(@name, 'save')]").click
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
    $quote_1_auto_Description = find(:xpath, '//td[text()="Description"]/following-sibling::td/div', :match => :prefer_exact).text
    puts "#{$quote_1_auto_Description} saved"

    $quote_1_auto_ExpirationDate = find(:xpath, '//td[text()="Expiration Date"]/following-sibling::td/div', :match => :prefer_exact).text
    puts "#{$quote_1_auto_ExpirationDate} saved"

  rescue Exception => ex
    putstr "Error occurred while updating quote fields on quote page"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify quote fields copied to opportunity fields on opportunity page$/) do
  begin
    $opp_auto_Custom_Text = find(:xpath, '//td[text()="Automation_Cust_Text"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_auto_Custom_Text}"

    if $opp_auto_Custom_Text == $quote_1_auto_Custom_Text
      sleep 5
      puts "#{$quote_1_auto_Custom_Text} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Text} field NOT copied from quote to opportunity"
    end

    $opp_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_auto_Custom_Email}"

    if $opp_auto_Custom_Email == $quote_1_auto_Custom_Email
      sleep 5
      puts "#{$quote_1_auto_Custom_Email} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Email} field NOT copied from quote to opportunity"
    end

    $opp_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_auto_Custom_Currency}"

    if $opp_auto_Custom_Currency == $quote_1_auto_Custom_Currency
      sleep 5
      puts "#{$quote_1_auto_Custom_Currency} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Currency} field NOT copied from quote to opportunity"
    end

    $opp_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_auto_Custom_Phone}"

    if $opp_auto_Custom_Phone == $quote_1_auto_Custom_Phone
      sleep 5
      puts "#{$quote_1_auto_Custom_Phone} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Phone} field NOT copied from quote to opportunity"
    end

    $opp_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_auto_Custom_Date}"

    if $opp_auto_Custom_Date == $quote_1_auto_Custom_Date
      sleep 5
      puts "#{$quote_1_auto_Custom_Date} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Date} field NOT copied from quote to opportunity"
    end

    $opp_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_auto_Custom_DateTime}"

    if $opp_auto_Custom_DateTime == $quote_1_auto_Custom_DateTime
      sleep 5
      puts "#{$quote_1_auto_Custom_DateTime} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_DateTime} field NOT copied from quote to opportunity"
    end

    $opp_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_auto_Custom_Picklist}"

    if $opp_auto_Custom_Picklist == $quote_1_auto_Custom_Picklist
      sleep 5
      puts "#{$quote_1_auto_Custom_Picklist} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Picklist} field NOT copied from quote to opportunity"
    end

    $opp_auto_Description = find(:xpath, '//td[text()="Description"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5

    if $opp_auto_Description == $quote_1_auto_Description
      sleep 5
      puts "#{$quote_1_auto_Description} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Description} field NOT copied from quote to opportunity"
    end

    $opp_auto_ExpirationDate = find(:xpath, '//td[text()="Earliest Expiration Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_auto_ExpirationDate}"

    if $opp_auto_ExpirationDate == $quote_1_auto_ExpirationDate
      sleep 5
      puts "#{$quote_1_auto_ExpirationDate} field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_ExpirationDate} field NOT copied from quote to opportunity"
    end

  rescue Exception => ex
    putstr "Error occurred while copying quote fields to opportunity fields"
    putstr_withScreen  ex.message
  end
end

And(/^I update the fields on opportunity line item$/) do
  begin
    arg = getDetails "QuoteSyncOppFields"

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

  rescue Exception => ex
    putstr "Error occurred while updating fields on opportunity line item"
    putstr_withScreen  ex.message
  end
end

Then(/^I navigate to opportunity from product detail page$/) do
  begin
    find(:xpath, '//td[text()="Opportunity"]/following-sibling::td/div/a', :match => :prefer_exact).click
    sleep 5
    puts "Navigated opportunity page"
  rescue Exception => ex
    putstr "Error occurred while navigating to opportunity page from opportunity product details page"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify OLI fields copied to QLI$/) do
  begin

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
  rescue Exception => ex
    putstr "Error occurred while copying OLI field to QLI field"
    putstr_withScreen  ex.message
  end
end

And(/^I update the fields on quote line item$/) do
  begin
    arg = getDetails "QuoteSyncQuoteFields"

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

    $quoteli_auto_Custom_Text = find(:xpath, '//td[text()="Automation_Cust_Text"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_auto_Custom_Text}"

    $quoteli_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_auto_Custom_Email}"

    $quoteli_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_auto_Custom_Currency}"

    $quoteli_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_auto_Custom_Phone}"

    $quoteli_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_auto_Custom_Date}"

    $quoteli_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_auto_Custom_DateTime}"

    $quoteli_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_auto_Custom_Picklist}"

    $quoteli_auto_Description = find(:xpath, '//td[text()="Line Item Description"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{$quoteli_auto_Description} standard field saved"

    $quoteli_auto_Discount = find(:xpath, '//td[text()="Discount"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{ $quoteli_auto_Discount} standard field saved"

  rescue Exception => ex
    putstr "Error occurred while updating QLI fields"
    putstr_withScreen  ex.message
  end
end

And(/^I navigate to opportunity from quote page$/) do
  begin
    find(:xpath, '//td[text()="Opportunity Name"]/following-sibling::td/div/a', :match => :prefer_exact).click
    sleep 5
    puts "Navigated Opportunity page"
  rescue Exception => ex
    putstr "Error occurred while navigating to opportunity page from quote page"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify QLI fields copied to OLI$/) do
  begin
    within(".opportunityLineItemBlock")do
      find(:link, "Product A").click
      sleep 5
      puts "clicked on product link."
    end

    $oppli_auto_Custom_Text = find(:xpath, '//td[text()="Automation_Cust_Text"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{ $oppli_auto_Custom_Text}"

    if $oppli_auto_Custom_Text == $quoteli_auto_Custom_Text
      sleep 5
      puts "#{$quoteli_auto_Custom_Text} field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Custom_Text} field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{ $oppli_auto_Custom_Email}"

    if $oppli_auto_Custom_Email == $quoteli_auto_Custom_Email
      sleep 5
      puts "#{$quoteli_auto_Custom_Email} field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Custom_Email} field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$oppli_auto_Custom_Currency }"

    if $oppli_auto_Custom_Currency == $quoteli_auto_Custom_Currency
      sleep 5
      puts "#{$quoteli_auto_Custom_Currency} field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Custom_Currency} field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$oppli_auto_Custom_Phone}"

    if $oppli_auto_Custom_Phone == $quoteli_auto_Custom_Phone
      sleep 5
      puts "#{$quoteli_auto_Custom_Phone} field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Custom_Phone} field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{ $oppli_auto_Custom_Date}"

    if $oppli_auto_Custom_Date == $quoteli_auto_Custom_Date
      sleep 5
      puts "#{$quoteli_auto_Custom_Date} field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Custom_Date} field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$oppli_auto_Custom_DateTime}"

    if $oppli_auto_Custom_DateTime == $quoteli_auto_Custom_DateTime
      sleep 5
      puts "#{$quoteli_auto_Custom_DateTime} field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Custom_DateTime} field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$oppli_auto_Custom_Picklist}"

    if $oppli_auto_Custom_Picklist == $quoteli_auto_Custom_Picklist
      sleep 5
      puts "#{$quoteli_auto_Custom_Picklist} field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Custom_Picklist} field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Description = find(:xpath, '//td[text()="Line Description"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$oppli_auto_Description}"
    if $oppli_auto_Description == $quoteli_auto_Description
      sleep 5
      puts "#{$quoteli_auto_Description} field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Description} field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Discount = find(:xpath, '//td[text()="Discount"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$oppli_auto_Discount}"
    if $oppli_auto_Discount == $quoteli_auto_Discount
      sleep 5
      puts "#{$quoteli_auto_Discount} field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Discount} field NOT copied from quote line item  to opportunity line item"
    end
  end
end
And(/^I delete the product from Quote_Opportunity$/) do
  begin
    sleep 5
    arg = getDetails "QuoteSync"
    sleep 5

    within(".opportunityLineItemBlock.quoteLineItemBlock") do

      within(".list") do
        sleep 3
        $first_product_name = all(".dataRow")[0].all("th")[0].first("a").text
        #$second_product_name = all(".dataRow")[1].all("th")[0].first("a").text
        sleep 3
      end

      sleep 5

      all('a[contains(@title,"Delete")]').each_with_index do |delLink , index|
        if index.to_i == arg["FirstProductCheckboxIndex"].to_i
          sleep 5
          delLink.click
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

And(/^I add the product to Quote_Opportunity$/) do
  begin
    sleep 6
    arg = getDetails "QuoteSync"

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

And(/^I sync the quotes from Quote$/) do
  begin
    sleep 4
    arg = getDetails "QuoteSync"
    sleep 3
    isQuotePresent = 0
    #within all(".listRelatedObject.quoteBlock") do
    puts "m in.."
    within all(".pbBody")[10] do
      
      if page.has_css?(".noRowsHeader")
        puts "No Quote Records found"
        sleep 3
      else
        isQuotePresent = 1
        puts "Successfully see the quote records"
      end
    end
    sleep 3
    if isQuotePresent == 1
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
        puts "Successfully see quote sync page"
        sleep 3
        if page.has_css?(".syncStart")
          sleep 3
          click_on arg["StartSync"]
          sleep 6
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
      #within("#bottomButtonRow") do
        click_on 'Sync'
      #end
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
    find(:xpath, "//td[text()='Opportunity Name']").find(:xpath, "following-sibling::td/div/a").click
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while syncing the quote renewal opportunity"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the sync error message$/) do
  begin
    sleep 3
    arg = getDetails "QuoteSync"
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

And(/^I stop the syncing of the quote$/) do
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
    if isQuotePresent == 1
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
      puts "Failed to see the quote sync page"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while sync stoping the quote renewal opportunity"
    putstr_withScreen  ex.message
  end
end

