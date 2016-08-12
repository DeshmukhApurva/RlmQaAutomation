require 'Win32API'

#All Common Step Definitions which are common across modules
#All scenarios mentioned in all features

# Given(/^that I navigate to the CRM application$/) do
# begin
# visit env
# puts "Login as " + ENV['UserRole']
# arg = getCredentialInfo
# fill_in "username",:with => arg["userName"]
# fill_in "Password",:with => arg["pwd"]
# puts "Entered Credentials"
# find(:id,"Login").click
# page.driver.browser.manage.window.maximize
# # find(:id,"tsidButton").click
# # begin
# # click_on "ServiceSource Cloud Apps"
# # rescue Exception => ex
# # puts "Already in ServiceSource Cloud Apps"
# # end
# sleep 10
# rescue Exception => ex
# puts "Error while entering credentials"
# puts ex.message
# end
# end

Given(/^that I navigate to the CRM application$/) do
  begin
    $userRole = ENV['UserRole']
    $currentBrowser = ENV['Browser']
    puts "#{$userRole} is logged in"
    sleep 5
    setCursorPos = Win32API.new("user32", "SetCursorPos", ['I','I'], 'V')
    setCursorPos.Call(500,10)
    arg = getCredentialInfo
    visit arg["url"]
    sleep 4
    #puts "Login as " + ENV['UserRole']
    page.driver.browser.manage.window.maximize
    if arg["url"] == "https://login.salesforce.com/"
      sleep 4
      fill_in "username",:with => arg["userName"]
      sleep 4
      fill_in "Password",:with => arg["pwd"]
      puts "Entered Credentials"
      find(:id,"Login").click
      page.driver.browser.manage.window.maximize
      sleep 10
    else
      sleep 4
      fill_in "username",:with => arg["userName"]
      sleep 4
      find("input[name='password']").send_keys arg["pwd"]
      puts "Entered Credentials"
      sleep 4
      click_on 'Sign In'
      sleep 5
      page.driver.browser.manage.window.maximize
      sleep 6
    end

  rescue Exception => ex
    puts "Error while entering credentials"
    puts ex.message
  end
end

Then(/^I should land on CRM home page$/) do
  begin
    sleep 5
    if page.has_content? "Accounts"
      puts "User Logged in Successfully"
    else
      raise "Login Failed"
    end
  rescue Exception => ex
    putstr "Error occurred while login"
    putstr_withScreen  ex.message
  end
end

Then(/^I logout$/) do
  begin
    sleep 5
    click_on "Logout"
    sleep 5
    puts "Logged out"
  rescue Exception => ex
    puts "Error occurred during Logout"
    puts ex.message
  end
end

When(/^I Navigate to "(.*?)" tab$/) do |arg1|
  begin
    sleep 10
    first(:link, arg1).click
    sleep 5
    puts "Navigated to #{arg1} tab"
  rescue Exception => ex
    puts "Error occurred while navigating to #{arg1} tab"
    puts ex.message
  end
end

When(/^I click on "(.*?)" link$/) do |arg1|
  begin
    first(:link, arg1).click
    sleep 5
    puts "Navigated to #{arg1}"
  rescue Exception => ex
    puts "Error occurred while navigating to #{arg1}"
    puts ex.message
  end
end

Then(/^I clicked on "(.*?)" link$/) do |arg1|
  begin
    first(:link, arg1).click
    sleep 5
    puts "Clicked on #{arg1} link"
  rescue Exception => ex
    puts "Error occurred while clicking #{arg1}"
    puts ex.message
  end
end

Then (/^I fetch the dropdown selected values$/) do
  begin
    putstr all(".dataRow")[0].find('option[selected]').text
  rescue Exception => ex
    puts "Error occurred while fetching the drop down selected values"
    putstr_withScreen  ex.message
  end
end

And(/^I enable "(.*?)" checkbox$/) do |labeltext|
  begin
    find_field("#{labeltext}").set(true)
    puts "Successfully enabled #{labeltext}"
  rescue Exception => ex
    puts "Error occurred while enabling #{labeltext}"
    putstr_withScreen  ex.message
  end
end

And(/^I disable "(.*?)" checkbox$/) do |labeltext|
  begin
    find_field("#{labeltext}").set(false)
    puts "Successfully disabled #{labeltext}"
  rescue Exception => ex
    puts "Error occurred while disabling #{labeltext}"
    putstr_withScreen  ex.message
  end
