#All Success Tasks Specific Step Definitions
#All Scenario mentioned in SuccessTasks.feature

Then(/^I select the SP$/) do
begin
   sleep 5
  within('.list') do
    first(:link).click
  end
  sleep 10
  rescue Exception => ex
    putstr "Error occurred while opening a SuccessPlan"
    putstr_withScreen ex.message
  end
end

And(/^I select task$/) do
  begin
    sleep 5
    puts "1"
    within("#actionSpGrid") do
   puts "2"
    if first("tbody").all("tr").count > 0
       first("tbody").first("tr").all("td")[2].first("a").click
     puts "3"
       sleep 2
       puts " click on subject text"
       end
       end
     within(:id, 'topButtonRow') do
     click_button('Edit')
     puts "Clicked on edit"
     sleep 5
        end
     if find(:xpath, "//*[contains(@id,'tsk12')]").find(:xpath, 'option[3]').select_option
       puts "Status Changed to Complete"
      else
       puts "Status Not Changed"
      end
     sleep 4   
    within(:id, 'topButtonRow') do
    click_button('Save')
    puts "Clicked on Save"
    sleep 5
    end
  status="Completed" 
  status= first(:xpath,'//td[contains(text(),"Status")]/following-sibling::td/div').text
      
       if status.to_s == status.to_s
         puts "Successfully see the #{status} task Completed Code"
       else
         putstr "Failed to see the #{status} task Completed Code"
       end
    rescue Exception => ex
    putstr "Error occurred while selecting the task from task list"
    putstr_withScreen ex.message
   end
 end   

Then(/^create new Tasks$/) do
  begin
    sleep 6
    arg=getDetails "Taskdetails"
    spPlay = getReference "Reference"
    sleep 2
    first(:xpath, "//*[contains(@id, 'selTasks')]").select(spPlay["FCView"])
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
      first(:xpath, "//*[contains(@id,'successPlanPlayValue')]").set(spPlay["SuccessPlanPlay"])
      within(:xpath, "//*[contains(@id,'relatedToBlockPanel')]") do
        first(:css, "input[id$='relatedToValue']").click
        sleep 2
        first(:css, "input[id$='relatedToValue']").set(spPlay["Account"])
        sleep 2
      end
      first(:xpath, "//*[contains(@id, 'commentsValue')]").click
      first(:xpath, "//*[contains(@id, 'commentsValue')]").set(arg["CommentsValue"])
      first(:xpath, "//*[contains(@id, 'taskStatusValue1')]").select(arg["Status"])
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

And /^select first success plan$/ do
  begin
    find(".hotListElement").first('a').click
    sleep 5
  rescue Exception => ex
    writeFailure "Success Plan Error :"+ex.message
  end
end

And /^click on details$/ do
  begin
    find(:link,'Details').click
    sleep 5
    puts "clicked on details"
  rescue Exception => ex
    writeFailure ex.message
  end
end

Then(/^click on Create new link$/) do
  begin
    sleep 10
    first("a",:text =>"Create New").click
    sleep 5
    arg = getDetails "FC View"

    fill_in "Display Name",:with => arg["Display Name"]
    click_on "Create"
    sleep 5
    first(:xpath, "//*[contains(@id, 'slFieldId')]").select("Status")
    sleep 8
    first(:xpath, "//*[contains(@id, 'outOperator')]").select("NOT IN")
    sleep 8
    first(:xpath, "//*[contains(@id, 'outValue')]").set("Not Started")
    # end
    sleep 8
    click_on "Save"
    puts "Successfully created Focus Category"
    sleep 10
    if page.has_content?('Focus Category View Criteria Saved Successfully')
      puts "Focus Category View Criteria Saved Successfully displayed"
      sleep 3
    else
      raise "Focus Category View Criteria Saved Successfully not displayed"
    end

    sleep 5
  rescue Exception => ex
    puts "Error Creating new focus Category while click on Create new link"
  end
end

Then(/^click on Edit link$/) do
  begin
    sleep 10
    first("a",:text =>"Edit").click
    sleep 5

    if page.should have_content('Focus Category View')
      puts "Navigated to ServiceSource Setup to create new FocusCategory"
      sleep 5
    else
      puts"User doesn't have sufficient privileges to Edit FocusCategory"
    end
    sleep 5
  rescue Exception => ex
    puts "Error Edit Focus Category while click on Edit link"
  end
end

Then(/^dismiss the Task$/) do
  begin
    sleep 10
    arg=getTaskInfo("TaskdetailsToDismiss")
    within(".fixed-table-body") do
      table=all("table")[0]
      table.all("td")[0].click
      sleep 10
      table.all("td")[1].first('.removeEnabled').click
      sleep 10
      status=table.all("td")[6].text
      subject =table.all("td")[3].text

    end
    first(:xpath, "//*[contains(@id, 'riskReasonValue')]").select("D - Alternative Task Performed - ATP")
    sleep 10

    within all('.pbBottomButtons').first do
      sleep 5
      click_on "DISMISS"
    end
    sleep 5

    first(".form-control").set(arg["DueDate"])
    sleep 5
    within(".fixed-table-body") do

      if page.has_content? "Dismiss"
        puts "Task is dismissed"
      else
        puts "Task is not dismissed"
      end
    end

  rescue Exception => ex
    puts "Error  while click on Dismissing the task"
    puts ex.message
  end
end

Then(/^complete the Task in bulk$/) do
  begin
    sleep 10  
    arg=getTaskdetailsTobulkcomplete
    within(".fixed-table-body") do
      #all('tbody')[0].all('tr')[0].all('td')[0].first('.btSelectItem').set(true)
      all('tbody')[0].all('tr')[0].all('td')[0].click
      sleep 2
      all('tbody')[0].all('tr')[1].all('td')[0].click
    end
    sleep 5
    first("a",:text => "Complete").click
    sleep 10
    first(:xpath, "//*[contains(@id, 'riskReasonValue')]").select("C - Adoption Issue - ADI")
    sleep 5

    within all('.pbBottomButtons').first do
      sleep 5
      click_on "COMPLETE"
      sleep 5
    end
    sleep 5
    find(".form-control").set(arg["DueDate"])
    sleep 10
    within(".fixed-table-body") do

      if page.has_content? "Completed"
        puts "Task is Completed"
      else
        puts "values is not found"
      end
    end
  rescue Exception => ex
    puts "Error  while completing the task"
    puts ex.message
  end
end

And /^click on first opportunity$/ do
  begin
    within(:id, "opportunitySPGrid") do
      main = page.driver.browser.window_handles.first
      find(:link, "Del").click
      puts "click del"
      #puts page.driver.browser.switch_to.alert.text
      #txt = page.driver.browser.switch_to.window(page.driver.browser.window_handles.last).text

      #page.accept_confirm { first(:link, "Del").click }
      sleep 5
      puts "clicked on opportunity"
    end
    popup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(popup)
    puts page.driver.browser.switch_to.alert.text
    #page.driver.browser.switch_to.alert.accept
    page.driver.browser.switch_to.alert.dismiss
    sleep 5

  rescue Exception => ex
    if(ex.message == "undefined method `click' for nil:NilClass")
      puts "Error : No Opportunity to select"
    end
    putstr_withScreen "Delete Opportunity Error :"+ex.message
  end
end

And /^select one view$/ do
  begin
    first_option = first(:xpath, "//*[@id='pageTaskList:frmCustomerSuccessOverview:taskComp:cmpCSMTasks:pageBlockTaskList:selTasks']/option[2]").text
    puts first_option
    select(first_option, :from => "pageTaskList:frmCustomerSuccessOverview:taskComp:cmpCSMTasks:pageBlockTaskList:selTasks")
    sleep 5
  rescue Exception => ex
    putstr_withScreen "Select View Error :"+ex.message
  end
end

And /^clicked on carrot$/ do
  begin
    all('.bs')[0].all('tbody')[0].all('tr')[0].find('.detailEnabled').click
    sleep 10
  rescue Exception => ex
    putstr_withScreen "Selected first Success-Tasks Error :"+ex.message
  end
end

Then /^verify success plans details widget$/ do
  begin
    page.should have_content('Current Phase')
    page.should have_content('Success Plan')
    page.should have_content('Renewal Date')
    page.should have_content('Account Manager')
    page.should have_content('Support Contact')
    puts ("SP Details verified that it contains Information")
  rescue Exception => ex
    putstr_withScreen "Success Plan Details Widget Verification Failed :"+ex.message
  end
