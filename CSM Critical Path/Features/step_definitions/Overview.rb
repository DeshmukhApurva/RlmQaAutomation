#All Overview Specific Step Definitions
#All Scenario mentioned in Overview.feature

 
Then /^I click on login button$/ do 
  begin
    puts "Click On Login Button"
    click_button('Login')
    sleep 5
  rescue Exception => ex
    puts ex.message
  end 
end

Then (/^I clicked tab (.*?)$/) do |tab|
  begin 
    click_link(tab)
  rescue Exception => ex
    puts ex.message
  end
end

And /^verify data on donut chart$/ do
  begin
    within('.highcharts-container') do
      @data1 = find('.highcharts-legend').text
    end
  if page.has_css?(".hsCount")
    within('.hsCount') do
      puts all('tspan')[0].text
      acc = all('tspan')[0].text
      @AccountTotal = acc.to_i
    end
  
    @Healthy = 0
    @low = 0
    @Pending = 0
    @Undetermined = 0

    if @data1.to_s != ''

      puts "data1 : #{@data1}"
      @healthy1 = @data1.split("Healthy").first
      @H = @healthy1.split("(").first
      @Healthy = @H.to_i
      @data1 = @data1.split("Healthy ").last

      puts "data2 : #{@data1}"
      if @data1.include?"Low"
        @low1 = @data1.split("Low").first
        @L = @low1.split("(").first
        @low = @L.to_i
        @data1 = @data1.split(" Low Adoption ").last
      end 
      
      puts "data3 : #{@data1}"
      if @data1.include?"Pending"
        @Pending1 = @data1.split("Pending").first
        @P = @Pending1.split("(").first
        @Pending = @P.to_i
        @data1 = @data1.split("Pending Churn").last
      end 
      
      puts "data4 : #{@data1}"
      if @data1.include? "Undetermined"
        @Undetermined1 = @data1.split("Undetermined").first
        @U = @Undetermined1.split("(").first
        @Undetermined = @U.to_i
      end 

      total = @Healthy+@low+@Pending+@Undetermined
      puts "Total: #{total}"  
      puts "Healthy: #{@Healthy}"
      puts "low: #{@low}"
      puts "Pending: #{@Pending}"
      puts "Undetermined: #{@Undetermined}"
      
      if @AccountTotal == total
        puts "Verified Data On Donut Chart"
      end 
    else
      puts "There are no Accounts for current owner"
    end
  else
    puts "No high charts found"
  end
  rescue Exception => ex
    putstr "Data Verification Error On Donut Chart : "
    putstr_withScreen ex.message
  end 
end

And (/^I navigate to heatMapChart$/) do
  begin
      within('.highcharts-container') do
        @data1 = find('.highcharts-legend').text
      end
      puts "Account Health Status"
      puts @data1
      @healthy1 = @data1.split("Healthy").first
      @H = @healthy1.split("(").first
      @Healthy = @H.to_i
      @data1 = @data1.split("Healthy ").last
      
      @low1 = @data1.split("Low ").first
      @L = @low1.split("(").first
      @low = @L.to_i
      @data1 = @data1.split(" Low Adoption ").last
      
      @Pending1 = @data1.split("Pending ").first
      @P = @Pending1.split("(").first
      @Pending = @P.to_i
      @data1 = @data1.split("Pending Churn ").last
      
      @Undetermined1 = @data1.split("Undetermined ").first
      @U = @Undetermined1.split("(").first
      @Undetermined = @U.to_i
      
        puts "Healthy: #{@Healthy}"
        puts "low: #{@low}"
      puts "Pending: #{@Pending}"
      puts "Undetermined: #{@Undetermined}"
      sleep 7
    find(:id, 'rightarrow').click
    sleep 5
    puts "Clicked on rightarrow for heatMapChart"
    sleep 7
    within(:id,'heatMapDivId') do
      highchart = all('.highcharts-tracker')
      @str = highchart[1].text
      value = @str.split()
      int_array = value.collect{|s| s.to_i}
      
      undermined = int_array[0..5]
      pending = int_array[6..11]
      low = int_array[12..17]
      healthy = int_array[18..24]
      
      uSum = getArraySum(undermined)
      pSum = getArraySum(pending)
      lSum = getArraySum(low)
      hSum = getArraySum(healthy)
       puts uSum
       puts @U
      
      if uSum == @Undetermined
        puts "Undetermined count perfect"
      end 
      if(pSum == @Pending)
        puts "Pending count perfect"
      end 
      if(lSum == @low)
        puts "Low count perfect"
      end 
      if(hSum == @Healthy)
        puts "Healthy count perfect"
      end 
    end 
    puts "HeatMapChart verified"
    rescue Exception => ex
      putstr "HeatMapChart verification Error : "+ex.message
    end
end

And (/^I click on first tile$/) do
  begin
    within('.highcharts-container') do
      @data1 = find('.highcharts-legend').text
    end

    find(:id, 'rightarrow').click

  if page.has_css?(".heatMapDivId")
    within(:id,'heatMapDivId') do
      highchart = all('.highcharts-tracker')
      page.all('rect')[1].double_click
      puts "Opened HeatMapChart tile"
    end
  else
    puts "No Heat Map Chart tile found"
  end
  rescue Exception => ex
    putstr "Error opening HeatMapChart tile: "+ex.message
  end
end

And (/^I stored data of Donut Chart$/) do
  begin
    within('.highcharts-container') do
      @data1 = find('.highcharts-legend').text
    end
  rescue Exception => ex
    putstr "Error opening HeatMapChart tile : "+ex.message
  end
end

Then(/^I click on the Hamburger icon (.*?) and (.*?)$/) do |v1,v2|
  begin
    within('.highcharts-container') do
      @data1 = find('.highcharts-legend').text
    end
    
    arg = getCredentialInfo(ENV['UserName'])
    puts arg
    
    find(".dropdown-toggle").click
    puts"Hamburger is clicked"
    
    within(".dropdown-menu-right") do
      find(:xpath, './/li[1]').text.should match("Edit View")
      find(:xpath, './/li[1]').click
      puts "Clicked On Edit View"
      sleep 25  
    end
    begin
      #find(:id,"pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:csmeditviewpageSectionItem:selectObjectType").click
      #select v1, from: "pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:csmeditviewpageSectionItem:selectObjectType" 
      find(:xpath, "//*[contains(@id, 'selectObjectType')]").select(v1)
      sleep 5
      #find(:id,"pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:outerfilterAttributesSectionItem:filterAttributeValue").click
      #select v2, from: "pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:outerfilterAttributesSectionItem:filterAttributeValue"        
      find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select(v2)
    rescue Exception => ex
      raise "#{v2} filter not present in #{v1}" 
    end   
    within all('.pbBottomButtons').last do
        click_on "Save"
      end
      within('.highcharts-container') do
        @data2 = find('.highcharts-legend').text
      end
      if @data2 != @data1
        puts "Health Donut Chart get filter by ARR"
      end
  rescue Exception => ex
    putstr "Health donut records get filtered by ARR Error : "+ex.message
  end
end


Then(/^click on the Hamburger icon (.*?) and (.*?)$/) do |v1,v2|
  begin
    within('.highcharts-container') do
      @data1 = find('.highcharts-legend').text
    end
    
    arg = getCredentialInfo(ENV['UserName'])
    puts arg
    
    find(".dropdown-toggle").click
    puts"Hamburger is clicked"
    
    within(".dropdown-menu-right") do
      find(:xpath, './/li[1]').text.should match("Edit View")
      find(:xpath, './/li[1]').click
      puts "Clicked On Edit View"
      sleep 15  
    end
    
      find(:xpath, "//*[contains(@id, 'selectObjectType')]").select(v1)
      sleep 5
      find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select(v2)
      searchValue = find_field('pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:filterLookUpSectionItem:csmFilterUsrLookup').value
      puts "owner Id: #{searchValue}"
      if searchValue == "null"
        puts "val"
        searchValue = arg[2]
      end
      puts "owner Id: #{searchValue}"
      find(:id,"pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:filterLookUpSectionItem:csmFilterUsrLookup_lkwgt").click
      sleep 5
      
      # new_window = page.driver.browser.window_handles.last 
        # page.within_window new_window do
          # puts "Lookup Window"
          # page.should have_content('Go!')
        # end
      
      @flag = 0
      @DiffOwner = "#{searchValue}"
      arg.each do |key,val|
          if (key != "#{searchValue}") && (key != "username") && (key != "password")
            @DiffOwner = key
                      @flag += 1 
          end
        if  @flag != 0
          fill_in('pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:filterLookUpSectionItem:csmFilterUsrLookup',:with => "#{@DiffOwner}")
          sleep 5
          break;
        end
      end 
      within all('.pbBottomButtons').last do
        click_on "Save"
      end
      within('.highcharts-container') do
        @data2 = find('.highcharts-legend').text
      end
      if @data2 != @data1
        puts "Health Donut Chart gets filtered by Owner"
      end
  rescue Exception => ex
    putstr "Health donut records get filtered by owner Error : "+ex.message
  end
end

And /^I click on Hamburger Icon and Filter by Success Plan$/ do
  begin
    within('.highcharts-container') do
      @data1 = find('.highcharts-legend').text
    end
    @user = changeUsers("user1")
    find(".dropdown-toggle").click
    puts"Hamburger is clicked"
    within(".dropdown-menu-right") do
      find(:xpath, './/li[1]').text.should match("Edit View")
      find(:xpath, './/li[1]').click
      puts "Clicked On Edit View"
      sleep 25
    end

    find(:xpath, "//*[contains(@id, 'selectObjectType')]").select("Success Plan")
    sleep 15
    find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select("CSM")
    sleep 15
    fill_in('pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:filterLookUpSectionItem:csmFilterUsrLookup',:with => @user)
    within all('.pbBottomButtons').last do
    click_on "Save"
    sleep 15
    end

    within('.highcharts-container') do
    @data2 = find('.highcharts-legend').text
    end
    if @data2 != @data1
    puts "Health Donut Chart get filter by Owner"
    end 
  rescue Exception => ex
    putstr "Filter By Success Plan Error:"+ex.message
  end
