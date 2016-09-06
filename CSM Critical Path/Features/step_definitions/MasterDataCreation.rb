#All MasterDetailCreation Specific Step Definitions
#All Scenario mentioned in MasterDetailCreation.feature
require 'pry'

Then(/^I create a new Success Plan Template with Template Name "(.*?)" PhaseName "(.*?)" Days "(.*?)" Indicator "(.*?)" with PlayBook "(.*?)" Criteria1 Type: "(.*?)" Criteria2 Type: "(.*?)" Criteria3 Type: "(.*?)" Criteria1: "(.*?)" Criteria2: "(.*?)" Criteria3: "(.*?)"$/) do |arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11|
  begin
    # arg=getDetails "SPT"
    # click_link('ServiceSource Setup')
    sleep 5
    click_link('Success Plan Templates')
    puts "clicked successfully"
    sleep 2
    click_on "Create New"
    puts "Creating a new SPT"
    sleep 2
    fill_in "Template Name",:with => arg1
    sleep 2
    within(".pbBottomButtons") do
     click_on "Create"
    end
    puts "Successfully created SPT" 
    sleep 10
    if page.has_content?('Define Success Plan Phases')
      puts "Define Success Plan Phases section displayed"
      sleep 3
    else
      raise "Define Success Plan Phases section not displayed"
    end
    #first(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").select(arg["OppStage"])
    first(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").find(:xpath, 'option[1]').select_option
    # if first(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").should have_content(arg["OppStage"])
      # puts arg["OppStage"]
    # end
    #puts "Opportunity Location set to "+arg["OppStage"]
    click_on "Add Phase"
    sleep 5
    first(:xpath, "//*[contains(@id, 'csmName')]").set(arg2)
    first(:xpath, "//*[contains(@id, 'csmLength')]").set(arg3)
    sleep 5
    within all(".pbButton")[0] do
          click_on "Save"
        end
    puts "Saved Success Plan Template"
    sleep 5
    if page.has_content?('Template has been saved')
        puts "Template has been saved message displayed after saving"
        sleep 3
    else
      raise "Template has been saved message not displayed"
    end
    if page.has_content?('Phase updates have been saved')
        puts "Phase updates have been saved message displayed after saving"
        sleep 3
    else
      raise "Phase updates have been saved message not displayed"
    end
    if page.has_content?('Define Opportunity Location on Success Plan Timeline')
      puts "Define Opportunity Location on Success Plan Timeline section displayed"
      sleep 3
    else
      raise "Define Opportunity Location on Success Plan Timeline section not displayed"
    end
    if page.has_content?('Define Success Plan Playbooks')
      puts "Define Success Plan Playbooks section displayed"
      sleep 3
    else
      raise "Define Success Plan Playbooks section not displayed"
    end
    click_on "Add Playbook"
    sleep 5
   
    within('.list') do
      tr = first("tbody").all("tr")
      tr.each do |row|
        if row.all("td")[1].text == arg5
          puts row.all("td")[1].text
          row.all("td")[0].all('a')[0].click
          break
        end                        
      end
    end
    puts "Added Playbook Sucessfully"
    sleep 10
    within all(".pbButton")[0] do
          click_on "Save"
        end
    puts "Saved Success Plan Template"

    if page.has_content?('Template has been saved')
        puts "Template has been saved message displayed after saving"
        sleep 3
    else
      raise "Template has been saved message not displayed"
    end
    if page.has_content?('Define Success Plan Indicators')
      puts "Define Success Plan Indicators section displayed"
      sleep 3
    else
      raise "Define Success Plan Indicators section not displayed"
    end
    click_on "Add Indicator"
    puts "Clicked on Add Indicator"
    sleep 10
    within all(".dataRow").last do
      all(".dataCell")[5].first(:xpath, ".//*[contains(@id, 'indicatorTemp:acctplanIndComp:pb1:accountPlanIndicatorsTable:0')]").select(arg8)
    end
    within all(".dataRow").last do
      all(".dataCell")[7].first(:xpath, ".//*[contains(@id, 'indicatorTemp:acctplanIndComp:pb1:accountPlanIndicatorsTable:0')]").select(arg7)
    end
    first(:xpath, "//*[contains(@id, 'indicatorTemp:acctplanIndComp:pb1:accountPlanIndicatorsTable:0:indicator')]").select(arg6)  
    all(:xpath, "//*[contains(@id, 'cr1fv')]").last.set(arg9)
    all(:xpath, "//*[contains(@id, 'cr1tv')]").last.set(arg10)
    sleep 5
    all(:xpath, "//*[contains(@id, 'cr2fv')]").last.set(arg10)
    all(:xpath, "//*[contains(@id, 'cr2tv')]").last.set(arg11)
    sleep 5
    all(:xpath, "//*[contains(@id, 'cr3fv')]").last.set(arg11)
    all(:xpath, "//*[contains(@id, 'cr3tv')]").last.set(arg9)
    sleep 5
    main = page.driver.browser.window_handles.first
    find("img[alt='Indicator Lookup (New Window)']").click
    sleep 5
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    sleep 10
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.list') do
      tr = first("tbody").all("tr")
      tr.each do |row|
        if row.all("th")[0].text == arg4
            row.all("th")[0].all('a')[0].click
            break
        end                        
      end
    end
    sleep 3
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
        sleep 5
   within all(".pbButton")[0] do
          click_on "Save"
        end
    puts "Saved Success Plan Templates"
    sleep 5
    if page.has_content?('Template has been saved')
        puts "Template has been saved message displayed after saving"
        sleep 3
    else
      puts "Template has been saved message not displayed"
    end
    if page.has_content?('Success Plan Template Indicators have been saved')
        puts "Success Plan Template Indicators have been saved message displayed after saving"
        sleep 3
    else
      puts "Success Plan Template Indicators have been saved message not displayed"
    end
    rescue Exception => ex
    putstr "Error occurred while creating SPT"
    putstr_withScreen ex.message
  end 
end
  
Then (/^I create a new Indicator Group with name "(.*?)"$/) do |arg|
  begin
    
    sleep 5
    click_link('Indicator Groups')
    sleep 5
    if all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").count == 0
      click_on "Add Indicator Group"
      sleep 2
      within_window(page.driver.browser.window_handles.last) do
        find(:xpath, "//*[contains(@id, 'itIndicatorGroupNameId')]").set(arg)
        find('#saveNewIndicatorGroupButtonId').click
      end
      sleep 5
      all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Account")
      sleep 3
      all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Annual Revenue")
      click_on "Add Field"
      sleep 4
      all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Opportunity")
      sleep 3
      all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Expected Amount")
      click_on "Add Field"
      sleep 4
      all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Contact")
      sleep 3
      all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Level")
      click_on "Add Field"
      sleep 4
      click_on "Save"
      if page.has_content?('Indicators have been saved')
      puts "Indicators have been saved message displayed after saving"
      sleep 3
    else
      raise "Indicators have been saved message not displayed"
    end
    else
      puts "Indicator Group already exists"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while Creating an Indicator Group"
    putstr_withScreen ex.message
  end
end

Then (/^I add indicator$/) do
begin
  sleep 5
  click_link('Indicator Groups')
  sleep 5
  if all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]").count == 0
    sleep 3
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Account")
    sleep 3
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Annual Revenue")
    click_on "Add Field"
    sleep 4
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Opportunity")
    sleep 3
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Expected Amount")
    click_on "Add Field"
    sleep 4
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slObjectId')]")[0].select("Contact")
    sleep 3
    all(:xpath, "//*[contains(@id, 'pbIndicatorListId:slFieldId')]")[0].select("Level")
    sleep 4
    click_on "Add Field"
    sleep 4
    click_on "Save"
    puts "Indicators have been added"
    sleep 5
    if page.has_content?('Indicators have been saved')
      puts "Indicators have been saved message displayed after saving"
      sleep 3
    else
      putstr "Indicators have been saved message not displayed"
    end
  else
    puts "Indicator Group already exists"
  end
  sleep 3
  rescue Exception => ex
    putstr "Indicators Already exist"
  end
