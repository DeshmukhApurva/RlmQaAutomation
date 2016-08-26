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

When (/^I select the created SP for Dynamic Filter$/) do
begin
   sleep 10
   arg = getDetails "Dynamic Filter"
   spName = arg["Account"]+" Success Plan"
  select "All", :from => "fcf"
    sleep 3
    within(".fBody") do
      click_on "Go!"
    end
    sleep 5
    foundCount = ""
    begin  
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          if row.all("td")[3].text==spName
          row.all("td")[2].all('a')[0].click
          foundCount = "found"
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
         if row.all("td")[3].text==spName
          row.all("td")[2].all('a')[0].click
          foundCount = "found"
          break
          end 
        end
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while opening a SuccessPlan"
    putstr_withScreen ex.message
  end
end


And(/^I verify all filters Present on Action tab page$/) do
  begin
    sleep 10
    find(:xpath,"//*[contains(@class,'dropdown-toggle')]").click
    puts "I successfully Clicked on Column Picker"
      sleep 10
      within('.dropdown-menu') do
      sleep 6
      find(:xpath,"//li[3]/label[contains(text(),'Play')]/input").set(true)
      puts "Play Filter Is on Action tab Page"
      sleep 6
      find(:xpath,"//li[4]/label[contains(text(),'Playbook')]/input").set(true)
      puts "Playbook Filter Is on Action tab Page"
      sleep 6
      find(:xpath,"//li[5]/label[contains(text(),'Assigned To')]/input").set(true)
      puts "Assigned To Filter Is on Action tab Page"
      sleep 16
      find(:xpath,"//li[6]/label[contains(text(),'Related To')]/input").set(true)
      puts "Related To Filter Is on Action tab Page"
      sleep 6
      find(:xpath,"//li[10]/label[contains(text(),'Task Type')]/input").set(true)
      puts "Task Type Filter Is on Action tab Page"
      sleep 6
      find(:xpath,"//li[12]/label[contains(text(),'Has Play')]/input").set(true)
      puts "Has Play Filter Is on Action tab Page"
      end  
      sleep 8
      find(:xpath,"//*[contains(@class,'dropdown-toggle')]").click
  sleep 10
  rescue Exception => ex
    putstr "Error occurred while verifying Dynamic Filters"
    putstr_withScreen ex.message
    end
end

And(/^I verify Play values Present in filter as "(.*?)" and "(.*?)"$/) do |playValue1,playValue2|
   begin
     find(:xpath,"//*[@id='actionSpGrid']/thead/tr/th[4]/div[2]/div/select").all('option').each do |playValues|
     # find(:xpath,"//*[contains(@class,'table table-hover')]").find(:xpath,'..').find(:xpath,"//th[contains(@data-field,'CSM_Play_Display_Name')]").find(:xpath,"//div[contains(text(),'Play')]/following-sibling::div/div/select").all('option').each do |playValues|
     puts "I check Play value"
     puts playValues.text.to_s
     if playValues.text.to_s.include?playValue1.to_s
          sleep 5
          puts "Successfully see the #{playValue1} field value"
          sleep 4
          puts "I successfully See the first value" 
     end
     if playValues.text.to_s.include?playValue2.to_s
          sleep 5
          puts "Successfully see the #{playValue2} field value"
          sleep 4
          puts "I successfully See the Second value" 
     end
    end
    sleep 6
     find(:xpath, "//*[@id='actionSpGrid']/thead/tr/th[4]/div[2]/div/select").select playValue1
     puts "I select Value for Play" 
     within("#actionSpGrid") do
        if first("tbody").all("tr").count > 0
          countValue=first("tbody").all("tr").count
          puts countValue
          PlayValue = first("tbody").first("tr").all("td")[3].text.to_s
          puts PlayValue
          if playValue1.to_s == PlayValue.to_s
         puts "Successfully See the Record as per Value Selected from picklist"
       else
         "Failed to see value" 
       end
         else
          puts "No Task Records found"
        end
     end
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while Selecting Successplan value"
    putstr_withScreen ex.message
   end
 end

    
