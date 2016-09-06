#All Step Definitions which are common across modules
require 'Win32API'
require 'pry'

Given(/^that I navigate to the CRM application$/) do
  begin
    setCursorPos = Win32API.new("user32", "SetCursorPos", ['I','I'], 'V')
    setCursorPos.Call(500,10)
    sleep 4
    visit env
    puts "Login as " + ENV['UserRole']
    arg=getCredentialInfo
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
    putstr_withScreen ex.message
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

Then(/^I create new Account$/) do
  begin
    arg=getDetails "Account"
    click_on "New"
    sleep 2
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
    putstr_withScreen ex.message
  end
end

Then(/^I access contacts and create a new contact$/) do

  begin
    arg=getContactInfo
    click_link('Contacts')
    sleep 2
    click_on "New"
    sleep 2
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
    sleep 2
    click_on "New"
    sleep 2
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

Then(/^I view Opportunities$/) do
  begin
    arg=getOpportunityInfo
    click_link('Opportunities')
    sleep 2
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
    sleep 2
    click_on "New"
    puts "Creating a new Playbook"
    sleep 2
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
    sleep 2
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
    sleep 3
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
        sleep 3
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
    sleep 2
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
  sleep 2
  puts "Navigated to " + arg1 + " tab"
end

When(/^I click on "(.*?)" link$/) do |arg1|
  first(:link, arg1).click
  sleep 10
  puts "Navigated to " + arg1 + " tab"
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
  arg1 = getDetails "Overview"
  liText[0].click
  find(:xpath, "//*[contains(@id, 'selectObjectType')]").select("Account")

  find(:xpath, "//*[contains(@id, 'filterAttrViewList')]").select(arg1["Filter_value1"])
  sleep 5
  first(:xpath, "//*[contains(@title, 'Object Field Filter User Lookup (New Window)')]").click
  sleep 5
  page.driver.browser.manage.window.maximize
  sleep 4
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  sleep 7
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 7
  fill_in "lksrch",:with => arg1["Search_value"]
  sleep 7
  click_on 'Go!'
  sleep 3
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  sleep 3
  page.driver.browser.switch_to.frame("resultsFrame")
  sleep 3
  within('.list') do
    click_link arg1["Search_value"]
    sleep 5
  end
  sleep 3
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
  sleep 3
  find(:xpath, "//input[@value='Save']").click
  sleep 5
  puts "Filter Attribute selected."
  #   find(:xpath, "//*[contains(@id, 'selectObjectType')]").select("Account")
  #   find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select("Account Owner")
  #   find(:xpath, "//*[contains(@id, 'chboxSaveAsDefaultValue')]").click
  #   find(".lookupIcon").click
  #	sleep 10
  ##	within_window(page.driver.browser.window_handles.last) do
  ##	   within_frame "resultsFrame" do
  ##		first(:link,"PES CSM User").click
  ##	   end
  ##	end
  #
  #   sleep 15
  #   puts page.body
  #  # first(:link,"CSM Automation").click
  #   sleep 5
  #   within_window(page.driver.browser.window_handles.last) do
  #     puts page.body
  #    click_on "Save"
  #   end
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
  sleep 2
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
    putstr_withScreen ex.message
  end
end

Then (/^I verify Play task created for SP$/) do
  begin
    sleep 4
    click_link "Details"
    sleep 5
    arg = getDetails "PlayforSP"
    within all(:css,".pbSubsection")[2] do
      first('a').click
      puts "Selected the Associated Account"
    end
    sleep 2
    if page.has_content?("Account Detail")
      puts "Opened associated Account successfully for SuccessPlan"
    else
      raise "Error while Opening the associated Account for SuccessPlan"
    end
    sleep 3
    within all(:css,".taskBlock")[0] do
      @taskBefore = all(:css,"tr .dataRow").count
    end
    within(:id,"topButtonRow") do
      click_on "Edit"
    end
    sleep 3
    fill_in 'Annual Revenue', :with => arg["PlayCriteria"]
    within(:id,"topButtonRow") do
      click_on "Save"
    end
    sleep 3
    within all(:css,".taskBlock")[0] do
      @taskAfter = all(:css,"tr .dataRow").count
    end
    if @taskBefore!=@taskAfter
      puts "Play task is generated when PlayBook is added to SP which meets play criteria"
    else
      puts "Play task is not generated when PlayBook is added to SP which meets play criteria"
    end
    sleep 3
  rescue Exception =>ex
    putstr "Error while verifying that Play task is generated when PlayBook is added to SP"
    putstr_withScreen ex.message
  end
end