end

Then(/^create new contact with FirstName "(.*?)" and LastName "(.*?)" and email "(.*?)"$/) do |arg1,arg2,arg3|
  begin
    click_on "New"
    sleep 2
    puts "Creating a new Account"
    sleep 4
    fill_in "name_firstcon2",:with => arg1
    puts "Filled value for First name"
    sleep 4
    fill_in "name_lastcon2",:with => arg2
    puts "Filled value for Last name"
    sleep 4
    fill_in "con15",:with => arg3
    puts "Filled value for Email" 
   within(:id,"topButtonRow") do
      click_on "Save"
    end

    puts "Account  successfully created For"+arg
  rescue Exception => ex
    puts "Error occurred while creating Account"
    puts ex.message
  end
end


Then(/^I create new Account with value "(.*?)"$/) do |arg|
  begin

    click_on "New"
    sleep 2
    puts "Creating a new Account"
    sleep 4
    fill_in "acc2",:with => arg
    puts "Filled value for Account name"
    sleep 1

    find("option[value='Healthy']").click
     sleep 3
      fill_in 'Annual Revenue', :with => 1000
      
    sleep 5
    within(:id,"topButtonRow") do
      click_on "Save"
    end

    puts "Account  successfully created For"+arg
  rescue Exception => ex
    puts "Error occurred while creating Account"
    puts ex.message

  end