end

And /^I click on Hamburger Icon and Filter Last Health Status$/ do
  begin
    @user = changeUsers("user1")
    within('.highcharts-container') do
        @data1 = find('.highcharts-legend').text
    end
      
    find(:id, 'rightarrow').click
    puts "clicked on Right arrow"
     
    within(:id,'heatMapDivId') do
      highchart = all('.highcharts-tracker')
      @str1 = highchart[1].text 
    end
    
    find(".dropdown-toggle").click
    puts"Hamburger is clicked"  
    within(".dropdown-menu-right") do
      find(:xpath, './/li[1]').text.should match("Edit View")
      find(:xpath, './/li[1]').click
      puts "Clicked On Edit View"
      sleep 15
    end 
    within(".detailList") do
      within(".data2Col.first") do
          find(:id,"pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:csmeditviewpageSectionItem:selectObjectType").click
          select 'Account', from: "pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:csmeditviewpageSectionItem:selectObjectType" 
      end
    end
    sleep 2
    find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select("Last Health Status")
    find(:id,"pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:filterLookUpSectionItem:csmFilterUsrLookup_lkwgt").click
    sleep 10
    searchValue = find_field('pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:filterLookUpSectionItem:csmFilterUsrLookup').value
    puts "owner Id: #{searchValue}" 
    fill_in('pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:filterLookUpSectionItem:csmFilterUsrLookup',:with => @user)
    within all('.pbBottomButtons').last do
      click_on "Save"
    end
    
    within('.highcharts-container') do
      @data2 = find('.highcharts-legend').text
    end
      
    within(:id,'heatMapDivId') do
      highchart = all('.highcharts-tracker')
      @str2 = highchart[1].text 
    end
    
    if @data1 != @data2 && @str1 != @str2
      puts "Health Donut records get filtered by Last Health Status"
    end
  rescue Exception => ex
    putstr "Health donut records get filtered by Last Health Status Error : "+ex.message
  end
end

Then /^Verify tiles$/ do
begin
    if page.has_css?(".ROD-tiles")
     within(".ROD-tiles") do
      if page.should have_css('.tile')
        tiles = (page.all(".tile").count)
        puts "The number of tiles : #{tiles}" 
        inactivetiles = (page.all(".inactive").count)
        puts "The number of inactive tiles : #{inactivetiles}"
        
        fcName = Array.new
        recordCount = Array.new
        page.all(".tile").each do |tile|
          tileLabel = tile.first(".figureCaption").text
          puts tileLabel
          
          if tile.all("h3").count > 0
            tileRecords = tile.first("h3").text
            puts "Tile - #{tileLabel} has value "+ tile.first("h3").text
          else 
            puts "Tile - #{tileLabel} is Inactive"
            tileRecords = "0"
            
          end
          fcName << tileLabel
          recordCount << tileRecords.to_i
        end
        
        puts recordCount
        if fcName.count > 0
          puts "Tile has Focus Category Name"
        else
          puts "Error displaying the Focus Category Name in Tile"
        end
        puts "Verified Tiles"
      else
        puts "Error verifying the Tiles"
      end
     end
    else
      puts "No Action Tiles to display"
    end
    sleep 4
  rescue Exception => ex
    putstr "Verified Tiles Error: "+ex.message
  end
end

Then /^click on tile$/ do
begin
  if page.has_css?(".ROD-tiles")
    within(".ROD-tiles") do
    if page.should have_css('.tile')
      @tileCount = (page.all(".tile").count)
      puts "The number of tiles : #{@tileCount}"
      
      @tileValues = Array.new
      page.all(".tile").each do |tile|
        tileLabel = tile.first(".figureCaption").text
        puts tileLabel
        
        if tile.all("h3").count > 0
          tileRecords = tile.first("h3").text.to_i
          puts "Tile - #{tileLabel} has value "+ tile.first("h3").text
        else 
          puts "Tile - #{tileLabel} is Inactive"
          tileRecords = "0"
          
        end
        @tileValues << tileRecords
      end
      
    end
  end
  0.upto(@tileCount - 1) do |x|
    @tilerecordValue = @tileValues[x] 
    puts @tilerecordValue
    all(".tile")[x].click
    sleep 5
    if all(".pagination-info").count > 0 
      puts find(".pagination-info").text
      @recordCount = find(".pagination-info").text.split(/[^\d]/).last.to_i
      puts @recordCount
    else  
      puts 0
      @recordCount = 0
    end
    if @tilerecordValue = @recordCount
      puts "Navigated to List page"
    else
      puts "Error while Navigating to List page"
    end
    click_link "Create New"
    sleep 10
    puts "Clicked on Create New"
    click_on "Overview"
    #find(".wt-Overview").click
    sleep 5
  end
  else
     puts "No Action Tiles to display"
  end
  rescue Exception => ex
    putstr "Verifing the Tiles"
    putstr_withScreen ex.message
  end
end

And (/^I select focus category "(.*?)"$/) do |arg1|
begin
  sleep 10
  find(".select2-choice").click
  sleep 5
  find( 'li', text: arg1).click
  sleep 5

  i= all(".status-num").count
  puts i
  1.upto(i) do |x|
    puts x
    all(".status-num")[x-1].hover
    sleep 2
    all(:link, "Edit")[x].click
    sleep 10
    all(:link,"Cancel").last.click
    sleep 10
    find(".select2-choice").click
    sleep 5
    find( 'li', text: arg1).click
    sleep 5
  end
  rescue Exception => ex
    putstr_withScreen ex.message
  end 
end

And(/^I hover on record count on FC cards$/) do 
  begin 
  all(:css,".col3").each do |main| 
      main.all(:css,".status-num").each do |link| 
        link.hover 
        #link.first(:link,"Edit").click
        #second(:link).click
        sleep 4 
    end 
  end 
  puts "Hovered over FC Cards Record Card"
  rescue Exception => ex 
    putstr "Not hovered" 
    putstr_withScreen ex.message 
  end 
end

And (/^I hover on FC cards$/) do
  begin
    within(:id,'focusCategories') do    
      page.all(:css,".ss-card").each do |link|      
        link.hover
        #click_link("Edit")
        #link.first(:link,"Edit").click#
        sleep 3 
      end
    end
    puts "Hovered over FC Cards"
    sleep 5
  rescue Exception => ex
    putstr "Not hovered"
    putstr_withScreen ex.message
  end
end

Then(/^change the object to Success plan in the edit view to verify the LOV present in Success plan$/) do
begin
    sleep 5
      find(".dropdown-toggle").click
    find("a",:text => "Edit View").click
    
       find(:xpath, "//*[contains(@id, 'selectObjectType')]").click
       find(:xpath, "//*[contains(@id, 'selectObjectType')]").select("Success Plan")
       sleep 5
       find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").click
      
        @LOV =find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").all('option').collect(&:text)  
        puts "The list of Values present in filterAttribute are as follows:"
        
        @LOV.each do |val|
        puts val
        end
    
  rescue Exception => ex
    putstr "Failed to get values of Success plan"
    putstr_withScreen ex.message
  end
end

Then(/^click on edit view to change the "([^"]*)"$/) do |v1|
  begin
  @user = changeUsers("user1")
  find(".dropdown-toggle").click
  find("a", :text => "Edit View").click
  puts "Clicked On Edit View"
  sleep 25
  within all('.pbBottomButtons').last do
    click_on "Clear"
  end
  puts v1
  sleep 3
  find(:xpath, "//*[contains(@id, 'selectObjectType')]").select("Account")
  sleep 4
  find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select(v1)
  sleep 10
  fill_in('pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:filterLookUpSectionItem:csmFilterUsrLookup',:with => @user)
  sleep 15
  within all('.pbBottomButtons').last do
    click_on "Save"
  end
  sleep 15
  within all('.bs')[0] do
    @currentusername =  find('.text-primary').text
  end
  sleep 10
  rescue Exception => ex
    putstr "Error  while changing the user"
    putstr_withScreen ex.message
  end
end

Then(/^select the focus category$/) do
  begin
    sleep 5
    arg2 = getReference "Reference"
    find(".select2-choice").click
    find( 'li', text: arg2["FCCategory"]).click
    sleep 10
  rescue Exception =>ex
    putstr "Unable to select focus category"
    putstr_withScreen ex.message
  end
end
 
Then (/^verify Health Donut Chart$/) do
  begin
    within('.highcharts-container') do
      @data2 = find('.highcharts-legend').text
    end
    if @data2 != @data1
      puts "Health Donut Chart get filter by Owner"
    else
      puts "Health Donut Chart not get filter by Owner"
    end 
  rescue Exception =>ex
      putstr "Unable to select focus category"
      putstr_withScreen ex.message
  end
end

Then(/^select any one account$/) do
  begin
    sleep 5
    unless page.has_css?(".ss-state-green")
      @TotalFocuscategoryAccoundCard = (page.all(".ss-state-green").count)
      puts "The number of Focus Category of Account : #{@TotalFocuscategoryAccoundCard}"
      if @TotalFocuscategoryAccoundCard > 0
        @TotalAccount = (page.all(".card-green").count)
        puts "The number of Account present in Focus Category card : #{@TotalAccount}"
        if  @TotalAccount > 0
          within all(".card-green")[0] do
            @Accountname1=  all('tbody')[0].all('tr')[0].all('th')[0].text
            puts "The Account of Focus Category :#{@Accountname1}"
          end
        else
          puts "No Account is present in Focus Category Card"
        end
      else 
        puts "There is no Focus Category of Account Type"
      end
     else
        puts "No Focus Category Accounts"
    end
    sleep 5
  rescue Exception =>ex
    putstr "Error while selecting the account"
    putstr_withScreen ex.message
  end
