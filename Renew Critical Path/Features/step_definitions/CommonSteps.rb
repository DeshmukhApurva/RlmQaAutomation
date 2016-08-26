#All Common Step Definitions which are common across modules
#All scenarios mentioned in all features
require 'Win32API'
require 'pry'

Given(/^that I navigate to the CRM application$/) do
  begin
    $userRole = ENV['UserRole']
    puts $userRole
    setCursorPos = Win32API.new("user32", "SetCursorPos", ['I','I'], 'V')
    setCursorPos.Call(500,10)
    visit env
    puts "Login as " + ENV['UserRole']
    arg = getCredentialInfo
    fill_in "username",:with => arg["userName"]
    fill_in "Password",:with => arg["pwd"]
    puts "Entered Credentials"
    find(:id,"Login").click
    page.driver.browser.manage.window.maximize
    # find(:id,"tsidButton").click
    # begin
    # click_on "ServiceSource Cloud Apps"
    # rescue Exception => ex
    # puts "Already in ServiceSource Cloud Apps"
    # end
    sleep 10
  rescue Exception => ex
    puts "Error  while entering credentials"
    puts ex.message
  end
end

#newly added
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

#admin login
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

      find("input[name='pw']").send_keys arg["pwd"]
      puts "Entered Credentials"
      sleep 4
      click_on 'Log In'
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

#newly added end

Then(/^I should land on CRM home page$/) do
  begin
    sleep 5

    if page.has_content? "Accounts"
      puts "User Logged in Successfully"
    else
      raise "Login Failed"
    end
  rescue Exception => ex
    putstr "Error  occurred while login"
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
    puts "Error  occurred during Logout"
    puts ex.message
  end
end

And(/^I maximize the page$/) do
  begin
    page.driver.browser.manage.window.maximize
    sleep 5
    page.driver.browser.manage.window.maximize
    sleep 5
  end
end

Then(/^I create new Account$/) do
  begin
    arg=getDetails "Account"
    click_on "New"
    sleep 5
    puts "Creating a new Account"
    arg.each do |key,val|
      fill_in key,:with => val
      puts "Filled value for " + key + " column"
      sleep 1
    end
    find("option[value='Healthy']").click

    sleep 1
    within(:id,"topButtonRow") do
      click_on "Save"
    end

    puts "Account  successfully created"
  rescue Exception => ex
    puts "Error occurred while creating Account"
    puts ex.message
  end
end

Then (/^I delete an Account$/) do
  begin
    select "My Accounts", :from => "fcf"
    sleep 5
    within(".fBody") do
      click_on "Go!"
    end
    sleep 5
    arg = getDetails "Account"
    within(".x-grid3-body") do
      rows = all(".x-grid3-row")
      rows.each do |row|
        if row.all("td")[2].text==arg["Account Name"]
          page.accept_confirm { row.first(:link,"Del").click }
          break
        end
      end
      sleep 5
      puts "Account <b>#{arg['Account Name']}</b> Deleted"
    end
  rescue Exception => ex
    putstr "Error occurred while deleting a Account"
    putstr_withScreen  ex.message
  end
end

Then(/^I access contacts and create a new contact$/) do

  begin
    arg=getContactInfo
    click_link('Contacts')
    sleep 5
    click_on "New"
    sleep 5
    puts "Creating a new Contact"
    arg.each do |key,val|
      fill_in key,:with => val
      puts "Filled value for " + key + " column"
      #sleep 1
    end
    sleep 1
    within(:id,"topButtonRow") do
      click_on "Save"
    end
    puts "Contact successfully created"
  rescue Exception => ex
    puts "Error occurred while creating contact"
    puts ex.message
  end
end
Then(/^I access Opportunity and create a new opportunity$/) do

  begin
    arg=getOpportunityInfo
    click_link('Opportunities')
    sleep 5
    click_on "New"
    sleep 5
    puts "Creating a new opportunity"
    arg.each do |key,val|
      fill_in key,:with => val
      puts "Filled value for " + key + " column"
      #sleep 1
    end
    select "Qualification", :from => "Stage"
    sleep 1
    within(:id,"topButtonRow") do
      click_on "Save"
    end

    puts "Successfully created Opportunity"
  rescue Exception => ex
    puts "Error occurred while creating Opportunities"
    puts ex.message
  end
end

And(/^I click on the Go button if present$/) do
  begin
    if page.has_xpath?('//input[@name="go"]')
      first(:button, "Go").click
    end
  end
end

And(/^I select Created Today view$/) do
  begin
    select "Created Today", :from => "fcf"
  end
end

And(/^I select OppToOpp view$/) do
  begin
    select "OppToOpp", :from => "fcf"
  end
end

And(/^I select SCOpp view$/) do
  begin
    select "SCOpp", :from => "fcf"
  end
end

Then(/^I view Opportunities$/) do
  begin
    arg=getOpportunityInfo
    click_link('Opportunities')
    sleep 5
    within(".list") do
      first(:link, arg["Opportunity Name"]).click
    end
    sleep 1
    within(:id,"topButtonRow") do
      click_on "Edit"
    end
    puts "Opening Opportunity to verify"
    arg.each do |key,val|
      page.should have_field(key, with: val)
      puts "verified " + key + ":" + val
      sleep 1
    end
    puts "Verified Opportunity successfully"
  rescue Exception  => ex
    puts "Error occurred while verifying account"
    puts ex.message
  end
end