end

And(/^create a new FC with value "(.*?)" with "(.*?)"$/) do |arg1,arg2|
  begin
    click_link('Focus Categories')
    puts "Clicked Focus Categories link successfully"
    sleep 2
    select arg2, :from => "thePage:theForm:pbFocusCategoryList:selList1"
    click_on "Create New"
    sleep 2
    fill_in "Display Name",:with => arg1
    click_on "Create"
    sleep 5
    click_on "Save"
    puts "Successfully created Focus Category"
    if page.has_content?('Focus Category View Criteria')
      puts "Focus Category View Criteria section displayed"
      sleep 3
    else
      raise "Focus Category View Criteria section not displayed"
    end
    if page.has_content?('Focus Category View Columns')
      puts "Focus Category View Columns section displayed"
      sleep 3
    else
      raise "Focus Category View Columns section not displayed"
    end
  rescue Exception => ex
    putstr "Error occurred while creating a Focus Category"
    putstr_withScreen ex.message
  end
end

And(/^create a new Play with value "(.*?)" and "(.*?)" object and "(.*?)"$/) do |arg1,arg2,arg3| 
  begin

    click_link('Plays')
    puts "Opened Plays Page successfully"
    sleep 2
    click_on "Create Play"
    sleep 2
    fill_in "Display Name",:with => arg1
    fill_in "Short Description",:with => arg3
    find(:xpath, "//*[contains(@id, 'slObjectId')]").select(arg2)
    all('.btn')[0].click
    sleep 5
    puts "Successfully created Play"
    
  rescue Exception => ex
    putstr "Error occurred while creating a Play"
    putstr_withScreen ex.message
  end
end

And(/^I Add Criteria on Play with field "(.*?)"$/) do |arg|
  begin
    sleep 8
    if page.has_content?('Define Play Criteria')
      puts "Define Play Criteria section displayed"
      sleep 3
    else
      raise "Define Play Criteria section not displayed"
    end
    if page.has_content?('Define Play Tasks')
      puts "Define Play Tasks section displayed"
      sleep 3
    else
      raise "Define Play Tasks section not displayed"
    end
    sleep 10
    amt = 500000
    if all(".dataRow").count > 0
      all(".dataRow").each do |row|
        if row.all("td")[1].text == arg
          row.first(:link,"Delete").click
        break
        end
      end
    end
    first(:xpath, "//*[contains(@id, 'slFieldId')]").select(arg)
    sleep 8
    first(:xpath, "//*[contains(@id, 'outOperator')]").select(">")
    sleep 8
    first(:xpath, "//*[contains(@id, 'outValue')]").set(amt)
    sleep 8
    first(:xpath, "//*[contains(@id, 'outValue')]").set(amt)
    all('.btn')[0].click
    sleep 10
    if page.has_content?('Play Criteria have been saved')
      puts "Play Criteria have been saved"
      sleep 3
    else
      raise "Play Criteria have been saved message not displayed"
    end
    
  rescue Exception => ex
    putstr "Error occurred while creating a Play"
    putstr_withScreen ex.message
  end