And(/^I verify Playbook values Present in filter as "(.*?)" and "(.*?)"$/) do |playBookValue1,playBookValue2|
   begin
     find(:xpath,"//*[@id='actionSpGrid']/thead/tr/th[5]/div[2]/div/select").all('option').each do |playBookValues|
     # find(:xpath,"//*[contains(@class,'table table-hover')]").find(:xpath,'..').find(:xpath,"//th[contains(@data-field,'CSM_Play_Display_Name')]").find(:xpath,"//div[contains(text(),'Play')]/following-sibling::div/div/select").all('option').each do |playValues|
     puts "I check Playbook value"
     if playBookValues.text.to_s.include?playBookValue1.to_s
          sleep 5
          puts "Successfully see the #{playBookValue1} field value"
          sleep 4
          puts "I successfully See the first value" 
     end
     if playBookValues.text.to_s.include?playBookValue2.to_s
          sleep 5
          puts "Successfully see the #{playBookValue2} field value"
          sleep 4
          puts "I successfully See the Second value" 
     end
     end
     sleep 6
     find(:xpath,"//*[@id='actionSpGrid']/thead/tr/th[5]/div[2]/div/select").select playBookValue1
      puts "I select Value for Playbook"
      sleep 8
          within("#actionSpGrid") do
        if first("tbody").all("tr").count > 0
          PlaybookValue = first("tbody").first("tr").all("td")[4].first("a").text
     if playBookValue1.to_s == PlaybookValue.to_s
         puts "Successfully See the Record as per Value Selected from picklist"
       else
         "Failed to see value" 
       end
         else
          puts "No Task Records found"
        end
     end
     
     sleep 10
  rescue Exception => ex
    putstr "Error occurred while Selecting Successplan value"
    putstr_withScreen ex.message
   end
 end
 
 And(/^I verify Assigned To values Present in filter as "(.*?)"$/) do |assignValue1|
   begin
     find(:xpath,"//*[@id='actionSpGrid']/thead/tr/th[6]/div[2]/div/select").all('option').each do |assignValues|
     # find(:xpath,"//*[contains(@class,'table table-hover')]").find(:xpath,'..').find(:xpath,"//th[contains(@data-field,'CSM_Play_Display_Name')]").find(:xpath,"//div[contains(text(),'Play')]/following-sibling::div/div/select").all('option').each do |playValues|
     puts "I check Assigned value"
     if assignValues.text.to_s.include?assignValue1.to_s
          sleep 5
          puts "Successfully see the #{assignValue1} field value"
          sleep 4
          puts "I successfully See the first value" 
     end
     end
     sleep 6
     find(:xpath,"//*[@id='actionSpGrid']/thead/tr/th[6]/div[2]/div/select").select assignValue1
    puts "I select Value for Assigned To"
    
     sleep 8
          within("#actionSpGrid") do
        if first("tbody").all("tr").count > 0
          AssignedToValue = first("tbody").first("tr").all("td")[5].first("a").text
     if assignValue1.to_s == AssignedToValue.to_s
         puts "Successfully See the Record as per Value Selected from picklist"
       else
         "Failed to see value" 
       end
         else
          puts "No Task Records found"
        end
     end
   
   sleep 10
  rescue Exception => ex
    putstr "Error occurred while Selecting Successplan value"
    putstr_withScreen ex.message
   end
 end
 
 And(/^I verify Releated To values Present in filter as "(.*?)"$/) do |releatedValue1|
   begin
     find(:xpath,"//*[@id='actionSpGrid']/thead/tr/th[7]/div[2]/div/select").all('option').each do |releatedValues|
     # find(:xpath,"//*[contains(@class,'table table-hover')]").find(:xpath,'..').find(:xpath,"//th[contains(@data-field,'CSM_Play_Display_Name')]").find(:xpath,"//div[contains(text(),'Play')]/following-sibling::div/div/select").all('option').each do |playValues|
     puts "I check Releated To value"
     if releatedValues.text.to_s.include?releatedValue1.to_s
          sleep 5
          puts "Successfully see the #{releatedValue1} field value"
          sleep 4
          puts "I successfully See the first value" 
     end
     end
     sleep 6
     find(:xpath,"//*[@id='actionSpGrid']/thead/tr/th[7]/div[2]/div/select").select releatedValue1
     puts "I select Value for Releated To"
     
     sleep 8
          within("#actionSpGrid") do
        if first("tbody").all("tr").count > 0
          ReleatedToValue = first("tbody").first("tr").all("td")[6].first("a").text
     if releatedValue1.to_s == ReleatedToValue.to_s
         puts "Successfully See the Record as per Value Selected from picklist"
       else
         "Failed to see value" 
       end
         else
          puts "No Task Records found"
        end
     end
  sleep 10
  rescue Exception => ex
    putstr "Error occurred while Selecting Successplan value"
    putstr_withScreen ex.message
   end
 end
 
 And(/^I verify Task Type values Present in filter as "(.*?)" and "(.*?)"$/) do |taskValue1,taskValue2|
   begin
     find(:xpath,"//*[@id='actionSpGrid']/thead/tr/th[11]/div[2]/div/select").all('option').each do |taskValues|
     # find(:xpath,"//*[contains(@class,'table table-hover')]").find(:xpath,'..').find(:xpath,"//th[contains(@data-field,'CSM_Play_Display_Name')]").find(:xpath,"//div[contains(text(),'Play')]/following-sibling::div/div/select").all('option').each do |playValues|
     puts "I check Task value"
     if taskValues.text.to_s.include?taskValue1.to_s
          sleep 5
          puts "Successfully see the #{taskValue1} field value"
          sleep 4
          puts "I successfully See the first value" 
     end
     if taskValues.text.to_s.include?taskValue2.to_s
          sleep 5
          puts "Successfully see the #{taskValue2} field value"
          sleep 4
          puts "I successfully See the Second value" 
     end
     end
     sleep 6
     find(:xpath,"//*[@id='actionSpGrid']/thead/tr/th[11]/div[2]/div/select").select taskValue1
      puts "I select Value for Task Type"
      sleep 8
          within("#actionSpGrid") do
        if first("tbody").all("tr").count > 0
          $recordCount=first("tbody").all("tr").count
          puts $recordCount
          TaskValue = first("tbody").first("tr").all("td")[10].first("span").text
     if taskValue1.to_s == TaskValue.to_s
         puts "Successfully See the Record as per Value Selected from picklist"
       else
         "Failed to see value" 
       end
         else
          puts "No Task Records found"
        end
     end
     
     sleep 10
  rescue Exception => ex
    putstr "Error occurred while Selecting Successplan value"
    putstr_withScreen ex.message
   end
 end 
 
 And(/^I verify Has Play values Present in filter as "(.*?)" and "(.*?)"$/) do |hasPlayValue1,hasPlayValue2|
   begin
     find(:xpath,"//*[@id='actionSpGrid']/thead/tr/th[12]/div[2]/div/select").all('option').each do |hasPlayValues|
     # find(:xpath,"//*[contains(@class,'table table-hover')]").find(:xpath,'..').find(:xpath,"//th[contains(@data-field,'CSM_Play_Display_Name')]").find(:xpath,"//div[contains(text(),'Play')]/following-sibling::div/div/select").all('option').each do |playValues|
     puts "I check Task value"
     if hasPlayValues.text.to_s.include?hasPlayValue1.to_s
          sleep 5
          puts "Successfully see the #{hasPlayValue1} field value"
          sleep 4
          puts "I successfully See the first value" 
     end
     if hasPlayValues.text.to_s.include?hasPlayValue2.to_s
          sleep 5
          puts "Successfully see the #{hasPlayValue2} field value"
          sleep 4
          puts "I successfully See the Second value"
     else
            puts "I did not See the Second value" 
     end
    end
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while Selecting Successplan value"
    putstr_withScreen ex.message
   end
 end 

 And(/^I verify that Subject Has Picklist$/) do
   begin
     if page.has_xpath?("//*[@id='actionSpGrid']/thead/tr/th[3]/div[text()='Subject']")
      puts "Subject Column Is Present"
      else
        "Subject have Picklist"
      end
      xpathvalue = find(:xpath,"//*[@id='actionSpGrid']/thead/tr/th[3]/div[text()='Subject']/following-sibling::div/div").text
      puts "Xpath Value= " + xpathvalue
      if xpathvalue == ""
        puts "Subject has No Picklist" 
      else 
        puts "Subject has Picklist"
      end
  sleep 8
  rescue Exception => ex
    putstr "Error occurred while opening a SuccessPlan"
    putstr_withScreen ex.message
   end
 end
 
 And(/^I verify that Due Date Has Picklist$/) do
   begin
     if page.has_xpath? ("//*[@id='actionSpGrid']/thead/tr/th[2]/div[text()='Due Date']") 
      puts "Due Date has not its Picklist Value"
      else
        "Due Date have Picklist"
      end
      xpathvalue = find(:xpath,"//*[@id='actionSpGrid']/thead/tr/th[2]/div[text()='Due Date']/following-sibling::div/div").text
      puts "Xpath Value= " + xpathvalue
      if xpathvalue == ""
        puts "Due Date has No Picklist" 
      else 
        puts "Due Date has Picklist"
      end
  sleep 8
  rescue Exception => ex
    putstr "Error occurred while opening a SuccessPlan"
    putstr_withScreen ex.message
    end
  end   
   And(/^I verify that Detail Has Picklist$/) do
     begin
       if page.has_xpath?("//*[@id='actionSpGrid']/thead/tr/th[11]/div[text()='Detail']") 
      puts "Detail has not its Picklist Value"
      else
        "Detail have Picklist"
      end
      xpathvalue = find(:xpath,"//*[@id='actionSpGrid']/thead/tr/th[11]/div[text()='Detail']/following-sibling::div/div").text
      puts "Xpath Value= " + xpathvalue
      if xpathvalue == ""
        puts "Detail has No Picklist" 
      else 
        puts "Detail has Picklist"
      end
  sleep 8
  rescue Exception => ex
    putstr "Error occurred while opening a SuccessPlan"
    putstr_withScreen ex.message
     end
   end
   