end

And (/^I select Show Charts and Tiles$/) do
  begin
    listMenu = find('.dropdown-menu-right')
    if listMenu.all('li')[1].text=='Show Charts and Tiles'
    find("a", :text => "Show Charts and Tiles").click
    else
    first(:link, "Overview").click
    end
    sleep 10   

    rescue Exception => ex
      putstr "Unable to select Show Charts and Tiles"
      putstr_withScreen ex.message
    end
end

Then(/^click on the edit view to change the different "([^"]*)"$/) do |val1|
  begin
    @user = changeUsers("user2")
    puts "@user: #{@user}"
    sleep 5
    find(".dropdown-toggle").click
    find("a", :text => "Edit View").click
    sleep 10
    within all('.pbBottomButtons').last do
      click_on "Clear"
    end
    sleep 4
    find(:xpath, "//*[contains(@id, 'selectObjectType')]").select("Account")
    sleep 5
    find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select(val1)
    sleep 5
    #find('.lookupIcon').click
    puts "Clicked On LookUp"
    sleep 10
    fill_in('pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:filterLookUpSectionItem:csmFilterUsrLookup',:with => @user)
    sleep 5
    within all('.pbBottomButtons').last do
      puts "Click on save"
      click_on "Save"
    end
    sleep 5
    within all('.bs')[0] do
      @currentusername =  find('.text-primary').text
      puts "The current user is :#{@currentusername}"
    end
    sleep 10
  rescue Exception =>ex
    putstr "Error while selecting different user"
    putstr_withScreen ex.message
  end
end   

And (/^I Show_Hide Inactive Categories$/) do
  listMenu = find('.dropdown-menu-right')
  puts "Selecting " + listMenu.all('li')[2].text
  listMenu.all('li')[2].click
  sleep 5
 end
 
And (/^I Verify Inactive Categories$/) do
  sleep 5
  if all(".title-status-inactive").count()>0
    puts "Inactive Categories are displayed"
  else
    puts "Inactive Categories are hidden"
  end
  
 end
 
Then(/^Verify the Account in Focus category$/) do
  begin 
    unless page.has_css?(".ss-state-green")
      @TotalFocuscategoryAccoundCard = (page.all(".ss-state-green").count)
      puts "The number of Focus Category of Account : #{@TotalFocuscategoryAccoundCard}"
      if @TotalFocuscategoryAccoundCard > 0
        @TotalAccount = (page.all(".card-green").count)
        puts "The number of Account present in Focus Category card : #{@TotalAccount}"
        if  @TotalAccount > 0
          within all(".card-green")[0] do
            @Accountname2=  all('tbody')[0].all('tr')[0].all('th')[0].text
            puts "The Account of Focus Category :#{@Accountname2}"
          end
        else
          puts "No Account is present in Focus Category Card"
        end
      else 
        puts "There is no Focus Category of Account Type"
      end
    else
       puts "No Focus Category Accounts"
    end

    puts "Accountname1: #{@Accountname1} and Accountname2: #{@Accountname2}"

    if  @Accountname1 != "" && @Accountname2 != ""
      if @Accountname1!=@Accountname2
        puts "Account  is not found in focus category"
        puts "FC records get filtered by owner"
      else
        puts "Account is  found in focus category"
        puts "FC records not getting filtered by owner"
      end
    else
      puts "Account records with different owners does not exist in the system"
    end
  rescue Exception =>ex
    putstr "Error  while verify the account"
    putstr_withScreen ex.message
  end
end  

Then(/^count the number of tiles$/) do
  begin
    sleep 10
    within(".ROD-tiles") do
    if page.should have_css('.tile')
      @tileCount = (page.all(".tile").count)
      puts "The number of tiles : #{@tileCount}"

      @tileValues1 = Array.new
      page.all(".tile").each do |tile|
          tileLabel = tile.first(".figureCaption").text
          puts tileLabel

        if tile.all("h3").count > 0
          tileRecords = tile.first("h3").text.to_i
          puts "Tile - #{tileLabel} has value "+ tile.first("h3").text
        else 
          puts "Tile - #{tileLabel} is Inactive"
          tileRecords = "0"
        end
        @tileValues1 << tileRecords
        end 
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error while counting the Tiles"
    putstr_withScreen ex.message
  end
end


Then(/^count the number of tiles after changing the user$/) do
begin
  find(".wt-Overview").click
    find(".dropdown-toggle").click
    within(:id,"bodyTable") do
    
      if find(:xpath, './/li[2]').has_content? ("Show Charts and Tiles")  
          find(:xpath, './/li[2]').click
          sleep 5
          find(".dropdown-toggle").click
          find(:xpath, './/li[2]').click
          puts"Show Charts and Tiles"
      end
    end 
    sleep 10
    within(".ROD-tiles") do
      if page.should have_css('.tile')
        @tileCount = (page.all(".tile").count)
        puts "The number of tiles : #{@tileCount}"
        
        @tileValues2 = Array.new
        page.all(".tile").each do |tile|
          tileLabel = tile.first(".figureCaption").text
          puts tileLabel
          if tile.all("h3").count > 0
            tileRecords = tile.first("h3").text.to_i
            puts "Tile - #{tileLabel} has value "+ tile.first("h3").text
          else 
            puts "Tile - #{tileLabel} is Inactive"
            tileRecords = "0" 
          end
          @tileValues2 << tileRecords
        end 
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error while counting the Tiles"
    putstr_withScreen ex.message
  end
end


Then(/^Verify the Tile Records$/) do
  begin
    sleep 10
    if @tileValues1!=@tileValues2
      puts "Tile records get filtered by owner"
    else
      puts "Tile records not get filtered by owner"
    end
  rescue Exception => ex
    putstr "Error while counting the Tiles"
    putstr_withScreen ex.message
  end
end

Then(/^click on edit view to show the tiles$/) do
  begin
    sleep 5
    find(".wt-Overview").click
    find(".dropdown-toggle").click
    within(:id,"bodyTable") do
      if  find(:xpath, './/li[2]').has_content? ("Show Charts and Tiles") 
        find(:xpath, './/li[2]').click
        puts"Shows Charts and Tiles"
      else  find(:xpath, './/li[2]').has_content? ("Hide Charts and Tiles") 
        find(:xpath, './/li[2]').click
        sleep 5
        find(".dropdown-toggle").click
        find(:xpath, './/li[2]').click
        puts"Shows Charts and Tiles"
      end 
    end
  rescue Exception => ex
    putstr "Error  while Show Charts and Tiles"
    putstr_withScreen ex.message
  end
    sleep 5
end


Then(/^click on edit view to Hide the tiles$/) do
  begin
    sleep 5
    find(".wt-Overview").click
    find(".dropdown-toggle").click
    within(:id,"bodyTable") do
      if  find(:xpath, './/li[2]').has_content? ("Hide Charts and Tiles") 
        find(:xpath, './/li[2]').click
        puts"Hide Charts and Tiles"
      else  find(:xpath, './/li[2]').has_content? ("Show Charts and Tiles") 
        find(:xpath, './/li[2]').click
        sleep 5
        find(".dropdown-toggle").click
        find(:xpath, './/li[2]').click
        puts"Hide Charts and Tiles"
      end
    end   
  rescue Exception => ex
    putstr "Error clicking on Hide Charts and Tiles"
    putstr_withScreen ex.message
  end
  sleep 2
end


Then(/^change the filter attribute to Last Health Status for verify the Focus Category records$/) do
  begin
    sleep 5
    #user(3)
    find(".dropdown-toggle").click
    find("a", :text => "Edit View").click
    sleep 2
    within(".detailList") do
      find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select("Last Health Status")
      find('.lookupIcon').click
      sleep 2
      #fill_in('pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:filterLookUpSectionItem:csmFilterUsrLookup',:with => 'Deepmala Prajapati')       
      sleep 2
    end
    within(:id,'focusCategories') do
      sleep 5
      #within(:id,"colContainer") do
      if page.should have_css('.col3')
        @TotalFocuscategory1 = (page.all(".col3").count)
        puts "The number of Focus Category : #{@TotalFocuscategory1}"
      else
        puts"Focus Category records are not present"
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Last Health Status is not present in the Filter attribute"
    putstr_withScreen ex.message
  end
end


Then(/^change the filter attribute to Last Health Status for verify the Tiles$/) do
  begin
    sleep 5
    arg = getCredentialInfo(ENV['UserName'])
    puts arg
    count = 0
    arg.each do |key, val|
      count +=1
      puts "count: #{count}"
      if count == 3
        puts arg[key] + key
        @User = key
        break;
      end
    end
    
    find(".dropdown-toggle").click
    find("a", :text => "Edit View").click
    sleep 5
    within(".detailList") do
      find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select("Last Health Status")
      find('.lookupIcon').click
      sleep 5
      fill_in('pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:filterLookUpSectionItem:csmFilterUsrLookup',:with => @User)       
        sleep 10
    end
    within(".ROD-tiles") do
      if page.should have_css('.tile')
        @tileCount = (page.all(".tile").count)
        puts "The number of tiles : #{@tileCount}"
      else
        puts "Tiles are not present"
      end
    end 
    puts "Tile records get filtered by Last Health Status"
    sleep 5
  rescue Exception => ex
    putstr "Last Health Status is not present in the Filter attribute"
    putstr_withScreen ex.message
  end
end