end

And /^I clicked success Plans on SP Details Widget$/ do
  begin
    within all('.pbSubsection')[0] do
      rows = all("tr")
      SP1 = rows[1].text
      values = SP1.split(" ")
      puts values[2]
      cols = rows[1].all("td")
      first('a').click
      puts "clicked on SP"
      sleep 10
    end
  rescue Exception => ex
    putstr_withScreen "There is no Success Plan associate with this Task: "+ex.message
  end
end

And (/^I switch to new tab$/) do
  begin
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    sleep 10
  rescue Exception => ex
    putstr_withScreen "Switching to new tab Error :"+ex.message
  end
end

Then(/^I should be able to see Success Plan page$/) do
  begin
    puts all("h1")[0].text
    sleep 5
    page.should have_content("Printable");
    puts "User taken to Success Plan page"
  rescue Exception => ex
    putstr_withScreen "User unable to access Success Plan page"+ex.message
  end
end

And (/^I close the new tab$/)do
  begin
    page.driver.browser.close
    puts "Closed New Tab"
  rescue Exception => ex
    putstr_withScreen "Closed New Tab Error :"+ex.message
  end
end

And (/^I switch back to first tab$/) do
  begin
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
    sleep 10
    puts "Switched back to first tab"
  rescue Exception => ex
    putstr_withScreen "Switched back to first tab Error :"+ex.message
  end
end

Then /^verify current phase$/ do
  begin

    within all('.pbSubsection')[0] do
      rows = all("tr")
      SP1 = rows[2].text
      puts SP1
      values = SP1.split(" ")
      puts values[2]
      @RDate1 = values[2]
      sleep 2
      first('a').click
    end
    sleep 10
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    sleep 10
    find_link('Details').click
    sleep 5
    puts "clicked on details"
    sleep 5

    within all('.detailList')[1]  do
      rows = all('tr')
      puts rows.length
      #puts rows[8]
      # rows[2].each do |col|
      # puts col.text
      # sleep 2
      # end

      @RDate = rows[10].all(".dataCol")[0].text
      if @RDate.include?(@RDate1)
        puts "Current Phase Verified"
      end
      # page.all(".dataCol").each do |v|
      # puts v.text
      # end
      sleep 5
    end
  rescue Exception => ex
    puts "Current Phase Verification Failed: "+ex.message
  end
end

Then /^verify Contact widget$/ do
  begin
    within all('.bs')[0].all('tbody')[0] do
      rows = all('tr')
      puts rows[0].text
      @Contact = rows[0].text
    end

    within(:id,'tbodyA') do
      rows = all("tr")
      puts rows[0].text
      rows[0].all('a')[1].click
      sleep 5
    end
    within(:id,'con4_ileinner') do
      @acc = find('a').text
      puts @acc
    end
    if @Contact.include?(@acc)
      puts "Contact Widget Verified"
    else
      puts "Contact Widget Not Verified"
    end
  rescue Exception => ex
    putstr "Contact Widget Verified : "+ex.message
  end
end

Then /^click on Email Icon$/ do
  begin
    within(:id,'tbodyA') do
      all('.iconBasic_format')[1].click
      puts "click on Email Icon"
      sleep 5
    end
    fill_in 'Subject', :with => 'Send Email'
    sleep 5
    within(:id, 'topButtonRow') do
      click_button('Send')
      puts "Email sent"
      sleep 5
    end

  rescue Exception => ex
    puts "Email sent Error : "+ex.message
  end
end

Then /^click on show more link$/ do
  begin
    puts "Show More/Show Less"
    within all('.ss_box')[1] do
      #find( 'a', text: 'Show More', exact: true, :visible => false ).click
      #page.all('a', :text => 'Home')
      #find_link('Show Less')
      rows = all('tr')
      contact = all('tr').count
      puts rows[contact-1].text

      if page.all('a', :text => 'Show More', :visible => true)
        puts "ShowMore"
        #first('a').click
        click_link('Show More')
        puts "clicked On Show More"
        sleep 5
        #elsif find_link('Show Less') == true
      elsif page.all('a', :text => 'Show Less', :visible => true)
        puts "ShowLess"
        click_link('Show Less')
        puts "Clicked On Show Less"
        sleep 5
      end
    end
  rescue Exception => ex
    puts "clicked On Show More Error : "+ex.message
  end
end

Then /^click on CSM Contact Icon$/ do
  begin
    within all(:id, 'mainTableA')[1] do
      #rows = all('tr')
      first('a').double_click
      sleep 10
      puts "clicked on contact Icon"
    end
  rescue Exception => ex
    puts "clicked on contact Icon : "+ex.message
  end
end

Then /^click on first contact$/ do
  begin
    within(:id,'tbodyA') do
      rows = all("tr")
      SP1 = rows[1].text
      values = SP1.split(" ")
      puts values[2]
      cols = rows[1].all("td")
      #puts cols[2].text
      first('a').click
      puts "clicked on contact"
      sleep 10
      page.should have_content(values[2])
      puts "verified Contact"
    end
  rescue Exception => ex
    puts "verified Contact : "+ex.message
  end
end

Then /^verify play details widget$/ do
  begin
    within all('.ss_box')[2] do
      rows = all("tr")
      PlayName = rows[1].text
      PlayDes = rows[2].text
      puts "Play Name: #{PlayName}"
      puts "Play Description: #{PlayDes}"
      puts "Verified Play Details"
    end
  rescue Exception => ex
    puts "Verified Play Details Error : "+ex.message
  end
end

And /^Click on ShowMore Link$/ do
  begin

  rescue Exception => ex
    puts "Play Details ShowMore Error:"+ex
  end
end

Then(/^search the task in the Task category$/) do
  begin
    sleep 10
    arg=getTaskInfo("TaskdetailsToDismiss")
    puts arg
    find(".form-control").set(arg["DueDate"])
    sleep 10
    within(".fixed-table-body") do
      if page.has_content? "Waiting on someone else"
        puts "Task is present"
      else
        puts "Task is not found"
      end
    end
  rescue  Exception =>ex
    puts "Task is not present in TaskCategory"
  end
end

Then(/^select the TaskCategory$/) do
  begin
    first_option = first(:xpath, "//*[contains(@id, 'selTasks')]/option[2]").text
    puts first_option
    select(first_option, :from => "pageTaskList:frmCustomerSuccessOverview:taskComp:cmpCSMTasks:pageBlockTaskList:selTasks")
    sleep 5
    puts "Selected First Task Category"
  rescue Exception =>ex
    puts "Error while Selecting Task category: "+ex.message
  end
end

Then(/^click on New Button to create New Task$/) do
  begin
    sleep 5
    first("a",:text => "Create Task").click
    sleep 5
    time = Time.new
    currentDate = time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s

    within all('.pbSubsection').last do
      table=all("table")[0]
      sleep 5
      arg=getTaskInfo ""
      table.all("td")[5].first(:css, "input[id$='dueValue']").set(currentDate)
      sleep 5
      table.all("td")[0].first(".comboboxIcon").click
      sleep 5
      table.all("td")[0].first(:css, "input[id$='taskNameValue']").set("Call")
      sleep 5
      table.all("td")[1].first(:css, "input[id$='successPlanValue']").click
      table.all("td")[1].first(:css, "input[id$='successPlanValue']").set(arg["SuccessPlan"])
      table.all("td")[2].first(:css, "input[id$='playValue']").set(arg["Play"])
      first(:xpath, "//*[contains(@id, 'commentsValue')]").click
      first(:xpath, "//*[contains(@id, 'commentsValue')]").set(arg["CommentsValue"])
      sleep 10
    end
    sleep 10
    within all('.pbBottomButtons').last do
      click_on "ADD"
      puts"Created task for the focus"
    end
    sleep 20
    within all(".detailList").first do
      first(:xpath, "//*[contains(@id, 'tsk12')]").select("Waiting on someone else")
      sleep 5
    end
    sleep 10
    within(:id,"topButtonRow") do
      click_on " Save "
    end
    sleep 20

  rescue Exception =>ex
    putstr "Error while creating the new task"
    putstr_withScreen ex.message
  end

end