Then (/^I delete a Playbook for SP$/) do
  begin
    arg1 =  getDetails ("PlayBookForSP")
    if all(".pagination-info").count > 0
      @SPtaskBefore = find(".pagination-info").text.split("of").last.split("rows").last.to_i
    end
    sleep 3
    click_link "Details"
    sleep 5
    all(:css,".form-control")[0].set(arg1["Display Name"])
    within(:id,"playbookSPGrid") do
      first(:link, "Del").click
    end
    puts "Successfully deleted PlayBook"
    if page.has_content?('Success Plan Template Playbook has been deleted')
      puts "Success Plan Template PlayBook has been deleted message displayed"
      sleep 3
    else
      raise "Success Plan Template PlayBook has been deleted message not displayed"
    end
    click_link "Actions"
    sleep 2
    if all(".pagination-info").count > 0
      @SPtaskAfter = find(".pagination-info").text.split("of").last.split("rows").last.to_i
    end
    sleep 2
    if @SPtaskAfter == @SPtaskBefore
      puts "Verified that Play Task is not deleted after deleting PlayBook for Success Plan"
    else
      raise "Play Task is deleted after deleting PlayBook for Success Plan"
    end
  rescue Exception =>ex
    putstr "Error while deleting PlayBook for Success Plan"
    putstr_withScreen ex.message
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
  sleep 20
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
  sleep 20
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

When(/^I click on "([^"]*)" tab$/) do |tab|
  begin
    sleep 3
    click_on tab
    sleep 10
    puts "Successfully to open the #{tab} page"
  rescue Exception => ex
    putstr "Error occurred while clicking the #{tab} tab"
    putstr_withScreen  ex.message
  end
end

And(/^I click on "([^"]*)" button$/) do |button|
  begin
    sleep 5
    click_on button
    sleep 10
    puts "Successfully to clicked the #{button} button"
  rescue Exception => ex
    putstr "Error occurred while clicking the #{button} button"
    putstr_withScreen  ex.message
  end
end

And(/^I "([^"]*)" the "([^"]*)"$/) do |button, task|
  begin
    sleep 5
    within all(".pbButtonb")[0] do
      sleep 4
      click_on button
      sleep 4
    end
    sleep 6
    puts "Successfully see the #{button} the #{task}"
  rescue Exception => ex
    putstr "Error occurred while #{button} the #{task}"
    putstr_withScreen ex.message
  end
end

When(/^I click on "([^"]*)" from "([^"]*)" app$/) do |link, app|
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

And(/^I click on "([^"]*)" link from "([^"]*)" page$/) do |field_name, custom_settings|
  begin
    sleep 4
    if page.has_content?(field_name)
      puts "Successfully see the #{field_name} field from #{custom_settings} page"
      sleep 4
      click_on field_name
      sleep 5
    else
      putstr "Failed to see the #{field_name} field from #{custom_settings} page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field_name} field from #{custom_settings} page"
    putstr_withScreen ex.message
  end
end

Then(/^I should be able to see the "([^"]*)" field$/) do |field|
  begin
    sleep 4
    if page.has_content?(field)
      puts "Successfully see the #{field} field"
    else
      putstr "Failed to see the #{field} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} field"
    putstr_withScreen ex.message
  end
end

When(/^I click on "([^"]*)" field$/) do |field|
  begin
    sleep 4
    if page.has_content?(field)
      puts "Successfully see the #{field} field"
      sleep 4
      click_on field
      sleep 5
    else
      putstr "Failed to see the #{field} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} field"
    putstr_withScreen ex.message
  end
end

Then(/^I should be able to see the "([^"]*)" is "([^"]*)"$/) do |value, status|
  begin
    sleep 3
    within all(".pbSubsection")[2] do
      if page.has_content?(value)
        puts "Successfully see the #{value} field"
      else
        putstr "Failed to see the #{value} field"
      end
      sleep 3
      if page.has_content?(status)
        puts "Successfully see the #{value} is #{status}"
      else
        putstr "Failed to see the #{value} is not #{status}"
      end
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the #{value} is #{status}"
    putstr_withScreen ex.message
  end
end

When(/^I user logout from "([^"]*)" application$/) do |environment|
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