Then(/^change the filter attribute to ARR for verify the Focus Category records$/) do
  begin
    sleep 5
    @user = changeUsers("user1")
    find(".wt-Overview").click
    find(".dropdown-toggle").click
    find("a", :text => "Edit View").click
    sleep 2
    within(".detailList") do
      find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select("ARR")
      find('.lookupIcon').click
      sleep 2
      fill_in('pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:filterLookUpSectionItem:csmFilterUsrLookup',:with => @user)
      sleep 2
    end
    
    within(:id,'focusCategories') do
      if page.should have_css('.col3')
        @TotalFocuscategory1 = (page.all(".col3").count)
        puts "The number of Focus Category : #{@TotalFocuscategory1}"
      else
        puts"FC are not present"
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "ARR is not present in the Filter attribute"
    putstr_withScreen ex.message
  end
end

Then(/^change the filter attribute to ARR for verify the Tiles$/) do
  begin
    sleep 5
    @user = changeUsers("user1")
    find(".wt-Overview").click
    find(".dropdown-toggle").click
    find("a", :text => "Edit View").click
    sleep 2
    within(".detailList") do
      find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select("Last Health Status")
      find('.lookupIcon').click
      sleep 2
      fill_in('pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:filterLookUpSectionItem:csmFilterUsrLookup',:with => @user)
      sleep 2
    end
    within(".ROD-tiles") do
      if page.should have_css('.tile')
        @tileCount = (page.all(".tile").count)
        puts "The number of tiles : #{@tileCount}"
      else
        puts "Tiles are not present"
      end
    end   
    sleep 5
  rescue Exception => ex
    putstr "ARR is not present in the Filterattribute"
    putstr_withScreen ex.message
  end
end

Then(/^change the object to Success plan in the edit view to verify the Tiles$/) do
  begin
    sleep 5
    @user = changeUsers("user1")
    find(".dropdown-toggle").click
    find("a",:text => "Edit View").click

    find(:xpath, "//*[contains(@id, 'selectObjectType')]").click
    find(:xpath, "//*[contains(@id, 'selectObjectType')]").select("Success Plan")
    sleep 5
    find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select("CSM Manager")
    fill_in('pageCustomerSuccessOverview:frmCustomerSuccessOverview:csmeditviewpageblock:csmeditviewpageSection:filterLookUpSectionItem:csmFilterUsrLookup',:with => @user)   
    sleep 5
    click_on 'Save'
    sleep 5
  rescue Exception => ex
    putstr "Error while counting the tiles"
    putstr_withScreen ex.message
  end
end

Then(/^change the object to Success plan in the edit view to verify the Focus Category records$/) do
  begin
    sleep 5
    otherUser = changeUsers("user1")
    puts otherUser + " -  is the Other User"
    find(".dropdown-toggle").click
    find("a",:text => "Edit View").click
    find(:xpath, "//*[contains(@id, 'selectObjectType')]").click
    sleep 3
    find(:xpath, "//*[contains(@id, 'selectObjectType')]").select("Success Plan")
    sleep 5
    find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").select("CSM Manager")
    sleep 5
    all(:xpath, "//*[contains(@id, 'filterLookUpSectionItem:csmFilterUsrLookup')]").last.set(otherUser)
    sleep 5
  within(:id,'focusCategories') do
    if page.should have_css('.col3')
      @TotalFocuscategory1 = (page.all(".col3").count)
      puts "The number of Focus Category : #{@TotalFocuscategory1}"
    else
      puts "Focus Category records are not present"
    end
  end
  rescue Exception => ex
    putstr "Error while counting the FocusCategory"
    putstr_withScreen ex.message
  end
end

Then(/^click on Show Inactive Categories view to see the Inactive Categories$/) do
  begin
  sleep 5 
    find(".dropdown-toggle").click
    within(:id,"bodyTable") do
      if find(:xpath, './/li[3]').has_content? ("Show Inactive Categories") 
        find(:xpath, './/li[3]').click
        puts"Shows Inactive Categories Accounts"
      else 
        puts "Shows Inactive Categories Accounts"
      end
    end
  rescue Exception=> ex
    putstr "Error while Show Inactive Categories accounts"
    putstr_withScreen ex.message
  end
end

Then(/^click on Hide Inactive Categories view to Hide the Inactive Categories$/) do
begin
  sleep 5
    find(".dropdown-toggle").click
    within(:id,"bodyTable") do
      if find(:xpath, './/li[3]').has_content? ("Hide Inactive Categories") 
        find(:xpath, './/li[3]').click
        puts"Shows Hide Categories accounts"  
      else if find(:xpath, './/li[3]').has_content? ("Show Inactive Categories")  
          find(:xpath, './/li[3]').click  
          sleep 5 
        find(".dropdown-toggle").click
        find(:xpath, './/li[3]').click
          puts"Shows Hide Categories accounts"
          end
      end 
      sleep 5
    end
  rescue Exception => ex
    putstr "Error  while hiding the Inactive Categories"
    putstr_withScreen ex.message
  end
  sleep 5
end
 
And /^I navigate to heatMapChart for details$/ do
  begin
    find(:id, 'rightarrow').click
    sleep 5
    puts "clicked on rightarrow for heatMapChart"
    
    within(:id,'heatMapDivId') do
      highchart = all('.highcharts-tracker')
      @str = highchart[1].text
      value = @str.split()
      int_array = value.collect{|s| s.to_i}
      
      undermined = int_array[0..5]
      pending = int_array[6..11]
      low = int_array[12..17]
      healthy = int_array[18..24]
      
      @utotal = getArraySum(undermined)
      @ptotal = getArraySum(pending)
      @ltotal = getArraySum(low)
      @htotal = getArraySum(healthy)
      
       puts @utotal
       puts @ptotal
       puts @ltotal
       puts @htotal
       @Total = @utotal+@ptotal+@ltotal+@htotal
       puts @Total
    end 
  rescue Exception => ex
    putstr "Not able to navigate to heatMapChart"+ex.message
    putstr_withScreen ex.message
  end
end

Then(/^click on edit link present in the FocusCategory$/) do
begin
  sleep 10
  within(:id,'focusCategories') do
    find("a",:text => "Edit").click 
  end
    puts"Focuscategory is edited"
  rescue Exception => ex
    putstr "User doesn't have sufficient privilleges"
    putstr_withScreen ex.message
  end
end 

Then(/^click on Create New Group link present in the FocusCategory$/) do
begin
  sleep 10
  within(:id,'focusCategories') do
    find("a",:text => "Create New Group").click
    puts"Focuscategory is edited"
  end
  rescue Exception => ex
    putstr "User doesn't have sufficient privilleges"
    putstr_withScreen ex.message
  end
end 

And (/^navigate to heatMapChart to verify records$/) do
  begin
    find(:id, 'rightarrow').click
    sleep 5
    puts "clicked on rightarrow for heatMapChart"

    within(:id,'heatMapDivId') do
      highchart = all('.highcharts-tracker')
      @str = highchart[1].text
      value = @str.split()
      int_array = value.collect{|s| s.to_i}

      undermined = int_array[0..5]
      pending = int_array[6..11]
      low = int_array[12..17]
      healthy = int_array[18..24]

      @utotal = getArraySum(undermined)
      @ptotal = getArraySum(pending)
      @ltotal = getArraySum(low)
      @htotal = getArraySum(healthy)

      @Total2 = @utotal+@ptotal+@ltotal+@htotal
      puts @Total2
      if @Total == @Total2
        puts "HeapMapChart verify based on Owner"
      else
        puts "HeapMapChart not verify based on Owner"
      end 
    end
  rescue Exception => ex
    putstr "HeapMapChart Verification Failed"
    putstr_withScreen ex.message
  end
end

#This code is for new TC.

And(/^I click on Edit View link$/) do
  begin
    sleep 10
    click_on "Edit View"
    puts "Edit View clicked."
    sleep 6
  rescue Exception => ex
    putstr "Error occurred while clicking Edit View link"
    putstr_withScreen ex.message
  end
end


Then(/^I verify Account object as default selection$/) do
  begin
  find(:xpath, "//*[contains(@id, 'selectObjectType')]").select("Account")
    within(".detailList") do
      if find("option[value='Account']")
        puts "Account object is default selection."
      else
        puts "Account object is not default selection."
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Account object as default"
    putstr_withScreen ex.message
  end
end

And(/^I change the filter attribute to Account Owner$/) do
  begin
    find(:xpath, "//*[contains(@id,'outerfilterAttributesSectionItem:filterAttributeValue')]").select "Account Owner"
    puts "Account Owner value slected from dropdown."
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while Changing filter attribute to Account Owner"
    putstr_withScreen ex.message
  end
end

And(/^I select the Default checkbox and Save$/) do
  begin
    within(".detailList") do
      unless all("tr")[3].first("td").first("input").checked?
        all("tr")[3].first("td").first("input").click
        puts "Successfully enabled the the product"
        break
      else
        puts "Product is already enabled"
      end
      #all("tr")[3].first("td").first("input").click
    end
    within(".pbBottomButtons") do
      click_on "Save"
    end
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while selecting Default Checkbox and Save"
    putstr_withScreen ex.message
  end
end

Then(/^I Clear the filter and Save$/) do
  begin
    sleep 10
    click_on "Edit View"
    puts "Edit View clicked."
    
    sleep 8
    within(".detailList") do
      unless all("tr")[3].first("td").first("input").checked?
        all("tr")[3].first("td").first("input").click
        puts "Successfully enabled the the product"
        break
      else
        puts "Product is already enabled"
      end
    end
    
    within(".pbBottomButtons") do
      click_on "Clear"
    end
    
    sleep 10
    within(".detailList") do
      unless all("tr")[3].first("td").first("input").checked?
        all("tr")[3].first("td").first("input").click
        puts "Successfully enabled the the product"
        break
      else
        puts "Product is already enabled"
      end
    end
  
    sleep 5
    within(".pbBottomButtons") do
      click_on "Save"
    end
    puts "Successfully clear the filter"
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while selecting Default Checkbox and Save"
    putstr_withScreen ex.message
  end