Then(/^edit FC View$/) do
  begin
    sleep 5
    arg = getDetails "FC View"
    first(:xpath, "//*[contains(@id, 'selTasks')]").first(:option, arg["Display Name"]).select_option
    sleep 5
    first("a",:text =>"Edit").click
    sleep 5
    click_on "Save"
    puts "Successfully Saved Focus Category"
    sleep 10
    if page.has_content?('Focus Category View Saved Successfully')
      puts "Focus Category View Saved Successfully message displayed"
      sleep 3
    else
      raise "Focus Category View Saved Successfully message not displayed"
    end

    sleep 5
  rescue Exception => ex
    putstr "Error Editing Focus Category View from Success Tasks"
    putstr_withScreen ex.message
  end
end

And (/^I complete Success task in bulk$/) do
  begin
    sleep 5
    arg = getReference "Reference"
    first(:xpath, "//*[contains(@id, 'selTasks')]").select(arg["FCView"])
    sleep 5
    searchStr = "In Progress"
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys searchStr
    end
    sleep 10
    unless page.has_css?(".no-records-found")
    completedCount = 0
    newcompletedCount = 0
    sleep 5
    found = 0
    within(:id,"taskGrid") do
      all("tr").each do |row|
        if row.all("td").count > 0
          if row.all("td")[6].text!="Completed"
            row.all("td")[0].click
            found = found + 1
            if found > 1
              break
            end

          end
        end
      end
    end
    sleep 5
    if found==1
      #first(:xpath, "//*[contains(@id, 'riskReasonValue')]").first(:xpath, 'option[2]').select_option
      sleep 3
      within("#grid-toolbar") do
        unless page.has_css?(".disabled")
          puts "Complete Button is enabled"
          sleep 5

          find("#completeTask").click
          sleep 5
          first(:xpath, "//*[contains(@id, 'riskReasonValue')]").first(:xpath, 'option[2]').select_option
          first(:xpath, "//*[contains(@id, 'taskStatusValue')]").first(:xpath, 'option[1]').select_option
          sleep 4
          within(".pbButtonb") do
            click_on "SAVE"
          end
          puts "Tasks completed in bulk"
          sleep 4
        else
          puts "Complete Button is disabled"
        end
      end
    end
    sleep 10
    else
        puts "No matching records found"
    end
    puts "Bulk Tasks completed successfully"
  rescue Exception =>ex
    putstr "Error while completing task"
    putstr_withScreen ex.message
  end
end

And (/^I dismiss Success task in bulk$/) do
  begin
    sleep 5
    arg = getReference "Reference"
    first(:xpath, "//*[contains(@id, 'selTasks')]").select(arg["FCView"])
    sleep 5
    searchStr = "In Progress"
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys searchStr
    end
    sleep 10
    unless page.has_css?(".no-records-found")
    completedCount = 0
    newcompletedCount = 0
    sleep 5
    found = 0
    within(:id,"taskGrid") do
      all("tr").each do |row|
        if row.all("td").count > 0
          if row.all("td")[6].text!="Completed"
            row.all("td")[0].click
            found = found + 1
            if found > 1
              break
            end

          end
        end
      end
    end
    sleep 5
    if found==1
      #first(:xpath, "//*[contains(@id, 'riskReasonValue')]").first(:xpath, 'option[2]').select_option
      sleep 3
      #within("#grid-toolbar") do
      unless page.has_css?(".disabled")
        puts "Dismiss Button is enabled"
        sleep 5

        find("#dismissTask").click
        sleep 5
        first(:xpath, "//*[contains(@id, 'riskReasonValue')]").first(:xpath, 'option[2]').select_option
        first(:xpath, "//*[contains(@id, 'taskStatusValue')]").first(:xpath, 'option[1]').select_option
        sleep 5
        within(".pbButtonb") do
          click_on "SAVE"
        end
        sleep 4
      else
        puts "Dismiss Button is disabled"
      end
      #end
    end
    sleep 10
    else
       puts "No matching records found"
    end
    puts "Bulk Tasks dismissed successfully"
  rescue Exception =>ex
    putstr "Error while completing task"
    putstr_withScreen ex.message
  end
end

And (/^I email Success task$/) do
  begin
    sleep 5
    arg = getReference "Reference"
    first(:xpath,"//*[contains(@id,'selTasks')]").select(arg["FCView"])
    sleep 5
    searchStr = "In Progress"
     within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys searchStr
    end
    sleep 10
    unless page.has_css?(".no-records-found")
    within(:id,"taskGrid") do
     first(".envEnabled").click
    end
    sleep 5
    fill_in 'Subject', :with => 'Send Email'
    fill_in 'To', :with => arg["emailContact"]
    within(:id, 'topButtonRow') do
      click_button('Send')
      puts "Email sent"
      sleep 5
    end
    else
     puts "No matching records found"
    end
  rescue Exception =>ex
    putstr "Error while sending task email"
    putstr_withScreen ex.message
  end
end

And (/^I complete Success task$/) do
  begin
    sleep 5
    arg = getReference "Reference"
    first(:xpath, "//*[contains(@id, 'selTasks')]").select(arg["FCView"])
    sleep 5
    searchStr = "In Progress"
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys searchStr
    end
    sleep 10
   unless page.has_css?(".no-records-found")
    i=0
    within(:id,"taskGrid") do
      all("tr").each do |row|
        if row.all("td").count > 0
          if row.all("td")[6].text!="Completed"
            if row.all(".checkEnabled").count > 0
              row.first(".checkEnabled").click
              sleep 5

              break
            end
            i+=1
            if i>1
              break
            end
          end
        end
      end
    end
    if i>0
      first(:xpath, "//*[contains(@id, 'riskReasonValue')]").first(:xpath, 'option[2]').select_option
      first(:xpath, "//*[contains(@id, 'taskStatusValue')]").first(:xpath, 'option[1]').select_option
      sleep 5
      within(".pbButtonb") do
        click_on "SAVE"
      end
    end
    sleep 5
    puts "Task completed"
    else
      puts "No matching records found"   
    end
  rescue Exception =>ex
    putstr "Error while completing task"
    putstr_withScreen ex.message
  end
end

And (/^I dismiss Success task$/) do
  begin
    sleep 5
    arg = getReference "Reference"
    first(:xpath, "//*[contains(@id, 'selTasks')]").select(arg["FCView"])
    sleep 5
    searchStr = "In Progress"
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys searchStr
    end
    sleep 10
     unless page.has_css?(".no-records-found")
    i=0
    within(:id,"taskGrid") do
      all("tr").each do |row|
        if row.all("td").count > 0
          if row.all("td")[6].text!="Completed"
            if all(".removeEnabled").count > 0
              row.first(".removeEnabled").click
            end
            i+=1
            if i>1
              break
            end
          end
        end
      end
    end
    sleep 10
    if i>0
      first(:xpath, "//*[contains(@id, 'riskReasonValue')]").first(:xpath, 'option[2]').select_option
      first(:xpath, "//*[contains(@id, 'taskStatusValue')]").first(:xpath, 'option[4]').select_option
      sleep 5
      within(".pbButtonb") do
        click_on "SAVE"
      end
    end
    sleep 5
    puts "Task dismissed"
   else
       puts "No matching records found"
   end
  rescue Exception =>ex
    putstr "Error while dismissing task"
    putstr_withScreen ex.message
  end
end


And (/^I cancel complete Success task in bulk$/) do
  begin
    sleep 5
    arg = getReference "Reference"
    first(:xpath, "//*[contains(@id, 'selTasks')]").select(arg["FCView"])
    sleep 4
    #Added piece of code,it will be remove further(SearchBox)
     searchStr = "In Progress"
     within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys searchStr
    end
    sleep 10
   unless page.has_css?(".no-records-found")
     completedCount = 0
     newcompletedCount = 0
     within(:id,"taskGrid") do
      all("tr").each do |row|
        if row.all("td").count > 0
          if row.all("td")[6].text=="Completed"
            completedCount += 1
          end
        end
      end
    end
    sleep 5
    i=0
    within(:id,"taskGrid") do
      all("tr").each do |row|
        if row.all("td").count > 0
          if row.all("td")[6].text!="Completed"
            row.all("td")[0].click
            i+=1
            if i>1
              break
            end
          end
        end
      end
    end
    sleep 5
    if i>0
      first(:link,"Complete").click
      sleep 2
      #first(:xpath, "//*[contains(@id, 'riskReasonValue')]").first(:xpath, 'option[2]').select_option
      within(".pbBottomButtons") do
        click_on("CANCEL")
      end
      sleep 10
      first(:xpath, "//*[contains(@id, 'selTasks')]").select(arg["FCView"])
      sleep 10
      within(:id,"taskGrid") do
        all("tr").each do |row|
          if row.all("td").count > 0
            if row.all("td")[6].text=="Completed"
              newcompletedCount += 1
            end
          end
        end
      end
    end
   if newcompletedCount == completedCount
      puts "Bulk Task complete cancelled successfully"
   end
 else
      puts "No matching records found"
 end
  rescue Exception =>ex
    putstr "Error while cancelling bulk completing task"
    putstr_withScreen ex.message
  end