end

And(/^I click on "(.*?)"$/) do |button_text|
  begin
    sleep 3
    within all(".pbButton ")[0] do
      click_on button_text
      puts "Successfully clicked #{button_text}"
      sleep 5
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{button_text}"
    putstr_withScreen  ex.message
  end
end

And(/^I click on "(.*?)" button$/) do |button_text|
  begin
    sleep 8
    #within all(".pbButton")[1] do
    first(:button, button_text).click
    sleep 5
    puts "Successfully clicked #{button_text}"
    #end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{button_text}"
    putstr_withScreen  ex.message
  end
end

And(/^I user login in to "([^"]*)" app$/) do |application|
  begin
    sleep 5
    arg = getCredentialInfo
    visit arg["channelNetops_url"]
    sleep 4
    if arg["channelNetops_url"] == "https://login.salesforce.com"
      sleep 4
      fill_in "username",:with => arg["channelNetops_userName"]
      sleep 4
      fill_in "Password",:with => arg["channelNetops_pwd"]
      puts "Entered Credentials"
      sleep 3
      find(:id,"Login").click
      sleep 5
      puts "Login in as #{application} application"
      page.driver.browser.manage.window.maximize
      sleep 8
    end
  rescue Exception => ex
    puts "Error while entering user credentials"
    puts ex.message
  end
end

And(/^I open the existing opportunity$/) do
  begin
    sleep 6
    arg = getReference "AddPartnerOpportunity"
    sleep 3
    find(:xpath, '//input[contains(@placeholder,"Search...")]').click
    sleep 2
    find(:xpath, '//input[contains(@placeholder,"Search...")]').set arg["PartnerOpportunityName"]
    sleep 2
    find(:xpath, '//input[contains(@id,"phSearchButton")]').click
    sleep 8
    within(".opportunityBlock") do
      within(".list") do
        if first("tbody").all(".dataRow")[0].all("th")[0].first("a").text == arg["PartnerOpportunityName"]
          first("tbody").all(".dataRow")[0].all("th")[0].first("a").click
          puts "Opportunity #{arg["PartnerOpportunityName"]} Found..."
        else
          puts "Opportunity #{arg["PartnerOpportunityName"] } Not Found..."
        end
      end
    end
    sleep 10
    # find('#fcf').select "My Opportunities"
    # sleep 5
#     #within (".fBody") do
#     click_button 'Go!'
#     #end
    # sleep 8
    # if page.has_css?(".listItemPad")
      # sleep 4
      # puts "Successfully see the Alphabetic Pagination"
      # all(".listItemPad")[15].click
      # sleep 8
      # all(".selectArrow")[0].click
      # sleep 8
      # within(".bottomNav") do
        # first("table").all("tr")[4].click
      # end
    # else
      # putstr "Failed to see the Alphabetic Pagination"
    # end
    # sleep 5
    # result = false
    # oppName = arg["PartnerOpportunityName"].to_s
    # oppInitial = oppName[0]
    # click_on oppInitial
    # #find(:xpath, '//a/span[text()="#{oppInitial}"]').click
    # sleep 5
    # all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
# 
      # if activity.text.to_s == arg["PartnerOpportunityName"].to_s
        # puts "Successfully match the Opportunity name"
        # activity.click
        # puts "Successfully opened the #{arg["PartnerOpportunityName"]} Opportunity"
      # result = true
      # break
      # end
    # end
    # putstr "Unable to find the #{arg["PartnerOpportunityName"]} Opportunity" unless result
    # sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting Opportunity: #{arg["PartnerOpportunityName"]}"
    putstr_withScreen  ex.message
  end
end

And(/^user login in to "([^"]*)" application$/) do |application|
  begin
    sleep 5
    arg = getCredentialInfo
    visit arg["oem_url"]
    sleep 4
    #puts "Login as " + ENV['UserRole']
    if arg["oem_url"] == "https://login.salesforce.com/"
      sleep 4
      fill_in "username",:with => arg["oem_userName"]
      sleep 4
      fill_in "Password",:with => arg["oem_pwd"]
      puts "Entered Credentials"
      find(:id,"Login").click
      sleep 4
      puts "Login in as #{application} application"
      sleep 3
      page.driver.browser.manage.window.maximize
      sleep 10
    end
  rescue Exception => ex
    puts "Error  while entering credentials"
    puts ex.message
  end
