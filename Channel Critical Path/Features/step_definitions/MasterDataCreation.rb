#All Channel master data creation
#All Scenario mentioned in MasterDataCreationChannel.feature
Then(/^I create new Channel Account with value "(.*?)" with AccountNumber "(.*?)" and Country "(.*?)"$/) do |arg1,arg2,arg3|
  begin
    sleep 8
    click_on "New"
    sleep 2
    puts "Creating a new Account"
    sleep 4
    fill_in "Account Name",:with => arg1
    puts "Filled value for Account name"
    sleep 4
    fill_in "Account Number",:with =>arg2
     puts "Filled value for Account Number"
    sleep 4
    fill_in "Billing Country" ,:with =>arg3
    puts "Filled value for Billing Country"
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

 And(/^I Manage External Account$/) do |arg|
   begin
     sleep 5
     find(:xpath,"//*[@id='acc1_ileinner']/a[2]").click
     puts "I change Owner"
     # sleep 3
    # find(:xpath,"//select[contains(@title,'Search scope')]").select "User"
    sleep 3
    fill_in "Owner",:with=> "QA ChannelManager"
    sleep 5
    click_on "Save"
    puts "I save Owner"
    sleep 6
     within('#workWithPortal') do
      find(:xpath,"//*[@id='workWithPortalLabel']").click
           puts "I Manage Account As Partner"
            find(:xpath,"//*[@id='workWithPortalMenu']/a").click
     puts "I click on Enabled Partner"
      end
     sleep 8
     click_on "New Contact"
     
   end
 end

Then(/^I create new Asset with Name "(.*?)" and its Product "(.*?)" and its Status "(.*?)" and price "(.*?)" and account "(.*?)"$/) do |arg1,arg2,arg3,arg4,arg5|
  begin
    sleep 10
    click_on "New"
    sleep 5
    puts "Creating a new Asset"
    sleep 5
    fill_in "Name",:with => arg1
    puts "Filled value for Asset name"
    sleep 5
    fill_in "Account",:with => arg5
    puts "Filled value for Asset Account"
    sleep 5
    first(:xpath, "//*[contains(@id, 'Status')]").select(arg3)
    sleep 5
    fill_in "Product2",:with =>arg2
    puts "Filled value for Asset Product"
    sleep 8
    fill_in "Price",:with =>arg4
    fill_in "Quantity",:with => "1"
    sleep 5

    within(:id,"topButtonRow") do
      click_on "Save"
    end
    sleep 8
    puts "Asset  successfully created"
  rescue Exception => ex
    puts "Error occurred while creating Asset"
    puts ex.message
  end
end


Then(/^I create new Service Contracts with Name "(.*?)" with Account "(.*?)" and Product "(.*?)"$/) do |arg1,arg2,arg|
  begin

    ProductName=arg

    click_on "New"
    sleep 2
    puts "Creating a new Service Contract"
    sleep 4
    fill_in "Name",:with => arg1
    puts "Filled value for Service Contract name"
    sleep 4
    fill_in "Account",:with => arg2
    puts "Filled value for Account name"
    sleep 5
    within(:id,"topButtonRow") do
      click_on "Save"
    end
    sleep 10
    puts "Service Contract  successfully created"
    sleep 5
    click_on "Add Line Item"
    sleep 5
    click_on "Save"
    within (".x-grid3-body") do
      tr=all(".x-grid3-row")
      tr.each do |row|
        puts row
        puts row.all("td")[1].text
        if row.all("td")[1].text == ProductName
          row.all("td")[0].first("div").first("input").click
        end
      end
    end
    click_on 'Select'
    puts "Successfully select the service contract line item"

    #find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[3]/input").send_keys "1"
    find(:xpath, "//*[contains(@name, 'Quantity')]").send_keys "1"
    sleep 3
    all(:xpath,'//td/input[@value=" Save "]')[0].click
    puts "Successfully added product to service contract"

  rescue Exception => ex
    puts "Error occurred while creating Service Contract"
    puts ex.message
  end
end



