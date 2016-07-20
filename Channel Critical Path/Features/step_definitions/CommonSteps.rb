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
    sleep 5
    arg = getCredentialInfo
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
    sleep 3
    #within all(".pbButton ")[1] do
    click_on button_text
    puts "Successfully clicked #{button_text}"
    sleep 5
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
    oppName = arg["PartnerOpportunityName"].to_s
    oppInitial = oppName[0]
    click_on oppInitial
    #find(:xpath, '//a/span[text()="#{oppInitial}"]').click
    sleep 5
    all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|

      if activity.text.to_s == arg["PartnerOpportunityName"].to_s
        puts "Successfully match the Opportunity name"
        activity.click
        puts "Successfully opened the #{arg["PartnerOpportunityName"]} Opportunity"
      result = true
      break
      end
    end
    putstr "Unable to find the #{arg["PartnerOpportunityName"]} Opportunity" unless result
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while clicking on existing #{arg["PartnerOpportunityName"]} Opportunity page"
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
    arg = getCredentialInfo
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

    within(:id,"topButtonRow") do
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
    find(:xpath, "(//input[@type='checkbox'])[2]").set(true)
    find(:xpath, "(//input[@type='checkbox'])[3]").set(true)
    find(:xpath, "(//input[@type='checkbox'])[4]").set(true)
    find(:xpath, "(//input[@type='checkbox'])[5]").set(true)
    # find(:xpath, "(//input[@type='checkbox'])[6]").set(true)
    # find(:xpath, "(//input[@type='checkbox'])[7]").set(true)
    # find(:xpath, "(//input[@type='checkbox'])[8]").set(true)
    # find(:xpath, "(//input[@type='checkbox'])[9]").set(true)
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
    
    #Resolve Opportunity
    first(:button,'Edit').click
    sleep 5
    first(:option,'Closed Won').select_option
    sleep 2
    first(:button,'Save').click
    sleep 8
    
    find(:xpath, "//th[text()='Contributed To']").find(:xpath, '..').find(:xpath, "following-sibling::tr/td[2]/a").click
    sleep 8


    first(:button,'Edit').click
    sleep 5
    fill_in "Opportunity Name",:with=>$automationOppName
    sleep 1
    first(:button,'Save').click
    sleep 8
  rescue Exception => ex
    puts "Error occurred while creating Opportunities"
    puts ex.message
  end
end