And(/^I count records after switching another tab$/) do
  begin
    sleep 8
     within("#actionSpGrid") do
        if first("tbody").all("tr").count > 0
          $recordCount1=first("tbody").all("tr").count
          puts $recordCount1
          else
          puts "No Records found"
        end
      end
      if $recordCount1 == $recordCount
        puts "Successfully see After Switching another tab all filters set to same and its records"
        else
        puts "UnSuccessfully see After Switching another tab all filters set to same and its records"  
      end
      sleep 8
  rescue Exception => ex
    putstr "Error occurred while Swiching tabs"
    putstr_withScreen ex.message
  end
end

 And(/^I verify records After clearing all filters$/) do
   begin
     sleep 8
     within("#actionSpGrid") do
        if first("tbody").all("tr").count > 0
          $filterCount=first("tbody").all("tr").count
          puts $filterCount
          else
          puts "No Records found"
        end
      end
      if $filterCount > $recordCount
        puts "Successfully clear All filter and get All Records"
        else
        puts "UnSuccessfully clear All filter and didn't get All Records"  
      end
      sleep 8
  rescue Exception => ex
    putstr "Error occurred while clearing filters"
    putstr_withScreen ex.message
   end
 end
 
And(/^I verify all filters Present on Activity Stream tab page$/) do
  begin
    sleep 10
    find(:xpath,"//*[contains(@class,'dropdown-toggle')]").click
    puts "I successfully Clicked on Column Picker"
      sleep 10
      within('.dropdown-menu') do
      sleep 6
      find(:xpath,"//li[4]/label[contains(text(),'Play')]/input").set(true)
      puts "Play Filter Is on Activity Stream tab Page"
      sleep 6
      find(:xpath,"//li[5]/label[contains(text(),'Playbook')]/input").set(true)
      puts "Playbook Filter Is on Activity Stream tab Page"
      sleep 6
      find(:xpath,"//li[6]/label[contains(text(),'Assigned To')]/input").set(true)
      puts "Assigned To Filter Is on Activity Stream tab Page"
      sleep 16
      find(:xpath,"//li[9]/label[contains(text(),'Task State')]/input").set(true)
      puts "Related To Filter Is on Activity Stream tab Page"
      sleep 6
      find(:xpath,"//li[7]/label[contains(text(),'Task Type')]/input").set(true)
      puts "Task Type Filter Is on Activity Stream tab Page"
      sleep 6
      find(:xpath,"//li[10]/label[contains(text(),'Has Play')]/input").set(true)
      puts "Has Play Filter Is on Activity Stream tab Page"
      end  
      sleep 8
      find(:xpath,"//*[contains(@class,'dropdown-toggle')]").click
  sleep 10
  rescue Exception => ex
    putstr "Error occurred while verifying Dynamic Filters"
    putstr_withScreen ex.message
    end