end

And(/^I Add its TaskName "(.*?)" and its task type "(.*?)" and AssignTo "(.*?)" and Description "(.*?)" and days "(.*?)"$/) do |arg1,arg2,arg3,arg4,arg5|
  begin
    sleep 9
    click_on "Add Task"
    sleep 10

    all(:xpath, "//*[contains(@id, 'inputName')]").last.set(arg1)
    all(:xpath, "//*[contains(@id, 'playTaskComp:playTaskComp:pb1:taskList:0:coltype')]").last.select(arg2)
    all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDesc')]").last.set(arg4)
    all(".dataRow").last.all("td")[5].first("select").select(arg3)
    all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDays')]").last.set(arg5)
    all('.btn')[0].click
    sleep 10
    if page.has_content?('Play Tasks have been saved')
      puts "Play Tasks have been saved message displayed"
      sleep 3
    else
      raise "Play Tasks have been saved message not displayed"
    end
  rescue Exception => ex
    putstr "Error occurred while creating a Play"
    putstr_withScreen ex.message
  end
end

And(/^create a new Playbook with value "(.*?)" with play "(.*?)" and its Short Description "(.*?)" and Object "(.*?)" and its TaskName "(.*?)" and its task type "(.*?)" and AssignTo "(.*?)" and Description "(.*?)" and days "(.*?)"$/) do |arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9|
  begin
    arg = getDetails "PlayBook Details"
    sleep 5
    click_link('Playbooks')
    puts "Clicked Playbooks successfully"
    sleep 2
    click_on "Create New"
    sleep 8

    fill_in "Display Name",:with => arg1

    all('.btn')[0].click
    sleep 6
    puts "Successfully created Playbook"
    if page.has_content?('Define Playbook Plays')
      puts "Define Playbook Plays section displayed"
      sleep 6
    else
      raise "Define Playbook Plays section not displayed"
    end
    sleep 6
    click_on "Add Play"
    sleep 5

    addFound = 0
    all(".dataRow").each do |tr|
      if tr.all(".dataCell")[1].text == arg2
        tr.all(".dataCell")[0].all('a')[0].click
      addFound = 1
      break
      end
    end
    if addFound == 0
      click_on "Cancel"
      sleep 5
      click_on "Create Play"
      sleep 2
      fill_in "Display Name",:with => arg2
      fill_in "Short Description",:with => arg3
      find(:xpath, "//*[contains(@id, 'slObjectId')]").select(arg4)
      all('.btn')[0].click
      sleep 5
      puts "Successfully created Play"
      if page.has_content?('Define Play Criteria')
        puts "Define Play Criteria section displayed"
        sleep 3
      else
        raise "Define Play Criteria section not displayed"
      end
      if page.has_content?('Define Play Tasks')
        puts "Define Play Tasks section displayed"
        sleep 3
      else
        raise "Define Play Tasks section not displayed"
      end
      sleep 10
      amt = 500000
      if all(".dataRow").count > 0
        all(".dataRow").each do |row|
          if row.all("td")[1].text == "Annual Revenue"
            row.first(:link,"Delete").click
          break
          end
        end
      end
      first(:xpath, "//*[contains(@id, 'slFieldId')]").select("Annual Revenue")
      sleep 8
      first(:xpath, "//*[contains(@id, 'outOperator')]").select(">")
      sleep 8
      first(:xpath, "//*[contains(@id, 'outValue')]").set(amt)
      sleep 8
      all('.btn')[0].click
      sleep 10
      if page.has_content?('Play Criteria have been saved')
        puts "Play Criteria have been saved"
        sleep 3
      else
        raise "Play Criteria have been saved message not displayed"
      end
      click_on "Add Task"
      sleep 10
      taskArg = getDetails "Play Tasks"
      all(:xpath, "//*[contains(@id, 'inputName')]").last.set(arg5)
      all(:xpath, "//*[contains(@id, 'playTaskComp:playTaskComp:pb1:taskList:0:coltype')]").last.select(arg6)
      all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDesc')]").last.set(arg8)
      all(".dataRow").last.all("td")[4].first("select").select(arg7)
      all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDays')]").last.set(arg9)
      all('.btn')[0].click
      sleep 10
      if page.has_content?('Play Tasks have been saved')
        puts "Play Tasks have been saved message displayed"
        sleep 3
      else
        raise "Play Tasks have been saved message not displayed"
      end
      sleep 2
      all('.btn')[2].click
      puts "Created Play and added Play to Playbook"
    end
    sleep 3
    found = 0
    fill_in "Search:",:with => arg2
    sleep 2
    all(".dataRow").each do |tr|
      if tr.all(".dataCell")[1].text == arg2
      found = 1
      break
      end
    end
    sleep 5
    if found==1
      puts "#{arg2} Play added to Playbook and displayed in Play grid"
      sleep 4
    else
      raise "#{arg2} Play not displayed in Play grid"
      sleep 4
    end
  rescue Exception => ex
    putstr "Error occurred while creating Playbook"
    putstr_withScreen ex.message
  end