end

Then(/^I should able to see the "([^"]*)" home page$/) do |application|
  begin
    sleep 5
    if page.has_content? "Accounts"
      puts "User Logged in #{application} Successfully"
    else
      raise "Login Failed"
    end
  rescue Exception => ex
    putstr "Error occurred while login"
    putstr_withScreen  ex.message
  end
end

When(/^user logs out from channel partner community$/) do
  begin
    sleep 5
    click_on "Logout"
    sleep 5
    puts "Logged out"
  rescue Exception => ex
    puts "Error  occurred during Logout"
    puts ex.message
  end
end

When(/^I click on "(.*?)" tab$/) do |arg1|
  begin
    first(:link, arg1).click
    sleep 10
    puts "Navigated to " + arg1 + " tab"
  rescue Exception => ex
    puts "Error  occurred while navigating to #{arg1}"
    puts ex.message
  end
end

And(/^I click on the "([^"]*)"$/) do |button_text|
  begin
    sleep 5
    click_on button_text
    sleep 8
    puts "Successfully click the #{button_text} button"
  rescue Exception => ex
    putstr "Error occurred while clicking on #{button_text} button"
    putstr_withScreen  ex.message
  end
end

And(/^I user login in to "([^"]*)" application$/) do |application|
  begin
    sleep 5
    arg = getCredentialInfo
    visit arg["partner_url"]
    sleep 4

    fill_in "username",:with => arg["partner_userName"]
    sleep 4
    find("input[name='password']").send_keys arg["partner_pwd"]
    puts "Entered Credentials"
    sleep 3
    click_on 'Sign In'
    sleep 5
    puts "Login in as #{application} application"
    page.driver.browser.manage.window.maximize
    sleep 8

  rescue Exception => ex
    puts "Error  while entering credentials"
    puts ex.message
  end
end

When(/^user logout from "([^"]*)" application$/) do |environment|
  begin
    sleep 5
    find("#userNav-arrow").click
    sleep 6
    click_on "Logout"
    sleep 5
    puts "Successfully logout from the #{environment}"
  rescue Exception => ex
    puts "Error occurred while logout the #{environment} application"
    puts ex.message
  end
end

Then(/^I should able to see the "([^"]*)" page$/) do |application|
  begin
    sleep 5
    if page.has_content? "Overview"
      puts "User Logged in #{application} Successfully"
    else
      raise "Login Failed"
    end
  rescue Exception => ex
    putstr "Error occurred while login"
    putstr_withScreen  ex.message
  end
end

And(/^I user login as a "([^"]*)" user$/) do |application|
  begin
    sleep 5
    arg = getCredentialInfo
    visit arg["admin_url"]
    sleep 4
    if arg["admin_url"] == "https://login.salesforce.com"
      sleep 4
      fill_in "username",:with => arg["admin_userName"]
      sleep 4
      fill_in "Password",:with => arg["admin_pwd"]
      puts "Entered Credentials"
      sleep 3
      find(:id,"Login").click
      sleep 5
      puts "Login in as #{application} application"
      page.driver.browser.manage.window.maximize
      sleep 8
    end
  rescue Exception => ex
    puts "Error while entering user credentials"
    puts ex.message
  end
end

When(/^I click on the "(.*?)" grid tab$/) do |tab|
  begin
    sleep 5
    if page.has_css?("#AllTab_Tab")
      sleep 3
      find(".allTabsArrow").click
      sleep 4
      within(".bPageBlock") do
        find("#p1").select "All Tabs"
        sleep 4
        click_on tab
      end
      sleep 3
      puts "Successfully navigate to the #{tab} page"
    else
      raise "Failed to see the All Tab Icon"
    end
    sleep 3
  rescue Exception => ex
    raise "Error occurred while clicking the #{tab} tab"
    putstr_withScreen  ex.message
  end
end