Then(/^I access ServiceSource Setup and create a new ServiceSource Setup$/) do

  begin
    arg=getPlayBookInfo
    click_link('ServiceSource Setup')
    sleep 5
    click_link('Playbooks')
    puts "clicked successfully"
    sleep 5
    click_on "New"
    puts "Creating a new Playbook"
    sleep 5
    arg.each do |key,val|
      fill_in key,:with => val
      puts "Filled value for " + key + " column"
      sleep 1
    end
    select "Qualification", :from => "Stage"
    sleep 1
    within(:id,"topButtonRow") do
      click_on "Save"
    end
    puts "Successfully created Playbook"
  rescue Exception => ex
    puts "Error occurred while creating Playbook"
    puts ex.message
  end
end

Then(/^I edit Account$/) do
  begin
    arg=getDetails "Account"
    click_link('Accounts')
    sleep 5
    within(".list") do
      first(:link, arg["Account Name"]).click
    end
    sleep 1
    within(:id,"topButtonRow") do
      click_on "Edit"
    end
    puts "Opening account to verify"
    arg.each do |key,val|
      page.should have_field(key, with: val)
      puts "verified " + key + ":" + val
      sleep 1
    end
    puts "verified Account successfully"
  rescue Exception  => ex
    puts "Error occurred while verifying account"
    puts ex.message
  end
end

Then(/^I view Account$/) do
  begin
    sleep 5
    select "My Accounts", :from => "fcf"
    sleep 5
    if all(".fBody").count > 0
      within(".fBody") do
        click_on "Go!"
      end
    else
      all(".btn",:text => "Go!").last.click
    end
    sleep 5
    arg = getDetails "Account"
    foundCount = ""
    begin
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          if row.all("td")[2].text==arg["Account Name"]
            row.first(:link,arg["Account Name"]).click
            foundCount = "First record found with match " + arg["Account Name"] + " opened"
            break
          end
        end
      end
      if page.has_css?('.next')
        find(".next").click
        sleep 5
      else
        break
      end
    end until (page.has_css?('.nextoff'))
    if foundCount==""
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          if row.all("td")[2].text==arg["Account Name"]
            row.first(:link,arg["Account Name"]).click
            foundCount = "First record found with match " + arg["Account Name"] + " opened"
            break
          end
        end
      end
    end
    sleep 5
    puts "Opened Account successfully. "+foundCount
  rescue Exception  => ex
    puts "Error occurred while verifying account"
    puts ex.message
  end
end

Then(/^I view Contact$/) do
  begin
    arg=getContactInfo
    click_link('Contacts')
    sleep 5
    within(".list") do
      first(:link, arg["Last Name"]+", "+arg["First Name"]).click
    end
    sleep 1
    within(:id,"topButtonRow") do
      click_on "Edit"
    end
    puts "Opening contact to verify"
    arg.each do |key,val|
      page.should have_field(key, with: val)
      puts "verified " + key + ":" + val
      #sleep 1
    end
    puts "Contact details verified successfully"
  rescue Exception => ex
    puts "Error occurred while verifying contact"
    puts ex.message
  end
end

And /^I create a new Account$/ do
  begin
    click_link('Accounts')
    click_on "New"
    time1 = Time.new
    puts time1.inspect
    #fill_in Account Name,:with => 'test'
    fill_in('Account Name', :with => 'ABC')
    fill_in('Last Health Status', :with => time1.inspect)
    find("option[value='Healthy']").click
    within(:id,"topButtonRow") do
      click_on "Save"
    end
    sleep 10
  rescue Exception => ex
    puts ex.message
  end
end

When(/^I Navigate to (.*?) tab$/) do |arg1|
  sleep 10
  first(:link, arg1).click
  sleep 5
  puts "Navigated to " + arg1 + " tab"
end

When(/^I click on "(.*?)" link$/) do |arg1|
  begin
    first(:link, arg1).click
    sleep 10
    puts "Navigated to " + arg1 + " tab"
  rescue Exception => ex
    puts "Error while navigating to #{arg1}"
    putstr_withScreen  ex.message
  end
end

And (/^I switch to new tab$/) do
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  sleep 10
end

And (/^I switch back to first tab$/)do
  page.driver.browser.close
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
  sleep 10
end

Then(/^I should be able to see help page$/) do
  sleep 15
  puts first("h1").text
  puts "Help page displayed"
end

And (/^I Verify hamburger icon$/) do
  begin
    find('.custom-btn-circle').click
    sleep 5
  rescue Exception => ex
    puts "Hamburger icon not present"
  end
end

Then (/^I should see the hamburger icon$/) do
  arg = getDetails("HamburgerMenu")
  i = 0
  listMenu = find('.dropdown-menu-right')
  liText = listMenu.all('li')
  liText.each do | liItem |
    if liItem.text == arg[i]
      puts "Item " + liItem.text + " present"
    end
    i=i+1
  end
  puts "Hamburger icon displayed"
  liText[0].click
  find(:xpath, "//*[contains(@id, 'selectObjectType')]").select("Account")
  find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select("Account Owner")
  find(:xpath, "//*[contains(@id, 'chboxSaveAsDefaultValue')]").click
  find(".lookupIcon").click
  sleep 10
  within_window(page.driver.browser.window_handles.last) do
    within_frame "resultsFrame" do
      first(:link,"PES CSM User").click
    end
  end
  sleep 15
  puts page.body
  # first(:link,"CSM Automation").click
  sleep 5
  within_window(page.driver.browser.window_handles.last) do
    puts page.body
    click_on "Save"
  end
  sleep 15
