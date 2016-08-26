require 'pry'

Then(/^I create a new Success Plan Template with mapData "(.*?)" and playbook "(.*?)"$/) do |mapData, playbook|
  begin
    arg=getDetails mapData
    templateName = arg['SPT1']
    playbookName = arg[playbook]
    sleep 5
    click_on "Create New"
    puts "Creating a new SPT"
    sleep 2
    fill_in "Template Name",:with => templateName
    sleep 2
    within(".pbBottomButtons") do
     click_on "Create"
    end
    puts "Successfully created SPT: "+templateName
    sleep 10
    if page.has_content?('Define Success Plan Playbooks')
      puts "Define Success Plan Playbooks section displayed"
      sleep 3
    else
      raise "Define Success Plan Playbook section not displayed"
    end
    click_on "Add Playbook"
    sleep 5
    first(:xpath, ".//tr/td/span[contains(text(), '#{playbookName}')]//parent::td//preceding-sibling::td/a").click
    sleep 5
    within all(".pbButton")[0] do
      click_on "Save"
    end
    puts "Successfully added '#{playbookName}' playbook to Success Plan Template"
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
    fill_in "Account",:with => $accountName
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
    $SuccessPlanName = record.first.Name
    #puts play.Id + " " + play.Name + " " + play.ServiceSource1__CSM_Display_Name__c
    puts "Success Plan :"+$SuccessPlanName
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while saving Success Plan name"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end

Then(/^I verify Playbooks subtab using map data "(.*?)" for "(.*?)" after "(.*?)" playbook$/) do |mapName, playbookNumber, action|
  begin
    sleep 3
    arg = getDetails mapName
    if playbookNumber == 'APB1'
      playbook_name = arg["APB1"]
      play_name = arg["PL1"]
    else
      playbook_name = arg["APB2"]
      play_name = arg["PL2"]
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
      #find(:xpath, ".//th/a[contains(text(), 'SP-000052')]").click
      find(:xpath, ".//th/a[contains(text(), '#{$SuccessPlanName}')]").click
      puts "Success Plan selected."
    end
  rescue Exception => ex
    putstr "Error occurred while selecting success plan"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end 

Then(/^I verify Playbooks subtab for Playbooks and Plays Grid/) do
  begin       
    sleep 5
    #find(:xpath, ".//li/a[contains(text(), 'Playbooks')]").click
    #sleep 3
    if page.has_table?("playbookSPGrid")
      playBookCount = all("#playbookSPGrid tr").count-2 
      puts "No. of PlayBooks: #{playBookCount + 1}"      
      puts "Playbooks: "
      while playBookCount >=0       
        playBook = find(:xpath, "//table[@id='playbookSPGrid']//descendant::tr[@data-index = '#{playBookCount}'][1]/td[2]/a").text
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

Then(/I delete playbook from SPT using map data "(.*?)" and key "(.*?)"$/) do |mapName, key|
  begin
    sleep 5
    arg = getDetails mapName
    templateName = arg["SPT1"]
    playbook = arg[key]
    # puts "Select '#{templateName}' template"
    # first(:xpath, ".//tr/td/span[contains(text(), '#{templateName}')]//parent::td//preceding-sibling::td/a[contains(text(), 'Edit')]").click
    # sleep 3
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

Then(/I add playbook or add and skip criteria to SP using map data "(.*?)" and key "(.*?)"$/) do |mapName, key|
  begin
    sleep 5  
    arg = getDetails mapName
    puts "playbook = "+arg[key] 
    playbook = arg[key]
    fill_in "Search:",:with => playbook
    #first(:xpath, ".//tr/td/a")
    sleep 3
    if has_xpath?(".//tr/td/a[contains(text(),'Add')]")
      first(:xpath, ".//tr/td/a[contains(text(),'Add')]").click
      puts "Clicked on 'Add' link"
    else
      first(:xpath, ".//tr/td/a[contains(text(),'Add & Skip Criteria')]").click
      puts "Clicked on 'Add & Skip Criteria' link"
    end
    sleep 5
    puts "Accept the alert"
    page.driver.browser.switch_to.alert.accept
    sleep 5
    #first(:xpath, ".//tr/td/span[contains(text(), '#{playbook}')]//parent::td//preceding-sibling::td/a").click
    # sleep 5
    # within all(".pbButton")[0] do
      # click_on "Save"
    # end
  rescue Exception => ex
    putstr "Error occurred while adding playbook"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end 

Then(/I click on "(.*?)" link of SPT for "(.*?)" and key "(.*?)"$/) do |action, mapName, keyName|
  begin
    puts "Click on '#{action}' of SPT "
    arg = getDetails mapName
    SPT = arg[keyName]
    puts "SPT = "+SPT
    first(:xpath, ".//tr/td/span[contains(text(), '#{SPT}')]//parent::td//preceding-sibling::td/a[contains(text(), '#{action}')]").click
    puts "Clicked on '#{action}' of SPT '#{SPT}'"
  rescue Exception => ex
    putstr "Error occurred while clicking on '#{action}' of SPT '#{SPT}'"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end 