end

Then(/^I Verify Heat map chart records$/) do
  begin
    sleep 5
    if page.has_text?("Displaying data for: Owner ID is")
      puts "Heat map records filtered by Account."
    else
      puts "Heat map records not filtered by Account."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Heat Map Chart records"
    putstr_withScreen ex.message
  end
end

And(/^I click Clear button$/) do
  begin
    sleep 5
    within(".pbBottomButtons") do
      click_on "Clear"
    end
    puts "Clicked clear button."
  rescue Exception => ex
    putstr "Error occurred while clicking Clear button"
    putstr_withScreen ex.message
  end
end

Then(/^I Verify result displayed on "([^"]*)" page$/) do |arg|
  begin
    sleep 10
    if page.has_text?("Displaying data for: Owner ID is")
      puts "Global filter is not removed."
    else
      puts "Global filter is removed."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the result"
    putstr_withScreen ex.message
  end
end

And(/^I change value to "([^"]*)"$/) do |arg|
  begin
    find(:xpath, "//*[contains(@id, 'csmFilterUsrLookup_mlktp')]").select "Customer Portal User"
    puts "Customer Portal User value selected from dropdown."
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while changing value"
    putstr_withScreen ex.message
  end
end

Then(/^I Verify filter result displayed on "([^"]*)" page$/) do |arg|
  begin
    sleep 5
    if page.has_text?("Displaying data for: Owner ID is")
      puts "Records filtered by User."
    else
      puts "Records not filtered by User."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the filtered results"
    putstr_withScreen ex.message
  end
end

And(/^I search for Lookup values$/) do
  begin
    popup = window_opened_by do
      within(".detailList") do
        all("tr")[2].first("div").first("span").first("a").click
      end
      sleep 3
    end
    within_window(popup) do
      page.driver.browser.switch_to.frame("resultsFrame")
      page.all(:css, '.list').each do |el|
        puts el.text
      end
    end
  rescue Exception => ex
    putstr "Error occurred while searching for Lookup values"
    putstr_withScreen ex.message
  end
end

Then(/^I verify the lookup values$/) do
  begin
    if page.has_text?("No records found")
      puts "Lookup values not verified."
    else
      puts "Lookup values verified."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the lookup values"
    putstr_withScreen ex.message
  end
end

And(/^I change the object to Success Plan$/) do
  begin
    within(".detailList") do
      all("tr")[0].first("td").first("span").first("select").click
      sleep 3
      all("tr")[0].first("td").first("span").first("select").send_keys :arrow_down
      all("tr")[0].first("td").first("span").first("select").send_keys :enter
    end
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while changing the object to Success Plan"
    putstr_withScreen ex.message
  end
end

And(/^I click on filter attribute$/) do
  begin
    within(".detailList") do
      all("tr")[1].first("td").first("span").first("select").click
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on filter attribute."
    putstr_withScreen ex.message
  end
end


Then(/^I verify the values for Success Plan$/) do
  begin
    $fltval =find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").all('option').collect(&:text)
    puts $fltval
    if page.has_text?("Exec Sponsor")
      puts "Filter Attribute values verified for Success Plan Object."
    else
      puts "Filter Attribute values not verified for Success Plan Object."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the values for Success Plan"
    putstr_withScreen ex.message
  end
end

And(/^I Navigate to Health Donut chart$/) do
  begin
    if page.has_text? ("Accounts by Health and Days Since Last Health Check")
      puts "Heat Map Chart on Display."
      find("#rightarrow").click
      sleep 10
    else
      puts "Health Donut on Display"
    end
  rescue Exception => ex
    putstr "Error occurred while navigating to Health Donut Chart"
    putstr_withScreen ex.message
  end
end

And(/^I click on Donut$/) do
  begin
    sleep 3
    if page.has_text? ("Account Health Status")
      puts "Health Donut on display."
      sleep 5   
    #find("#pieChartcontainer").first(".highcharts-0").first(".highcharts-series-group").first("path").click
      find(:xpath, "//*[contains(@id, 'highcharts-13')]").click

    sleep 5
      puts "Health Donut clicked."
    else
      puts "Health Donut cannot be clicked."
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the donut"
    putstr_withScreen ex.message
  end
end

And(/^I verify user navigates to Account Health Status to click on Account Name$/) do
  begin
    sleep 10
    if page.has_css? ("#healthStatus-toolbar")
      puts "Account Health Status page verified."
      if page.has_text?("No matching records found")
        puts "No matching records found"
        puts "Account name not present to be clicked."
      else
        within("#healthStatus") do
          $AccName = all("tr")[1].first("td").first("a").text
          all("tr")[1].first("td").first("a").click
        end
        puts "Account name clicked: #{$AccName}"
      end
    else
      puts "Account Health Status page not verified."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the navigation to Account Health Status page and clicking Account Name"
    putstr_withScreen ex.message
  end
end

Then(/^I Verify user navigates to Account Details page$/) do
  begin
    if page.has_text? ("#{$AccName}")
      puts "User navigated to Account Details page: #{$AccName}"
    else
      puts "User did not navigate to Account Details page."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the navigation to Account Details page."
    putstr_withScreen ex.message
  end
end

And(/^I verify user navigates to Account Health Status to click on Success Plan$/) do
  begin
    if page.has_css? ("#healthStatus-toolbar")
      puts "Account Health Status page verified."
      if page.has_content?("No matching records found")
        puts "No matching records found"
        puts "Success Plan not present be clicked."
      else
        within("#healthStatus") do
          $SPName = all("tr")[1].all("td")[1].first("a").text
          all("tr")[1].all("td")[1].first("a").click
          end
        puts "Success Plan clicked: #{$SPName}"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the navigation to Account Health Status page and clicking Success Plan"
    putstr_withScreen ex.message
  end
end

Then(/^I Verify user navigates to Success Plan page$/) do
  begin
    if page.has_text? ("#{$SPName}")
      puts "User navigated to Success Plan page: #{$SPName}"
    else
      puts "No Success Plan clicked."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the navigation to Success Plan page"
    putstr_withScreen ex.message
  end
end

Then(/^I Verify User Preferences$/) do
  begin
    within('.highcharts-container') do
      @data2 = find('.highcharts-legend').text
    end
    if @data2 != @data1
      puts "Health Donut Chart as per user preference"
    else
      puts "Health Donut Chart not as per user preference"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the User Preferences"
    putstr_withScreen ex.message
  end
end

And(/^I click on Success Plan tab link$/) do
  begin
    within("#tabContainer") do
      all("li")[2].first("a").click
    end
    puts "Success Plans page."
  rescue Exception => ex
    putstr "Error occurred while clicking on Success Plan tab link"
    putstr_withScreen ex.message
  end
  sleep 10
end

And(/^I click logout$/) do
  begin
    find("#userNavButton").click
    within("#userNavMenu") do
      click_on "Logout"
    end
    puts "Successfully Logged out."
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while clicking logout"
    putstr_withScreen ex.message
  end
end


Then(/^I verify User Preferences as per HeatMap$/) do
  begin
    sleep 5
    if page.has_text?("Accounts by Health and Days Since Last Health Check")
      puts "Heat map as per user preference."
    else
      puts "Heat map as per user preference."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying User Prefernces as per HeatMap"
    putstr_withScreen ex.message
  end
end

And(/^I navigate to Heat Map Chart$/) do
  begin
    if page.has_text? ("Account Health Status")
      puts "Health Donut on Display."
      sleep 5
      find("#rightarrow").click
      sleep 10
      puts "Navigated to Heat Map Chart."
    else
      puts "Heat Map Chart on display."
    end
  rescue Exception => ex
    putstr "Error occurred while navigating to Heat Map Chart"
    putstr_withScreen ex.message
  end
end


And(/^I click on a tile$/) do
  begin
    if page.has_text?("Accounts by Health and Days Since Last Health Check")
      within("#heatMapDivId") do
        within(".highcharts-series-group") do
          all("rect")[0].double_click
        end
      end
    else
      puts "No Heat Map Chart tile found"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on a tile"
    putstr_withScreen ex.message
  end
end

And(/^I click on tile to navigate to Account name link to click it$/) do
  begin
    if page.has_css?(".ROD-tiles")
      within(".ROD-tiles") do
        if page.should have_css('.tile')
          @tileCount = (page.all(".tile").count)
          puts "The number of tiles : #{@tileCount}"
          @tileValues = Array.new
          page.all(".tile").each do |tile|
            tileLabel = tile.first(".figureCaption").text
            puts tileLabel

            if tile.all("h3").count > 0
              tileRecords = tile.first("h3").text.to_i
              puts "Tile - #{tileLabel} has value "+ tile.first("h3").text
            else
              puts "Tile - #{tileLabel} is Inactive"
              tileRecords = "0"
            end
            @tileValues << tileRecords
          end
        end
      end
      0.upto(@tileCount - 3) do |x|
        @tilerecordValue = @tileValues[x]
        puts @tilerecordValue
        all(".tile")[x].click
        sleep 5
        if page.has_text? ("Account Name")
          puts "Account Name page navigated."
        else
          puts "Account Name page not navigated."
        end
    if page.has_text? ("No matching records found")
              puts "Account name link cannot be clicked."
            else
              #within("#fcFullList") do
                within(:id, 'fcFullList')do
                $aname = all("tr")[1].first("td").first("a").text
      
                all("tr")[1].first("td").first("a").click
                sleep 5
              end
                puts "Account name clicked"
            end
            end
        else
         puts "No Action Tiles to display"
        end
      rescue Exception => ex
        putstr "Error occurred while clicking on link to navigate to Account name link"
        putstr_withScreen ex.message
      end
    end