end

And (/^I cancel creation of new SuccessPlan$/) do
  click_on "New"
  arg = getDetails "SuccessPlan"
  arg.each do |key,val|
    fill_in key,:with => val
  end
  all('.btn')[2].click
  sleep 5
  puts "Successfully cancelled creation of new Success Plan"
end

And (/^I open on first SuccessPlan$/) do
  within('.hotListElement') do
    all('a')[0].click
  end
  sleep 15
  click_link "Details"
  sleep 5
  click_link "New Opportunity"
  sleep 5
  arg=getOpportunityInfo
  sleep 5
  puts "Creating a new opportunity"
  arg.each do |key,val|
    fill_in key,:with => val
    puts "Filled value for " + key + " column"
    #sleep 1
  end
  select "Qualification", :from => "Stage"
  sleep 1
  within(:id,"topButtonRow") do
    click_on "Save"
  end
  puts "Successfully created Opportunity"
end

And (/^I verify edit link of focus category$/) do
  sleep 10
  sleep 5
  arg1 =  getReference ("Reference")

  if all(:link,arg1["Account"]).count > 0
    first(:link,arg1["Account"]).hover
    all(:link, "Edit").last.click
    sleep 5
    all(:link, "Cancel").last.click
    # click_on "Cancel"

  end

  puts "FC Edit Link Verified"
end

Then (/^I add new Playbook for SP$/) do
  begin
    click_link "Details"
    sleep 5
    click_link "Add Playbook"
    sleep 5
    arg1 =  getDetails ("PlayBookForSP")
    within('.list') do
      tr = first("tbody").all("tr")
      tr.each do |row|
        if row.all("td")[1].text == arg1["Display Name"]
          page.accept_confirm { row.all("td")[0].all('a')[0].click }
          sleep 5
          break
        end
      end
    end
    puts "Added Playbook Sucessfully"
    sleep 10
  rescue Exception =>ex
    putstr "Error while adding Playbook for Success Plan"
    putstr_withScreen  ex.message
  end
end

Then (/^I verify Play task created for SP$/) do
  begin
    click_link "Details"
    sleep 5
    arg = getDetails "PlayforSP"
    within all(:css,".pbSubsection")[2] do
      first('a').click
      puts "Selected the Associated Account"
    end
    sleep 5
    if page.has_content?("Account Detail")
      puts "Opened associated Account successfully for SuccessPlan"
    else
      raise "Error while Opening the associated Account for SuccessPlan"
    end
    sleep 5
    within all(:css,".taskBlock")[0] do
      @taskBefore = all(:css,"tr .dataRow").count
    end
    within(:id,"topButtonRow") do
      click_on "Edit"
    end
    sleep 5
    fill_in 'Annual Revenue', :with => arg["PlayCriteria"]
    within(:id,"topButtonRow") do
      click_on "Save"
    end
    sleep 5
    within all(:css,".taskBlock")[0] do
      @taskAfter = all(:css,"tr .dataRow").count
    end
    if @taskBefore!=@taskAfter
      puts "Play task is generated when PlayBook is added to SP which meets play criteria"
    else
      raise "Play task is not generated when PlayBook is added to SP which meets play criteria"
    end

  rescue Exception =>ex
    putstr "Error while verifying that Play task is generated when PlayBook is added to SP"
    putstr_withScreen  ex.message
  end

end

Then (/^I delete a Playbook for SP$/) do
  begin
    arg1 =  getDetails ("PlayBookForSP")
    if all(".pagination-info").count > 0
      @SPtaskBefore = find(".pagination-info").text.split("of").last.split("rows").last.to_i
    end
    sleep 5
    click_link "Details"
    sleep 5
    all(:css,".form-control")[0].set(arg1["Display Name"])
    within(:id,"playbookSPGrid") do
      first(:link, "Del").click
    end
    puts "Successfully deleted PlayBook"
    if page.has_content?('Success Plan Template Playbook has been deleted')
      puts "Success Plan Template PlayBook has been deleted message displayed"
      sleep 5
    else
      raise "Success Plan Template PlayBook has been deleted message not displayed"
    end
    click_link "Actions"
    sleep 5
    if all(".pagination-info").count > 0
      @SPtaskAfter = find(".pagination-info").text.split("of").last.split("rows").last.to_i
    end
    sleep 5
    if @SPtaskAfter == @SPtaskBefore
      puts "Verified that Play Task is not deleted after deleting PlayBook for Success Plan"
    else
      raise "Play Task is deleted after deleting PlayBook for Success Plan"
    end
  rescue Exception =>ex
    putstr "Error while deleting PlayBook for Success Plan"
    putstr_withScreen  ex.message
  end
end

And (/^I select Edit View$/) do
  listMenu = find('.dropdown-menu-right')
  liText = listMenu.all('li')
  liText[0].click
  find(:xpath, "//*[contains(@id, 'selectObjectType')]").select("Account")
  find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select("Last Health Status")
  sleep 5
  within('.pbBottomButtons') do
    click_on "Save"
  end
  sleep 10
  puts "Edit View Saved"
end

And (/^I click check icon$/) do
  sleep 10
  find(:xpath, "//*[contains(@id, 'selTasks')]").select("Risk")
  sleep 5
  within all('.bs')[0] do
    all('tbody')[0].all('tr')[0].find('.checkEnabled').click
  end
  sleep 50