Then(/I verify playbooks in SPT using map data "(.*?)" and key "(.*?)"$/) do |mapName, keyName|
  begin
    sleep 3
    arg = getDetails mapName
    playbook = arg[keyName]
    puts "Verifying '#{playbook}' playbook is visible in template."
    if page.has_content?('Define Success Plan Playbooks')
      puts "Define Success Plan Playbooks section displayed"
      sleep 3
    else
      raise "Define Success Plan Playbook section not displayed"
    end 
    #add code here
    playBookStatus = has_xpath?(".//td/span[contains(text(), '#{playbook}')]")
    puts "Playbook '#{playbook}' is visible in SPT: '#{playBookStatus}'"
  rescue Exception => ex
    putstr "Error occurred while verifying playbook '#{playbook}' in SPT"
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end 


Then (/^I delete a Playbook "(.*?)" from SP using mapdata "(.*?)"$/) do |keyName, mapName|
  begin
    arg =  getDetails (mapName)
    playbook = arg[keyName]
    within(:id,"playbookSPGrid") do
      first(:xpath, "//tr/td/a[contains(text(), '#{playbook}')]//parent::td//preceding-sibling::td/a[contains(text(), Del)]").click
    end    
    puts "Clicked on the Delete link of Playbook '#{playbook}'"
    sleep 3
    if page.has_content?('Success Plan Template Playbook has been deleted')
      puts "Success Plan Template PlayBook has been deleted message displayed"
      sleep 3
    else
      raise "Success Plan Template PlayBook has been deleted message not displayed"
    end
  end
end  