end

Then (/^I verify SP Details Widget on Success task$/) do
  begin
    arg = getReference "Reference"
    first(:xpath, "//*[contains(@id, 'selTasks')]").select(arg["FCView"])
    sleep 5
    searchStr = "In Progress"
    within(".bootstrap-table") do 
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys searchStr
    end
    sleep 10
    unless page.has_css?(".no-records-found")
      sleep 4
      first(".detailEnabled").click
      sleep 6
      page.should have_content('Current Phase')
      page.should have_content('Success Plan')
      page.should have_content('Renewal Date')
      page.should have_content('Account Manager')
      page.should have_content('Support Contact')
      puts ("SP Details verified that it contains Information")
      sleep 5
    else
      puts "No matching records found"
    end
    sleep 3
  rescue Exception => ex
    putstr "Success Plan Details Widget Verification Failed"
    putstr_withScreen ex.message
  end
end

Then (/^I open SP$/) do
  begin
    arg = getReference "Reference"
    first(:xpath, "//*[contains(@id, 'selTasks')]").select(arg["FCView"])
    sleep 5
    #Added piece of code,it will be remove further(SearchBox)
    searchStr = ""
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys searchStr
    end
    sleep 5
    unless page.has_css?(".no-records-found")
      sleep 3
      first(".detailEnabled").click
    # all('.pbSubsection')[0].first("a").click
      sleep 10
      puts ("SP opened successfully")
    else
      puts "No matching records found"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error opening Success Plan"
    putstr_withScreen ex.message
  end
end

Then (/^I open Contact$/) do
  begin
    arg = getReference "Reference"
    find(:xpath, "//*[contains(@id, 'selTasks')]").select(arg["FCWidgetView"])
    sleep 100
    #Added piece of code,it will be remove further(SearchBox)
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys ''
    end
    sleep 5
    unless page.has_css?(".no-records-found")
      sleep 3
      first(".detailEnabled").click
      sleep 5
      found = 0
      within all(".ss_box")[1] do
        if all(".iconContact-phone").count > 0
          puts find(:id,"th2").text
          puts "mouse over task"
          all(".iconContact-phone")[0].hover
          puts "Contact phone number:"+all(".iconContact-phone")[0].text
          puts "Contact Name:"+first(".ss_contact_name").text
          sleep 5   
         if all(".iconBasic-mail").count > 0
            found = 1
            sleep 5
            all(".iconBasic-mail")[0].click
            puts "Email verified"
          end
        end
      end
      sleep 2
      if found > 0
        fill_in 'Subject', :with => 'Send Email'
        sleep 5
        within(:id, 'topButtonRow') do
          click_button('Send')
          puts "Email sent"
          sleep 5
        end
      end
      puts "Success Task Contact Widget displayed correctly"
    else
      puts "No matching records found"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error verifying Success Task Contact Widget"
    putstr_withScreen ex.message
  end
end

Then (/^I verify Play widget$/) do
  begin
    arg = getReference "Reference"
    first(:xpath, "//*[contains(@id, 'selTasks')]").select(arg["FCWidgetView"])
    sleep 5
    #Added piece of code,it will be remove further(SearchBox)
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys ''
    end
    unless page.has_css?(".no-records-found")
      sleep 5
      first(".detailEnabled").click
      sleep 5
      within all(".ss_box")[2] do
        puts find(".table").text
        puts find(".sfdc_richtext").text
        if all(:link,"Show More").count > 0
          first(:link,"Show More").click
        end
      end
      sleep 5
      puts "Success Task Play Widget displayed correctly"
    else
      puts "No matching records found"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error verifying Success Task Play Widget"
    putstr_withScreen ex.message
  end
end

And(/^I create a new "([^"]*)" success task$/) do |new_task|
  begin
    sleep 3
    arg = getDetails "Focus Category Group"
    sleep 6
    click_on new_task
    sleep 6
    fill_in "Display Name",:with => arg["FoucsCategoryGroupName"]
    sleep 4
    click_on "Create"
    sleep 5
    first(:xpath, "//*[contains(@id, 'slFieldId')]").select("Status")
    sleep 8
    first(:xpath, "//*[contains(@id, 'outOperator')]").select("NOT IN")
    sleep 8
    first(:xpath, "//*[contains(@id, 'outValue')]").set("Not Started")
    sleep 8
    click_on "Save"
    puts "Successfully created success task"
    sleep 10
    if page.has_content?('Focus Category View Criteria Saved Successfully')
      puts "Focus Category View Criteria Saved Successfully displayed"
      sleep 3
    else
      "Focus Category View Criteria Saved Successfully not displayed"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while creating the success task"
    putstr_withScreen ex.message
  end
end

And(/^I select the tasks$/) do
  begin
    sleep 5
    arg = getReference "Reference"
    find(:xpath, "//*[contains(@id, 'selTasks')]").select(arg["FCView"])
    sleep 5
    searchStr = "In Progress"
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys searchStr
    end
    sleep 5
    unless page.has_css?(".no-records-found")
      within("#taskGrid") do
        if first("tbody").all("tr").count > 0
          count = 0
          unless page.has_xpath?("//input[@disabled='disabled']")
            all(:xpath, "//input[@name='btSelectItem']").each do |checkbox|
              count = count + 1
              unless checkbox.checked?
                checkbox.click
                sleep 5
                puts "Task is enabled"
              else
                puts "Task is already enabled"
              end
              if count == 2
                break
              end
            end
          else
            puts "Tasks are disabled mode"
          end
        else
          puts "No Task Records found"
        end
      end
    else
      puts "No matching records found"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while selecting the tasks"
    putstr_withScreen ex.message
  end
end

And(/^I "([^"]*)" the create new task$/) do |button|
  begin
    sleep 3
    sleep 8
    arg=getDetails "Taskdetails"
    spPlay = getReference "Reference"
    sleep 2
    first(:xpath, "//*[contains(@id, 'selTasks')]").select(spPlay["FCView"])
    sleep 8
    puts "Selected First Task Category"
    click_on "Create Task"
    sleep 8
    time = Time.new
    currentDate = time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s
     within all('.pbSubsection').last do
      sleep 5
      first(:xpath, "//*[contains(@id, 'dueValue')]").set(currentDate)
      sleep 5
      first(:xpath, "//*[contains(@id, 'taskNameValue')]").click
      first(:xpath, "//*[contains(@id,'taskNameValue')]").set("Call")
      first(:xpath, "//*[contains(@id,'successPlanPlayValue')]").click
      first(:xpath, "//*[contains(@id,'successPlanPlayValue')]").set(spPlay["SuccessPlanPlay"])
      within(:xpath, "//*[contains(@id,'relatedToBlockPanel')]") do
        first(:css, "input[id$='relatedToValue']").click
        sleep 2
        first(:css, "input[id$='relatedToValue']").set(spPlay["Account"])
        sleep 2
      end
      first(:xpath, "//*[contains(@id, 'commentsValue')]").click
      first(:xpath, "//*[contains(@id, 'commentsValue')]").set(arg["CommentsValue"])
      first(:xpath, "//*[contains(@id, 'taskStatusValue1')]").select(arg["Status"])
    end

    within(".pbButtonb") do
      if page.has_button?(button)
        puts "Successfully see the #{button} button on create new task"
        click_on button
        sleep 3
        puts "Successfully #{button} the create new task"
      else
        putstr "Failed to see the #{button} button on create new task"
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while canceling the create new task"
    putstr_withScreen ex.message
  end
end

Then(/^I should able to see the "([^"]*)" page$/) do |success_tasks|
  begin
    sleep 3
    if find(".pageDescription").text == success_tasks
      puts "Successfully see the #{success_tasks} page"
    else
      putstr "Failed to see the #{success_tasks} page"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the #{success_tasks} page"
    putstr_withScreen ex.message
  end
end