end

And (/^I click choose icon$/) do
  sleep 10
  find(:xpath, "//*[contains(@id, 'selTasks')]").select("Task_Category")
  sleep 5
  within all('.bs')[0] do
    all('tbody')[0].all('tr')[0].find('.detailEnabled').click
  end
  sleep 5
  all(".iconContact-phone")[0].hover
  puts all(".iconContact-phone")[0].text
  all(".iconContact-phone")[0].hover
  sleep 50
  first(:link,"SP1").click

end

And (/^I select Show_Hide Charts and Tiles$/) do
  begin
    listMenu = find('.dropdown-menu-right')
    puts "Selecting " + listMenu.all('li')[1].text
    listMenu.all('li')[1].click
    sleep 2
  rescue Exception => ex
    puts "Unable to select Show_Hide Charts and Tiles"
  end
end

And (/^I Verify Chart and Tiles Visibility$/) do
  begin
    if(find('#HideShowDiv',:visible => false)['style'].should_not include('display:none', 'display: none'))
      puts "Chart and Tiles are not visible"
    else
      puts "Chart and Tiles are visible"
    end
  rescue Exception =>ex
    puts "Chart and Tiles are not visible"
  end
  sleep 5
end

When(/^I Navigate to "([^"]*)" tab$/) do |arg1|
  sleep 10
  first(:link, arg1).click
  sleep 2
  puts "Navigated to #{arg1} tab"
end

Then(/^I clicked on "(.*?)" link "(.*?)"$/) do |arg1,grid|
  # puts arg1
  # puts grid
  arg2 = getDetails grid
  param = getDetails grid+"Param"
  begin
    within all(".pbSubsection")[param['section']]do
      within(".detailList")do
        if first(:xpath,".//*[contains(@id,'addFilterLogicId')]").text == arg1
          first(:link, arg1).click
          sleep 10
          puts "Clicked on " + arg1 + " link"
        else
          first(:xpath,".//*[contains(@id,'addFilterLogicId')]").click
          sleep 10
          first(:link, arg1).click
          sleep 5
          puts "Clicked on " + arg1 + " link"
        end
      end
    end

    within all(".pbSubsection")[param['section']]do
      within(".detailList")do
        filter = first(:xpath,".//*[contains(@id,'addFilterLogicId')]").text
        puts filter
      end
    end
  rescue Exception => ex
    putstr_withScreen  ex.message
  end
end

Then(/^I Specify the conditions for "(.*?)" in "(.*?)"$/) do |grid,screen|
  arg = getDetails grid+"Criteria"
  begin
    if (grid == "OppFields")

      puts "Setting Criteria for Opportunity section fields"

      all(".dataRow")[0].all(".dataCell")[2].select(arg["Fieldvalue2"])
      sleep 8
      all(".dataRow")[0].all(".dataCell")[3].select(arg["Operator2"])
      sleep 10
      all(".dataRow")[0].all(".dataCell")[4].first("input").set(arg["Value2"])
      sleep 5

      all(".dataRow")[1].all(".dataCell")[2].select(arg["Fieldvalue1"])
      sleep 8
      all(".dataRow")[1].all(".dataCell")[3].select(arg["Operator1"])
      sleep 10
      all(".dataRow")[1].all(".dataCell")[4].first("input").set(arg["Value1"])
      sleep 5

      all(".dataRow")[2].all(".dataCell")[2].select(arg["Fieldvalue3"])
      sleep 8
      all(".dataRow")[2].all(".dataCell")[3].select(arg["Operator3"])
      sleep 10
      all(".dataRow")[2].all(".dataCell")[4].first("input").set((arg["Value3"]))
      sleep 5

    elsif (grid == "ProductFields")

      puts "Setting criteria for Renewable Product section fields"

      all(".dataRow")[3].all(".dataCell")[2].select(arg["Fieldvalue2"])
      sleep 8
      all(".dataRow")[3].all(".dataCell")[3].select(arg["Operator2"])
      sleep 10
      all(".dataRow")[3].all(".dataCell")[4].first("input").set((arg["Value2"]))
      sleep 5

      all(".dataRow")[4].all(".dataCell")[2].select(arg["Fieldvalue3"])
      sleep 8
      all(".dataRow")[4].all(".dataCell")[3].select(arg["Operator3"])
      sleep 10
      all(".dataRow")[4].all(".dataCell")[4].first("input").set((arg["Value3"]))
      sleep 5

      all(".dataRow")[5].all(".dataCell")[2].select(arg["Fieldvalue4"])
      sleep 8
      all(".dataRow")[5].all(".dataCell")[3].select(arg["Operator4"])
      sleep 10
      all(".dataRow")[5].all(".dataCell")[4].first("input").set((arg["Value4"]))
      sleep 5
    end

    within(:css ,".pbButton") do
      click_on "Save"
    end

    if screen == "OpportunityGeneration"
      screen = "Renewal Opportunity"
    end

    if page.has_content?("#{screen} configuration has been saved.")
      puts "#{screen} configuration has been saved message is displayed"
    else
      putstr "#{screen} configuration has been saved message is not displayed"
    end
  rescue Exception => ex
    puts "Error while setting criteria for #{screen}"
    putstr_withScreen  ex.message
  end
end