When(/^I connect to SalesforceAPI using "([^"]*)" user role$/) do |user_role|
  begin
    arg = Array.new
    arg = getSalesForceAPIinfo user_role
    puts "Data #{arg}"
    sleep 5
    connectSalesforceAPI(arg)
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I create Account using map data "([^"]*)"$/) do |mapName|
  begin
    sleep 5
    arg = getDetails mapName
    time = Time.new
    accDateTime = time.hour.to_s + time.min.to_s + time.sec.to_s
    $accountName = "AAcc" + accDateTime.to_s
    setDetails("Details.yml", "SPPBSPPL", 'AccountName', $accountName)
    puts $accountName
    $client.create('Account',Name: $accountName)
    record = $client.query("SELECT Id,Name from Account where Name = \'#{$accountName}\'")
    accRec = record.first
    puts accRec.Id
    $accId = accRec.Id
    $client.update!('Account', Id: accRec.Id, OwnerId: '005o0000002P4KI')
    setDetails("Details.yml", "SPPBSPPL", 'AccountId', $accId)
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I create PLAY with TASK using map data "([^"]*)"$/) do |mapName|
  begin
    sleep 5
    time = Time.new
    puts time
    arg = getDetails mapName

    #Create Play1Task1
    $client.create!('ServiceSource1__CSM_Play__c',ServiceSource1__CSM_Display_Name__c: arg["APL1APB1"], ServiceSource1__CSM_IsActive__c: true, ServiceSource1__CSM_Object_Name__c: 'Account', OwnerId: '005o0000002P4KI')
    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Display_Name__c FROM ServiceSource1__CSM_Play__c where ServiceSource1__CSM_Display_Name__c = \'#{arg["APL1APB1"]}\'")
    play = record.first
    $pL1Id = play.Id
    $pL1Name = play.Name
    setDetails("Details.yml", "SPPBSPPL", 'APL1APB1Id', $pL1Id)
    setDetails("Details.yml", "SPPBSPPL", 'APL1APB1Name', $pL1Name)
    puts play.Id + " " + play.Name + " " + play.ServiceSource1__CSM_Display_Name__c

    $client.create!('ServiceSource1__CSM_Play_Task__c',ServiceSource1__CSM_Play__c: $pL1Id, Name: arg["AT1APL1"], ServiceSource1__CSM_Type__c: 'Meeting', ServiceSource1__CSM_Days_Until_Due__c: '10', ServiceSource1__CSM_IsActive__c: true)
    record = $client.query("SELECT Id,Name FROM ServiceSource1__CSM_Play_Task__c where ServiceSource1__CSM_Play__c = \'#{$pL1Id}\'")
    task = record.first
    $T1Id = task.Id
    puts task.Id + " " + task.Name

    time = Time.new
    puts time

    #Create Play2Task2
    $client.create!('ServiceSource1__CSM_Play__c',ServiceSource1__CSM_Display_Name__c: arg["APL2APB2"], ServiceSource1__CSM_IsActive__c: true, ServiceSource1__CSM_Object_Name__c: 'Account', OwnerId: '005o0000002P4KI')
    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Display_Name__c FROM ServiceSource1__CSM_Play__c where ServiceSource1__CSM_Display_Name__c = \'#{arg["APL2APB2"]}\'")
    play = record.first
    $pL2Id = play.Id
    $pL2Name = play.Name
    setDetails("Details.yml", "SPPBSPPL", 'APL2APB2Id', $pL2Id)
    setDetails("Details.yml", "SPPBSPPL", 'APL2APB2Name', $pL2Name)
    puts play.Id + " " + play.Name + " " + play.ServiceSource1__CSM_Display_Name__c

    $client.create!('ServiceSource1__CSM_Play_Task__c',ServiceSource1__CSM_Play__c: $pL2Id, Name: arg["AT2APL2"], ServiceSource1__CSM_Type__c: 'Meeting', ServiceSource1__CSM_Days_Until_Due__c: '10', ServiceSource1__CSM_IsActive__c: true)
    record = $client.query("SELECT Id,Name FROM ServiceSource1__CSM_Play_Task__c where ServiceSource1__CSM_Play__c = \'#{$pL2Id}\'")
    task = record.first
    $T2Id = task.Id
    puts task.Id + " " + task.Name
    time = Time.new
    puts time

    #Create Play3Task3
    $client.create!('ServiceSource1__CSM_Play__c',ServiceSource1__CSM_Display_Name__c: arg["APL3APB3"], ServiceSource1__CSM_IsActive__c: true, ServiceSource1__CSM_Object_Name__c: 'Account', OwnerId: '005o0000002P4KI')
    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Display_Name__c FROM ServiceSource1__CSM_Play__c where ServiceSource1__CSM_Display_Name__c = \'#{arg["APL3APB3"]}\'")
    play = record.first
    $pL3Id = play.Id
    $pL3Name = play.Name
    setDetails("Details.yml", "SPPBSPPL", 'APL3APB3Id', $pL3Id)
    setDetails("Details.yml", "SPPBSPPL", 'APL3APB3Name', $pL3Name)
    puts play.Id + " " + play.Name + " " + play.ServiceSource1__CSM_Display_Name__c

    $client.create!('ServiceSource1__CSM_Play_Task__c',ServiceSource1__CSM_Play__c: $pL3Id, Name: arg["AT3APL3"], ServiceSource1__CSM_Type__c: 'Meeting', ServiceSource1__CSM_Days_Until_Due__c: '10', ServiceSource1__CSM_IsActive__c: true)
    record = $client.query("SELECT Id,Name FROM ServiceSource1__CSM_Play_Task__c where ServiceSource1__CSM_Play__c = \'#{$pL3Id}\'")
    task = record.first
    $T3Id = task.Id
    puts task.Id + " " + task.Name
    time = Time.new
    puts time

    #Create Play4Task4
    $client.create!('ServiceSource1__CSM_Play__c',ServiceSource1__CSM_Display_Name__c: arg["APL4APB4"], ServiceSource1__CSM_IsActive__c: true, ServiceSource1__CSM_Object_Name__c: 'Account', OwnerId: '005o0000002P4KI')
    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Display_Name__c FROM ServiceSource1__CSM_Play__c where ServiceSource1__CSM_Display_Name__c = \'#{arg["APL4APB4"]}\'")
    play = record.first
    $pL4Id = play.Id
    $pL4Name = play.Name
    setDetails("Details.yml", "SPPBSPPL", 'APL4APB4Id', $pL4Id)
    setDetails("Details.yml", "SPPBSPPL", 'APL4APB4Name', $pL4Name)
    puts play.Id + " " + play.Name + " " + play.ServiceSource1__CSM_Display_Name__c

    $client.create!('ServiceSource1__CSM_Play_Task__c',ServiceSource1__CSM_Play__c: $pL4Id, Name: arg["AT4APL4"], ServiceSource1__CSM_Type__c: 'Meeting', ServiceSource1__CSM_Days_Until_Due__c: '10', ServiceSource1__CSM_IsActive__c: true)
    record = $client.query("SELECT Id,Name FROM ServiceSource1__CSM_Play_Task__c where ServiceSource1__CSM_Play__c = \'#{$pL4Id}\'")
    task = record.first
    $T4Id = task.Id
    puts task.Id + " " + task.Name
    time = Time.new
    puts time

  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I create PLAYBOOK with PLAY using map data "([^"]*)"$/) do |mapName|
  begin
    sleep 5
    time = Time.new
    puts time
    arg = getDetails mapName

    #Create PlayBook1/AddPlay1
    $client.create!('ServiceSource1__CSM_Playbook__c', ServiceSource1__CSM_Display_Name__c: arg["APB1ASPT1"], ServiceSource1__CSM_IsActive__c: true, OwnerId: '005o0000002P4KI')
    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Display_Name__c FROM ServiceSource1__CSM_Playbook__c where ServiceSource1__CSM_Display_Name__c = \'#{arg["APB1ASPT1"]}\'")
    playBook = record.first
    $pb1Id = playBook.Id
    $pb1Name = playBook.Name
    setDetails("Details.yml", "SPPBSPPL", 'APB1ASPT1Id', $pb1Id)
    setDetails("Details.yml", "SPPBSPPL", 'APB1ASPT1Name', $pb1Name)
    puts "Play Book1: " + playBook.Id + " " + playBook.Name + " " + playBook.ServiceSource1__CSM_Display_Name__c

    $client.create!('ServiceSource1__CSM_PlaybookPlay__c', ServiceSource1__CSM_Play__c: $pL1Id, ServiceSource1__CSM_Playbook__c: $pb1Id)
    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Playbook__c,ServiceSource1__CSM_Play__c FROM ServiceSource1__CSM_PlaybookPlay__c where ServiceSource1__CSM_Play__c = \'#{$pL1Id}\' and ServiceSource1__CSM_Playbook__c = \'#{$pb1Id}\'")
    pbpl = record.first
    $pbpl1Id = pbpl.Id
    puts "PlayBookPlay1: " + pbpl.Id + " " + pbpl.Name+ " " + pbpl.ServiceSource1__CSM_Playbook__c + " " + pbpl.ServiceSource1__CSM_Play__c

    time = Time.new
    puts time

    #Create PlayBook2/Add Play2 and Play3
    $client.create!('ServiceSource1__CSM_Playbook__c', ServiceSource1__CSM_Display_Name__c: arg["APB2ASPT2"], ServiceSource1__CSM_IsActive__c: true, OwnerId: '005o0000002P4KI')
    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Display_Name__c FROM ServiceSource1__CSM_Playbook__c where ServiceSource1__CSM_Display_Name__c = \'#{arg["APB2ASPT2"]}\'")
    playBook = record.first
    $pb2Id = playBook.Id
    $pb2Name = playBook.Name
    setDetails("Details.yml", "SPPBSPPL", 'APB2ASPT2Id', $pb2Id)
    setDetails("Details.yml", "SPPBSPPL", 'APB2ASPT2Name', $pb2Name)
    puts "Play Book2: " + playBook.Id + " " + playBook.Name + " " + playBook.ServiceSource1__CSM_Display_Name__c

    $client.create!('ServiceSource1__CSM_PlaybookPlay__c', ServiceSource1__CSM_Play__c: $pL2Id, ServiceSource1__CSM_Playbook__c: $pb2Id)
    #$client.create!('ServiceSource1__CSM_PlaybookPlay__c', ServiceSource1__CSM_Play__c: $pL3Id, ServiceSource1__CSM_Playbook__c: $pb2Id)

    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Playbook__c,ServiceSource1__CSM_Play__c FROM ServiceSource1__CSM_PlaybookPlay__c where ServiceSource1__CSM_Play__c = \'#{$pL2Id}\' and ServiceSource1__CSM_Playbook__c = \'#{$pb2Id}\'")
    pbplRecords = record.first
    $pbpl2Id = pbplRecords.Id
    puts "PlayBookPlay1: " + pbplRecords.Id + " " + pbplRecords.Name+ " " + pbplRecords.ServiceSource1__CSM_Playbook__c + " " + pbplRecords.ServiceSource1__CSM_Play__c

    #    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Playbook__c,ServiceSource1__CSM_Play__c FROM ServiceSource1__CSM_PlaybookPlay__c where ServiceSource1__CSM_Play__c = \'#{$pL3Id}\' and ServiceSource1__CSM_Playbook__c = \'#{$pb2Id}\'")
    #    pbplRecords = record.first
    #    $pbpl3Id = pbplRecords.Id
    #    puts "PlayBookPlay2: " + pbplRecords.Id + " " + pbplRecords.Name+ " " + pbplRecords.ServiceSource1__CSM_Playbook__c + " " + pbplRecords.ServiceSource1__CSM_Play__c
    time = Time.new
    puts time

    #Create PlayBook_1 for SP/AddPlay3
    $client.create!('ServiceSource1__CSM_Playbook__c', ServiceSource1__CSM_Display_Name__c: arg["APB1"], ServiceSource1__CSM_IsActive__c: true, OwnerId: '005o0000002P4KI')
    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Display_Name__c FROM ServiceSource1__CSM_Playbook__c where ServiceSource1__CSM_Display_Name__c = \'#{arg["APB1"]}\'")
    playBook = record.first
    $pb3Id = playBook.Id
    $pb3Name = playBook.Name
    setDetails("Details.yml", "SPPBSPPL", 'APB1Id', $pb3Id)
    setDetails("Details.yml", "SPPBSPPL", 'APB1Name', $pb3Name)
    puts "Play Book1: " + playBook.Id + " " + playBook.Name + " " + playBook.ServiceSource1__CSM_Display_Name__c

    $client.create!('ServiceSource1__CSM_PlaybookPlay__c', ServiceSource1__CSM_Play__c: $pL3Id, ServiceSource1__CSM_Playbook__c: $pb3Id)
    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Playbook__c,ServiceSource1__CSM_Play__c FROM ServiceSource1__CSM_PlaybookPlay__c where ServiceSource1__CSM_Play__c = \'#{$pL3Id}\' and ServiceSource1__CSM_Playbook__c = \'#{$pb3Id}\'")
    pbpl = record.first
    $pbpl3Id = pbpl.Id
    puts "PlayBookPlay1: " + pbpl.Id + " " + pbpl.Name+ " " + pbpl.ServiceSource1__CSM_Playbook__c + " " + pbpl.ServiceSource1__CSM_Play__c

    time = Time.new
    puts time

    #Create PlayBook_2 for SP/AddPlay4
    $client.create!('ServiceSource1__CSM_Playbook__c', ServiceSource1__CSM_Display_Name__c: arg["APB2"], ServiceSource1__CSM_IsActive__c: true, OwnerId: '005o0000002P4KI')
    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Display_Name__c FROM ServiceSource1__CSM_Playbook__c where ServiceSource1__CSM_Display_Name__c = \'#{arg["APB2"]}\'")
    playBook = record.first
    $pb4Id = playBook.Id
    $pb4Name = playBook.Name
    setDetails("Details.yml", "SPPBSPPL", 'APB2Id', $pb4Id)
    setDetails("Details.yml", "SPPBSPPL", 'APB2Name', $pb4Name)
    puts "Play Book1: " + playBook.Id + " " + playBook.Name + " " + playBook.ServiceSource1__CSM_Display_Name__c

    $client.create!('ServiceSource1__CSM_PlaybookPlay__c', ServiceSource1__CSM_Play__c: $pL4Id, ServiceSource1__CSM_Playbook__c: $pb4Id)
    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Playbook__c,ServiceSource1__CSM_Play__c FROM ServiceSource1__CSM_PlaybookPlay__c where ServiceSource1__CSM_Play__c = \'#{$pL4Id}\' and ServiceSource1__CSM_Playbook__c = \'#{$pb4Id}\'")
    pbpl = record.first
    $pbpl4Id = pbpl.Id
    puts "PlayBookPlay1: " + pbpl.Id + " " + pbpl.Name+ " " + pbpl.ServiceSource1__CSM_Playbook__c + " " + pbpl.ServiceSource1__CSM_Play__c

    time = Time.new
    puts time
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I create SPT with PLAYBOOK using map data "([^"]*)"$/) do |mapName|
  begin
    sleep 5
    time = Time.new
    puts time
    arg = getDetails mapName

    #Create Success Plan Template 1
    $client.create!('ServiceSource1__CSM_Account_Plan_Template__c', ServiceSource1__CSM_Template_Name__c: arg["ASPT1"], ServiceSource1__CSM_isActive__c: true, ServiceSource1__CSM_Opp_Date__c: 'CloseDate')
    record = $client.query("SELECT Id,Name FROM ServiceSource1__CSM_Account_Plan_Template__c where ServiceSource1__CSM_Template_Name__c = \'#{arg["ASPT1"]}\'")
    sPT = record.first
    $sPT1Id = sPT.Id
    $sPT1Name = sPT.Name
    setDetails("Details.yml", "SPPBSPPL", 'ASPT1Id', $sPT1Id)
    setDetails("Details.yml", "SPPBSPPL", 'ASPT1Name', $sPT1Name)
    puts "SPT1: " + sPT.Id + " " + sPT.Name

    $client.create!('ServiceSource1__CSM_Account_Plan_Phase__c', ServiceSource1__CSM_Account_Plan_Template__c: $sPT1Id, ServiceSource1__CSM_Length__c: '10', ServiceSource1__CSM_Order__c: '1', ServiceSource1__CSM_Phase_Name__c: 'Automation SPT1 Phase')
    $client.create!('ServiceSource1__CSM_Account_Plan_Playbook__c', ServiceSource1__CSM_Account_Plan_Template__c: $sPT1Id, ServiceSource1__CSM_IsActive__c: true, ServiceSource1__CSM_Playbook__c: $pb1Id)
    #$client.create!('ServiceSource1__CSM_Account_Plan_Playbook__c', ServiceSource1__CSM_Account_Plan_Template__c: $sPT1, ServiceSource1__CSM_IsActive__c: true, ServiceSource1__CSM_Indicator__c: , ServiceSource1__CSM_Order__c: '1')

    time = Time.new
    puts time

    #Create Success Plan Template 2
    $client.create!('ServiceSource1__CSM_Account_Plan_Template__c', ServiceSource1__CSM_Template_Name__c: arg["ASPT2"], ServiceSource1__CSM_isActive__c: true, ServiceSource1__CSM_Opp_Date__c: 'CloseDate')
    record = $client.query("SELECT Id,Name FROM ServiceSource1__CSM_Account_Plan_Template__c where ServiceSource1__CSM_Template_Name__c = \'#{arg["ASPT2"]}\'")
    sPT = record.first
    $sPT2Id = sPT.Id
    $sPT2Name = sPT.Name
    setDetails("Details.yml", "SPPBSPPL", 'ASPT2Id', $sPT2Id)
    setDetails("Details.yml", "SPPBSPPL", 'ASPT2Name', $sPT2Name)
    puts "SPT2: " + sPT.Id + " " + sPT.Name

    $client.create!('ServiceSource1__CSM_Account_Plan_Phase__c', ServiceSource1__CSM_Account_Plan_Template__c: $sPT2Id, ServiceSource1__CSM_Length__c: '10', ServiceSource1__CSM_Order__c: '1', ServiceSource1__CSM_Phase_Name__c: 'Automation SPT1 Phase')
    $client.create!('ServiceSource1__CSM_Account_Plan_Playbook__c', ServiceSource1__CSM_Account_Plan_Template__c: $sPT2Id, ServiceSource1__CSM_IsActive__c: true, ServiceSource1__CSM_Playbook__c: $pb2Id)
    #$client.create!('ServiceSource1__CSM_Account_Plan_Playbook__c', ServiceSource1__CSM_Account_Plan_Template__c: $sPT1, ServiceSource1__CSM_IsActive__c: true, ServiceSource1__CSM_Indicator__c: , ServiceSource1__CSM_Order__c: '1')

    time = Time.new
    puts time

  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I delete Play_PlayBook_SPT using map data "([^"]*)"$/) do |mapName|
  begin
    #$accId/$pL1Id/$pL2Id/$pL3Id/$pL4Id/$pb1Id/$pbpl1Id/$pb2Id/$pbpl2Id/$pbpl3Id/$sPT1Id/s$sPT2Id
    sleep 5
    time = Time.new
    puts time
    arg = getDetails mapName
    #Delete Plays
    $client.destroy!('ServiceSource1__CSM_Play__c', arg["APL1APB1Id"])
    $client.destroy!('ServiceSource1__CSM_Play__c', arg["APL2APB2Id"])
    $client.destroy!('ServiceSource1__CSM_Play__c', arg["APL3APB3Id"])
    $client.destroy!('ServiceSource1__CSM_Play__c', arg["APL4APB4Id"])

    #Delete Play Books
    $client.destroy!('ServiceSource1__CSM_Playbook__c', arg["APB1ASPT1Id"])
    $client.destroy!('ServiceSource1__CSM_Playbook__c', arg["APB2ASPT2Id"])
    $client.destroy!('ServiceSource1__CSM_Playbook__c', arg["APB1Id"])
    $client.destroy!('ServiceSource1__CSM_Playbook__c', arg["APB2Id"])

    #Delete SPTs
    $client.destroy!('ServiceSource1__CSM_Account_Plan_Template__c', arg["ASPT1Id"])
    $client.destroy!('ServiceSource1__CSM_Account_Plan_Template__c', arg["ASPT2Id"])
    $client.destroy!('ServiceSource1__CSM_Account_Plan_Template__c', arg["SPT1Id"])

    #Delete Account
    #$client.destroy!('Account', $accId)
    #puts $client.find('Account', $accId)
    time = Time.new
    puts time
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I delete Account$/) do
  begin
    #$accId/$pL1Id/$pL2Id/$pL3Id/$pL4Id/$pb1Id/$pbpl1Id/$pb2Id/$pbpl2Id/$pbpl3Id/$sPT1Id/s$sPT2Id
    sleep 5
    time = Time.new
    puts time

    #Delete Account
    $client.destroy!('Account', $accId)
    #puts $client.find('Account', $accId)
    time = Time.new
    puts time
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I delete Success Plan from DB/) do
  begin
    #$accId/$pL1Id/$pL2Id/$pL3Id/$pL4Id/$pb1Id/$pbpl1Id/$pb2Id/$pbpl2Id/$pbpl3Id/$sPT1Id/s$sPT2Id
    sleep 5
    time = Time.new
    puts time

    #Delete Account
    $client.destroy!('ServiceSource1__CSM_Account_Plan__c', $sPlanId)
    #puts $client.find('Account', $accId)
    time = Time.new
    puts time
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
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
        puts "Click On All TAb"
        sleep 4
        click_on tab
      end
      sleep 3
      puts "Successfully navigate to the #{tab} page"
    else
      raise "Failed to see the All Tab Icon"
    end
    sleep 8
  rescue Exception => ex
    raise "Error occurred while clicking the #{tab} tab"
    putstr_withScreen  ex.message
  end