When(/^I log into "(.*?)" details$/) do |arg1|
  begin
    sleep 5
    ENV['UserRole'] = arg1
    puts ENV['UserRole']

    arg = getCredentialInfo

    ENV['UserRole'] = $userRole
    puts ENV['UserRole']

    visit arg["url"]
    sleep 4
    #puts "Login as " + ENV['UserRole']
    if arg["url"] == "https://login.salesforce.com/"
      sleep 4
      fill_in "username",:with => arg["userName"]
      sleep 4
      fill_in "Password",:with => arg["pwd"]
      puts "Entered Credentials"
      find(:id,"Login").click
      page.driver.browser.manage.window.maximize
      sleep 10
    else
      sleep 4
      fill_in "username",:with => arg["userName"]
      sleep 4
      find("input[name='password']").send_keys arg["pwd"]
      puts "Entered Credentials"
      sleep 4
      click_on 'Sign In'
      sleep 5
      page.driver.browser.manage.window.maximize
      sleep 6
    end

  rescue Exception => ex
    puts "Error while entering credentials"
    puts ex.message
    ENV['UserRole'] = $userRole
  end
end

When(/^I create Source Opportunity with Line Items and resolve it$/) do
  begin
  # Components of a Time
  #    puts "Current Time : " + time.inspect
  #    puts time.year    # => Year of the date
  #    puts time.month   # => Month of the date (1 to 12)
  #    puts time.day     # => Day of the date (1 to 31 )
  #    puts time.wday    # => 0: Day of week: 0 is Sunday
  #    puts time.yday    # => 365: Day of year
  #    puts time.hour    # => 23: 24-hour clock
  #    puts time.min     # => 59
  #    puts time.sec     # => 59
  #    puts time.usec    # => 999999: microseconds
  #    puts time.zone    # => "UTC": timezone name
    time = Time.new
    #oppDateTime =  +
    arg = getDetails "QuoteSync"
    time = Time.new
    oppDateTime = time.day.to_s + time.month.to_s + time.year.to_s + time.hour.to_s + time.min.to_s + time.sec.to_s
    year = time.year.to_i + 2
    click_link('Opportunities')
    sleep 5
    click_on "New"
    sleep 5
    puts "Creating a new opportunity"

    $automationOppName = arg["SourceOppName"] + oppDateTime.to_s

    $earliestExpirationDate = "12/30/" + year.to_s
    $oPPCloseDate = "12/31/" + year.to_s

    $startDateOLI = time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s
    $endDateOLI = time.month.to_s + "/" + time.day.to_s + "/" + (time.year.to_i + 1).to_s

    fill_in "Opportunity Name",:with=>$automationOppName
    sleep 1
    fill_in "Close Date",:with=> $oPPCloseDate
    sleep 1
    fill_in "Earliest Expiration Date",:with=> $earliestExpirationDate
    sleep 1
    select arg["SourceOppStage"], :from => "Stage"
    sleep 1
    fill_in "Account Name",:with=>arg["Account"]
    sleep 1

    within(:id,"bottomButtonRow") do
      click_on "Save"
    end

    puts "Successfully created Opportunity"

    sleep 5
    click_on "Choose Price Book"
    sleep 3
    first(:option,'Standard Price Book').select_option
    sleep 4
    click_on "Save"
    sleep 5
    click_on "Add Product"
    sleep 5
    first(:option, 'Active (Product)').select_option
    sleep 1
    first(:option, 'equals').select_option
    sleep 1
    find(:xpath, '//span[contains(text(),"By Field Filter")]/following-sibling::div/div/input').set 'Active'
    sleep 1
    find(:xpath, '//input[contains(@id,"save_filter_PricebookEntry")]').click
    sleep 5
    
    find(:xpath, "(//input[@type='checkbox'])[2]").set(true)
    find(:xpath, "(//input[@type='checkbox'])[3]").set(true)
    find(:xpath, "(//input[@type='checkbox'])[4]").set(true)
    find(:xpath, "(//input[@type='checkbox'])[5]").set(true)
    # find(:xpath, "(//input[@type='checkbox'])[6]").set(true)
    # find(:xpath, "(//input[@type='checkbox'])[7]").set(true)
    # find(:xpath, "(//input[@type='checkbox'])[8]").set(true)
    # find(:xpath, "(//input[@type='checkbox'])[9]").set(true)'

    click_on 'Select'
    puts "Successfully select the product"
    sleep 6
    #Enter product Quantity
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[3]/input").set arg["ProductQuantity"]
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[3]/input").set arg["ProductQuantity"]
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[13]/td[3]/input").set arg["ProductQuantity"]
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[3]/input").set arg["ProductQuantity"]
    sleep 2

    #Enter Start Date of Product
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[4]/span/input").set $startDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[4]/span/input").set $startDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[4]/span/input").set $startDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[13]/td[4]/span/input").set $startDateOLI
    sleep 2

    #Enter End Date of Product
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[5]/span/input").set $endDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[5]/span/input").set $endDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[5]/span/input").set $endDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[13]/td[5]/span/input").set $endDateOLI
    sleep 2

    #Enter product sales price
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[6]/input").set arg["ProductSalesPrice"]
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[6]/input").set arg["ProductSalesPrice"]
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[13]/td[6]/input").set arg["ProductSalesPrice"]
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[6]/input").set arg["ProductSalesPrice"]
    sleep 2
    # find(:xpath,"//*[@id='editPage']/table/tbody/tr[21]/td[6]/input").set arg["ProductSalesPrice"]
    # sleep 2
    # find(:xpath,"//*[@id='editPage']/table/tbody/tr[25]/td[6]/input").set arg["ProductSalesPrice"]
    # sleep 2
    # find(:xpath,"//*[@id='editPage']/table/tbody/tr[29]/td[6]/input").set arg["ProductSalesPrice"]
    # sleep 2
    # find(:xpath,"//*[@id='editPage']/table/tbody/tr[33]/td[6]/input").set arg["ProductSalesPrice"]
    # sleep 2
    all(:xpath,'//td/input[@value=" Save "]')[0].click
    sleep 6

    within(".opportunityLineItemBlock") do
      within(".list") do
        sleep 3
        $first_product = all(".dataRow")[0].all("th")[0].first("a").text
        puts $first_product

        $second_product = all(".dataRow")[1].all("th")[0].first("a").text
        puts $second_product

        $third_product = all(".dataRow")[2].all("th")[0].first("a").text
        puts $third_product

        $fourth_product = all(".dataRow")[3].all("th")[0].first("a").text
        puts $fourth_product
        sleep 3
      end
    end

    #Resolve Opportunity
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    #first(:button,'Edit').click
    sleep 5
    first(:option,'Closed Won').select_option
    sleep 2
    first(:button,'Save').click
    sleep 8

    find(:xpath, "//th[text()='Contributed To']").find(:xpath, '..').find(:xpath, "following-sibling::tr/td[2]/a").click
    sleep 8

    # first(:button,'Edit').click
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    sleep 5
    $automationRO = $automationOppName + "RO"
    fill_in "Opportunity Name",:with=>$automationRO
    sleep 1
    first(:button,'Save').click
    sleep 8
  rescue Exception => ex
    puts "Error occurred while creating Opportunities"
    puts ex.message
  end