end

And(/^I verify Play values Present in filter as "(.*?)" and "(.*?)" on Activity Stream$/) do |playValue1,playValue2|
   begin
     find(:xpath,"//*[@id='ActivityHistory']/thead/tr/th[4]/div[2]/div/select").all('option').each do |playValues|
     # find(:xpath,"//*[contains(@class,'table table-hover')]").find(:xpath,'..').find(:xpath,"//th[contains(@data-field,'CSM_Play_Display_Name')]").find(:xpath,"//div[contains(text(),'Play')]/following-sibling::div/div/select").all('option').each do |playValues|
     puts "I check Play value"
     puts playValues.text.to_s
     if playValues.text.to_s.include?playValue1.to_s
          sleep 5
          puts "Successfully see the #{playValue1} field value"
          sleep 4
          puts "I successfully See the first value" 
     end
     if playValues.text.to_s.include?playValue2.to_s
          sleep 5
          puts "Successfully see the #{playValue2} field value"
          sleep 4
          puts "I successfully See the Second value" 
     end
    end
    sleep 6
     find(:xpath, "//*[@id='ActivityHistory']/thead/tr/th[4]/div[2]/div/select").select playValue1
     puts playValue1
     puts "I select Value for Play" 
     PlayValue = first(:xpath,"//*[@id='ActivityHistory']/tbody/tr/td[4]/a").text.to_s
     puts PlayValue
     if playValue1.to_s == PlayValue.to_s
         puts "Successfully See the Record as per Value Selected from picklist"
       else
         "Failed to see value" 
       end
     sleep 8
    within("#ActivityHistory") do
        if first("tbody").all("tr").count > 0
          $recordCountOnActivity=first("tbody").all("tr").count
          puts $recordCountOnActivity
          else
          puts "No Records found"
        end
      end   
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while Selecting Successplan value"
    putstr_withScreen ex.message
   end
 end

    