end

Then(/^I make call to YML$/) do
  begin
    sleep 3
    puts "call YML"
    arg = setDetails("Details.yml", "Demo", "Name", "Shashi")
    puts "after call YML"
    puts arg
  end
end

When(/^I navigate to Setup$/) do
  begin
    sleep 5
    find("#userNav-arrow").click
    sleep 6
    click_on "Setup"
    sleep 5
    puts "Successfully navigated to Setup page"
  rescue Exception => ex
    putstr_withScreen  ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
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
    putstr_withScreen  ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I set the value of "([^"]*)" Custom Setting$/) do |customSettingName|
  begin
    sleep 3
    if page.has_content?(customSettingName)
      click_button 'Edit'
      sleep 5
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
      puts "#{customSettingName} Custom Setting not present on Page"
    end
  rescue Exception => ex
    putstr_withScreen  ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I get ownerId of "([^"]*)" using map data "([^"]*)" and key "([^"]*)"$/) do |userRole, mapName, keyName|
  begin
    sleep 5
    puts Time.new
    arg = getSalesForceAPIinfo userRole
    puts arg["userName"]

    record = $client.query("SELECT Id FROM User where Username = \'#{arg["userName"]}\'")
    userRec = record.first.Id.to_s
    puts userRec
    setDetails("Details.yml", mapName, keyName, userRec)
    puts Time.new
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I create Account "([^"]*)" using map data "([^"]*)" and key "([^"]*)"$/) do |accName, mapName, keyName|
  begin
    sleep 5
    owner = getDetails mapName
    time = Time.new
    accDateTime = time.hour.to_s + time.min.to_s + time.sec.to_s
    accountName = accName + accDateTime.to_s
    setDetails("Details.yml", mapName, keyName, accountName)
    puts accountName
    $client.create('Account',Name: accountName, OwnerId: owner["OwnerId"])
    record = $client.query("SELECT Id,Name from Account where Name = \'#{accountName}\'")
    accRec = record.first.Id
    puts accRec.Id
    accId = accRec.Id
    setDetails("Details.yml", mapName, 'Account_Id', accId)
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I create PLAY "([^"]*)" for object "([^"]*)" using map data "([^"]*)" and key "([^"]*)"$/) do |playName, objectName, mapName, keyName|
  begin
    sleep 5
    puts Time.new
    arg = getDetails mapName
    setDetails("Details.yml", mapName, keyName, playName)
    sleep 2
    $client.create!('ServiceSource1__CSM_Play__c',ServiceSource1__CSM_Display_Name__c: playName, ServiceSource1__CSM_IsActive__c: true, ServiceSource1__CSM_Object_Name__c: objectName, OwnerId: arg["Owner_Id"])
    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Display_Name__c FROM ServiceSource1__CSM_Play__c where ServiceSource1__CSM_Display_Name__c = \'#{playName}\'")
    play = record.first
    setDetails("Details.yml", mapName, playName + "_Id", play.Id)
    setDetails("Details.yml", mapName, playName + "_Name", play.Name)
    puts "Play:" + play.Id + " " + play.Name + " " + play.ServiceSource1__CSM_Display_Name__c
    puts Time.new
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I create Task "([^"]*)" in PLAY "([^"]*)" using map data "([^"]*)" and key "([^"]*)"$/) do |taskName, playName, mapName, keyName|
  begin
    sleep 5
    puts Time.new
    arg = getDetails mapName
    playId = playName + "_Id"
    setDetails("Details.yml", mapName, keyName, taskName)
    $client.create!('ServiceSource1__CSM_Play_Task__c',ServiceSource1__CSM_Play__c: playId, Name: taskName, ServiceSource1__CSM_Type__c: 'Meeting', ServiceSource1__CSM_Days_Until_Due__c: '5', ServiceSource1__CSM_IsActive__c: true)

    record = $client.query("SELECT Id,Name FROM ServiceSource1__CSM_Play_Task__c where ServiceSource1__CSM_Play__c = \'#{playId}\'")
    task = record.first
    setDetails("Details.yml", mapName, taskName + "_Id" ,task.Id)
    setDetails("Details.yml", mapName, taskName + "_Name" ,task.Id)
    puts "Task:" + task.Id + " " + task.Name

    puts Time.new
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I create PLAYBOOK "([^"]*)" using map data "([^"]*)" and key "([^"]*)"$/) do |playBookName, mapName, keyName|
  begin
    sleep 5
    puts Time.new
    arg = getDetails mapName

    setDetails("Details.yml", mapName, keyName, playBookName)

    $client.create!('ServiceSource1__CSM_Playbook__c', ServiceSource1__CSM_Display_Name__c: playBookName, ServiceSource1__CSM_IsActive__c: true, OwnerId: arg["Owner_Id"])

    record = $client.query("SELECT Id,Name,ServiceSource1__CSM_Display_Name__c FROM ServiceSource1__CSM_Playbook__c where ServiceSource1__CSM_Display_Name__c = \'#{playBookName}\'")
    playBook = record.first
    setDetails("Details.yml", mapName,  playBookName + "_Id", playBook.Id)
    setDetails("Details.yml", mapName, playBookName + "_Name", playBook.Name)
    puts "Play Book: " + playBook.Id + " " + playBook.Name + " " + playBook.ServiceSource1__CSM_Display_Name__c
    puts Time.new
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I add PLAY "([^"]*)" to PLAYBOOk "([^"]*)" using map data "([^"]*)"$/) do |playName, playBookName, mapName|
  begin
    sleep 5
    puts Time.new
    arg = getDetails mapName
    playId = playName + "_Id"
    playBookId = playBookName + "_Id"

    record = $client.create!('ServiceSource1__CSM_PlaybookPlay__c', ServiceSource1__CSM_Play__c: arg[playId], ServiceSource1__CSM_Playbook__c: arg[playBookId], OwnerId: arg["Owner_Id"])

    puts "PlayBookPlay: " + record
    puts Time.new
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I create SPT "([^"]*)" using map data "([^"]*)" and key "([^"]*)"$/) do |sptName, mapName, keyName|
  begin
    sleep 5
    time = Time.new
    puts time
    arg = getDetails mapName
    setDetails("Details.yml", mapName, keyName, sptName)

    $client.create!('ServiceSource1__CSM_Account_Plan_Template__c', ServiceSource1__CSM_Template_Name__c: sptName, ServiceSource1__CSM_isActive__c: true, ServiceSource1__CSM_Opp_Date__c: 'CloseDate', OwnerId: arg["Owner_Id"])
    record = $client.query("SELECT Id,Name FROM ServiceSource1__CSM_Account_Plan_Template__c where ServiceSource1__CSM_Template_Name__c = \'#{sptName}\'")
    sPT = record.first
    setDetails("Details.yml", mapName, sptName + "_Id", sPT.Id)
    setDetails("Details.yml", mapName, sptName + "_Name", sPT.Name)
    puts "SPT: " + sPT.Id + " " + sPT.Name

    $client.create!('ServiceSource1__CSM_Account_Plan_Phase__c', ServiceSource1__CSM_Account_Plan_Template__c: sPT.Id, ServiceSource1__CSM_Length__c: '10', ServiceSource1__CSM_Order__c: '1', ServiceSource1__CSM_Phase_Name__c: 'Automation SPT1 Phase')
    puts Time.new
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I add PLAYBOOk "([^"]*)" to SPT "([^"]*)" using map data "([^"]*)"$/) do |playBookName, sPTName, mapName|
  begin
    sleep 5
    puts Time.new
    arg = getDetails mapName
    sPTId = sPTName + "_Id"
    playBookId = playBookName + "_Id"

    record = $client.create!('ServiceSource1__CSM_Account_Plan_Playbook__c', ServiceSource1__CSM_Account_Plan_Template__c: arg[sPTId], ServiceSource1__CSM_Playbook__c: arg[playBookId], OwnerId: arg["Owner_Id"])

    puts "PlayBookPlay: " + record
    puts Time.new
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