end

And(/^I verify the current expiration quarter value in Expiration Quarter filter$/) do
  begin
    allExpQrtrArg = getReference "Expiration Quarter"
    allExpQuarters = allExpQrtrArg["filterValues"].split(",")
    puts allExpQuarters

    within all("span.ui-select-match")[0] do
      find(:css, ".close.ui-select-match-close").click
      sleep 2
    end

    allExpQuarters.each do |value|
      find(:xpath, "//div/div[2]/div/div[2]/div/div/div[1]/div[1]/div/div/div/input").click
      click_on(value)
      sleep 2
    end
    sleep 5
  rescue Exception => ex
    puts "Error occurred while creating Opportunities"
    puts ex.message
  end
end

And(/^I verify the current expiration year value in Expiration Year filter$/) do
  begin
    allExpYearsArg = getReference "Expiration Year"
    allExpYears = allExpYearsArg["filterValues"].split(",")
    puts allExpYears

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
  rescue Exception => ex
    puts "Error occurred while creating Opportunities"
    puts ex.message
  end
end

#copied from renew
  
And(/^I Create New Source Opportunity$/) do
  begin
    sleep 5
    arg = getReference "SourceOpportunity"
    puts arg    
    time = Time.new
    oppDateTime = time.day.to_s + time.month.to_s + time.year.to_s + time.hour.to_s + time.min.to_s + time.sec.to_s
    year = time.year.to_i + 2

    click_on "New"
    sleep 5
    puts "Creating a new opportunity"

    $RenAutomationSO = arg["SourceOppName"] + oppDateTime.to_s

    $earliestExpirationDate = "12/30/" + year.to_s
    $oPPCloseDate = "12/31/" + year.to_s

    fill_in "Opportunity Name",:with=> $RenAutomationSO
    sleep 1
    fill_in "Close Date",:with=> $oPPCloseDate
    sleep 1
    fill_in "Earliest Expiration Date",:with=> $earliestExpirationDate
    sleep 1
    select arg["SourceOppStage"], :from => "Stage"
    sleep 1
    fill_in "Account Name",:with=>arg["Account"]
    sleep 1

    within(:id,"bottomButtonRow") do
      click_on "Save"
    end

    puts "Successfully Created Source Opportunity #{$RenAutomationSO}"

  rescue Exception => ex
    raise "Error occurred while creating new source opportunity #{$RenAutomationSO}"
    putstr_withScreen  ex.message
  end
