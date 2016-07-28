#All MasterDetailCreation Specific Step Definitions
#All Scenario mentioned in MasterDetailCreation.feature

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

    sleep 1
    within(:id,"topButtonRow") do
      click_on "Save"
    end

    puts "Account  successfully created For"+arg
  rescue Exception => ex
    puts "Error occurred while creating Account"
    puts ex.message

  end
end

And(/^create a new FC with value "(.*?)"$/) do |arg|
  begin

    click_link('Focus Categories')
    puts "Clicked Focus Categories link successfully"
    sleep 2
    select "Account", :from => "thePage:theForm:pbFocusCategoryList:selList1"
    click_on "Create New"
    sleep 2
    fill_in "Display Name",:with => arg
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

And(/^create a new Play with value "(.*?)" and "(.*?)" and "(.*?)" and its TaskName "(.*?)" and its task type "(.*?)" and AssignTo "(.*?)" and Description "(.*?)" and days "(.*?)"$/) do |arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8|
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