And(/^I delete "([^"]*)" using map data "([^"]*)" and key "([^"]*)"$/) do |objectName, mapName, keyName|
  begin
    #$accId/$pL1Id/$pL2Id/$pL3Id/$pL4Id/$pb1Id/$pbpl1Id/$pb2Id/$pbpl2Id/$pbpl3Id/$sPT1Id/s$sPT2Id
    sleep 5
    time = Time.new
    puts time
    arg = getDetails mapName
    #Delete Plays
    $client.destroy!('ServiceSource1__CSM_Play__c', arg["APL1APB1Id"])
    $client.destroy!('ServiceSource1__CSM_Play__c', arg["APL2APB2Id"])
    $client.destroy!('ServiceSource1__CSM_Play__c', arg["APL3APB3Id"])
    $client.destroy!('ServiceSource1__CSM_Play__c', arg["APL4APB4Id"])

    #Delete Play Books
    $client.destroy!('ServiceSource1__CSM_Playbook__c', arg["APB1ASPT1Id"])
    $client.destroy!('ServiceSource1__CSM_Playbook__c', arg["APB2ASPT2Id"])
    $client.destroy!('ServiceSource1__CSM_Playbook__c', arg["APB1Id"])
    $client.destroy!('ServiceSource1__CSM_Playbook__c', arg["APB2Id"])

    #Delete SPTs
    $client.destroy!('ServiceSource1__CSM_Account_Plan_Template__c', arg["ASPT1Id"])
    $client.destroy!('ServiceSource1__CSM_Account_Plan_Template__c', arg["ASPT2Id"])
    $client.destroy!('ServiceSource1__CSM_Account_Plan_Template__c', arg["SPT1Id"])

    #Delete Account
    #$client.destroy!('Account', $accId)
    #puts $client.find('Account', $accId)
    time = Time.new
    puts time
  rescue Exception => ex
    puts ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end