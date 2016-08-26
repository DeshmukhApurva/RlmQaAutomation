And (/^I select the QA Test SP$/) do
  begin
    if page.has_xpath?('//input[@name="go"]')
      first(:button, "Go").click
    end
    first(:link,'SP-000045').click
    puts "Opened QA Test Success Plan"
  end
end

And (/^I check Record Type checkbox is checked or not$/) do
  begin
    within all(".keep-open")[0] do
      first("button").click
      sleep 5
    end

    within('.dropdown-menu') do
      if all("li")[10].first("input").checked?
        puts "Record Type is checked"
      else
        puts "Record Type is not checked"
      end
    end
  end
end

And (/^I check the Action tab Record Type checkbox if not checked$/) do
  begin
    within('.dropdown-menu') do
      if all("li")[10].first("input").checked?
        puts "Record Type is checked no need to check it"
      else
        all("li")[10].first("input").click
        puts "Record Type is not checked so checking it"
        sleep 7
      end
    end
  end
end

And (/^I check Record Type checkbox$/) do
  begin
    within all(".keep-open")[0] do
      first("button").click
      sleep 5
  end
      within('.dropdown-menu') do
        find(:xpath,"//li[11]/label[contains(text(),'Record Type')]/input").set(true)
        #all("li")[11].first("input").click
        sleep 7
        puts "Now Record Type checkbox is checked"
        
      end
    #end
  end
end

And (/^I uncheck Record Type checkbox$/) do
  begin
    within all(".keep-open")[0] do
      first("button").click
      sleep 5
  end
      within('.dropdown-menu') do
        find(:xpath,"//li[11]/label[contains(text(),'Record Type')]/input").set(false)
        #all("li")[11].first("input").click
        sleep 7
        puts "Now Record Type checkbox is unchecked"
      end
    #end
  end
end

And (/^I check Activity Stream Record Type checkbox if not checked$/) do
  begin
      within('.dropdown-menu') do
        if all("li")[7].first("input").checked?
          puts "Record Type is checked no need to check it"
        else
          all("li")[7].first("input").click
          puts "Record Type is not checked so checking it"
          sleep 7
        end
      end
    end
  end

And (/^I uncheck Activity Stream Record Type checkbox$/) do
  begin
    within all(".keep-open")[0] do
      first("button").click
      sleep 5
  end
      within('.dropdown-menu') do
        find(:xpath,"//li[8]/label[contains(text(),'Record Type')]/input").set(false)
        #all("li")[11].first("input").click
        sleep 20
        puts "Now Activity Stream Record Type checkbox is unchecked"
      end
    #end
  end
end



And (/^I verify Record Type picklist presence on the page$/) do
  begin
    if page.has_xpath?("//table[@id='actionSpGrid']/thead/tr/th/div[text()='Record Type']")and page.has_xpath?("//table[@id='actionSpGrid']/thead/tr/th/div[text()='Record Type']/following-sibling::div/div/select")
      puts "Record Type field has picklist present"
    else
      raise "Record Type picklist not present"
    end
  end
end

And (/^I verify Activity Stream Record Type picklist presence on the page$/) do
  begin
    if page.has_xpath?("//table[@id='ActivityHistory']/thead/tr/th/div[text()='Record Type']")and page.has_xpath?("//table[@id='ActivityHistory']/thead/tr/th/div[text()='Record Type']/following-sibling::div/div/select")
      puts "Activity Stream Record Type field has picklist present"
    else
      raise "Activity Stream Record Type picklist not present"
    end
  end
end

And (/^I select the Record Type values and clear the filter$/) do
  begin
    first(:link,'Clear Filters').click
    sleep 5
    all_records = find(:xpath,'//div[3]/div[2]/div[4]/div[1]/span[1]').text
    allrec_trimm = all_records[18,6]
    puts "All Records Count = " + allrec_trimm
    sleep 5
    first(:option,'Service_Source_Record').select_option
    sleep 5
    puts "Service_Source_Record selected for record type"
    rec1_records = find(:xpath,'//div[3]/div[2]/div[4]/div[1]/span[1]').text
    rec1_trimm = rec1_records[18,6]
    puts "Service_Source_Record Count = " + rec1_trimm
    if all_records.to_s != rec1_records.to_s
      puts "Service_Source_Record records are filtered"
    end
    sleep 10
    first(:link,'Clear Filters').click
    sleep 5
    first(:option,'Test_Record_Type').select_option
    sleep 5
    puts "Test_Record_Type selected for record type"
    rec2_records = find(:xpath,'//div[3]/div[2]/div[4]/div[1]/span[1]').text
    sleep 10
    rec2_trimm = rec2_records[18,6]
    puts "Test_Record_Type Record Count = " + rec2_trimm
    if all_records.to_s != rec2_records.to_s
      puts "Test_Record_Type records are filtered"
    end
    first(:link,'Clear Filters').click
    sleep 5
    first(:link,'Activity Stream').click
    sleep 5
    first(:link,'Actions').click
    sleep 5    
  end