#US1276
Then(/^I create SuccessPlan using map "(.*?)" and key "(.*?)"$/) do |mapName, keyName|
  begin
    sleep 3
    arg = getDetails mapName
    time = Time.new
    #    sPT = time.hour.to_s + time.min.to_s + time.sec.to_s
    #    $sPTName = arg["SP"] + sPT.to_s
    phase_Start_Date = time.month.to_s + "/" + time.day.to_s + "/" + (time.year.to_i + 1).to_s
    #within(:class,".pbButton") do
    record = $client.query("SELECT Id,Name FROM ServiceSource1__CSM_Account_Plan_Template__c where ServiceSource1__CSM_Template_Name__c = \'#{arg["#{keyName}"]}\'")
    sPTName = record.first.Name

    puts "SPT1: " + sPTName
    click_on "New"
    #end
    sleep 5
    fill_in "Success Plan Template", :with => sPTName
    sleep 2
    fill_in "Account",:with => $accountName
    sleep 2
    fill_in "Phase Start Date", :with=> phase_Start_Date
    sleep 2
    within("#bottomButtonRow") do
      click_on "Save"
    end
    sleep 10
    puts "Successfully created Success Plan"
    sleep 3

    $SPurl = URI.parse(current_url).request_uri
    $SPId = $SPurl.split('id=')[1].split('&')[0]
    $SPId = $SPId[0,15]
    puts "PlanId: " + $SPId
    sleep 4
    record = $client.query("SELECT Name FROM ServiceSource1__CSM_Account_Plan__c WHERE Id = \'#{$SPId}\'")
    $SPName = record.first.Name
    #puts play.Id + " " + play.Name + " " + play.ServiceSource1__CSM_Display_Name__c
    puts "Success Plan :" + $SPName
    sleep 5
  rescue Exception => ex
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end 

Then(/^I store "(.*?)" Play and PlayBook details of Succcess Plan$/) do |old_new|
  begin
    sleep 3
    if page.has_table?("playbookSPGrid")
      playBookCount = all("#playbookSPGrid tr").count-2
      puts "No. of PlayBooks: #{playBookCount}"

      $OldPlayBook = Array.new
      $NewPlayBook = Array.new
      while playBookCount >=0
        within(:id, "playbookSPGrid") do
          if old_new == 'old'
            $OldPlayBook[playBookCount] = find(:xpath, "//table[@id='playbookSPGrid']//descendant::tr[@data-index = '#{playBookCount}'][1]/td[2]/a").text
            puts "Playbooks: " + $OldPlayBook[playBookCount]
          else
            $NewPlayBook[playBookCount] = find(:xpath, "//table[@id='playbookSPGrid']//descendant::tr[@data-index = '#{playBookCount}'][1]/td[2]/a").text
            puts "Playbooks: " + $NewPlayBook[playBookCount]
          end
          playBookCount -= 1
        end
      end
    else
      puts "PlayBook Grid Table is not present"
    end
    sleep 3
    if page.has_table?("successPlanPlayGrid")
      playsCount = all("#successPlanPlayGrid tr").count-2
      puts "No. of Plays: #{playsCount}"

      $OldPlay = Array.new
      $NewPlay = Array.new
      while playsCount >=0
        within(:id, "successPlanPlayGrid") do
          if old_new == 'old'
            $OldPlay[playsCount] = find(:xpath, "//tr[contains(@data-index,'#{playsCount}')]/td[1]/a").text
            puts "Plays: " + $OldPlay[playsCount]
          else
            $NewPlay[playsCount] = find(:xpath, "//tr[contains(@data-index,'#{playsCount}')]/td[1]/a").text
            puts "Plays: " + $NewPlay[playsCount]
          end
          playsCount -= 1
        end
      end
    else
      raise "Plays grid is not present."
    end
  rescue Exception => ex
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end 

Then(/^I open Success Plan record$/) do
  begin
#    if page.has_button?('Go!')
#      click_on "Go!"
#    end
#    sleep 10
#    if page.has_css?(".listItemPad")
#      sleep 4
#      puts "Successfully see the Alphabetic Pagination"
#      all(".selectArrow")[0].click
#      sleep 8
#      within(".bottomNav") do
#        first("table").all("tr")[4].click
#      end
#    else
#      putstr "Failed to see the Alphabetic Pagination"
#    end
#    sleep 10
#    puts page.has_xpath? ('//table/descendant::span[contains(text(),"#{$SPName}")]')
#    if page.has_xpath? ('//table/descendant::span[contains(text(),"#{$SPName}")]')
#      #//table/descendant::span[contains(text(),"SP-001821")]/ancestor-or-self::td[1]/preceding-sibling::td[1]/div/a/span[contains(text(),"Edit")]
#      #all("//table/tbody/tr/td[2]/div").first(:link, 'Edit').click
#      find(:xpath, '//table/descendant::span[contains(text(),"#{$SPName}")]/ancestor-or-self::td[1]/preceding-sibling::td[1]/div/a/span[contains(text(),"Edit")').click
#      sleep 5
#    end
#
    find(:xpath, '//input[contains(@placeholder,"Search...")]').click
    sleep 2
    find(:xpath, '//input[contains(@placeholder,"Search...")]').set $SPName
    sleep 2
    find(:xpath, '//input[contains(@id,"phSearchButton")]').click
    sleep 8
    within("#ServiceSource1__CSM_Account_Plan__c_body") do
      within(".list") do
        if first("tbody").all(".dataRow")[0].all("th")[0].first("a").text == $SPName
          first("tbody").all(".dataRow")[0].all("td")[0].first("a").click
          puts "Success Plan #{$SPName} Found..."
        else
          puts "Success Plan #{$SPName} Not Found..."
        end
      end
    end
    sleep 10
  rescue Exception => ex
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
    putstr_withScreen ex.message
  end
end 

Then(/^I change the SPT of SP using map "(.*?)" and key "(.*?)"$/) do |mapName, keyName|
  begin
    sleep 5
    arg = getDetails mapName
    within("#bottomButtonRow") do
      click_on "Edit"
    end
    sleep 10
    record = $client.query("SELECT Id,Name FROM ServiceSource1__CSM_Account_Plan_Template__c where ServiceSource1__CSM_Template_Name__c = \'#{arg["keyName"]}\'")
    sPTName = record.first.name
    fill_in "Success Plan Template", :with => arg["#{sPTName}"]
    sleep 2
    within("#bottomButtonRow") do
      click_on "Save"
    end
    sleep 10
  rescue Exception => ex
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end 

Then(/^I verify Play and PlayBook details of Succcess Plan$/) do |old_new|
  begin
    sleep 3
    if page.has_table?("playbookSPGrid")
      playBookCount = all("#playbookSPGrid tr").count-2
      puts "No. of PlayBooks: #{playBookCount}"
      while playBookCount >=0
        within(:id, "playbookSPGrid") do
          if $OldPlayBook[playBookCount] != $NewPlayBook[playBookCount]
            puts "PlayBook has been updated"
          else
            raise "PlayBook has not been updated"
          end
          playBookCount -= 1
        end
      end
    else
      puts "PlayBook Grid Table is not present"
    end
    sleep 3
    if page.has_table?("successPlanPlayGrid")
      playsCount = all("#successPlanPlayGrid tr").count-2
      puts "No. of Plays: #{playsCount}"

      $OldPlay = Array.New
      $NewPlay = Array.New
      while playsCount >=0
        within(:id, "successPlanPlayGrid") do
          if $OldPlay[playBookCount] != $NewPlay[playBookCount]
            puts "Play has been updated"
          else
            raise "Play has not been updated"
          end
          playsCount -= 1
        end
      end
    else
      raise "Plays grid is not present."
    end
  rescue Exception => ex
    putstr_withScreen ex.message
    puts ex.backtrace.select { |x| x.match(/step_definitions/) }
  end
end 
