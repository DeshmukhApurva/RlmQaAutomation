require 'pry'
Then(/^I create a new Success Plan Template with name "(.*?)" and playbook "(.*?)"$/) do |spt_name, pb_name|
  begin
    #arg=getDetails "SPT"
    #click_link('ServiceSource Setup')
    sleep 5
    click_on "Create New"
    puts "Creating a new SPT"
    sleep 2
    #fill_in "Template Name",:with => arg["Template Name"]
    fill_in "Template Name",:with => spt_name
    sleep 2
    within(".pbBottomButtons") do
     click_on "Create"
    end
    puts "Successfully created SPT" 
    sleep 10
    if page.has_content?('Define Success Plan Playbooks')
      puts "Define Success Plan Playbooks section displayed"
      sleep 3
    else
      raise "Define Success Plan Playbook section not displayed"
    end
    click_on "Add Playbook"
    sleep 5
    first(:xpath, ".//tr/td/span[contains(text(), 'SPPB1')]//parent::td//preceding-sibling::td/a").click
    sleep 5
    within all(".pbButton")[0] do
      click_on "Save"
    end
    puts "Successfully added playbook to Success Plan Template"
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while creating Success Plan Template"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

Then(/^I fetch URI of template$/) do
  begin
    puts "Get Template ID from URL"
    templatePath = URI.parse(current_url).request_uri
    templateId = templatePath.split('id=')[1].split('&')[0]
    templateId = templateId[0,15] 
    puts "templateId: "+templateId
    sleep 4
    record = $client.query("SELECT Name FROM ServiceSource1__CSM_Account_Plan_Template__c WHERE Id = \'#{templateId}\'")
    $playBookTempForPlan = record.first.Name
    puts "Playbook :"+$playBookTempForPlan
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while fetching SPT ID"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

Then(/^I create a SuccessPlan using map data "(.*?)"$/) do |mapName|
  begin
    sleep 3
    click_on "New"
    puts "Creating Success Plan with Template '#{$playBookTempForPlan}' and Account '#{$accName}'"
    sleep 5
    arg = getDetails mapName
    sleep 2
    fill_in "Success Plan Template", :with => $playBookTempForPlan
    sleep 2
    fill_in "Account",:with => $accName
    sleep 2
    #add code for Phase Start Date instead of taking from yml
    fill_in "Phase Start Date", :with=> arg["Phase Start Date"]
    sleep 2
    within(:id,"topButtonRow") do
      click_on "Save"
    end
    sleep 10
    puts "Successfully created Success Plan" 
    sleep 3
    
  rescue Exception => ex
    putstr "Error occurred while creating Success Plan"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end 

Then(/^I Save success plan Name value$/) do
  begin
    templatePath = URI.parse(current_url).request_uri
    templateId = templatePath.split('id=')[1].split('&')[0]
    templateId = templateId[0,15] 
    puts "PlanId: "+templateId
    sleep 4
    record = $client.query("SELECT Name FROM ServiceSource1__CSM_Account_Plan__c WHERE Id = \'#{templateId}\'")
    #SELECT Name FROM ServiceSource1__CSM_Account_Plan__c WHERE Id = 'a07j000000GqDdx'
    #SELECT Name FROM ServiceSource1__CSM_Account_Plan_Template__c WHERE Id = 'a06j000000B3q3xAAB'
    $SuccessPlanName = record.first.Name
    #puts play.Id + " " + play.Name + " " + play.ServiceSource1__CSM_Display_Name__c
    puts "Success Plan :"+$SuccessPlanName
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while creating SPT"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end
Then(/^I verify Playbooks subtab using map data "(.*?)" for "(.*?)" after "(.*?)" playbook$/) do |mapName, playbookNumber, action|
  begin
    find(:xpath, ".//li/a[contains(text(), 'Playbooks')]").click
    sleep 3
    arg = getDetails mapName
    if playbookNumber == 'Playbook1'
      playbook_name = arg["APB1"] #need to change arg names
      play_name = arg["PL1"]  #need to change arg names
    else
      playbook_name = arg["APB2"] #need to change arg names
      play_name = arg["PL2"] #need to change arg names
    end 
    if page.has_table?("playbookSPGrid")
      within(:id, "playbookSPGrid") do
        playStatus = has_xpath?(".//td/a[contains(text(), '#{playbook_name}')]")
        if action == "adding"
          puts "After adding playbook, in Playbooks Grid '#{playbook_name}' visible: #{playStatus}"
        else
          puts "After deleting playbook, in Playbooks Grid '#{playbook_name}' visible: #{playStatus}"
        end
      end
    else
      raise "Playbooks grid is not present."
    end
    sleep 3
    if page.has_table?("successPlanPlayGrid")
      within("#successPlanPlayGrid") do
        playStatus = has_xpath?(".//td/a[contains(text(), '#{play_name}')]")
        if action == "adding"
          puts "After adding playbook, in Plays Grid '#{play_name}' visible: #{playStatus}"
        else
          puts "After deleting playbook, in Plays Grid '#{play_name}' visible: #{playStatus}"
        end
      end
    else
      raise "Plays grid is not present."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying records from Playbooks Tab of SP"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end 