And(/^I verify Playbook values Present in filter as "(.*?)" and "(.*?)" on Activity Stream$/) do |playBookValue1,playBookValue2|
   begin
     find(:xpath,"//*[@id='ActivityHistory']/thead/tr/th[5]/div[2]/div/select").all('option').each do |playBookValues|
     # find(:xpath,"//*[contains(@class,'table table-hover')]").find(:xpath,'..').find(:xpath,"//th[contains(@data-field,'CSM_Play_Display_Name')]").find(:xpath,"//div[contains(text(),'Play')]/following-sibling::div/div/select").all('option').each do |playValues|
     puts "I check Playbook value"
     if playBookValues.text.to_s.include?playBookValue1.to_s
          sleep 5
          puts "Successfully see the #{playBookValue1} field value"
          sleep 4
          puts "I successfully See the first value" 
     end
     if playBookValues.text.to_s.include?playBookValue2.to_s
          sleep 5          
          puts "Successfully see the #{playBookValue2} field value"
          sleep 4
          puts "I successfully See the Second value" 
     end
     end
     sleep 6
     find(:xpath,"//*[@id='ActivityHistory']/thead/tr/th[5]/div[2]/div/select").select playBookValue1
      puts "I select Value for Playbook"
      sleep 8
      PlaybookValue = first(:xpath,"//*[@id='ActivityHistory']/tbody/tr/td[5]/a").text.to_s
     puts PlaybookValue
      if playBookValue1.to_s == PlaybookValue.to_s
         puts "Successfully See the Record as per Value Selected from picklist"
       else
         "Failed to see value" 
       end
         
     sleep 10
  rescue Exception => ex
    putstr "Error occurred while Selecting Successplan value"
    putstr_withScreen ex.message
   end
 end
 
 And(/^I verify Assigned To values Present in filter as "(.*?)" on Activity Stream$/) do |assignValue1|
   begin
     find(:xpath,"//*[@id='ActivityHistory']/thead/tr/th[6]/div[2]/div/select").all('option').each do |assignValues|
     # find(:xpath,"//*[contains(@class,'table table-hover')]").find(:xpath,'..').find(:xpath,"//th[contains(@data-field,'CSM_Play_Display_Name')]").find(:xpath,"//div[contains(text(),'Play')]/following-sibling::div/div/select").all('option').each do |playValues|
     puts "I check Assigned value"
     if assignValues.text.to_s.include?assignValue1.to_s
          sleep 5
          puts "Successfully see the #{assignValue1} field value"
          sleep 4
          puts "I successfully See the first value" 
     end
     end
     sleep 6
     find(:xpath,"//*[@id='ActivityHistory']/thead/tr/th[6]/div[2]/div/select").select assignValue1
    puts "I select Value for Assigned To"
    sleep 8
      AssignedToValue = first(:xpath,"//*[@id='ActivityHistory']/tbody/tr/td[6]/a").text.to_s
     puts AssignedToValue
      if assignValue1.to_s == AssignedToValue.to_s
         puts "Successfully See the Record as per Value Selected from picklist"
       else
         "Failed to see value" 
       end
     
   sleep 10
  rescue Exception => ex
    putstr "Error occurred while Selecting Successplan value"
    putstr_withScreen ex.message
   end
 end
 
 And(/^I verify Task state values Present in filter as "(.*?)" on Activity Stream$/) do |taskStateValue1|
   begin
     find(:xpath,"//*[@id='ActivityHistory']/thead/tr/th[9]/div[2]/div/select").all('option').each do |taskStateValues|
     # find(:xpath,"//*[contains(@class,'table table-hover')]").find(:xpath,'..').find(:xpath,"//th[contains(@data-field,'CSM_Play_Display_Name')]").find(:xpath,"//div[contains(text(),'Play')]/following-sibling::div/div/select").all('option').each do |playValues|
     # puts "Task state" + taskStateValues
     puts "I check Task state value"
     if taskStateValues.text.to_s.include?taskStateValue1.to_s
          sleep 5
          puts "Successfully see the #{taskStateValue1} field value"
          sleep 4
          puts "I successfully See the first value" 
     end
     end
     sleep 6
     find(:xpath,"//*[@id='ActivityHistory']/thead/tr/th[9]/div[2]/div/select").select taskStateValue1
     puts "I select Value for Releated To"
     sleep 8
      TaskStateValue = first(:xpath,"//*[@id='ActivityHistory']/tbody/tr/td[9]/span").text.to_s
     puts TaskStateValue
      if taskStateValue1.to_s == TaskStateValue.to_s
         puts "Successfully See the Record as per Value Selected from picklist"
       else
         "Failed to see value" 
       end
     sleep 8
    within("#ActivityHistory") do
         if first("tbody").all("tr").count > 0
           $recordCountOnActivity=first("tbody").all("tr").count
           puts $recordCountOnActivity
           else
          puts "No Records found"
        end
      end   
  sleep 10
  rescue Exception => ex
    putstr "Error occurred while Selecting Successplan value"
    putstr_withScreen ex.message
   end
 end
 
 And(/^I verify Task Type values Present in filter as "(.*?)" and "(.*?)" on Activity Stream$/) do |taskValue1,taskValue2|
   begin
     find(:xpath,"//*[@id='ActivityHistory']/thead/tr/th[7]/div[2]/div/select").all('option').each do |taskValues|
     # find(:xpath,"//*[contains(@class,'table table-hover')]").find(:xpath,'..').find(:xpath,"//th[contains(@data-field,'CSM_Play_Display_Name')]").find(:xpath,"//div[contains(text(),'Play')]/following-sibling::div/div/select").all('option').each do |playValues|
     puts taskValues
     puts "I check Task value"
     if taskValues.text.to_s.include?taskValue1.to_s
          puts taskValue1
          sleep 5
          puts "Successfully see the #{taskValue1} field value"
          sleep 4
          puts "I successfully See the first value" 
     end
     if taskValues.text.to_s.include?taskValue2.to_s
          sleep 5
          puts taskValue2
          puts "Successfully see the #{taskValue2} field value"
          sleep 4
          puts "I successfully See the Second value" 
     end
     end
     sleep 6
     find(:xpath,"//*[@id='ActivityHistory']/thead/tr/th[7]/div[2]/div/select").select taskValue1
      puts "I select Value for Task Type"
      sleep 8
      TaskValue = first(:xpath,"//*[@id='ActivityHistory']/tbody/tr/td[7]/a/span").text.to_s
     puts TaskValue
      if taskValue1.to_s == TaskValue.to_s
         puts "Successfully See the Record as per Value Selected from picklist"
       else
         "Failed to see value" 
       end
       
     sleep 10
  rescue Exception => ex
    putstr "Error occurred while Selecting Successplan value"
    putstr_withScreen ex.message
   end
 end 
 
 And(/^I verify Has Play values Present in filter as "(.*?)" and "(.*?)" on Activity Stream$/) do |hasPlayValue1,hasPlayValue2|
   begin
     find(:xpath,"//*[@id='ActivityHistory']/thead/tr/th[10]/div[2]/div/select").all('option').each do |hasPlayValues|
     # find(:xpath,"//*[contains(@class,'table table-hover')]").find(:xpath,'..').find(:xpath,"//th[contains(@data-field,'CSM_Play_Display_Name')]").find(:xpath,"//div[contains(text(),'Play')]/following-sibling::div/div/select").all('option').each do |playValues|
     puts "I check Task value"
     if hasPlayValues.text.to_s.include?hasPlayValue1.to_s
          sleep 5
          puts "Successfully see the #{hasPlayValue1} field value"
          sleep 4
          puts "I successfully See the first value" 
     end
     if hasPlayValues.text.to_s.include?hasPlayValue2.to_s
          sleep 5
          puts "Successfully see the #{hasPlayValue2} field value"
          sleep 4
          puts "I successfully See the Second value"
     else
            puts "I did not See the Second value" 
     end
    end
    sleep 8
    within("#ActivityHistory") do
         if first("tbody").all("tr").count > 0
           $recordCountOnActivity=first("tbody").all("tr").count
           puts $recordCountOnActivity
           else
          puts "No Records found"
        end
      end   
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while Selecting Successplan value"
    putstr_withScreen ex.message
   end
 end 
 