Then (/^I Specify the conditions for generation of renewal opportunities$/) do
  begin
    all(".dataRow")[0].all(".dataCell")[2].select("Name")
    sleep 8
    all(".dataRow")[0].all(".dataCell")[3].select("LIKE")
    sleep 10
    all(".dataRow")[0].all(".dataCell")[4].first("input").set("Sourceopp")
    sleep 5

    within(:css ,".pbButton") do
      click_on "Save"
    end
  rescue Exception => ex
    puts "Error in setting criteria"
    putstr_withScreen  ex.message
  end
end

Then(/^I clicked on "(.*?)" link$/) do |arg1|
  first(:link, arg1).click
  sleep 10
  puts "Clicked on " + arg1 + " link"
end

Then (/^I edit "(.*?)" filter Logic for "(.*?)"$/) do |grid,screen|
  puts screen
  puts grid
  param = getDetails grid+"Param"
  begin
    within all(".pbSubsection")[param["section"]] do
      first(:xpath,".//*[contains(@id,'bool_filter')]").first("input").set("1 OR 2 OR 3")
    end
    within(:css ,".pbButton") do
      click_on "Save"
    end
    if page.has_content?("#{screen} configuration has been saved.")
      puts "#{screen} configuration is set and saved."
    else
      putstr "#{screen} configuration is set and not saved."
    end
  rescue Exception => ex
    puts "Error while editing filter logic for #{screen}"
    putstr_withScreen  ex.message
  end
end

Then (/^I select a Source Opportunity$/) do
  begin
    sleep 5
    arg = getDetails "Sourceopp"
    select "My Opportunities", :from => "fcf"
    sleep 5
    within(".fBody") do
      click_on "Go!"
    end
    sleep 5
    foundCount = ""
    begin
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          if row.all("td")[2].text==arg["Name"]
            row.all("td")[2].all('a')[0].click
            foundCount = "found"
            break
          end
        end
      end
      if page.has_css?('.next')
        find(".next").click
        sleep 5
      else
        break
      end
    end until (page.has_css?('.nextoff'))
    if foundCount==""
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          if row.all("td")[2].text==arg["Name"]
            row.all("td")[2].all('a')[0].click_on
            foundCount = "found"
            break
          end
        end
      end
    end
    sleep 5
  rescue Exception => ex
    puts "Error in Selecting the source opportunity"
    putstr_withScreen  ex.message
  end
end

Then (/^I enter the wrong details for the criteria$/) do
  arg = getDetails "Wrongdetails"
  arg1 = getDetails "OppFieldsCriteria"
  begin
    all(".dataRow")[2].all(".dataCell")[2].select(arg["Fieldvalue1"])
    sleep 8
    all(".dataRow")[2].all(".dataCell")[3].select(arg["Operator1"])
    sleep 10
    all(".dataRow")[2].all(".dataCell")[4].first("input").set((arg["Value1"]))
    sleep 5

    within(:css ,".pbButton") do
      click_on "Save"
    end

    if page.has_content?"Value must be populated for Quantity"
      puts "User is able to see the error message"
    else
      putstr "User is unable to see the error message"
    end

    within all(".pbSubsection")[0] do
      first(:xpath,"//*[contains(@id,'bool_filter')]").first("input").set("1 OR 2 3")
    end

    within(:css ,".pbButton") do
      click_on "Save"
    end

    if page.has_content?"Some filter conditions are defined but not referenced in your filter logic."
      puts "User is able to see the error message of filter criteria"
    else
      putstr "User is unable to see the error message of filter criteria"
    end

    all(".dataRow")[2].all(".dataCell")[2].select(arg1["Fieldvalue3"])
    sleep 8
    all(".dataRow")[2].all(".dataCell")[3].select(arg1["Operator3"])
    sleep 10
    all(".dataRow")[2].all(".dataCell")[4].first("input").set((arg1["Value3"]))
    sleep 5

    within all(".pbSubsection")[0] do
      first(:xpath,"//*[contains(@id,'bool_filter')]").first("input").set("1 OR 2 OR 3")
    end

    within(:css ,".pbButton") do
      click_on "Save"
    end

    if page.has_content?("Renewal Opportunity configuration has been saved.")
      puts "Renewal Opportunity configuration criteria is set and saved"
    else
      putstr "Renewal Opportunity configuration criteria is not saved and set"
    end
  rescue Exception => ex
    puts "Error while setting incorrect criteria"
    putstr_withScreen  ex.message
  end
end

Then (/^I Match the source opp criteria with "(.*?)" criteria$/) do |grid|
  puts grid
  arg1 = getDetails grid
  param = getDetails grid+"Criteria"
  begin
    within(:id ,"topButtonRow") do
      click_on "Edit"
    end
    sleep 5
    select param["Value1"] ,:from => "opp11"
    within(:id ,"topButtonRow") do
      click_on "Save"
    end
    sleep 5
  rescue Exception => ex
    puts "Error in Matching the source opp criteria with the renewal opp generation criteria"
    putstr_withScreen  ex.message
  end
end

Then (/^I fetch the dropdown selected values$/) do
  begin
    putstr all(".dataRow")[0].find('option[selected]').text
  rescue Exception => ex
    putstr_withScreen  ex.message
  end
end

