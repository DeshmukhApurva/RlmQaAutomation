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
    sleep 5
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
      puts "#{$opp_auto_Custom_Text} - text type custom field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_Text} - text type custom field NOT copied from opportunity to quote"
    end

    $quote_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_Custom_Email}"

    if $opp_auto_Custom_Email == $quote_auto_Custom_Email
      sleep 5
      puts "#{$opp_auto_Custom_Email} - email type custom field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_Email} - email type custom field  NOT copied from opportunity to quote"
    end

    $quote_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_Custom_Currency}"

    if $opp_auto_Custom_Currency == $quote_auto_Custom_Currency
      sleep 5
      puts "#{$opp_auto_Custom_Currency} - currency type custom field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_Currency} - currency type custom field NOT copied from opportunity to quote"
    end

    $quote_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_Custom_Phone}"

    if $opp_auto_Custom_Phone == $quote_auto_Custom_Phone
      sleep 5
      puts "#{$opp_auto_Custom_Phone} - phone type custom field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_Phone} - phone type custom field NOT copied from opportunity to quote"
    end

    $quote_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_Custom_Date}"

    if $opp_auto_Custom_Date == $quote_auto_Custom_Date
      sleep 5
      puts "#{$opp_auto_Custom_Date} - date type custom field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_Date} - date type custom field NOT copied from opportunity to quote"
    end

    $quote_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_Custom_DateTime}"

    if $opp_auto_Custom_DateTime == $quote_auto_Custom_DateTime
      sleep 5
      puts "#{$opp_auto_Custom_DateTime} - DateTime type custom field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_DateTime} - DateTime type custom field NOT copied from opportunity to quote"
    end

    $quote_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_Custom_Picklist}"

    if $opp_auto_Custom_Picklist == $quote_auto_Custom_Picklist
      sleep 5
      puts "#{$opp_auto_Custom_Picklist} - picklist type custom field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_Picklist} - picklist type custom field NOT copied from opportunity to quote"
    end

    $quote_auto_Description = find(:xpath, '//td[text()="Description"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5

    if $opp_auto_Description == $quote_auto_Description
      sleep 5
      puts "#{$opp_auto_Description} - Description - standard field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Description}  - Description - standard field NOT copied from opportunity to quote"
    end

    $quote_auto_ExpirationDate = find(:xpath, '//td[text()="Expiration Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quote_auto_ExpirationDate}"

    if $opp_auto_ExpirationDate == $quote_auto_ExpirationDate
      sleep 5
      puts "#{$opp_auto_Custom_DateTime} Exp Date - standard field copied from opportunity to quote"
    else
      puts "#{$opp_auto_Custom_DateTime} Exp Date- standard field NOT copied from opportunity to quote"
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
      puts "#{$quote_1_auto_Custom_Text} - text type custom field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Text} - text type custom field  NOT copied from quote to opportunity"
    end

    $opp_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_auto_Custom_Email}"

    if $opp_auto_Custom_Email == $quote_1_auto_Custom_Email
      sleep 5
      puts "#{$quote_1_auto_Custom_Email} - email type custom field  copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Email} - email type custom field  NOT copied from quote to opportunity"
    end

    $opp_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_auto_Custom_Currency}"

    if $opp_auto_Custom_Currency == $quote_1_auto_Custom_Currency
      sleep 5
      puts "#{$quote_1_auto_Custom_Currency} - currency type custom field  copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Currency} - currency type custom field  NOT copied from quote to opportunity"
    end

    $opp_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_auto_Custom_Phone}"

    if $opp_auto_Custom_Phone == $quote_1_auto_Custom_Phone
      sleep 5
      puts "#{$quote_1_auto_Custom_Phone} - phone type custom field  copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Phone} - phone type custom field NOT copied from quote to opportunity"
    end

    $opp_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_auto_Custom_Date}"

    if $opp_auto_Custom_Date == $quote_1_auto_Custom_Date
      sleep 5
      puts "#{$quote_1_auto_Custom_Date} - Date type custom field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Date} - Date type custom field NOT copied from quote to opportunity"
    end

    $opp_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_auto_Custom_DateTime}"

    if $opp_auto_Custom_DateTime == $quote_1_auto_Custom_DateTime
      sleep 5
      puts "#{$quote_1_auto_Custom_DateTime} - DateTime type custom field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_DateTime}  - DateTime type custom field NOT copied from quote to opportunity"
    end

    $opp_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$opp_auto_Custom_Picklist}"

    if $opp_auto_Custom_Picklist == $quote_1_auto_Custom_Picklist
      sleep 5
      puts "#{$quote_1_auto_Custom_Picklist}  - picklist type custom field copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Custom_Picklist}- picklist type custom field  NOT copied from quote to opportunity"
    end

    $opp_auto_Description = find(:xpath, '//td[text()="Description"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5

    if $opp_auto_Description == $quote_1_auto_Description
      sleep 5
      puts "#{$quote_1_auto_Description} - Standard field - Description -  copied from quote to opportunity"
    else
      puts "#{$quote_1_auto_Description} - Standard field - Description -  NOT copied from quote to opportunity"
    end

    #    $opp_auto_ExpirationDate = find(:xpath, '//td[text()="Earliest Expiration Date"]/following-sibling::td/div', :match => :prefer_exact).text
    #    sleep 5
    #    puts "#{$opp_auto_ExpirationDate}"
    #
    #    if $opp_auto_ExpirationDate == $quote_1_auto_ExpirationDate
    #      sleep 5
    #      puts "#{$quote_1_auto_ExpirationDate} field copied from quote to opportunity"
    #    else
    #      puts "#{$quote_1_auto_ExpirationDate} field NOT copied from quote to opportunity"
    #    end

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
    puts "#{$oppli_auto_Description}"

    sleep 3

    $oppli_auto_Discount = find(:xpath, '//td[text()="Discount"]/following-sibling::td/div', :match => :prefer_exact).text
    puts "#{$oppli_auto_Discount}"

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
      puts "#{$oppli_auto_Custom_Text} - text type custom field copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Custom_Text} - text type custom field NOT copied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Custom_Email}"

    if $oppli_auto_Custom_Email == $quoteli_auto_Custom_Email
      sleep 5
      puts "#{$oppli_auto_Custom_Email} - email type custom field copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Custom_Email} - email type custom field NOT copied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Custom_Currency}"

    if $oppli_auto_Custom_Currency == $quoteli_auto_Custom_Currency
      sleep 5
      puts "#{$oppli_auto_Custom_Currency} - currency type custom field copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Custom_Currency} - currency type custom field NOT copied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Custom_Phone}"

    if $oppli_auto_Custom_Phone == $quoteli_auto_Custom_Phone
      sleep 5
      puts "#{$oppli_auto_Custom_Phone} - phone type custom field copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Custom_Phone} - phone type custom field  NOT copied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Custom_Date}"

    if $oppli_auto_Custom_Date == $quoteli_auto_Custom_Date
      sleep 5
      puts "#{$oppli_auto_Custom_Date} - date type custom field  copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Custom_Date} - date type custom field  NOT copied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Custom_DateTime}"

    if $oppli_auto_Custom_DateTime == $quoteli_auto_Custom_DateTime
      sleep 5
      puts "#{$oppli_auto_Custom_DateTime} - datetime type custom field  copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Custom_DateTime} - datetime type custom field  NOT copied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Custom_Picklist}"

    if $oppli_auto_Custom_Picklist == $quoteli_auto_Custom_Picklist
      sleep 5
      puts "#{$oppli_auto_Custom_Picklist} - picklist type custom field  copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Custom_Picklist} - picklist type custom field NOT copied from opportunity line item  to quote line item"
    end

    $quoteli_auto_Description = find(:xpath, '//td[text()="Line Item Description"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Description}"
    if $oppli_auto_Description == $quoteli_auto_Description
      sleep 5
      puts "#{$oppli_auto_Description} - standard field - Description - copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Description} standard field - Description - NOT from opportunity line item  to quote line item"
    end

    $quoteli_auto_Discount = find(:xpath, '//td[text()="Discount"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$quoteli_auto_Discount}"
    if $oppli_auto_Discount == $quoteli_auto_Discount
      sleep 5
      puts "#{$oppli_auto_Discount} - standard field - Discount - copied from opportunity line item  to quote line item"
    else
      puts "#{$oppli_auto_Discount} - standard field - Discount - NOT copied from opportunity line item  to quote line item"
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
    sleep 5

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
    puts "#{$quoteli_auto_Description}"

    $quoteli_auto_Discount = find(:xpath, '//td[text()="Discount"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 3
    puts "#{ $quoteli_auto_Discount}"

  rescue Exception => ex
    putstr "Error occurred while updating QLI fields"
    putstr_withScreen  ex.message
  end
end

And(/^I navigate to opportunity from quote page$/) do
  begin
    find(:xpath, '//td[text()="Opportunity Name"]/following-sibling::td/div/a', :match => :prefer_exact).click
    sleep 7
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
      puts "#{$quoteli_auto_Custom_Text} - text type custom field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Custom_Text} - text type custom field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Custom_Email = find(:xpath, '//td[text()="Automation_Cust_Email"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{ $oppli_auto_Custom_Email}"

    if $oppli_auto_Custom_Email == $quoteli_auto_Custom_Email
      sleep 5
      puts "#{$quoteli_auto_Custom_Email} - email type custom field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Custom_Email} - email type custom field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Custom_Currency = find(:xpath, '//td[text()="Automation_Cust_Currency"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$oppli_auto_Custom_Currency }"

    if $oppli_auto_Custom_Currency == $quoteli_auto_Custom_Currency
      sleep 5
      puts "#{$quoteli_auto_Custom_Currency} - currency type custom field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Custom_Currency} - currency type custom field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Custom_Phone = find(:xpath, '//td[text()="Automation_Cust_Phone"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$oppli_auto_Custom_Phone}"

    if $oppli_auto_Custom_Phone == $quoteli_auto_Custom_Phone
      sleep 5
      puts "#{$quoteli_auto_Custom_Phone} - phone type custom field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Custom_Phone} - phone type custom field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Custom_Date = find(:xpath, '//td[text()="Automation_Cust_Date"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{ $oppli_auto_Custom_Date}"

    if $oppli_auto_Custom_Date == $quoteli_auto_Custom_Date
      sleep 5
      puts "#{$quoteli_auto_Custom_Date} - date type custom field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Custom_Date} - date type custom field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Custom_DateTime = find(:xpath, '//td[text()="Automation_Cust_DateTime"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$oppli_auto_Custom_DateTime}"

    if $oppli_auto_Custom_DateTime == $quoteli_auto_Custom_DateTime
      sleep 5
      puts "#{$quoteli_auto_Custom_DateTime} - datetime type custom field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Custom_DateTime} - datetime type custom field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Custom_Picklist = find(:xpath, '//td[text()="Automation_Cust_Picklist"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$oppli_auto_Custom_Picklist}"

    if $oppli_auto_Custom_Picklist == $quoteli_auto_Custom_Picklist
      sleep 5
      puts "#{$quoteli_auto_Custom_Picklist} - picklist type custom field copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Custom_Picklist} - picklist type custom field NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Description = find(:xpath, '//td[text()="Line Description"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$oppli_auto_Description}"
    if $oppli_auto_Description == $quoteli_auto_Description
      sleep 5
      puts "#{$quoteli_auto_Description} - standard field - Description - copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Description} - standard field - Description -  NOT copied from quote line item  to opportunity line item"
    end

    $oppli_auto_Discount = find(:xpath, '//td[text()="Discount"]/following-sibling::td/div', :match => :prefer_exact).text
    sleep 5
    puts "#{$oppli_auto_Discount}"
    if $oppli_auto_Discount == $quoteli_auto_Discount
      sleep 5
      puts "#{$quoteli_auto_Discount} - standard field - Discount - copied from quote line item  to opportunity line item"
    else
      puts "#{$quoteli_auto_Discount} - standard field - Discount - NOT copied from quote line item  to opportunity line item"
    end
  end
end

And(/^I navigate to Quote detail page from QLI details page$/) do
  begin
    find(:xpath, '//td[text()="Quote Name"]/following-sibling::td/div/a', :match => :prefer_exact).click
    puts "Navigated to quote details page"
    sleep 5

  rescue Exception => ex
    putstr "Error occurred while navigating quote page from QLI details page"
    putstr_withScreen  ex.message
  end
end

And(/^I navigate to available quote$/) do
  begin

    sleep 3
    isQuotePresent = 0
    #within all(".listRelatedObject.quoteBlock") do
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

          puts "Navigated to available quote page - #{quote_name} "
          sleep 3
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while navigating to available quote"
    putstr_withScreen  ex.message
  end
end

And(/^I navigate to Opportunity from partner Opportunity page$/) do
  begin
    sleep 15
    find(:xpath, '//td[text()="Opportunity Name"]/following-sibling::td/div/a', :match => :prefer_exact).click
    sleep 10
    puts "Navigated Opportunity page"
  rescue Exception => ex
    putstr "Error occurred while navigating to opportunity page from partner opportunity page"
    putstr_withScreen  ex.message
  end
end

#And(/^I delete the product from Quote_Opportunity$/) do
And(/^I delete the product from "([^"]*)" LineItem$/) do |lineItem|
  begin
    sleep 5

    if lineItem == "Quote"
      #within(".opportunityLineItemBlock",".quoteLineItemBlock") do
      within(".quoteLineItemBlock") do
        $first_product = all(".dataRow")[0].all("th")[0].first("a").text
        puts $first_product
        first(:link, "Del").click
        sleep 5
      end
      page.driver.browser.switch_to.alert.accept
      puts "QLI deleted successfully"
    else
      within(".opportunityLineItemBlock") do
        $first_product = all(".dataRow")[0].all("th")[0].first("a").text
        puts $first_product
        first(:link, "Del").click
        sleep 5
      end
      page.driver.browser.switch_to.alert.accept
      puts "OLI deleted successfully"
    end
    #      within(".list") do
    #        first(:link, "Del").click
    #        page.driver.browser.switch_to.alert.accept
    #        sleep 3
    #        $first_product_name = all(".dataRow")[0].all("th")[0].first("a").text
    #        #$second_product_name = all(".dataRow")[1].all("th")[0].first("a").text
    #        sleep 3
    #      end

    #      all('a[contains(@title,"Delete")]').each_with_index do |delLink , index|
    #        if index.to_i == arg["FirstProductCheckboxIndex"].to_i
    #          sleep 5
    #          delLink.click
    #          page.driver.browser.switch_to.alert.accept
    #        else
    #          # puts "#{index}"
    #        end
    #      end
    #
    #    end

  rescue Exception => ex
    putstr "Error occurred while deleting the QLI"
    putstr_withScreen  ex.message
  end
end

And(/^I add the product to "([^"]*)" object$/) do |object|
  begin
    if object == "Quote"
      click_on "Add Line Item"
    else
      click_on "Add Product"
    end
    sleep 6
    arg = getDetails "QuoteSync"
    #$first_product_name
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
        #puts "#{index}"
        end
      end
    end
    $add_first_product_name = first(:xpath, '//tr/td[4]/div/a/span').text
    puts "First Product selected from the Product List is: #{$add_first_product_name}"

    if $first_product == $add_first_product_name
      click_on 'Select'
    end

    sleep 4
    #click_on 'Select'
    puts "Successfully select the product"
    sleep 6
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[3]/input").set arg["ProductQuantity"]
    sleep 5
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[2]/input").set arg["ProductSalesPrice"]
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

And(/^I select and sync the quote which is not syncing from Opp$/) do
  begin
    sleep 4
    arg = getDetails "QuoteSync"
    sleep 3
    isQuotePresent = 0
    #within all(".listRelatedObject.quoteBlock") do
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
          puts first("tbody").all(".dataRow")[0].all("td")[1].first("a").text
          puts first("tbody").all(".dataRow")[1].all("td")[1].first("a").text

          sleep 3

          if first("tbody").all(".dataRow")[0].all("td")[1].first("a").text != $newPOQuote
            first("tbody").all(".dataRow")[0].all("td")[1].first("a").click
            sleep 4
          elsif first("tbody").all(".dataRow")[1].all("td")[1].first("a").text != $newPOQuote
            first("tbody").all(".dataRow")[1].all("td")[1].first("a").click
            sleep 4
          end

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

And(/^I navigate to Quote page from Opportunity page$/) do
  begin
    sleep 4
    arg = getDetails "QuoteSync"
    sleep 3
    isQuotePresent = 0
    #within all(".listRelatedObject.quoteBlock") do
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
          first("tbody").all(".dataRow")[0].all("td")[1].first("a").click
          sleep 4
        end
      end
    end
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
          $quote_name = first("tbody").all(".dataRow")[0].all("td")[1].first("a").text
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
          puts "syncstop button is available"
          sleep 3
          #click_on arg["StopSync"]
          click_on "Stop Sync"
          sleep 5

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

#And(/^I click on "([^"]*)" button from renewal relationship page$/) do |consolidate|
#  begin
#    sleep 5
#    unless page.has_css?(".no-records-found")
#      sleep 4
#      click_on consolidate
#      sleep 8
#      puts "Successfully click the #{consolidate} button"
#    else
#      puts "No matching records found"
#    end
#  rescue Exception => ex
#    putstr "Error occurred while clicking the #{consolidate} button"
#    putstr_withScreen  ex.message
#  end
#end

And(/^I delete the opportunity product$/) do
  begin
  #$rebuild_product_name = first(".opportunityLineItemBlock").first("tbody").first(".dataRow").first("th").first("a").text
  #first(".opportunityLineItemBlock").first(:link,"Del").click
  #    sleep 5
  #    find(:link,'Del').click
  #    puts "tested.."
  #    sleep 5
  #    page.driver.browser.switch_to.alert.accept
  #    puts "Deleted product #{$rebuild_product_name}"
  #    sleep 5

    within(".opportunityLineItemBlock")do
      first(:link, "Del").click
      sleep 5
      puts "Deleted the product."
      page.driver.browser.switch_to.alert.accept

    end
  rescue Exception => ex
    putstr "Error occurred while deleting the Opportunity product"
    putstr_withScreen  ex.message
  end
end

Then(/^I should click on back to navigate to opportunity from manage renewals page$/) do
  begin
    sleep 3
    click_on "Back"
    sleep 3
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

And(/^I select the multiple "([^"]*)" product fields$/) do |renewal_relationship|
  begin
    sleep 4
    arg = getDetails "QuoteSync_ManageRenewalsOpportunity"
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

And(/^I create new quote for newly created PO$/) do
  begin
    arg = getDetails "QuoteSync"
    time = Time.new
    quoteDateTime = time.hour.to_s + time.min.to_s + time.sec.to_s
    sleep 1

    $newPOQuote = arg["AQName"] + quoteDateTime.to_s
    puts $newPOQuote
    click_on "New Quote"
    sleep 5
    within all(".pbSubsection")[0] do
      first(:xpath, "//*[contains(@name, 'Name')]").send_keys $newPOQuote
      sleep 1
      fill_in "Partner Opportunity",:with => $PO_name
      sleep 1
      first(:xpath, "//*[contains(@name, 'save')]").click
      puts "New Quote created"
      sleep 5
    end

    $newPOQuoteNumber = find(:xpath, '//td[text()="Quote Number"]/following-sibling::td/div', :match => :prefer_exact).text
    puts $newPOQuoteNumber
    sleep 1

  rescue Exception => ex
    putstr "Error occurred while adding new Quote"
    putstr_withScreen  ex.message
  end
end

When(/^I update the earliest expiration date$/) do |tab|
  begin
    sleep 2
    first(:button,'Edit').click
    sleep 5
    fill_in "Earliest Expiration Date",:with=> $earliestExpirationDate
    sleep 1
    within(:id,"topButtonRow") do
      click_on "Save"
    end
  rescue Exception => ex
    raise "Error occurred while clicking the #{tab} tab"
    putstr_withScreen  ex.message
  end
end

And(/^I search for the partner opportunity on Community$/) do
  begin
    sleep 5

    allExpQrtrArg = getReference "Expiration Quarter"
    allExpQuarters = allExpQrtrArg["filterValues"].split(",")
    puts allExpQuarters

    allExpYearsArg = getReference "Expiration Year"
    allExpYears = allExpYearsArg["filterValues"].split(",")
    puts allExpYears

    within all("span.ui-select-match")[0] do
      find(:css, ".close.ui-select-match-close").click
      sleep 2
    end

    allExpQuarters.each do |value|
      find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[1]/div/div/div/input").click
      click_on(value)
      sleep 2
    end

    within all("span.ui-select-match")[1] do
      find(:css, ".close.ui-select-match-close").click
      sleep 2
    end

    allExpYears.each do |value|
      find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[2]/div/div/div/input").click
      click_on(value)
      sleep 2
    end
    sleep 5
    #Puts $PO_name

    find(:xpath, "//input[@placeholder='Search Opportunities...']").click
    sleep 2
    find(:xpath, "//input[@placeholder='Search Opportunities...']").send_keys [:control, 'a'], :backspace
    sleep 2
    find(:xpath, "//input[@placeholder='Search Opportunities...']").send_keys 'AO1972016174845-SSAutomationQuoteSyncAccount'
    sleep 5

    #find(:xpath, "//div[2]/div/div[2]/div/div/div[1]/div[5]/input").click
    #find(:xpath, "//div[2]/div/div[2]/div/div/div[1]/div[5]/input").send_keys [:control, 'a'], :space
    #sleep 1
    #find(:xpath, "//div[2]/div/div[2]/div/div/div[1]/div[5]/input").send_keys $PO_name
    #find(:xpath, "//div[2]/div/div[2]/div/div/div[1]/div[5]/input").send_keys 'AO1972016174845-SSAutomationQuoteSyncAccount'
    #sleep 1

    #click_on $PO_name
    click_on  'AO1972016174845-SSAutomationQuoteSyncAccount'

    sleep 3

  rescue Exception => ex
    puts "Error while searching opportunity on Opporunities Tab"
    puts ex.message
  end
end

And(/^I Set new Quote as primary$/) do
  begin

    Capybara.ignore_hidden_elements = true

    puts $newPOQuoteNumber

    if page.should have_content($newPOQuoteNumber)
      #if page.should have_content("00001750")
      puts "Quote #{$newPOQuoteNumber} has been verified successfully."
      #puts "Quote 00001750 has been verified successfully."

      #find(:xpath, '//a[contains(text(),"00001750")]/parent::div/parent::div/following-sibling::div/div/label').click
      find(:xpath, '//a[contains(text(),"#{$newPOQuoteNumber}")]/parent::div/parent::div/following-sibling::div/div/label').click

      sleep 5
    end
  rescue Exception => ex
    puts "Error occured while setting new Quote as primary"
    puts ex.message
  end
end

And(/^I navigate to contributor opportunity$/) do
  begin
    sleep 5
    find(:xpath, "//th[text()='Contributor']").find(:xpath, '..').find(:xpath, "following-sibling::tr/td[2]/a").click
    sleep 5
  end
end

And(/^I open the Quote Sync Renewal Opportunity$/) do
  begin
    sleep 6
    arg = getReference "AddPartnerOpportunity"
    sleep 3
    find('#fcf').select "My Opportunities"
    sleep 5
    #within (".fBody") do
    click_button 'Go!'
    #end
    sleep 8
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
    sleep 5
    result = false
    oppName = $automationRO.to_s
    oppInitial = oppName[0]
    click_on oppInitial
    #find(:xpath, '//a/span[text()="#{oppInitial}"]').click
    sleep 5
    all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|

      if activity.text.to_s == $automationRO.to_s
        puts "Successfully match the Opportunity name"
        activity.click
        puts "Successfully opened the #{$automationRO} Opportunity"
      result = true
      break
      end
    end
    putstr "Unable to find the #{$automationRO} Opportunity" unless result
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while clicking on existing #{$automationRO} Opportunity page"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the primary and syncing Quote on Opp$/) do
  begin
    sleep 4
    isQuotePresent = 0
    #within all(".listRelatedObject.quoteBlock") do
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

          puts first("tbody").all(".dataRow")[0].all("td")[1].first("a").text
          puts first("tbody").all(".dataRow")[1].all("td")[1].first("a").text

          sleep 3

          if first("tbody").all(".dataRow")[0].all("th")[0].first("a").text == $newPOQuoteNumber
            if first("tbody").all(".dataRow")[0].all("td")[2].find("img")['title'] == 'Checked'
              puts "Quote #{$newPOQuoteNumber} has been selected as Primary Quote successfully"
            else
              puts "Quote #{$newPOQuoteNumber} has not been selected as Primary Quote successfully"
            end
            sleep 4
          elsif first("tbody").all(".dataRow")[1].all("th")[0].first("a").text == $newPOQuoteNumber
            if first("tbody").all(".dataRow")[1].all("td")[2].find("img")['title'] == 'Checked'
              puts "Quote #{$newPOQuoteNumber} has been selected as Primary Quote successfully"
            else
              puts "Quote #{$newPOQuoteNumber} has not been selected as Primary Quote successfully"
            end
            sleep 4
          end
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while syncing the quote renewal opportunity"
    putstr_withScreen  ex.message
  end
end