And(/^I count records after switching another tab from Activity Stream$/) do
  begin
    sleep 8
     within("#ActivityHistory") do
        if first("tbody").all("tr").count > 0
          $recordCount2=first("tbody").all("tr").count
          puts $recordCount2
          else
          puts "No Records found"
        end
      end
      if $recordCount2 == $recordCountOnActivity
        puts "Successfully see After Switching another tab all filters set to same and its records"
        else
        puts "UnSuccessfully see After Switching another tab all filters set to same and its records"  
      end
      sleep 8
  rescue Exception => ex
    putstr "Error occurred while Swiching tabs"
    putstr_withScreen ex.message
  end
end

And(/^I verify records After clearing all filters from Activity Stream$/) do
  begin
    sleep 8
     within("#ActivityHistory") do
        if first("tbody").all("tr").count > 0
          $filterCount1=first("tbody").all("tr").count
          puts $filterCount1
          else
          puts "No Records found"
        end
      end
      puts $recordCountOnActivity
      if $filterCount1 > $recordCountOnActivity
        puts "Successfully clear All filter and get All Records"
        else
        puts "UnSuccessfully clear All filter and didn't get All Records"  
      end
      sleep 8
  rescue Exception => ex
    putstr "Error occurred while clearing filters"
    putstr_withScreen ex.message
  end