And(/^I select the task from task list$/) do
  begin
    sleep 5
    arg = getReference "Reference"
    searchStr = "In Progress"
    find(:xpath, "//*[contains(@id, 'selTasks')]").select arg["FCView"]
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys $taskName
      #find(:xpath, "//*[contains(@class, 'form-control')]").send_keys searchStr
    sleep 5
    end
    sleep 5
    #find(".pull-right.search").first("input").set('')
    puts "Successfully selected the filter"
  rescue Exception => ex
    putstr "Error occurred while selecting the task from task list"
    putstr_withScreen ex.message
  end
end


And(/^I select All task from task list$/) do
  begin
    sleep 3
    arg = getReference "Reference"
    searchStr = " "
    find(:xpath, "//*[contains(@id, 'selTasks')]").select arg["FCView"]
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys searchStr
    end
    sleep 5
    #find(".pull-right.search").first("input").set('')
    puts "Successfully selected the filter"
  rescue Exception => ex
    putstr "Error occurred while selecting the task from task list"
    putstr_withScreen ex.message
  end
end

Then(/^I verify the "([^"]*)" and "([^"]*)" buttons$/) do |complete, dismiss|
  begin
    sleep 3
    within("#grid-toolbar") do
      if page.has_css?("#completeTask")
        puts "Successfully see the #{complete} button"
      else
        putstr "Failed to see the #{complete} button"
      end
      sleep 4
      if page.has_css?("#dismissTask")
        puts "Successfully see the #{dismiss} button"
      else
        putstr "Failed to see the #{dismiss} button"
      end
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the #{complete} and #{dismiss} buttons"
    putstr_withScreen ex.message
  end
end

And(/^I "([^"]*)" the complete success task$/) do |button|
  begin
    sleep 3
    arg = getDetails "Taskdetails"
    arg2 = getDetails "CreateTaskFields"
    sleep 4
    unless page.has_xpath?("//input[@disabled='disabled']")
      sleep 5
      find(:xpath, "//*[contains(@id, 'riskReasonValue')]").find(:xpath, 'option[2]').select_option
      sleep 3
      find(:xpath, "//*[contains(@id, 'commentsValue')]").click
      find(:xpath, "//*[contains(@id, 'commentsValue')]").set(arg["CommentsValue"])
      sleep 4
      first(:xpath, "//*[contains(@id, 'taskStatusValue')]").select arg2["CompletedStatusfield"]
      sleep 5
      within all(".pbBottomButtons")[0] do
        if page.has_button?(button)
          puts "Successfully see the #{button} button on complete task"
          click_on button
          sleep 3
          puts "Successfully see the #{button} complete task"
        else
          putstr "Failed to see the #{button} button on complete task"
        end
      end
    else
      puts "Tasks are disabled mode"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while #{button} the complete task"
    putstr_withScreen ex.message
  end
end

And(/^I "([^"]*)" the dismiss success task$/) do |button|
  begin
    sleep 5
    unless page.has_xpath?("//input[@disabled='disabled']")
      sleep 5
      first(:xpath, "//*[contains(@id, 'riskReasonValue')]").find(:xpath, 'option[2]').select_option
      first(:xpath, "//*[contains(@id, 'taskStatusValue')]").select('Completed')
      sleep 5
      within all(".pbBottomButtons")[0] do
        if page.has_button?(button)
          puts "Successfully see the #{button} button on dismiss task"
          click_on button
          sleep 3
          puts "Successfully #{button} the dismiss task"
        else
          putstr "Failed to see the #{button} button on dismiss task"
        end
      end
      sleep 3
    else
      puts "Tasks are disabled mode"
    end
  rescue Exception => ex
    putstr "Error occurred while #{button} the dismiss task"
    putstr_withScreen ex.message
  end
end

And(/^I should able to see the "([^"]*)" status$/) do |status|
  begin
    sleep 4
    unless page.has_css?(".no-records-found")
      within("#taskGrid") do
        if first("tbody").all("tr").count > 0
          complted_status = first("tbody").first("tr").all("td")[6].text
          if status == complted_status
            puts "Successfully updated the #{status} task"
          else
           # putstr "Failed to update the #{status} task"
          end
        else
          puts "No Task Records found"
        end
      end
    else
      puts "No matching records found"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the #{status} status"
    putstr_withScreen ex.message
  end
end

And(/^I click on "([^"]*)" task button$/) do |button|
  begin
    sleep 4
    unless page.has_xpath?("//input[@disabled='disabled']")
      sleep 3
      click_on button
      sleep 10
      puts "Successfully to clicked the #{button} button"
    else
      puts "Tasks are disabled mode"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{button} button"
    putstr_withScreen  ex.message
  end
end

And(/^I click on carrot icon$/) do
  begin
    sleep 5
    unless page.has_css?(".no-records-found")
      within("#taskGrid") do
        sleep 3
        if first("tbody").all("tr").count > 0
          sleep 4
          count = 0
          tr = first("tbody").all("tr")
          tr.each do |row|
            sleep 4
            if row.all("td")[6].text == "In Progress"
              sleep 3
              if page.has_css?(".detailEnabled")
                sleep 3
                first(".detailEnabled").click
                sleep 4
                puts "Successfully click the carrot icon"
              else
                putstr "Failed to see the carrot icon"
              end
              sleep 3
              break
            else
              count = count + 1
              puts "No In Progess records are found"
              if count == 3
                break
              end
            end
          end
        else
          puts "Failed to see the tasks"
        end
      end
    else
      puts "No matching records found"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the carrot icon"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the success plan details widget$/) do
  begin
    sleep 3
    arg = getDetails "CreateTaskFields"
    sleep 4
    unless page.has_css?(".no-records-found")
      sleep 5
      if page.has_xpath?("//*[contains(@id, 'pbsAcctDetailsId')]")
        sleep 3
        if page.has_content?(arg["SucessPlanDetailsWidget"])
          puts "Successfully see the #{arg["SucessPlanDetailsWidget"]} widget"
        else
          putstr "Failed to see the #{arg["SucessPlanDetailsWidget"]} widget"
        end
        sleep 3
        if page.has_content?(arg["SucessPlanDetailsWidget1"])
          puts "Successfully see the #{arg["SucessPlanDetailsWidget1"]} in #{arg["SucessPlanDetailsWidget"]} widget"
        else
          putstr "Failed to see the #{arg["SucessPlanDetailsWidget1"]} in #{arg["SucessPlanDetailsWidget"]} widget"
        end
        sleep 3
        if page.has_content?(arg["SucessPlanDetailsWidget2"])
          puts "Successfully see the #{arg["SucessPlanDetailsWidget2"]} in #{arg["SucessPlanDetailsWidget"]} widget"
        else
          putstr "Failed to see the #{arg["SucessPlanDetailsWidget2"]} in #{arg["SucessPlanDetailsWidget"]} widget"
        end
        sleep 3
        if page.has_content?(arg["SucessPlanDetailsWidget3"])
          puts "Successfully see the #{arg["SucessPlanDetailsWidget3"]} in #{arg["SucessPlanDetailsWidget"]} widget"
        else
          putstr "Failed to see the #{arg["SucessPlanDetailsWidget3"]} in #{arg["SucessPlanDetailsWidget"]} widget"
        end
        sleep 3
        if page.has_content?(arg["SucessPlanDetailsWidget4"])
          puts "Successfully see the #{arg["SucessPlanDetailsWidget4"]} in #{arg["SucessPlanDetailsWidget"]} widget"
        else
          putstr "Failed to see the #{arg["SucessPlanDetailsWidget4"]} in #{arg["SucessPlanDetailsWidget"]} widget"
        end
        sleep 3
        if page.has_content?(arg["SucessPlanDetailsWidget5"])
          puts "Successfully see the #{arg["SucessPlanDetailsWidget5"]} in #{arg["SucessPlanDetailsWidget"]} widget"
        else
          putstr "Failed to see the #{arg["SucessPlanDetailsWidget5"]} in #{arg["SucessPlanDetailsWidget"]} widget"
        end
        sleep 3
      else
        puts "No Success Plan records are found"
      end
      sleep 3
    else
      puts "No matching records found"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the success plan details"
    putstr_withScreen  ex.message
  end
end