When(/^I create Source Opportunity with Line Items and resolve it and rename it as "(.*?)"$/) do |arg|
  begin
  # Components of a Time
  #    puts "Current Time : " + time.inspect
  #    puts time.year    # => Year of the date
  #    puts time.month   # => Month of the date (1 to 12)
  #    puts time.day     # => Day of the date (1 to 31 )
  #    puts time.wday    # => 0: Day of week: 0 is Sunday
  #    puts time.yday    # => 365: Day of year
  #    puts time.hour    # => 23: 24-hour clock
  #    puts time.min     # => 59
  #    puts time.sec     # => 59
  #    puts time.usec    # => 999999: microseconds
  #    puts time.zone    # => "UTC": timezone name
    time = Time.new
    #oppDateTime =  +
    time = Time.new
    oppDateTime = time.day.to_s + time.month.to_s + time.year.to_s + time.hour.to_s + time.min.to_s + time.sec.to_s
    year = time.year.to_i + 2
    click_link('Opportunities')
    sleep 5
    click_on "New"
    sleep 5
    puts "Creating a new opportunity"

    $automationOppName = "SourceOpp" + oppDateTime.to_s
    $earliestExpirationDate = "12/30/" + year.to_s
    $oPPCloseDate = "12/31/" + year.to_s

    $startDateOLI = time.month.to_s + "/" + time.day.to_s + "/" + time.year.to_s
    $endDateOLI = time.month.to_s + "/" + time.day.to_s + "/" + (time.year.to_i + 1).to_s

    fill_in "Opportunity Name",:with=>$automationOppName
    sleep 3
    fill_in "Close Date",:with=> $oPPCloseDate
    sleep 3
    fill_in "Earliest Expiration Date",:with=> $earliestExpirationDate
    sleep 3
    select "Qualification", :from => "Stage"
    sleep 3
    fill_in "Account Name",:with=> "PES Channel Account"

    sleep 3

    within(:id,"topButtonRow") do
      click_on "Save"
    end

    puts "Successfully created Opportunity"

    sleep 5
    click_on "Choose Price Book"
    sleep 3
    first(:option,'Standard Price Book').select_option
    sleep 4
    click_on "Save"
    sleep 5
    click_on "Add Product"
    sleep 5

    #find(:xpath, "(//input[@type='checkbox'])[2]").set(true)
    find(:xpath, "(//input[@type='checkbox'])[3]").set(true)
    find(:xpath, "(//input[@type='checkbox'])[4]").set(true)
    find(:xpath, "(//input[@type='checkbox'])[5]").set(true)
    find(:xpath, "(//input[@type='checkbox'])[6]").set(true)

    
    # find(:xpath, "(//input[@type='checkbox'])[6]").set(true)
    # find(:xpath, "(//input[@type='checkbox'])[7]").set(true)
    # find(:xpath, "(//input[@type='checkbox'])[8]").set(true)
    # find(:xpath, "(//input[@type='checkbox'])[9]").set(true)'

    click_on 'Select'
    puts "Successfully select the product"
    sleep 6
    #Enter product Quantity
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[3]/input").send_keys "1"
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[3]/input").send_keys "1"
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[13]/td[3]/input").send_keys "1"
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[3]/input").send_keys "1"
    sleep 2

    #Enter Start Date of Product
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[4]/span/input").set $startDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[4]/span/input").set $startDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[4]/span/input").set $startDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[13]/td[4]/span/input").set $startDateOLI
    sleep 2

    #Enter End Date of Product
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[5]/span/input").set $endDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[5]/span/input").set $endDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[5]/span/input").set $endDateOLI
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[13]/td[5]/span/input").set $endDateOLI
    sleep 2

    #Enter product sales price
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[6]/input").send_keys "1000"
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[6]/input").send_keys "2000"
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[13]/td[6]/input").send_keys "1500"
    sleep 2
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[6]/input").send_keys "3000"
#    sleep 2
    # find(:xpath,"//*[@id='editPage']/table/tbody/tr[21]/td[6]/input").set arg["ProductSalesPrice"]
    # sleep 2
    # find(:xpath,"//*[@id='editPage']/table/tbody/tr[25]/td[6]/input").set arg["ProductSalesPrice"]
    # sleep 2
    # find(:xpath,"//*[@id='editPage']/table/tbody/tr[29]/td[6]/input").set arg["ProductSalesPrice"]
    # sleep 2
    # find(:xpath,"//*[@id='editPage']/table/tbody/tr[33]/td[6]/input").set arg["ProductSalesPrice"]
    # sleep 2
    all(:xpath,'//td/input[@value=" Save "]')[0].click
    sleep 6

    within(".opportunityLineItemBlock") do
      within(".list") do
        sleep 3
        $first_product = all(".dataRow")[0].all("th")[0].first("a").text
        puts $first_product

        $second_product = all(".dataRow")[1].all("th")[0].first("a").text
        puts $second_product

        $third_product = all(".dataRow")[2].all("th")[0].first("a").text
        puts $third_product

        $fourth_product = all(".dataRow")[3].all("th")[0].first("a").text
        puts $fourth_product
        sleep 3
      end
    end

    #Resolve Opportunity
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    #first(:button,'Edit').click
    sleep 5
    first(:option,'Closed Won').select_option
    sleep 2
    first(:button,'Save').click
    sleep 8

    find(:xpath, "//th[text()='Contributed To']").find(:xpath, '..').find(:xpath, "following-sibling::tr/td[2]/a").click
    sleep 8

    # first(:button,'Edit').click
    within("#bottomButtonRow") do
      click_on 'Edit'
    end
    sleep 5
    #$automationRO = $automationOppName + "RO"
    fill_in "Opportunity Name",:with=> arg
    sleep 1
    first(:button,'Save').click
    sleep 8
  rescue Exception => ex
    puts "Error occurred while resolving Opportunities"
    puts ex.message
  end
end