end

And(/^I select "([^"]*)" pricebook$/) do |priceBookName|
  begin
    sleep 5
    click_on "Choose Price Book"
    sleep 5
    first(:option, priceBookName).select_option
    sleep 2
    click_on "Save"
    sleep 5
  rescue Exception => ex
    raise "Error occurred while selecting pricebook #{priceBookName}"
    putstr_withScreen  ex.message
  end
end

And(/^I Add "([^"]*)" Products having product name as "([^"]*)" to Opportunity$/) do |totalProducts,productName|
  begin
    sleep 5
    arg = getReference "SourceOpportunity"
    time = Time.new

    $startDateOLI = time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s
    $endDateOLI = time.month.to_s + "/" + time.day.to_s + "/" + (time.year.to_i + 1).to_s
  
    click_on "Add Product"
    
    within(:id,'field_name_PricebookEntry')do
      searchField = find(:id, 'search')
      searchField.send_keys(productName)    
      puts "add search criteria"
    end
    first(:option, 'Active (Product)').select_option
    sleep 1
    first(:option, 'equals').select_option
    sleep 1
    find(:xpath, '//span[contains(text(),"By Field Filter")]/following-sibling::div/div/input').set 'Active'
    sleep 1
    find(:xpath, '//input[contains(@id,"save_filter_PricebookEntry")]').click
    sleep 5
    
    i = 1
    while i <= totalProducts.to_i do
      puts i.to_s 
      find(:xpath, "//div[contains(@class,'x-grid3-body')]/div[#{i}]/table/tbody/tr/td[1]/div/input").set(true)
      i = i + 1
      sleep 2
    end
    click_on 'Select'
    puts "Successfully select the product"    
    sleep 5
    
    #Enter product Quantity
    pos = 1
    $nums = Array.new(totalProducts.to_i)
    for i in 2..totalProducts.to_i + 1
      $nums[i] = 4 +  pos.to_i
      pos = $nums[i].to_i
      find(:xpath,"//*[@id='editPage']/table/tbody/tr[#{$nums[i]}]/td[3]/input").set arg["ProductQuantity"]
      find(:xpath,"//*[@id='editPage']/table/tbody/tr[#{$nums[i]}]/td[4]/span/input").set $startDateOLI
      find(:xpath,"//*[@id='editPage']/table/tbody/tr[#{$nums[i]}]/td[5]/span/input").set $endDateOLI
      find(:xpath,"//*[@id='editPage']/table/tbody/tr[#{$nums[i]}]/td[6]/input").set arg["ProductSalesPrice"]
    end
    
    all(:xpath,'//td/input[@value=" Save "]')[0].click
    sleep 5
    $productsTitle = Array.new(totalProducts.to_i)
    i= 0
    for i in 0..totalProducts.to_i - 1
     within(".opportunityLineItemBlock") do
      within(".list") do        
        $productsTitle[i] = all(".dataRow")[i].all("th")[0].first("a").text
        puts $productsTitle[i]
        sleep 3
      end
     end
    end    
  rescue Exception => ex
    raise "Error occurred while adding products to source opp"
    putstr_withScreen  ex.message
  end
end

And(/^I Renew Source Opportunity$/) do
  begin
    sleep 5
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    puts 'Editing the status'
    sleep 5
    first(:option,'Closed Won').select_option
    sleep 2
    first(:button,'Save').click
    sleep 10
    puts 'Editing the status to Closed Won'
    find(:xpath, "//th[text()='Contributed To']").find(:xpath, '..').find(:xpath, "following-sibling::tr/td[2]/a").click
    sleep 10

    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    sleep 5
    $RenAutomationRO = $RenAutomationSO + "RO"
    fill_in "Opportunity Name",:with=> $RenAutomationRO
    sleep 1
    first(:button,'Save').click
    sleep 10
  rescue Exception => ex
    raise "Error occurred while renewing opportunity"
    putstr_withScreen  ex.message
  end
end

And(/^I select the partner accounts from the accounts lookup list for Two Tire$/) do
  begin
    arg = getDetails "TwoTier"
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
    if page.has_css?(".lookupIcon")
      #puts "Successfully see the #{arg["PartnerAccount1ContactFieldName"]} and #{arg["PartnerAccount2ContactFieldName"]} lookup Icons"
      puts "Successfully see the ContactField lookup Icons"
      sleep 2
      main = page.driver.browser.window_handles.first
      sleep 3
      find("img[alt='Partner Account 1 Contact Lookup (New Window)']").click
      sleep 8
      page.driver.browser.manage.window.maximize
      sleep 3
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      sleep 5
      page.driver.browser.switch_to.frame("resultsFrame")
      sleep 3
      within('.list') do
        click_link arg2["DistributorContact"]
      end
      sleep 5
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
      sleep 3
      #puts "Successfully Selected the #{arg["PartnerAccount1ContactFieldName"]} from #{arg["PartnerOpportunityName"]} page"
      puts "Successfully Selected the first contact"
      sleep 8
      main = page.driver.browser.window_handles.first
      sleep 3
      find("img[alt='Partner Account 2 Contact Lookup (New Window)']").click
      sleep 8
      page.driver.browser.manage.window.maximize
      sleep 3
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      sleep 5
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.list') do
        click_on arg2["ResellerContact"]
      end
      sleep 5
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
      sleep 5
      puts "Successfully Selected the second contact"
    else
      putstr "Failed to see the #{arg["PartnerAccount1ContactFieldName"]} and #{arg["PartnerAccount2ContactFieldName"]} lookup Icons"
    end
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
      puts "For Reseller Distributor checkbox not checked: "
      puts distCheckBox
    else
      distCheckBox = has_xpath?(".//tr/td[contains(text(),'Distributor Quote')]//following-sibling::td/div/img[@alt = 'Checked']")
      puts "For Distributor checkbox checked: "
      puts distCheckBox
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
    find("#bottomButtonRow").click
    sleep 3
    within ("#bottomButtonRow") do
      first(:xpath, "//*[contains(@title, 'Create Distributor Quote')]").click
      puts "Created distributor quote successfully"
      sleep 5
    end
    if $currentBrowser == 'chrome'
      alert_message = page.driver.browser.switch_to.alert.text
      puts alert_message
      sleep 5
      if alert_message == "Distributor Quote Created Successfully."
        puts "in if block"
        page.driver.browser.switch_to.alert.accept
        puts "Distributor Quote Created Successfully."
      else
        page.driver.browser.switch_to.alert.deny
        putstr "Did not created"
      end
    else
      binding.pry
    end  
    sleep 5
  # rescue Exception => ex
    # putstr "Error occurred while creating distributor quote"
    # putstr_withScreen  ex.message
   end  
end


And(/^I check checkbox status for reseller and distributor quotes$/) do
  begin
    sleep 5
    TTResellerStatus = has_xpath?(".//tr/td/a[contains(text(),'TTReseller Quote')]//parent::td//parent::tr/td[8]/img[@alt = 'Not Checked']")    
    puts "TTResellerStatus: "
    puts TTResellerStatus
    if TTResellerStatus == true
      puts "Checkbox is not checked for Reseller quote"
    else 
      puts "Checkbox is checked for Reseller quote"
    end
    TTDistributorStatus = has_xpath?(".//tr/td/a[contains(text(),'TTDistributor Quote')]//parent::td//parent::tr/td[8]/img[@alt = 'Checked']")
    puts "TTDistributorStatus:"
    puts TTDistributorStatus
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