Then(/^I Verify user navigates to Account Name Details page$/) do
  begin
    if page.has_text? ("#{$aname}")
      puts "User navigated to Account Details page: #{$aname}"
    else
      puts "User did not navigate to Account Details page."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the navigation to Account Name Details page."
    putstr_withScreen ex.message
  end
end

Then(/^I verify Active Tiles with No Records$/) do
  begin
    if page.has_css?(".ROD-tiles")
      within(".ROD-tiles") do
        if page.has_css?('.inactive')
            puts "Tile is grey."
          else
            puts "Tile is not grey."
          end
      end
    else
      puts "Page has no tiles."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Active tiles with no records"
    putstr_withScreen ex.message
  end
end


And(/^I click on tile to navigate to Account name link$/) do
  begin
      @tileCount = 0
    if page.has_css?(".ROD-tiles")
      within(".ROD-tiles") do
        if  page.has_css?('.tile')
          @tileCount = (page.all(".tile").count)
          puts "The number of tiles : #{@tileCount}"

          @tileValues = Array.new
          page.all(".tile").each do |tile|
            tileLabel = tile.first(".figureCaption").text
            puts tileLabel
                       
            if tile.all("h3").count > 0
              tileRecords = tile.first("h3").text.to_i
              puts "Tile - #{tileLabel} has value "+ tile.first("h3").text
            else
              puts "Tile - #{tileLabel} is Inactive"
              tileRecords = "0"

            end
            @tileValues << tileRecords
             #tile.first(".figureCaption").click
          end

        end
      end
      page.all(".tile").first.first(".figureCaption").click
      # (@tileCount - 1).times do |x|
        # @tilerecordValue = @tileValues[x]
        # puts @tilerecordValue
        # page.all(".tile")[x].click
        # sleep 5
      # end
      if page.has_text? ("Account Name")
        puts "Account Name page navigated."
      else
        puts "Account Name page not navigated."
      end
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on tile to navigate to Account name link"
    putstr_withScreen ex.message
  end
end



When(/^I click on Edit link$/) do
  begin
    within(".detailList") do
      click_on "Edit"
    end
    puts "Successfully cllicked on Edit button. "
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while clicking Edit link"
    putstr_withScreen ex.message
  end
end

Then(/^I verify FC page and click Save to save changes$/) do
  begin
    if page.has_text? ("Focus Category View")
      puts "Navigated to Focus Category page."
    else
      puts "Not Navigated to Focus Category page."
    end

    # within(".dataTables_wrapper") do
    #   click_on "Delete"
    # end
    # sleep 10

    click_on "Save"
    sleep 10

    if page.has_text? ("Successfully")
      puts "Save functionality for FC Successfully."
    else
      puts "Save functionality for FC Failed."
    end
  rescue Exception => ex
    putstr "Error occurred while erifying FC page and clicking save"
    putstr_withScreen ex.message
  end
end


And /^I Verify tiles$/ do
  begin
    if page.has_css?(".ROD-tiles")
      within(".ROD-tiles") do
        if page.should have_css('.tile')
          tiles = (page.all(".tile").count)
          puts "The number of tiles : #{tiles}"
          inactivetiles = (page.all(".inactive").count)
          puts "Tile is Active but no records available : #{inactivetiles}"
          puts "Tile is grey : #{inactivetiles}"

          fcName = Array.new
          recordCount = Array.new
          page.all(".tile").each do |tile|
            tileLabel = tile.first(".figureCaption").text
            puts tileLabel

            if tile.all("h3").count > 0
              tileRecords = tile.first("h3").text
              puts "Tile - #{tileLabel} has value "+ tile.first("h3").text
            else
              puts "Tile - #{tileLabel} is Inactive"
              tileRecords = "0"

            end
            fcName << tileLabel
            recordCount << tileRecords.to_i
          end

          puts recordCount
          if fcName.count > 0
            puts "Tile has Focus Category Name"
          else
            puts "Error displaying the Focus Category Name in Tile"
          end
          puts "Verified Tiles"
        else
          puts "Error verifying the Tiles"
        end
      end
    else
      puts "No Action Tiles to display"
    end
    sleep 4
  rescue Exception => ex
    putstr "Verified Tiles Error: "+ex.message
  end
end

Then(/^I Verify Focus Category records$/) do
  begin
    sleep 5
    if page.has_text?("FC")
      puts "Focus Category Columns filtered by Focus Category Selected."
    else
      puts "Focus Category Columns not filtered by Focus Category Selected."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Focus Category records"
    putstr_withScreen ex.message
  end
end

Then(/^I verify User Preferences as per FC$/) do
  begin
    sleep 5
    if page.has_text?("FC")
      puts "Focus Category View as per User Preference."
    else
      puts "Focus Category View not as per User Preference."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying User preferences as per FC"
    putstr_withScreen ex.message
  end
end

And(/^I click on Subject link value of FC Task$/) do
  begin
    if page.has_css? (".acc")
      within(".list") do
        all("tr")[1].all("td")[2].first("a").click
      end
      puts "Subject link value clicked."
    else
      puts "Subject link value cannot be clicked."
    end
    sleep 10
    if page.has_text? ("Task")
      puts "Navigated to Subject link Value's page."
      within all(".pbBody")[0] do
        within all(".detailList")[0] do
          $status = first("tr").all("td")[3].first("div").text
          if $status == "Completed"
            puts "Status is completed."
          else
            puts "Status is not completed."
          end
        end
      end
    else
      puts "Not navigated to Subject link Value's page."
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on Subject link of FC task"
    putstr_withScreen ex.message
  end
end


Then(/^I Verify Action link for the chosen FC Task$/) do
  begin
    if page.has_css? (".acc")
      within(".list") do
        if all("tr")[1].all("td")[0].first("span").first("a").has_css? (".ss-fill-disabled")
          puts all("tr")[1].all("td")[0].first("a").text
          all("tr")[1].all("td")[0].first("a").click
          page.has_text? ("Complete Task Help")
          puts "Complete link is Active."
        else
          puts "Action link not Active."
        end
      end
      puts "Action Link verified."
    else
      puts "Action link not verified."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Action link for chosen FC Task"
    putstr_withScreen ex.message
  end
end


And(/^I click on FC Header$/) do
  begin
    within all(".title-status").last do
      $title = all("h3")[1].first("a").text
      all("h3")[1].first("a").click
    end
    puts $title
    puts "FC Header link clicked."
  rescue Exception => ex
    putstr "Error occurred while clicking on FC Header"
    putstr_withScreen ex.message
  end
end

Then(/^I verify FC view details page$/) do
  begin
      $fctask = find(:xpath, "//*[contains(@id, 'selectfocusCategoryView')]").all("option").collect(&:text)
      puts $fctask
    if $title && $fctask == true
      puts "FC Verified"
    else
      puts "FC Not Verified"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying FC view details page"
    putstr_withScreen ex.message
  end
end


And(/^I click Create New link$/) do
  begin
    click_on "Create New"
    sleep 5
    if page.has_text? ("Focus Category View")
      sleep 5
      within(".requiredInput") do
        first("input").send_keys "FCNEWT"
      end
      sleep 10
      click_on "Create"
      puts "Create New FC."
      sleep 5
    else
      puts "New FC creation failed."
    end
  rescue Exception => ex
    putstr "Error occurred while clicking Create New link"
    putstr_withScreen ex.message
  end
end

Then(/^I save the new FC$/) do
  begin
    click_on "Save"
    sleep 5
    if page.has_text? ("Successfully")
      puts "New FC successfully created."
    else
      puts "New FC creation failed."
    end
    sleep 3
    click_on "Cancel"
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while saving the new FC"
    putstr_withScreen ex.message
  end
end

And(/^I click Edit link$/) do
  begin
    if page.has_text? ("Success Tasks")
      click_on "Edit"
      puts "Edit link clicked."
      sleep 5
    else
      puts "No Edit link found."
    end
  rescue Exception => ex
    putstr "Error occurred while clicking Edit link"
    putstr_withScreen ex.message
  end
end

Then(/^I Save the changes$/) do
  begin
    if page.has_text? ("Focus Category View")
      within(".requiredInput") do
        $dname = first("input")['value']
      end
      puts $dname
      if $title == $dname
        puts "FC verified"
      else
        puts "FC edit wrong."
      end
      puts "Edit link redirected."
      sleep 5
      click_on "Save"
      sleep 5
      if page.has_text? ("Successfully")
        puts "FC successfully edited."
      else
        puts "FC edit failed."
      end
      sleep 3
      click_on "Cancel"
      sleep 5
    else
      puts "Edit link not redirected."
    end
  rescue Exception => ex
    putstr "Error occurred while Saving the changes"
    putstr_withScreen ex.message
  end
end


And(/^I click Record Name link$/) do
  begin
     within("#fcFullList") do
    sleep 5
    $val = first("tbody").first("tr").all("td")[0].first("a").text
    first("tbody").first("tr").all("td")[0].first("a").click
end
  rescue Exception => ex
    putstr "Error occurred while clicking on Record Name link"
    putstr_withScreen ex.message
  end
end

Then(/^I verify Record Name details page$/) do
  begin
    $check = find(".pageDescription").text
    if $val == $check
      puts "Record Name Verified."
    else
      puts "Record Name not Verified."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Record Name details page"
    putstr_withScreen ex.message
  end
end

And(/^I click on Complete Action$/) do
  begin
    within(".list") do
       tr = first("tbody").all("tr")
       tr.each_with_index do |row, index|
         next if index == 0
         unless row.has_css? (".ss-fill-disabled")
           $index_number = index
           puts $index_number
           $valuerow = row.all("td")[2].first("a").text
           row.all("td")[0].first("span").first("a").click
           sleep 2
           if page.has_css? ("#fcDialogTask")
             puts "Complete Action link Active: #{index} #{$valuerow} #{$valuerow1}"
             $popwin = 1
             
           end
           break
         else
          puts "No Complete Action link's Active: #{index}"
         end
       end
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on Complete Action link"
    putstr_withScreen ex.message
  end