And(/^I verify the Data Types of "(.*?)"$/) do |item|
  arg = getDetails item
  param = getDetails item+"Param"

  begin
    within all(".pbSubsection")[param["section"]] do
      within('.detailList') do

        LOV = all(:xpath, ".//*[contains(@id, 'slFieldId')]")[param["rowNum"]].all('option').collect(&:text)
        #LOV = all(:xpath, "//*[contains(@id, 'slFieldId')]")[param["rowNum"]].all('option').collect(&:text)
        #LOV = all(".dataRow")[0].all(".dataCell")[2].first("select").all('option').collect(&:text)
        puts "Dropdown values : #{LOV}"
        arg.each do |key,value|
          k = key
          v = value
          if LOV.include? v
            puts "#{k} : #{v} is present in Picklist values"
          else
            putstr "#{k} : #{v} does not exist in Picklist values"
          end
        end
      end
    end
  rescue Exception => ex
    puts "Error while verifying the Data Types for - #{item}"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the list of Operators for "(.*?)"$/) do |item|
  arg = getDetails item
  param = getDetails item+"Param"
  operator = getDetails "Operators"
  begin
    within all(".pbSubsection")[param["section"]] do
      within('.detailList') do
        arg.each do |key,value|
          k = key
          v = value
          operators = Array.new
          operators = operator[k].split(",")
          puts operators
          all(".dataRow")[0].all(".dataCell")[2].select(v)
          puts "#{v} is selected"
          sleep 5
          operators.each do |ele|
            all(".dataRow")[0].all(".dataCell")[3].select(ele)
            sleep 5
            # puts "#{arg[v]} operator : #{ele}"
          end
        end
      end
    end
  rescue Exception => ex
    puts "Error while verifying the list of Operators - #{item}"
    putstr_withScreen  ex.message
  end
end

# And(/^I select all the "(.*?)"$/) do |item|
# begin
# param = getDetails item+"Param"
# i=0
# LOVcount = 0
# within all(".pbSubsection")[param["section"]] do
# within('.detailList') do
# LOV = all(:xpath, ".//*[contains(@id, 'slFieldId')]")[param["rowNum"]].all('option').collect(&:text)
# LOVcount = LOV.size
# puts "Picklist values : #{LOV}"

# LOV.each do |value|
# all(".dataRow")[0].all(".dataCell")[2].select(value)
# sleep 5
# i+=1
# end
# end
# end
# if i == LOVcount
# puts "All values are selected"
# else
# puts "Unable to select all values"
# end
# rescue Exception => ex
# puts "Error while Selecting the #{item}"
# putstr_withScreen  ex.message
# end
# end

And(/^I select all the "(.*?)"$/) do |item|
  begin
    param = getDetails item+"Param"
    rowNum = 0
    i=0
    LOVcount = 0
    within all(".pbSubsection")[param["section"]] do
      within(".detailList") do
        within(".list") do
          rowNum = first("tbody").all("tr").count
        end
        click_on "Add Criteria"
        sleep 5
        LOV = all(:xpath, ".//*[contains(@id, 'slFieldId')]")[rowNum].all('option').collect(&:text)
        LOVcount = LOV.size
        puts "Dropdown values : #{LOV}"
        LOV.each do |value|
          all(".dataRow")[rowNum].all(".dataCell")[2].select(value)
          sleep 3
          i+=1
        end
      end
    end
    if i == LOVcount
      puts "All #{item} are selected"
    else
      puts "Unable to #{item}"
    end
  rescue Exception => ex
    puts "Error while Selecting the #{item}"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the Data Types and list of Operators for "(.*?)"$/) do |item|
  begin
    arg = getDetails item
    param = getDetails item+"Param"
    operator = getDetails "Operators"
    rowNum = 0

    within all(".pbSubsection")[param["section"]] do
      within(".detailList") do
        within(".list") do
          rowNum = first("tbody").all("tr").count
        end
        click_on "Add Criteria"
        sleep 8
        lov = all(:xpath, ".//*[contains(@id, 'slFieldId')]")[rowNum].all('option').collect(&:text)
        puts "Dropdown values : #{lov}"
        arg.each do |key,value|
          k = key
          v = value
          if lov.include? v
            puts "#{k} : #{v} is present in Picklist values"
          else
            putstr "#{k} : #{v} does not exist in Picklist values"
          end
          operators = Array.new
          operators = operator[k].split(",")

          all(".dataRow")[rowNum].all(".dataCell")[2].select(v)
          sleep 10
          listofoperators = all(:xpath, ".//*[contains(@id, 'outOperator')]")[rowNum].all('option').collect(&:text)

          if operators.to_s.gsub!(/\s+/, "") == listofoperators.to_s.gsub!(/\s+/, "")
            puts "For #{v} selected : #{listofoperators} are the list of operators"
          else
            putstr "#{listofoperators} are not available for #{v}"
          end
        end
        within(".list") do
          first("tbody").all("tr")[rowNum].first(:link,"Delete").click
          sleep 4
        end
      end
    end
  rescue Exception => ex
    puts "Error while verifying the data types and its list of operators for #{item}"
    putstr_withScreen  ex.message
  end
end

And(/^I enable "(.*?)" checkbox$/) do |labeltext|
  # within all(".detailList")[0] do
  # row.all('input[type=checkbox]').each do |checkbox |
  # unless checkbox.checked?
  # checkbox.click
  # puts "#{arg["Asset1"]} is selected"
  # break
  # else
  # putstr "#{arg["Asset1"]} is not selected"
  # end
  # end
  # foundCount = "found"
  # break
  # end
  sleep 4
  find_field("#{labeltext}").set(true)
  puts "#{labeltext} is enabled"
  sleep 4
end