end

Then(/^I create a SuccessPlan with template "(.*?)" with Account "(.*?)"$/) do |arg,arg1|
  begin
    puts "Create a new Success Plan"
    
    click_on "New"
    puts "New button is clicked successfully"
    puts "I am Standing on Success Plan Edit page"
    sleep 10
    fill_in "Success Plan Template",:with => arg
    puts "Success plan Template is selected successfully"
    sleep 8
    fill_in "Account",:with => arg1
    puts "Account is Selected successfully"
    sleep 8
    time = Time.new
    fill_in "Phase Start Date",:with => time.month.to_s + "/" + time.day.to_s + "/" +time.year.to_s
    puts "Date is filled in Phase Date"
    sleep 2
    within all(".pbButton")[0] do
      click_on "Save"
      sleep 3
      puts "Save Button is clicked successfully"
    end
  rescue Exception => ex
    putstr "Error occurred while creating SPT"
    putstr_withScreen ex.message
  end
end

And(/^create a new FC group with value "(.*?)"$/) do |arg1|
  begin
   
    fcgName = arg1
    puts "fcgNmae"+fcgName
    click_link('Focus Category Groups')
    puts "Clicked Focus Categories Group link successfully"
    found = false
    sleep 4
    within all(".pbBody")[0] do
      rows = all(:css,"tr .dataRow")
      rows.each do |row|
        if row.all("td")[3].first("input").value == fcgName
          puts "Focus Category Group is already exists"
        found = true
        break
        end
      end
    end
    if !found
      find(".requiredInput").first("input").set(fcgName)
      first(:xpath, "//*[contains(@id, 'categoryGroupTypeSectionItem:categoryGroupTypeSL')]").select("Main")
      click_on "Create New"
      sleep 5
      find(:xpath, "//input[@value='Save']").click
      puts "Successfully created Focus Category"
    #break
    end

    if page.has_content?('Successfully Saved Focus Category Group')
      puts "Successfully Saved Focus Category Group message displayed"
      sleep 3
    else
      puts "Successfully Saved Focus Category Group message not displayed"
    end

  rescue Exception => ex
    putstr "Error occurred while creating a Focus Category Group"
    putstr_withScreen ex.message
  end
end