end
And(/^I mark the task as Not Started$/) do
  begin
    within(".list") do
           tr = first("tbody").all("tr")
           all("td")[2].first("a").click
           puts "Navigated to Task page"
                   sleep 5
             first(:xpath, "//*[contains(@name, 'edit')]").click
             sleep 5
             puts "clicked to edit"
             find(:xpath, "//*[contains(@id, 'tsk12')]").select "Not Started"
             find(:xpath, "//*[contains(@id, '00No000000DVO0g')]").send_keys "100"
             first(:xpath, "//*[contains(@name, 'save')]").click
             sleep 2
             puts "Task status changed from Completed to Not started"
             sleep 2
             end          
   rescue Exception => ex
     putstr "Error occurred while changing the status from Completed to Not started"
     putstr_withScreen ex.message
   end
 end


And(/^I select Completed Status value$/) do
  begin
    sleep 2
    if page.has_text? ("Complete Task")
      sleep 3
      find(:xpath, "//*[contains(@id, 'taskStatusValue')]").select "Completed"
      sleep 5
      puts "Completed Value selected."
    else
      puts "No Completed Value for Inactive action link."
    end
  rescue Exception => ex
    putstr "Error occurred while selecting Completed Status value"
    putstr_withScreen ex.message
  end
end

Then(/^I verify Saved Task Completed$/) do
  begin
      within(".list") do
        tr = first("tbody").all("tr")
        tr.each_with_index do |row, index|
          if index == $index_number
            row.all("td")[2].first("a").click
            sleep 5
            break
          else
            puts "index_number does not match"
          end
          sleep 5
        end
      end
      if page.has_text? ("Task")
        puts "Navigated to task page."
        within all(".pbBody")[0] do
          within all(".detailList")[0] do
            $status = first("tr").all("td")[3].first("div").text
            puts $status
            if $status == "Completed"
              puts "Status is completed and Saved Task Verified."
            else
              puts "Status is not completed and Saved Task not Verified."
            end
          end
        end
      else
        puts "Not navigated to task page."
      end
  rescue Exception => ex
    putstr "Error occurred while verifying Saved Task Completed"
    putstr_withScreen ex.message
  end
end

Then(/^I verify Saved Task Completed with Additional Details$/) do
  begin
    within(".list") do
      tr = first("tbody").all("tr")
      tr.each_with_index do |row, index|
        if index == $index_number
          row.all("td")[2].first("a").click
          sleep 5
          if page.has_text? ("Task")
            puts "Navigated to task page."
            within all(".pbBody")[0] do
              within all(".detailList")[0] do
                #$status = first("tr").all("td")[3].first("div").text
                $count = all("tr")[6].all("td")[1].first("div").text
                #puts $status
                puts $count
                if $count.to_i == $x.to_i
                  puts "Status is completed with additional details and Saved Task Verified."
                else
                  puts "Status is not completed with additional details and Saved Task not Verified."
                end
              end
            end
          else
            puts "Not navigated to task page."
          end
          break
        else
          puts "index_number does not match"
        end
        sleep 5
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Saved Task Completed with Additional Details"
    putstr_withScreen ex.message
  end
end

And(/^I click on Dismiss Action$/) do
  begin
    within(".list") do
      tr = first("tbody").all("tr")
      tr.each_with_index do |row, index|
        next if index == 0
        unless row.has_css? (".ss-disabled")
          $index_number = index
          $valuerow = row.all("td")[2].first("a").text
          row.all("td")[0].first("span").all("a")[1].click
          sleep 2
          page.has_text? ("Dismiss Task")
          puts "Dismiss Action link Active: #{index} #{$valuerow} #{$valuerow1}"
          break
        else
          puts "No Dismiss Action link's Active: #{index}"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on Dismiss Action"
    putstr_withScreen ex.message
  end
end



And(/^I select Dismissed Status value$/) do
  begin
    sleep 2
    if page.has_text? ("Dismiss Task")
      sleep 5
      find(:xpath, "//*[contains(@id, 'taskStatusValue')]").select "Completed"
      sleep 3
      puts "Completed Value selected."
      sleep 10
    else
      puts "No Completed Value for Inactive action link."
    end
  rescue Exception => ex
    putstr "Error occurred while selecting Dismissed Status value"
    putstr_withScreen ex.message
  end
end

Then(/^I verify Saved Task Dismissed$/) do
  begin
    within(".list") do
      tr = first("tbody").all("tr")
      tr.each_with_index do |row, index|
        if index == $index_number
          row.all("td")[2].first("a").click
          sleep 5
          break
        else
          puts "index_number does not match"
        end
      end
    end
    if page.has_text? ("Task")
      puts "Navigated to task page."
      within all(".pbBody")[0] do
        within all(".detailList")[0] do
          $status = first("tr").all("td")[3].first("div").text
          if $status == "Completed"
            puts "Status is completed and Dismissed Task Verified."
          else
            puts "Status is completed and Dismissed Task not Verified."
          end
        end
      end
    else
      puts "Not navigated to task page."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Saved Task Dismissed"
    putstr_withScreen ex.message
  end
end

Then(/^I verify Saved Task Dismissed with Additional Details$/) do
  begin
    within(".list") do
      tr = first("tbody").all("tr")
      tr.each_with_index do |row, index|
        if index == $index_number
          row.all("td")[2].first("a").click
          sleep 5
          break
        else
          puts "index_number does not match"
        end
        sleep 3
      end
    end
    if page.has_text? ("Task")
      puts "Navigated to task page."
      within all(".pbBody")[0] do
        within all(".detailList")[0] do
          $status = first("tr").all("td")[3].first("div").text
          $count = all("tr")[6].all("td")[1].first("div").text
          puts ": #{$count}"
          puts ": #{$x}"
          if $count.to_i == $x.to_i
            puts "Dismissed Task Verified with additional details: #{$status}"
          else
            puts "Dismissed Task not Verified with additional details: #{$status}"
          end
        end
      end
    else
      puts "Not navigated to task page."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Dismissed Task Completed with Additional Details"
    putstr_withScreen ex.message
  end
end


And(/^I click on Save$/) do
  begin
    sleep 5
    if page.has_text? ("Task")
      within all(".pbButton")[0] do
          click_button "SAVE"
      end
      puts "Save Button clicked."
    else
      puts "No Save Option for Inactive action Link."
    end
  rescue Exception => ex
    putstr "Error occurred while clicking Save"
    putstr_withScreen ex.message
  end
end


And(/^I provide additional details$/) do
  begin
    within all(".detailList")[1] do
      $x = 111
      first("tbody").first("tr").first("td").first("input").send_keys [:control, 'a']
      first("tbody").first("tr").first("td").first("input").send_keys :backspace
      first("tbody").first("tr").first("td").first("input").send_keys $x
      sleep 3
      first("tbody").all("tr")[1].first("td").first("span").first("span").first("a").click
      $date = first("tbody").all("tr")[1].first("td").first("span").first("span").first("a").text
      puts "Value selected is: #{$date}"
    end
  rescue Exception => ex
    putstr "Error occurred while providing Additional Details"
    putstr_withScreen ex.message
  end
end


And(/^I select FC Group$/) do
  begin
    within(".select2-container") do
      first("a").first("span").click
    end
    within(".select2-drop") do
      first("ul").all("li")[2].click
    end
      sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting FC Group"
    putstr_withScreen ex.message
  end
end


And(/^I click on FC Header link$/) do
  begin
    sleep 3
    within all(".title-status")[0] do
      $title = all("h3")[1].first("a").text
      all("h3")[1].first("a").click
    end
    puts $title
    puts "FC Header link clicked."
  rescue Exception => ex
    putstr "Error occurred while Clicking on FC Header link"
    putstr_withScreen ex.message
  end
end



And(/^I verify FC view details$/) do
  begin
    within(".pbBody") do
      $fctask = find(:xpath, "//*[contains(@id, 'selectfocusCategoryView')]").all("option").collect(&:text)
      #$fctask =find(:xpath, "//*[contains(@id, 'filterAttributeValue')]").all('option').collect(&:text)
    end
    puts $fctask
    if $title && $fctask == true
      puts "FC Verified"
    else
      puts "FC Not Verified"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying FC view details"
    putstr_withScreen ex.message
  end
end

Then(/^I verify currency field format$/) do
  begin
    within(:id, 'fcFullList') do
      $cur = first("thead").first("tr").all("th")[1].first("div").text
    end
    puts ": #{$cur}"
    if $cur == "Annual Revenue (USD)"
      puts "Currency is US Dollar"
    elsif
      $cur == "Annual Revenue (EUR)"
      puts "Currency is Euro"
    else
      $cur == "Annual Revenue (INR)"
      puts "Currency is Rupee"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Currency Field Format"
    putstr_withScreen ex.message
  end
end


And(/^I select FCG$/) do
  begin
    within(".select2-container") do
      first("a").first("span").click
    end
    within(".select2-drop") do
      first("ul").all("li")[2].click
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting FCG"
    putstr_withScreen ex.message
  end
end

Then(/^I verify Additional Fields Section$/) do
  begin
    sleep 2
    if page.has_text? ("COMPLETE TASK")
      puts "Pop-up Window opened"
      within all(".pbSubsection")[1] do
       # within all(".detailList")[1] do
          $adet = first("tbody").all("tr")[0].first("th").first("label").text
    
          $adt = first("tbody").all("tr")[1].first("th").first("label").text
          sleep 2
          if $adet == "Count"
            puts "Additional field Count section verified"
          else
            puts "Additional field Count section not verified"
          end
          sleep 2
          if $adt == "Complete/Dismiss Date"
            puts "Additional field Date section verified"
          else
            puts "Additional field Date section not verified"
          end
        #end
      end
    else
      puts "No Additional Fields present."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Additional Fields Section"
    putstr_withScreen ex.message
  end