And(/^I disable "(.*?)" checkbox$/) do |labeltext|
  sleep 4
  find_field("#{labeltext}").set(false)
  puts "#{labeltext} is disabled"
  sleep 4
end

Then(/^I Clear the conditions specified for "(.*?)"$/) do |ren|
  begin
    arg2 = getDetails ren
    initialRowCount = 0
    within all(".pbSubsection")[arg2["section"]] do
      initialRowCount = all(:link,"Delete").count
    end
    within all(".pbSubsection")[arg2["section"]] do
      first(:link, "Delete").click
      sleep 5
    end
    finalRowCount = 0
    within all(".pbSubsection")[arg2["section"]] do
      finalRowCount = all(:link,"Delete").count
    end
    if initialRowCount > finalRowCount
      puts "Opportunity criteria row is getting removed"
    end
  rescue Exception => ex
    putstr_withScreen  ex.message
  end
end

And(/^I click on "([^"]*)" button$/) do |button_text|
  begin
    click_on button_text
    sleep 8
    puts "Successfully click the #{button_text} button"
  rescue Exception => ex
    putstr "Error occurred while clicking on #{button_text} button"
    putstr_withScreen  ex.message
  end
end

# Then(/^I clicked on "(.*?)" link$/) do |arg1|
#   first(:link, arg1).click
#   sleep 10
#   puts "Clicked on " + arg1 + " link"
# end

And (/^I save the Mapping$/) do
  begin
    sleep 5
    #Bottom Save button click
    first(".pbButtonb").first(".btn").click
    sleep 10
    puts "Saved Mapping"
  rescue Exception => ex
    putstr "Error occurred while saving Mapping."
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the "([^"]*)" alert message$/) do |alert_message|
  begin
    sleep 5
    if page.driver.browser.switch_to.alert.text.to_s == alert_message.to_s
      puts "Successfully see the #{alert_message} alert message"
      page.driver.browser.switch_to.alert.accept
    else
      putstr "Failed to see the #{alert_message} alert message"
      page.driver.browser.switch_to.alert.accept
    end
  rescue Exception => ex
    putstr "Error occurred while validating #{alert_message} alert message"
    putstr_withScreen  ex.message
  end
end

And(/^I Create New Source Opportunity$/) do
  begin
    sleep 5
    arg = getReference "SourceOpportunity"

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
    sleep 10
    $sourceOppURL = URI.parse(current_url)
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
    #
    # click_on 'save_filter_PricebookEntry'
    # puts "click on search"
    # sleep 5
    first(:option, 'Active (Product)').select_option
    sleep 1
    first(:option, 'equals').select_option
    sleep 1
    find(:xpath, '//span[contains(text(),"By Field Filter")]/following-sibling::div/div/input').set 'True'
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

And(/^I delete SourceOppRenewalOppSourceObject record$/) do
  begin
    deleteOppRenOppSourceObj($RenAutomationSO, $RenAutomationRO)
    sleep 5
  rescue Exception => ex
    raise "Error occurred while renewing opportunity"
    putstr_withScreen  ex.message
  end
end

And(/^I Renew Source Opportunity$/) do
  begin
    sleep 5
    within("#bottomButtonRow") do
      click_on 'Edit'
    end

    sleep 5
    first(:option,'Closed Won').select_option
    sleep 2
    first(:button,'Save').click
    sleep 10

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
    $renOppURL = URI.parse(current_url)
  rescue Exception => ex
    raise "Error occurred while renewing opportunity"
    putstr_withScreen  ex.message
  end
end

#newly added

And(/^I click on "([^"]*)" from "([^"]*)" app$/) do |link, app|
  begin
    sleep 3
    if page.has_css?("#userNavButton")
      puts "Successfully see the #{app} app link"
      sleep 3
      first("#userNavButton").click
      sleep 5
      click_on link
      sleep 4
    else
      putstr "Failed to see the #{app} app link"
    end
    puts "Successfully click the #{link} from #{app} app"
  rescue Exception => ex
    putstr "Error occurred while clicking the #{link} from #{app} app"
    putstr_withScreen ex.message
  end
end

And(/^I select "([^"]*)" products from Products section$/) do |totalProducts|
  begin
    sleep 5
    within(".opportunityLineItemBlock") do
      for cnt in 0..totalProducts.to_i - 1
        productName = all(".dataRow")[cnt.to_i].all("th")[0].first("a").text
        puts productName
        all(".dataRow")[cnt.to_i].all("td")[0].first("input").click
        sleep 1
      end
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the multiple #{renewal_relationship} products"
    putstr_withScreen  ex.message
  end
end

And(/^I search for "([^"]*)" from Quick Find$/) do |searchText|
  begin
    sleep 3
    find("input[placeholder='Quick Find / Search...']").send_keys [:control, 'a'], :backspace
    find("input[placeholder='Quick Find / Search...']").send_keys searchText
    sleep 3
    puts "Entered text #{searchText} to search in Quick search box"
    #within("#DevToolsIntegrate_child") do  CustomSettings_font
    click_link(searchText)
    #end
  rescue Exception => ex
    putstr "Error while searching #{searchText}"
    putstr_withScreen  ex.message
  end

end

#I select CSM Admin from Custom Settings
And(/^I select "([^"]*)" from Custom Settings$/) do |user|
  begin
    sleep 3
    puts user
    within (".listRelatedObject") do
      first(:xpath, ".//th/a[contains(text(),'#{user}')]").click
    end
  rescue Exception => ex
    putstr "Error while selecting CSM Admin"
    putstr_withScreen  ex.message
  end