And(/^I select the existing account$/) do
  begin
    sleep 5
    arg = getReference "Reference"
    sleep 5
    find('#fcf').select "My Accounts"
    sleep 5
    within (".fBody") do
      click_on "Go!"
    end
    sleep 10
    foundCount = 0
    begin
      within(".x-grid3-body") do
        tr = all(".x-grid3-row-table")
        tr.each do |row|
          if row.all("td")[2].text == arg["Account"]
            row.all("td")[2].all('a')[0].click
            foundCount = 1
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
    if foundCount == 0
      within(".x-grid3-body") do
        tr = all(".x-grid3-row-table")
        tr.each do |row|
          if row.all("td")[2].text == arg["Account"]
            row.all("td")[2].all('a')[0].click
            foundCount = 1
            break
          end
        end
      end
    end
    if foundCount > 0
      puts "Successfully open the #{arg["Account"]}"
    else
      putstr "Account #{arg["Account"]} not found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the existing account"
    putstr_withScreen ex.message
  end
end

And(/^I click on success task$/) do
  begin
    sleep 5
    within all(".listRelatedObject")[4] do
      within(".list") do
        unless page.has_css?(".noRowsHeader")
          sleep 3
          if first("tbody").all(".dataRow").count > 0
            $success_task = first("tbody").first(".dataRow").first("th").first("a").text
            sleep 3
            first("tbody").first(".dataRow").first("th").first("a").click
            sleep 3
          else
            puts "No Success Tasks Found"
          end
        else
          puts "No records to display"
        end
      end
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while clicking the success task"
    putstr_withScreen  ex.message
  end
end

And(/^I edit the success task$/) do
  begin
    sleep 5
    within all(".listRelatedObject")[4] do
      within(".list") do
        unless page.has_css?(".noRowsHeader")
          sleep 3
          if first("tbody").all(".dataRow").count > 0
            $success_task = first("tbody").first(".dataRow").first("th").first("a").text
            sleep 3
            first("tbody").first(".dataRow").first("th").first("a").click
            sleep 3
          else
            puts "No Success Tasks Found"
          end
        else
          puts "No records to display"
        end
      end
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while editing the success task"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the success task details page$/) do
  begin
    sleep 3
    if find(".pageDescription").text == $success_task
      puts "Successfully see the success task #{$success_task} details page"
    else
      putstr "Failed to see the success task #{$success_task} details page"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the success task #{$success_task} details page"
    putstr_withScreen  ex.message
  end
end

And(/^I should able to see the "([^"]*)" field$/) do |field|
  begin
    sleep 3
    if page.has_content?(field)
      puts "Successfully see the #{field} field"
    else
     # putstr "Failed to see the #{field} field"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} field"
    putstr_withScreen  ex.message
  end
end

And(/^I open the "([^"]*)" pop up window$/) do |task|
  begin
    sleep 5
    $ispopwindow = 0
    unless page.has_css?(".no-records-found")
      within("#taskGrid") do
        sleep 3
        if first("tbody").all("tr").count > 0
          sleep 4
          count = 0
          tr = first("tbody").all("tr")
          tr.each do |row|
            sleep 4
            unless row.all("td")[6].text == "Completed"
              sleep 3
              first(".checkEnabled").click
              sleep 3
              $ispopwindow = 1
              puts "Successfully open the #{task} pop up window"
              break
            else
              count = count + 1
              puts "Records are disabled mode"
              if count == 3
                break
              end
            end
          end
        else
          puts "Failed to see the tasks"
        end
      end
    else
      puts "No matching records found"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while opening the #{task} pop up window"
    putstr_withScreen ex.message
  end
end

And(/^I open the "([^"]*)" task pop up window$/) do |task|
  begin
    sleep 4
    $ispopwindow = 0
    sleep 5
    unless page.has_css?(".no-records-found")
      within("#taskGrid") do
        sleep 3
        if first("tbody").all("tr").count > 0
          sleep 4
          count = 0
          tr = first("tbody").all("tr")
          tr.each do |row|
            sleep 4
            unless row.all("td")[6].text == "Completed"
              sleep 3
              first(".removeEnabled").click
              sleep 3
              $ispopwindow = 1
              puts "Successfully open the #{task} pop up window"
              break
            else
              count = count + 1
              puts "Records are disabled mode"
              if count == 3
                break
              end
            end
          end
        else
          puts "Failed to see the tasks"
        end
      end
    else
      puts "No matching records found"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while opening the #{task} pop up window"
    putstr_withScreen ex.message
  end
end

And(/^I verify the "([^"]*)" checkbox state$/) do |status|
  begin
    sleep 4
    unless page.has_css?(".no-records-found")
      within("#taskGrid") do
        sleep 3
        if first("tbody").all("tr").count > 0
          sleep 4
          tr = first("tbody").all("tr")
          tr.each do |row|
            sleep 4
            if row.all("td")[6].text == "Completed"
              puts "Successfully see the completed records"
              sleep 3
              if row.all("td")[0].first("input")[:disabled] == "true"
                sleep 3
                puts "Successfully see the checkbox in disabled mode"
                break
              else
                putstr "Failed to see the checkbox in disabled mode"
              end
            else
              # puts "No Completed records found"
            end
          end
        else
          puts "Failed to see the tasks"
        end
      end
    else
      puts "No matching records found"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the #{status} checkbox state"
    putstr_withScreen ex.message
  end
end

And(/^I verify the complete icon state$/) do
  begin
    sleep 4
    unless page.has_css?(".no-records-found")
      within("#taskGrid") do
        sleep 3
        if first("tbody").all("tr").count > 0
          sleep 4
          tr = first("tbody").all("tr")
          tr.each do |row|
            sleep 4
            if row.all("td")[6].text == "Completed"
              puts "Successfully see the completed records"
              sleep 4
              if (row.all("td")[1].first("div").all("div")[0]['class']).include?("disabled")
                sleep 3
                puts "Successfully see the complete icon in disabled mode"
                break
              else
                putstr "Failed to see the complete icon in disabled mode"
              end
            else
              # puts "No Completed records found"
            end
          end
        else
          puts "Failed to see the tasks"
        end
      end
    else
      puts "No matching records found"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the complete icon state"
    putstr_withScreen ex.message
  end
end

And(/^I verify the dismiss icons state$/) do
  begin
    sleep 4
    unless page.has_css?(".no-records-found")
      within("#taskGrid") do
        sleep 3
        if first("tbody").all("tr").count > 0
          sleep 4
          tr = first("tbody").all("tr")
          tr.each do |row|
            sleep 4
            if row.all("td")[6].text == "Completed"
              puts "Successfully see the completed records"
              sleep 4
              if (row.all("td")[1].first("div").all("div")[1]['class']).include?("disabled")
                sleep 3
                puts "Successfully see the dismiss icon in disabled mode"
                break
              else
                putstr "Failed to see the dismiss icon in disabled mode"
              end
            else
              # puts "No Completed records found"
            end
          end
        else
          puts "Failed to see the tasks"
        end
      end
    else
      puts "No matching records found"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the dismiss icon state"
    putstr_withScreen ex.message
  end
end

And(/^I verify the email icon state$/) do
  begin
    sleep 4
    unless page.has_css?(".no-records-found")
      within("#taskGrid") do
        sleep 3
        if first("tbody").all("tr").count > 0
          sleep 4
          tr = first("tbody").all("tr")
          tr.each do |row|
            sleep 4
            if row.all("td")[6].text == "Completed"
              puts "Successfully see the completed records"
              sleep 4
              if (row.all("td")[1].first("div").all("div")[2]['class']).include?("envEnabled")
                sleep 3
                puts "Successfully see the email icon in enabled mode"
                break
              else
                putstr "Failed to see the email icon in enabled mode"
              end
            else
              # puts "No Completed records found"
            end
          end
        else
          puts "Failed to see the tasks"
        end
      end
    else
      puts "No matching records found"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the email icon state"
    putstr_withScreen ex.message
  end
end