end


And(/^I verify that Subject Has Picklist from Activity Stream$/) do
   begin
     if page.has_xpath?("//*[@id='ActivityHistory']/thead/tr/th[3]/div[text()='Subject']")
      puts "Subject Column Is Present"
      else
        "Subject have Picklist"
      end
      xpathvalue = find(:xpath,"//*[@id='ActivityHistory']/thead/tr/th[3]/div[text()='Subject']/following-sibling::div/div").text
      puts "Xpath Value= " + xpathvalue
      if xpathvalue == ""
        puts "Subject has No Picklist" 
      else 
        puts "Subject has Picklist"
      end
  sleep 8
  rescue Exception => ex
    putstr "Error occurred while opening a SuccessPlan"
    putstr_withScreen ex.message
   end
 end
 
 And(/^I verify that Due Date Has Picklist from Activity Stream$/) do
   begin
     if page.has_xpath? ("//*[@id='ActivityHistory']/thead/tr/th[2]/div[text()='Due Date']") 
      puts "Due Date has not its Picklist Value"
      else
        "Due Date have Picklist"
      end
      xpathvalue = find(:xpath,"//*[@id='ActivityHistory']/thead/tr/th[2]/div[text()='Due Date']/following-sibling::div/div").text
      puts "Xpath Value= " + xpathvalue
      if xpathvalue == ""
        puts "Due Date has No Picklist" 
      else 
        puts "Due Date has Picklist"
      end
  sleep 8
  rescue Exception => ex
    putstr "Error occurred while opening a SuccessPlan"
    putstr_withScreen ex.message
    end
  end   
   
   And(/^I verify that Completion Date Has Picklist from Activity Stream$/) do
     begin
       if page.has_xpath?("//*[@id='ActivityHistory']/thead/tr/th[1]/div[text()='Completion Date']") 
      puts "Completion Date has not its Picklist Value"
      else
        "Completion Date have Picklist"
      end
      xpathvalue = find(:xpath,"//*[@id='ActivityHistory']/thead/tr/th[1]/div[text()='Completion Date']/following-sibling::div/div").text
      puts "Xpath Value= " + xpathvalue
      if xpathvalue == ""
        puts "Completion Date has No Picklist" 
      else 
        puts "Completion Date has Picklist"
      end
  sleep 8
  rescue Exception => ex
    putstr "Error occurred while opening a SuccessPlan"
    putstr_withScreen ex.message
     end
   end
   