end

And(/^check the set renewal checkbox in CSM Admin custom setting if it is not checked$/) do
  begin
    sleep 3
    puts page.has_xpath?("//th[contains(text(),'Set new Opportunity as Renewal')]//following-sibling::td/span/img[@alt='Not Checked']")
    puts page.has_xpath?("//th[contains(text(),'Set new Opportunity as Renewal')]//following-sibling::td/span/img[@alt='Checked']")

    if page.has_xpath?("//th[contains(text(),'Set new Opportunity as Renewal')]//following-sibling::td/span/img[@alt='Not Checked']") == true
      puts "checkbox is not checked"
      click_button 'Edit'
      sleep 3
      if page.has_css?(".editPage")
        puts "Successfully see the edit form"
        find(:xpath, "//label[contains(text(),'Set new Opportunity as Renewal')]/parent::th/following-sibling::td/input").click
        sleep 3
        click_button 'Save'
        puts "successfully checked the checkbox"
      else
        putstr "Failed to see the edit form"
      end
    else
      puts "checkbox is already checked"
    end
  rescue Exception => ex
    putstr "Error while checking the checkbox"
    putstr_withScreen  ex.message
  end
end

And(/^uncheck the set renewal checkbox in CSM Admin custom setting if it is checked$/) do
  begin
    sleep 3
    puts page.has_xpath?("//th[contains(text(),'Set new Opportunity as Renewal')]//following-sibling::td/span/img[@alt='Not Checked']")
    puts page.has_xpath?("//th[contains(text(),'Set new Opportunity as Renewal')]//following-sibling::td/span/img[@alt='Checked']")
    if page.has_xpath?("//th[contains(text(),'Set new Opportunity as Renewal')]//following-sibling::td/span/img[@alt='Checked']") == true
      puts "checkbox is checked"
      click_button 'Edit'
      sleep 3
      if page.has_css?(".editPage")
        puts "Successfully see the edit form"
        find(:xpath, "//label[contains(text(),'Set new Opportunity as Renewal')]/parent::th/following-sibling::td/input").click
        sleep 3
        click_button 'Save'
        puts "successfully unchecked the checkbox"
      else
        putstr "Failed to see the edit form"
      end
    else
      puts "checkbox is already unchecked"
    end
  rescue Exception => ex
    putstr "Error while unchecking the checkbox"
    putstr_withScreen  ex.message
  end
end

And(/^I will verify renewal status for the opportunity$/) do
  begin
    sleep 3
    puts page.has_xpath?("//td[contains(text(),'Renewal')]//following-sibling::td/div/img[@alt='Checked']")
    rStatus = page.has_xpath?("//td[contains(text(),'Renewal')]//following-sibling::td/div/img[@alt='Checked']")
    #putstr "renewal status: #{rStatus}"
    if page.has_xpath?("//td[contains(text(),'Renewal')]//following-sibling::td/div/img[@alt='Checked']") == true
      puts "Renewal checkbox is checked"
    else
      puts "Renewal checkbox is unchecked"
    end

  rescue Exception => ex
    putstr "Error while checking the renewal status"
    putstr_withScreen  ex.message
  end
end

And(/^I Save Adds Amount and Adds ratio values$/) do
  begin
    sleep 3
    $addsAmount = first(:xpath, "//tr/td[contains(text(),'Adds Amount')]//following-sibling::td/div").text
    $addsRatio = find(:xpath, "//tr/td[contains(text(),'Adds Ratio')]//following-sibling::td/div").text
    puts "AddsAmount: "+$addsAmount
    puts "AddsRatio: "+$addsRatio
  rescue Exception => ex
    putstr "Error in adding products to the Opportunity"
    putstr_withScreen  ex.message
  end
end

Then (/^I verify Adds Amount and Adds Ratio$/) do
  begin
    puts 'verify Adds Amount and Ratio'
    sleep 3
    addsAmountNew = first(:xpath, "//tr/td[contains(text(),'Adds Amount')]//following-sibling::td/div").text
    addsRatioNew = find(:xpath, "//tr/td[contains(text(),'Adds Ratio')]//following-sibling::td/div").text

    puts "AddsRatioNew: "+addsRatioNew
    puts "AddsAmountNew: "+addsAmountNew
    #addsTempR = "100.00%"
    #addsTempA = "USD 2,000.00"

    if $addsAmount == addsAmountNew && $addsRatio == addsRatioNew
      puts "Values for Adds Amount and Adds Ratio are not populated correctly."
    else
      puts "Correct values for Adds Amount and Adds Ratio are populated."
    end

  rescue Exception => ex
    putstr "Error while verifying Adds Amount and Adds Ratio"
    putstr_withScreen  ex.message
  end
end

When(/^I connect to SalesforceAPI using "([^"]*)" user role$/) do |user_role|
  begin
    arg = Array.new
    arg = getSalesForceAPIinfo user_role
    puts "Data #{arg}"
    sleep 5
    connectSalesforceAPI(arg) 
  rescue Exception => ex
    puts ex.message
  end
end

When(/^I delete the SourceOpp_RenOpp_SourceObjects$/) do
  begin
    sleep 5
    deleteOppRenOppSourceObj($RenAutomationSO, $RenAutomationRO) 
  rescue Exception => ex
    puts ex.message
  end
end