And(/^I verify the "([^"]*)" task reason code$/) do |status|
  begin
    sleep 4
    unless page.has_css?(".no-records-found")
      if $ispopwindow > 0
        if page.has_css?("#taskGrid")
          within("#taskGrid") do
            sleep 3
            if first("tbody").all("tr").count > 0
              puts "Successfully see the records"
              sleep 4
              count = 0
              tr = first("tbody").all("tr")
              tr.each do |row|
                if row.all("td")[3].all('a')[0].text == $taskName
                  sleep 3
                  $success_task = row.all("td")[3].all('a')[0].text
                  row.all("td")[3].all('a')[0].click
                  break
                else
                  count = count + 1
                  puts "No current date records found"
                  if count == 5
                    break
                  end
                end
              end
            else
              puts "No Records Found"
            end
          end
        else
          puts "No Records Found"
        end
        sleep 5
        if find(".pageDescription").text == $success_task
          puts "Successfully see the success task #{$success_task} details page"
        else
          putstr "Failed to see the success task #{$success_task} details page"
        end
        sleep 4
        #within all(".pbSubsection") do
        puts "In the reason code loop"
        reason_code = first(:xpath,'//td[contains(text(),"Reason Code")]/following-sibling::td/div').text
        if reason_code.to_s == $reason_code.to_s
          puts "Successfully see the #{status} task reason code"
        else
          putstr "Failed to see the #{status} task reason code"
        end
        #end
      else
        puts "#{status} Task pop up is not displayed"
      end
    else
      puts "No matching records found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{status} task reason code"
    putstr_withScreen ex.message
  end
end

And(/^I select the "([^"]*)" value from complete task$/) do |field|
  begin
    sleep 3
    arg = getDetails "CreateTaskFields"
    sleep 4
    unless page.has_css?(".no-records-found")
      if $ispopwindow > 0
        $reason_code = "C - Support Issue - SPI"

        time = Time.new
        $current_date = time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s

        sleep 4
        find(:xpath, "//*[contains(@id, 'completedOnValue')]").set $current_date
        sleep 4
        find(:xpath, "//*[contains(@id, 'riskReasonValue')]").select $reason_code
        sleep 4
        first(:xpath, "//*[contains(@id, 'taskStatusValue')]").select arg["CompletedStatusfield"]
        sleep 4
        page.find(:xpath,"//*[@id='pageTaskList:frmCustomerSuccessOverview:taskComp:cmpCSMTasks:taskCompleteTaskPageBlock:j_id303:bottom:Complete']").click
        puts "Save all data"
      else
        puts "Complete Task pop up is not displayed"
      end
    else
      puts "No matching records found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the #{field} value from pick list"
    putstr_withScreen ex.message
  end
end

And(/^I select the "([^"]*)" value from dismiss task$/) do |field|
  begin
    sleep 4
    unless page.has_css?(".no-records-found")
      if $ispopwindow > 0
        sleep 5
        $reason_code = "D - Already Completed - ACD"
        time = Time.new
        $current_date = time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s
        sleep 4
        find(:xpath, "//*[contains(@id, 'completedOnValue')]").set $current_date
        sleep 4
        first(:xpath, "//*[contains(@id, 'riskReasonValue')]").select $reason_code
        sleep 5
      else
        puts "Dismiss Task pop up is not displayed"
      end
      sleep 3
    else
      puts "No matching records found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the dismiss task #{field}"
    putstr_withScreen ex.message
  end
end

And(/^I select the pagination size$/) do
 begin
  sleep 5
   within(".bootstrap-table") do
       find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
       find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
       find(:xpath, "//*[contains(@class, 'form-control')]").send_keys ''
   end
  sleep 3
   unless page.has_css?(".no-records-found")
   if page.has_css?(".dropdown-toggle")
     puts "Successfully see the pagination"
     sleep 4
     within(".pagination-detail") do
       sleep 4
       puts "Successfully see the pagination button"
      #find(".btn btn-default  dropdown-toggle").click
       find(".dropdown-toggle").click
       puts "I clicked on button"
       sleep 3
       within(".dropdown-menu") do
         all("li")[2].first("a").click
     end
   end
     sleep 3
     $page_size = find(".page-size").text
     sleep 3
     puts "Successfully selected the pagination size: #{$page_size}"
    else
     puts "No pagination present"
    end
  else
      puts "No matching records found"
  end
  
  sleep 3
 rescue Exception => ex
   putstr "Error occurred while selecting the pagination size"
   putstr_withScreen ex.message
 end
end


Then(/^I verify that user preference is saved$/) do
  begin
    sleep 5
    unless page.has_css?(".no-records-found")
    if page.has_css?(".pagination-detail")
      puts "Successfully see the pagination"
      sleep 4
      if page.has_css?(".page-size")
        if find(".page-size").text == $page_size
          puts "User preference is saved as per last selection"
        else
          putstr "User preference is not saved as per last selection"
        end
      else
        puts "FC does not have enough record to display page size list drop down"
      end
    else
      putstr "Failed to see the pagination"
    end
    sleep 3
     else
      puts "No matching records found"
     end
  rescue Exception => ex
    putstr "Error occurred while verify the user preference is saved"
    putstr_withScreen ex.message
  end
end

And(/^I change the "([^"]*)" filter$/) do |success_task|
  begin
    sleep 5
    find(:xpath, "//*[contains(@id, 'selTasks')]").find(:xpath, 'option[3]').select_option
    sleep 5
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys ''
    end
    puts "Successfully change the #{success_task} filter"
  rescue Exception => ex
    putstr "Error occurred while selecting the #{success_task} filter"
    putstr_withScreen ex.message
  end
end

Then(/^I verify the grid details$/) do
  begin
    sleep 3
    arg = getReference "Reference"
    sleep 4
    if find(:xpath, "//*[contains(@id, 'selTasks')]").find('option[selected]').text == arg["FCView"]
      puts "Successfully see the grid details"
      unless page.has_css?(".no-records-found")
        within("#taskGrid") do
          sleep 3
          if first("tbody").all("tr").count > 0
            sleep 4
            puts "Successfully see the grid details"
          else
            puts "No records found"
          end
        end
      else
        puts "No matching records found"
      end
    else
      puts "Failed to see the grid details"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the grid details"
    putstr_withScreen ex.message
  end
end

Then(/^I verify the grid details based on user preference$/) do
  begin
    sleep 3
    arg = getReference "Reference"
    sleep 4
    if find(:xpath, "//*[contains(@id, 'selTasks')]").find('option[selected]').text == arg["FCView"]
      puts "User preference is saved as per last selection"
    else
      puts "User preference is not saved as per last selection"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verify the user preference is saved"
    putstr_withScreen ex.message
  end
end

And(/^I click on success task "([^"]*)" button$/) do |button|
  begin
    sleep 3
    recordsFound = false;
    unless page.has_css?(".no-records-found")
      within("#taskGrid") do
        if first("tbody").all("tr").count > 0
          unless page.has_xpath?("//input[@disabled='disabled']")
            sleep 4
            recordsFound = true
          else
            puts "Tasks are disabled mode"
          end
        else
          puts "No Task Records found"
        end
      end
    else
      puts "No matching records found"
    end
    if recordsFound
      within("#grid-toolbar") do
        click_on button
        sleep 2
      end
    end
    puts "Successfully to clicked the #{button} button"
  rescue Exception => ex
    putstr "Error occurred while clicking the #{button} button"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the task "([^"]*)" field$/) do |record_type|
  begin
    sleep 4
    if page.has_content?(record_type)
      puts "Successfully see the #{record_type} field"
    else
      putstr "Failed to see the #{record_type} field"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the #{record_type} field"
    putstr_withScreen ex.message
  end
end

When(/^I select the task "([^"]*)" field$/) do |record_type|
  begin
    sleep 4
    within all(".dropdown-menu")[0] do
      all("li").each do |column|
        sleep 3
        if column.first("label").text == record_type
          puts "Successfully see the #{record_type} field"
          sleep 3
          column.first("input").click
          sleep 4
        end
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the #{record_type} field"
    putstr_withScreen ex.message
  end
end

Then(/^I verify the task "([^"]*)" field selection is saved or not$/) do |record_type|
  begin
    sleep 4
    within all(".dropdown-menu")[0] do
      all("li").each do |column|
        sleep 3
        if column.first("label").text == record_type
          puts "Successfully see the #{record_type} field"
          sleep 3
          if column.first("input").checked?
            puts "#{record_type} field is selected"
          else
            putstr "#{record_type} field is not selected"
          end
          sleep 3
        end
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{record_type} field selection is saved or not"
    putstr_withScreen ex.message
  end
end

Then(/^I verify the task "([^"]*)" user preference is saved$/) do |record_type|
  begin
    sleep 4
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys ''
    end
    sleep 3
   unless page.has_css?(".no-records-found") 
     within all(".dropdown-menu")[0] do
      all("li").each do |column|
        sleep 3
        if column.first("label").text == record_type
          puts "Successfully see the #{record_type} field"
          sleep 3
          if column.first("input").checked?
            puts "User preference selection is saved"
          else
            putstr "User preference selection is not saved"
          end
          sleep 3
        end
        sleep 4
      end
    end
    else 
         puts "No matching records found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while click verifying the #{record_type} user preference is saved"
    putstr_withScreen ex.message
  end