Then(/^create new Tasks with Type "(.*?)" and its FCView "(.*?)" with SPPL "(.*?)" with Account "(.*?)" with status "(.*?)"$/) do |arg1,arg2,arg3,arg4,arg5|
  begin
    sleep 8
    arg=getDetails "Taskdetails"
    sleep 2
    first(:xpath, "//*[contains(@id, 'selTasks')]").select(arg2)
    sleep 6
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys ''
    end
    puts "Selected First Task Category"
    click_on "Create Task"
    sleep 8
    time = Time.new
    currentDate = "#{Time.now.strftime("%m-%d-%Y")}"
    time = Time.new
    taskCreationTime = time.hour.to_s + time.min.to_s + time.sec.to_s
    $taskName = "Automation" + taskCreationTime

    within all('.pbSubsection').last do
      sleep 5
      first(:xpath, "//*[contains(@id, 'dueValue')]").set(currentDate)
      sleep 5
      first(:xpath, "//*[contains(@id, 'taskNameValue')]").click
      #first(:xpath, "//*[contains(@id,'taskNameValue')]").set("Call")
      first(:xpath, "//*[contains(@id,'taskNameValue')]").set($taskName)
      first(:xpath, "//*[contains(@id,'successPlanPlayValue')]").click
      first(:xpath, "//*[contains(@id,'successPlanPlayValue')]").set(arg3)

      ####
      first(:xpath,"//*[contains(@id, 'taskTypeValue')]").select(arg1)
      within(:xpath, "//*[contains(@id,'relatedToBlockPanel')]") do
        first(:css, "input[id$='relatedToValue']").click
        sleep 2
        first(:css, "input[id$='relatedToValue']").set(arg4)
        sleep 2
      end
      first(:xpath, "//*[contains(@id, 'commentsValue')]").click
      #first(:xpath, "//*[contains(@id, 'commentsValue')]").set(arg["CommentsValue"])
      first(:xpath, "//*[contains(@id, 'taskStatusValue1')]").select(arg5)
    end
    sleep 8
    within(".pbButtonb") do
      click_on "SAVE"
    end
    within(".pbButtonb") do
      click_on "SAVE"
      puts"Created task for the focus"
    end
    sleep 10
  rescue Exception =>ex
    putstr "Error while creating the new task"
    putstr_withScreen ex.message
  end
end


And(/^I click on Edit Button$/)do 
  begin
     click_link('Edit')
     puts "Successfully clicked on Edit Button"
     sleep 10
  rescue Exception =>ex
    putstr "Error while clicking on Edit Button"
    putstr_withScreen ex.message
  end
end


And(/^I fill the Details in the FC$/)do 
  begin
  
  arg = getDetails "FCTask" 
 
  find(:xpath,"//*[contains(@id,'categoryGroupNameSectionItem')]/ancestor::th/following-sibling::td/input").set(arg["FCCategory"])
  sleep 5
  find(:xpath,"//*[contains(@id,'focusCategoryColumnNameIT')]").set(arg["Task"])
  sleep 5
  click_link('Create New')
  sleep 2
  
  puts "Successfully fill the Details in Focus Category"
  rescue Exception =>ex
    putstr "Error while filling the details in FC"
    putstr_withScreen ex.message
  end
end

And(/^I Select FC Task$/)do 
  begin
  arg = getDetails "FCTask" 
  first(:xpath,"//*[contains(@id,'selectObjectType')]").select(arg["Task"]) 
  sleep 2
  first(:xpath,"//*[contains(@id,'selectfocusCategoryView')]").select(arg["FCView4Overview"])  
  sleep 1
  click_link('Add Category')
  sleep 3
  puts "Successfully Selected the FC Task"
  sleep 10
  first(:button,'Save').click
  sleep 8
  rescue Exception =>ex
    putstr "Error while clicking on Edit Button"
    putstr_withScreen ex.message
  end
end