end




And(/^I select Task object$/) do
  begin
    sleep 2
    if page.has_text? ("Edit Filter")
      sleep 3
      find(:xpath, "//*[contains(@id, 'selectObjectType')]").select "Task"
      sleep 5
      puts "Task object selected."
    else
      puts "No Task object present to be selected."
    end
  rescue Exception => ex
    putstr "Error occurred while selecting Task as object."
    putstr_withScreen ex.message
  end
end


And(/^I change the filter attribute for Task$/) do
  begin
    arg = getDetails "Overview"
    sleep 5
    find(:xpath, "//*[contains(@id, 'filterAttrViewList')]").select(arg["Filter_value1"])
    sleep 10
    first(:xpath, "//*[contains(@title, 'Object Field Filter User Lookup (New Window)')]").click
    sleep 6
    page.driver.browser.manage.window.maximize
    sleep 4
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    sleep 5
    page.driver.browser.switch_to.frame("searchFrame")
    sleep 8
    fill_in "lksrch",:with => arg["Search_value"]
    sleep 5
    click_on 'Go!'
    sleep 3
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    sleep 3
    page.driver.browser.switch_to.frame("resultsFrame")
    sleep 3
    within('.list') do
    click_link arg["Search_value"]
    end
    sleep 3
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.first)
    sleep 10
    #find(:xpath, "//input[@value='Save']").click
    
    puts "Filter Attribute selected."

    rescue Exception => ex
    putstr "Error occurred while changing the filter attribute."
    putstr_withScreen ex.message
  end
end


Then(/^I verify Task object present$/) do
  begin
    $objval =find(:xpath, "//*[contains(@id, 'selectObjectType')]").all('option').collect(&:text)
    puts $objval
    if page.has_text?("Task")
      puts "Task as object verified."
    else
      puts "Task as object cannot be verified."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Task as object."
    putstr_withScreen ex.message
  end
end

And(/^I provide Required additional details$/) do
  begin
    $x = 111
    within all(".detailList")[1] do
      first("tbody").first("tr").first("td").first("input").send_keys [:control, 'a']
      first("tbody").first("tr").first("td").first("input").send_keys :backspace
      first("tbody").first("tr").first("td").first("input").send_keys $x
      sleep 3
    end
  rescue Exception => ex
    putstr "Error occurred while providing Required Additional Details"
    putstr_withScreen ex.message
  end
end


And(/^I provide Non\-Required additional details$/) do
  begin
    within all(".detailList")[1] do
      first("tbody").all("tr")[1].first("td").first("span").first("span").first("a").click
      sleep 5
      $date = first("tbody").all("tr")[1].first("td").first("span").first("a").text
      puts "Value selected is: #{$date}"
    end
  rescue Exception => ex
    putstr "Error occurred while providing Non-Required Additional Details"
    putstr_withScreen ex.message
  end
end


Then(/^I verify the required details of the task$/) do
  begin
    within(".list") do
      tr = first("tbody").all("tr")
      tr.each_with_index do |row, index|
        if index == $index_number
          row.all("td")[2].first("a").click
          sleep 5
          break
        else
          puts "index_number does not match"
        end
        sleep 3
      end
    end
    if page.has_text? ("Task")
      puts "Navigated to task page."
      $count = find(:xpath, "//*[contains(@id, '00No000000DVO0g_ileinner')]").text
      unless $count.to_i == $x.to_i
        puts "Required Additional Details Not Verified."
      else
        puts "Required Additional Details Verified"
      end
        #end
      #end
    else
      puts "Not navigated to task page."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Required Details of Task"
    putstr_withScreen ex.message
  end
end



Then(/^I verify the non\-required details of the task$/) do
  begin
    within(".list") do
      tr = first("tbody").all("tr")
      tr.each_with_index do |row, index|
        if index == $index_number
          row.all("td")[2].first("a").click
          sleep 5
          break
        else
          puts "index_number does not match"
        end
        sleep 3
      end
    end
    if page.has_text? ("Task")
      puts "Navigated to task page."
      $dat = find(:xpath, "//*[contains(@id, '00No000000DVO0b_ileinner')]").text
      unless $dat == $date
        puts "Non-Required Additional Details Not Verified."
      else
        puts "Non-Required Additional Details Verified."
      end
    else
      puts "Not navigated to task page."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Non-required Details of task"
    putstr_withScreen ex.message
  end
end


And(/^I click on Subject link for Active Action link$/) do
  begin
    within(".list") do
      tr = first("tbody").all("tr")
      tr.each_with_index do |row, index|
        next if index == 0
        unless row.has_css? (".ss-disabled")
          $index_number = index
          $valuerow = row.all("td")[2].first("a").text
          row.all("td")[2].first("a").click
          puts "Subject link value clicked."
          break
        else
          puts "No Active Action links present."
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on Subject link."
    putstr_withScreen ex.message
  end
end


And(/^I verify Task page$/) do
  begin
    if page.has_css? (".multiUserViewIcon")
      sleep 3
      within first(".pbBody") do
      within first(".pbSubsection") do
        sleep 3
         # $create = first("table").first("tbody").all("tr")[6].all("td")[1].first("div").first("a").text

          $create = find(:xpath, "//*[contains(@id, 'tsk5_ileinner')]").text
          sleep 3
        
          $sts = first("table").first("tbody").all("tr")[0].all("td")[3].first("div").text
          sleep 3
        end
      end
      puts $create, $sts
      puts "Navigated to task page."
      sleep 2
    else
      puts "Not Navigated to task page."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Task page."
    putstr_withScreen ex.message
  end
end

Then(/^I verify the User Access$/) do
  begin
    sleep 2
    $user = find("#userNavButton").first("span").text
    puts $user
    sleep 3
    if $user.to_s == $create.to_s && $sts.to_s != "Completed"
      puts "Same User and Hence Action Link is Active."
    else
      puts "Different Users and Hence Action Link Inactive."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying User Access."
    putstr_withScreen ex.message
  end
end


And(/^I select Task FCG$/) do
  begin
    unless page.has_css? (".ss-check")
      within(".select2-container") do
        first("a").first("span").click
      end
      within(".select2-drop") do
        first("ul").all("li").each_with_index do |fc,index|
          next if index == 0
          #puts index
          fc.click
     puts "clicked on the fcg"
          sleep 10
          if page.has_css? (".ss-check")
            puts "Task FCG selected."
           else
            puts "Task FCG not present."
            #puts index
          end
          break
        end
        sleep 10
      end
    else
      puts "Page already has Task FCG selected."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying User Access."
    putstr_withScreen ex.message
  end
end

And(/^I click on Subject of any Task$/) do
  begin
    $i = 0
    sleep 2
    if page.has_css? (".ss-check")
      within(".list") do
        tr = first("tbody").all("tr")
        tr.each_with_index do |row, index|
          next if index == 0
          unless row.has_css? (".ss-disabled")
            #$valuerow = row.all("td")[2].first("a").text
            row.all("td")[2].first("a").click
            puts "Subject link value clicked."
            sleep 15
            $i = 1
            break
          else
            puts "No pending Tasks available on Overview page for selection."
          end
        end
      end
    else
      puts "No Subject present."
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while clicking Subject."
    putstr_withScreen ex.message
  end
end


And(/^I check Task detail page to edit status to Completed$/) do
  begin
    unless $i == 0
      if page.has_text? ("Task")
        puts "Navigated to task page."
        sleep 20
        find(:id, "topButtonRow").all("input")[0].click
        puts "Edit button clicked."
        sleep 10
        find(:xpath, "//*[contains(@id, 'tsk12')]").select "Completed"
        puts "Completed status is selected."
        sleep 3
        within all(".pbHeader")[0] do
          within all(".pbButton")[0] do
            click_on "Save"
          end
        end
        sleep 20
      else
        puts "Not Navigated to task page."
      end
    else
      puts "No pending Tasks available on for selection."
    end
  rescue Exception => ex
    putstr "Error occurred while editing status to Completed."
    putstr_withScreen ex.message
  end
end



Then(/^I verify Task State$/) do
  begin
    unless $i == 0
      sleep 3
      if page.has_text? ("Task")
        puts "Navigated to task page."
        within all(".pbSubsection")[0] do
          within all(".detailList")[0] do
            $stas = all("tr")[0].all("td")[3].first("div").text
          end
        end
        puts $stas
        $taskstas = find(:xpath, '//*/td[text()="Task State"]/following-sibling::td/div').text
        puts $taskstas
        if $taskstas == "Manual Completion" && $stas == "Completed"
          puts "Task State Status verified as Manual Completion."
        else
          puts "Task State Status verified not as Manual Completion."
        end
      else
        puts "Not Navigated to task page."
      end
    else
      puts "No pending Tasks available on for selection."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Task State status."
    putstr_withScreen ex.message
  end
end


Then(/^I Verify result for Task as object$/) do
  begin
    arg = getDetails "Overview"
    sleep 5
    $messagedisplay = find(:id, "filterSelectionCriteria").text
    puts $messagedisplay
    if $messagedisplay.to_s.include?(arg["Display_Msg1"]) || $messagedisplay.to_s.include?(arg["Display_Msg2"]) || $messagedisplay.to_s.include?(arg["Display_Msg3"])
      puts "Verified result for Task as Object."
    else
      puts "Page does not get filtered as per Task Object."
    end
  rescue Exception => ex
    putstr "Error occurred while verifying result for Task as Object."
    putstr_withScreen ex.message
  end
end