Then(/I add another playbook using map data "(.*?)" to SPT$/) do |mapName|
  begin
    sleep 5  
    arg = getDetails mapName
    templateName = arg["SPT1"]
    playbook = arg["APB2"]
    first(:xpath, ".//tr/td/span[contains(text(), '#{templateName}')]//parent::td//preceding-sibling::td/a[contains(text(), 'Edit')]").click
    sleep 3
    if page.has_content?('Define Success Plan Playbooks')
      puts "Define Success Plan Playbooks section displayed"
      sleep 3
    else
      raise "Define Success Plan Playbook section not displayed"
    end
    click_on "Add Playbook"
    ##Select second playbook
    sleep 5
    first(:xpath, ".//tr/td/span[contains(text(), '#{playbook}')]//parent::td//preceding-sibling::td/a").click
    sleep 5
    within all(".pbButton")[0] do
      click_on "Save"
    end
    puts "Successfully added Second playbook to Success Plan Template"
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying success plan data"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end 

Then(/^I select SP for verifying Playbooks/) do
  begin       
    within(:class, ".hotListElement") do
      #find(:xpath, ".//th/a[contains(text(), 'SP-000048')]").click
      find(:xpath, ".//th/a[contains(text(), '#{$SuccessPlanName}')]").click
      puts "Success Plan selected."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying success plan data"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end 

Then(/^I verify Playbooks subtab for Playbooks and Plays Grid/) do
  begin       
    sleep 5
    find(:xpath, ".//li/a[contains(text(), 'Playbooks')]").click
    sleep 3
    if page.has_table?("playbookSPGrid")
      playBookCount = all("#playbookSPGrid tr").count-2 
      puts "No. of PlayBooks: #{playBookCount + 1}"      
      puts "Playbooks: "
      while playBookCount >=0       
        playBook = find(:xpath, "//table[@id='playbookSPGrid']//descendant::tr[@data-index = '#{playBookCount}'][1]/td/a").text
        puts playBook
        playBookCount -= 1
      end
    else
      puts "PlayBook Grid Table is not present"
    end
    sleep 3
    if page.has_table?("successPlanPlayGrid")
      playsCount = all("#successPlanPlayGrid tr").count-2 
      puts "No. of Plays: #{playsCount + 1}"
      puts "Plays: "      
      while playsCount >=0 
        play = find(:xpath, "//table[@id='successPlanPlayGrid']//descendant::tr[@data-index = '#{playsCount}'][1]/td[1]/a").text
        puts play
        playsCount -= 1
      end
    else
      raise "Plays grid is not present."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying playbooks and plays for Success Plan"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

Then(/I delete playbook using map data "(.*?)" to SPT$/) do |mapName|
  begin
    sleep 5
    arg = getDetails mapName
    templateName = arg["SPT1"]
    playbook = arg["APB2"]
    puts "Select '#{templateName}' template"
    first(:xpath, ".//tr/td/span[contains(text(), '#{templateName}')]//parent::td//preceding-sibling::td/a[contains(text(), 'Edit')]").click
    sleep 3
    if page.has_content?('Define Success Plan Playbooks')
      puts "Define Success Plan Playbooks section displayed"
      sleep 3
    else
      raise "Define Success Plan Playbook section not displayed"
    end 
    puts "Delete '#{playbook}' playbook."
    sleep 5
    first(:xpath, ".//tr/td/span[contains(text(), '#{playbook}')]//parent::td//preceding-sibling::td/a[contains(text(), 'Delete')]").click
    sleep 5
    puts "Accept the alert"
    page.driver.browser.switch_to.alert.accept
    sleep 2
    within all(".pbButton")[0] do
      click_on "Save"
    end
    puts "Successfully deleted '#{playbook}' playbook from '#{templateName}'Success Plan Template"
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while deleting playbook"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end
#incomplete
Then(/I add playbook to SP using map data "(.*?)"$/) do |mapName|
  begin
    sleep 5  
    arg = getDetails mapName
    #templateName = arg["SPT1"]
    playbook = arg["APB2"]
    click_on "Add Playbook"
    ##Select second playbook
    sleep 5
    first(:xpath, ".//tr/td/span[contains(text(), '#{playbook}')]//parent::td//preceding-sibling::td/a").click
    sleep 5
    within all(".pbButton")[0] do
      click_on "Save"
    end
  rescue Exception => ex
    putstr "Error occurred while adding playbook"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end 