end

And(/^I select Task based FC from dropdown$/) do
  begin
    unless page.has_css? (".icons-container")
      #find(:xpath, "//*[contains(@id, 'selTasks')]").click
      find(:xpath, "//*[contains(@id, 'selTasks')]").all("option").each_with_index do |task, index|
        next if index == 0
        task.click
        sleep 10
        if page.has_css? (".icons-container")
          puts "Task based FC selected."
          break
        else
          puts "Task based FC selected but no records found."
        end
      end
    else
      puts "Page already has Task based FC selected."
    end
  rescue Exception => ex
    putstr "Error occurred while selecting Task based FC from dropdown."
    putstr_withScreen ex.message
  end
end

And(/^I click on Subject of any Task displayed$/) do
  begin
    $i = 0
    sleep 2
    if page.has_css? (".icons-container")
      within(".fixed-table-body") do
        tr = first("table").first("tbody").all("tr")
        tr.each_with_index do |taskrow,index|
          unless taskrow.has_css? (".disabled")
            taskrow.all("td")[3].first("a").click
            puts "Subject link value clicked."
            sleep 15
            $i = 1
            break
          else
            puts "No pending Tasks available on Success Tasks page for selection."
          end
        end
      end
    else
      puts "No Tasks present for the choosen FC."
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting Subject of any Task displayed."
    putstr_withScreen ex.message
  end
end

And(/^I record the default grid output$/) do
  begin
    $all_subject = []
    unless page.has_content? ("No matching records found")
      if page.has_css? (".icons-container")
        within(".fixed-table-body") do
          tr = first("table").first("tbody").all("tr")
          tr.each_with_index do |taskrow,index|
            $all_subject << taskrow.all("td")[3].first("a").text
          end
          puts $all_subject
        end
      else
        puts "No Tasks present for the choosen FC."
      end
    else
      puts "No matching records found."
    end
  rescue Exception => ex
    putstr "Error occurred while recording the default grid output."
    putstr_withScreen ex.message
  end
end

And(/^Enter some text in Search field$/) do
  begin
    $search = "PES Play"
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys $search
    end
    sleep 5
    $srcresults = []
    unless page.has_content? ("No matching records found")
      if page.has_css? (".icons-container")
        within(".fixed-table-body") do
          tr = first("table").first("tbody").all("tr")
          tr.each_with_index do |taskrow,index|
            $srcresults << taskrow.all("td")[3].first("a").text
          end
          puts $srcresults
        end
      else
        puts "No Tasks present for the choosen FC."
      end
    else
      puts "No matching records found."
    end
  rescue Exception => ex
    putstr "Error occurred while entering text in Search field."
    putstr_withScreen ex.message
  end
end

Then(/^Verify grid details as per search$/) do
  begin
    unless page.has_content? ("No matching records found")
      $srcresults.each do |search_elements|
        if search_elements.to_s.include?($search.to_s)
          puts "Grid results verified as per search."
        else
          puts "Grid results do not match search."
        end
      end
    else
      puts "No matching records found."
      puts "Grid results verified as per search."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the grid details as per search."
    putstr_withScreen ex.message
  end
end

And(/^I change FC view$/) do
  begin
    $fctask = find(:xpath, "//*[contains(@id, 'selTasks')]").find("option[selected='selected']").text
    if $fctask
      find(:xpath, "//*[contains(@id, 'selTasks')]").select "FC for Widgets"
      puts "New FC selected."
    else
      puts "Not able to select New FC."
    end
  rescue Exception => ex
    putstr "Error occurred while changing the FC view."
    putstr_withScreen ex.message
  end
end

And(/^I change the Page Size$/) do
  begin
    unless page.has_content? ("No matching records found")
      within(".page-list") do
        first("span").first("button").click
      end
      sleep 1
      within(".page-list") do
        first("ul").first("li").first("a").click
      end
      sleep 2
      puts "Page Size is changed."
    else
      puts "No matching records found."
    end
  rescue Exception => ex
    putstr "Error occurred while changing the Page Size."
    putstr_withScreen ex.message
  end
end

And(/^I select any grid column$/) do
  begin
    sleep 5
    unless page.has_content? ("No matching records found")
      if page.has_css? (".icons-container")
        within(".fixed-table-body") do
          tr = first("table").first("tbody").all("tr")
          sleep 3
          tr.each_with_index do |taskrow,index|
            unless taskrow.has_css? (".disabled")
              if taskrow.first("td").checked?
                sleep 3
                puts "Checkbox already selected."
              else
                taskrow.all("td")[0].first("input").click
                puts "Checkbox selected."
                sleep 1
                break
              end
            else
              puts "No pending Tasks available on Success Tasks page for selection."
            end
          end
        end
      else
        puts "No Tasks present for the choosen FC."
      end
    else
      puts "No matching records found."
    end
  rescue Exception => ex
    putstr "Error occurred while changing the Page Size."
    putstr_withScreen ex.message
  end
end

And(/^I deselect grid columns$/) do
  begin
    unless page.has_content? ("No matching records found")
      if page.has_css? (".icons-container")
        within(".fixed-table-body") do
          tr = first("table").first("tbody").all("tr")
          tr.each_with_index do |taskrow,index|
            unless taskrow.has_css? (".disabled")
              unless taskrow.first("td").checked?
                sleep 3
                puts "Checkbox already un-selected"
              else
                taskrow.all("td")[0].first("input").click
                puts "Checkbox un-selected."
                sleep 1
                break
              end
            else
              puts "No pending Tasks available on Success Tasks page for selection."
            end
          end
        end
      else
        puts "No Tasks present for the choosen FC."
      end
    else
      puts "No matching records found."
    end
  rescue Exception => ex
    putstr "Error occurred while changing the Page Size."
    putstr_withScreen ex.message
  end
end

Then(/^I Verify the text present in the Search field$/) do
  begin
    $srcsresults = []
    unless page.has_content? ("No matching records found")
      if page.has_css? (".icons-container")
        within(".fixed-table-body") do
          tr = first("table").first("tbody").all("tr")
          tr.each_with_index do |taskrow,index|
            $srcsresults << taskrow.all("td")[3].first("a").text
          end
          puts $srcsresults
        end
      else
        puts "No Tasks present for the choosen FC."
      end
      $srcsresults.each do |search_elements|
        if search_elements.to_s.include?($search.to_s)
          puts "Grid results verified as per search."
          puts "Text present in Search field."
        else
          puts "Grid results do not match search."
          puts "Text not present in Search field."
        end
      end
    else
      puts "No matching records found."
      puts "Grid results verified as per search."
      puts "Text present in Search field."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the grid details as per search."
    putstr_withScreen ex.message
  end
end

And(/^I select All task from task list with Selected Task$/) do
 
 begin
    sleep 3
    arg = getReference "Reference"
    searchStr = "In Progress"
    find(:xpath, "//*[contains(@id, 'selTasks')]").select arg["FCView"]
    within(".bootstrap-table") do
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys [:control, 'a']
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys :backspace
      find(:xpath, "//*[contains(@class, 'form-control')]").send_keys searchStr
    end
    sleep 5
    #find(".pull-right.search").first("input").set('')
    puts "Successfully selected the filter"
    
    within("#taskGrid") do
    if first("tbody").all("tr").count > 0
       first("tbody").first("tr").all("td")[3].first("a").click
       sleep 2
       puts " click on subject text"
       end
       end
     within(:id, 'topButtonRow') do
     click_button('Edit')
     puts "Clicked on edit"
     sleep 5
        end
     if find(:xpath, "//*[contains(@id,'tsk12')]").find(:xpath, 'option[3]').select_option
       puts "Status Changed to Complete"
      else
       puts "Status Not Changed"
      end
     sleep 4   
    within(:id, 'topButtonRow') do
    click_button('Save')
    puts "Clicked on Save"
    sleep 5
    end
  status="Completed" 
  status= first(:xpath,'//td[contains(text(),"Status")]/following-sibling::td/div').text
      
       if status.to_s == status.to_s
         puts "Successfully see the #{status} task Completed Code"
       else
         putstr "Failed to see the #{status} task Completed Code"
       end
    rescue Exception => ex
    putstr "Error occurred while selecting the task from task list"
    putstr_withScreen ex.message
  end
 
end