And(/^create a new Play with value "(.*?)" and "(.*?)" and "(.*?)" and its first TaskName "(.*?)" and its task type "(.*?)" and AssignTo "(.*?)" and Description "(.*?)" and days "(.*?)" its second TaskName "(.*?)" and its task type "(.*?)" and AssignTo "(.*?)" and Description "(.*?)" and days "(.*?)" its third TaskName "(.*?)" and its task type "(.*?)" and AssignTo "(.*?)" and Description "(.*?)" and days "(.*?)" its fourth TaskName "(.*?)" and its task type "(.*?)" and AssignTo "(.*?)" and Description "(.*?)" and days "(.*?)"$/) do |arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9,arg10,arg11,arg12,arg13,arg14,arg15,arg16,arg17,arg18,arg19,arg20,arg21,arg22,arg23| 
 begin
        click_link('Plays')
    puts "Opened Plays Page successfully"
    sleep 2
    click_on "Create Play"
    sleep 2
    fill_in "Display Name",:with => arg1
    fill_in "Short Description",:with => arg3
    find(:xpath, "//*[contains(@id, 'slObjectId')]").select(arg2)
    all('.btn')[0].click
    sleep 5
    puts "Successfully created Play"
    if page.has_content?('Define Play Criteria')
      puts "Define Play Criteria section displayed"
      sleep 3
    else
      raise "Define Play Criteria section not displayed"
    end
    if page.has_content?('Define Play Tasks')
      puts "Define Play Tasks section displayed"
      sleep 3
    else
      raise "Define Play Tasks section not displayed"
    end
    # sleep 10
     amt = 50
    # if all(".dataRow").count > 0
      # all(".dataRow").each do |row|
        # if row.all("td")[1].text == "Annual Revenue"
          # row.first(:link,"Delete").click
        # break
        # end
      # end
    # end
    sleep 10
    click_on "Add Criteria"
    sleep 10
    first(:xpath, "//*[contains(@id, 'slFieldId')]").select("Amount")
    sleep 8
    first(:xpath, "//*[contains(@id, 'outOperator')]").select(">")
    sleep 8
    first(:xpath, "//*[contains(@id, 'outValue')]").set(amt)
    sleep 8
    first(:xpath, "//*[contains(@id, 'outValue')]").set(amt)
     all('.btn')[0].click
    sleep 10
    if page.has_content?('Play Criteria have been saved')
      puts "Play Criteria have been saved"
      sleep 3
    else
      raise "Play Criteria have been saved message not displayed"
    end
    click_on "Add Task"
    sleep 10

    all(:xpath, "//*[contains(@id, 'inputName')]").last.set(arg4)
    all(:xpath, "//*[contains(@id, 'playTaskComp:playTaskComp:pb1:taskList:0:coltype')]").last.select(arg5)
    all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDesc')]").last.set(arg7)
    all(".dataRow").last.all("td")[5].first("select").select(arg6)
    all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:0:inputDays')]").last.set(arg8)
     all('.btn')[0].click
    # within('.dataRow even')
    sleep 10
    click_on "Add Task"
    sleep 10
     all(:xpath, "//*[contains(@id, 'inputName')]").last.set(arg9)
     sleep 8
     all(:xpath, "//*[contains(@id, 'playTaskComp:playTaskComp:pb1:taskList:1:coltype')]").last.select(arg10)
      sleep 8
     all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:1:inputDesc')]").last.set(arg12)
      sleep 8
     all(".dataRow").last.all("td")[5].first("select").select(arg11)
      sleep 8
     all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:1:inputDays')]").last.set(arg13)
    
    sleep 10
    click_on "Add Task"
    sleep 10
     all(:xpath, "//*[contains(@id, 'inputName')]").last.set(arg14)
     sleep 8
     all(:xpath, "//*[contains(@id, 'playTaskComp:playTaskCp:pb1:taskList:2:coltype')]").last.select(arg15)
      sleep 8
     all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:2:inputDesc')]").last.set(arg17)
      sleep 8
     all(".dataRow").last.all("td")[5].first("select").select(arg16)
      sleep 8
     all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:2:inputDays')]").last.set(arg18)
     all('.btn')[0].click
     sleep 10
    click_on "Add Task"
    sleep 10
     all(:xpath, "//*[contains(@id, 'inputName')]").last.set(arg19)
     sleep 8
     all(:xpath, "//*[contains(@id, 'playTaskComp:playTaskComp:pb1:taskList:3:coltype')]").last.select(arg20)
      sleep 8
     all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:3:inputDesc')]").last.set(arg22)
      sleep 8
     all(".dataRow").last.all("td")[5].first("select").select(arg21)
      sleep 8
     all(:xpath, "//*[contains(@id, 'playTaskComp:pb1:taskList:3:inputDays')]").last.set(arg23)
    sleep 10
    all('.btn')[0].click
    sleep 10
    if page.has_content?('Play Tasks have been saved')
      puts "Play Tasks have been saved message displayed"
      sleep 3
    else
      raise "Play Tasks have been saved message not displayed"
    end
  rescue Exception => ex
    putstr "Error occurred while creating a Play"
    putstr_withScreen ex.message
  end
end 