end

And (/^I print Action tab first filter value for all columns$/) do
  begin
    play_name = find(:xpath,'//*[@id="actionSpGrid"]/thead/tr/th[4]/div[2]/div/select/option[1]').text
    puts "Play first column value = " + play_name
    
    playbook_name = find(:xpath,'//*[@id="actionSpGrid"]/thead/tr/th[4]/div[2]/div/select/option[1]').text
    puts "Playbook first column value = " + playbook_name
    
    assigned_to = find(:xpath,'//*[@id="actionSpGrid"]/thead/tr/th[5]/div[2]/div/select/option[1]').text
    puts "Assigned To first column value = " + assigned_to
    
    related_to = find(:xpath,'//*[@id="actionSpGrid"]/thead/tr/th[6]/div[2]/div/select/option[1]').text
    puts "Related To first column value = " + related_to
    
    task_status = find(:xpath,'//*[@id="actionSpGrid"]/thead/tr/th[7]/div[2]/div/select/option[1]').text
    puts "Status first column value = " + task_status
    
    play_status = find(:xpath,'//*[@id="actionSpGrid"]/thead/tr/th[8]/div[2]/div/select/option[1]').text
    puts "Play Status first column value = " + play_status
    
    task_type = find(:xpath,'//*[@id="actionSpGrid"]/thead/tr/th[8]/div[2]/div/select/option[1]').text
    puts "Task Type first column value = " + task_type
    
    record_type = find(:xpath,'//*[@id="actionSpGrid"]/thead/tr/th[8]/div[2]/div/select/option[1]').text
    puts "Record Type first column value = " + record_type
    
    has_play = find(:xpath,'//*[@id="actionSpGrid"]/thead/tr/th[10]/div[2]/div/select/option[1]').text
    puts "Has Play first column value = " + has_play
    
  end
end

And (/^I print Activity Stream tab first filter value for all columns$/) do
  begin
    play_name = find(:xpath,'//*[@id="ActivityHistory"]/thead/tr/th[4]/div[2]/div/select/option[1]').text
    puts "Play first column value = " + play_name
    
    playbook_name = find(:xpath,'//*[@id="ActivityHistory"]/thead/tr/th[4]/div[2]/div/select/option[1]').text
    puts "Playbook first column value = " + playbook_name
    
    assigned_to = find(:xpath,'//*[@id="ActivityHistory"]/thead/tr/th[5]/div[2]/div/select/option[1]').text
    puts "Assigned To first column value = " + assigned_to
    
    related_to = find(:xpath,'//*[@id="ActivityHistory"]/thead/tr/th[6]/div[2]/div/select/option[1]').text
    puts "Related To first column value = " + related_to
    
    task_status = find(:xpath,'//*[@id="ActivityHistory"]/thead/tr/th[7]/div[2]/div/select/option[1]').text
    puts "Status first column value = " + task_status
    
    play_status = find(:xpath,'//*[@id="ActivityHistory"]/thead/tr/th[8]/div[2]/div/select/option[1]').text
    puts "Play Status first column value = " + play_status
    
    task_type = find(:xpath,'//*[@id="ActivityHistory"]/thead/tr/th[8]/div[2]/div/select/option[1]').text
    puts "Task Type first column value = " + task_type
    
    record_type = find(:xpath,'//*[@id="ActivityHistory"]/thead/tr/th[8]/div[2]/div/select/option[1]').text
    puts "Record Type first column value = " + record_type
    
    has_play = find(:xpath,'//*[@id="ActivityHistory"]/thead/tr/th[8]/div[2]/div/select/option[1]').text
    puts "Has Play first column value = " + has_play
    
  end
end