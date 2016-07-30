#All Renew master data creation
#All Scenario mentioned in RenewMsterData.feature

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

 Then(/^I click on Price Books and create pricebook with the name "(.*?)"$/) do |arg1|
   begin
     sleep 8
     click_on "Price Books"
     sleep 5
     puts "I click on Price Book"
     sleep 6
     click_on "New"
     puts "Creating Standard Price Book"
     sleep 5
     fill_in "Price Book Name",:with=>arg1
      sleep 5
      
        find('input[type=checkbox]').click
     #topButtonRow
     within(".pbBottomButtons") do
           first(:xpath, "//*[contains(@name, 'save')]").click
           sleep 5
         end
         
     puts "Pricebook created"

     
    rescue Exception => ex
    raise "Error occurred while creating Price book"
    putstr_withScreen  ex.message
   end
 end

When(/^I click on "([^"]*)" tab$/) do |tab|
  begin
    sleep 8
    click_on tab
    sleep 8
    puts "Successfully to open the #{tab} page"
  rescue Exception => ex
    putstr "Error occurred while clicking the #{tab} tab"
    putstr_withScreen  ex.message
  end
end

Then(/^I create new Asset with Name "(.*?)" and its Product "(.*?)" and its Status "(.*?)" and account "(.*?)"$/) do |arg1,arg2,arg3,arg4|   
  begin
    sleep 10
    click_on "New"
    sleep 5
    puts "Creating a new Asset"
    sleep 5
    fill_in "Name",:with => arg1
    puts "Filled value for Assest name"
    sleep 5
    fill_in "Account",:with => arg4
    puts "Filled value for Assest Account"
    sleep 5
    first(:xpath, "//*[contains(@id, 'Status')]").select(arg3)
    sleep 5
    fill_in "Product2",:with =>arg2
    puts "Filled value for Assest Product"
    sleep 8
    within(:id,"topButtonRow") do
      click_on "Save"
    end
    sleep 8
    puts "Assest  successfully created"
  rescue Exception => ex
    puts "Error occurred while creating Assest"
    puts ex.message
  end
end

Then(/^I create new Service Contracts with Name "(.*?)" with Account "(.*?)"$/) do |arg1,arg2|
  begin
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
  rescue Exception => ex
    puts "Error occurred while creating Service Contract"
    puts ex.message
  end
end
Then (/^I select with its Product "(.*?)"$/) do |arg|
  begin
    ProductName=arg
    puts "ProductName"+ProductName
    sleep 7
    within('.list') do
      first(:link).click
    end
    sleep 4
    click_on "Add Line Item"
    puts "Successfully click on  Add Line Items"
    sleep 6
    first(:xpath, "//*[contains(@id, 'p1')]").select("Standard Price Book")
    sleep 6

    click_on "Save"
    puts "Select Price book"
    sleep 6
    within (".x-grid3-body") do
      tr=all(".x-grid3-row")
      tr.each do |row|
        puts row
        puts row.all("td")[1].text
        if row.all("td")[1].text == ProductName
          sleep 5
          row.all("td")[0].first("div").first("input").click
        end
      end
    end
    sleep 5
    click_on "Select"
    puts "Successfully select the product"
    sleep 8

  rescue Exception => ex
    putstr "Error occurred while opening a Product"
    putstr_withScreen ex.message
  end
end

Then(/^I create new opportunity with Name "(.*?)" with Account "(.*?)"$/) do |arg1,arg2|
  begin
    sleep 8
    within (".pbHeader") do
      click_on "New"
    end
    puts "New Opportunity button clicked."
    fill_in "Opportunity Name",:with=>arg1
    fill_in "Account Name",:with=>arg2
#    fill_in "Stage",:with=>arg["OpportunityStageValue"]
    time = Time.new
    fill_in "Close Date",:with=>time.month.to_s + "/" + time.day.to_s + "/" +time.year.to_s
      
#    find(:xpath, "//td/label[text()='Stage']").find(:xpath, '..').find(:xpath, "following-sibling::td").find(:xpath,"//select").select arg["OpportunityStageValue"]
    find("#opp11").select "Qualification"
    sleep 2
    within("#bottomButtonRow") do
      click_on 'Save'
    end

    sleep 8
    rescue Exception => ex
    putstr "Error occurred while creating opportunity"
    putstr_withScreen ex.message
  end
end  

Then(/^I select opportunity with its Product "(.*?)"$/) do |arg|    
  begin
    ProductName=arg
    puts "ProductName"+ProductName
    sleep 5
    within('.list') do
      first(:link).click
    end
    sleep 4
    click_on "Add Product"
    puts "Successfully click on  Add Line Items"
    sleep 5
    first(:xpath, "//*[contains(@id, 'p1')]").select("Standard Price Book")
    sleep 5

    click_on "Save"
    puts "Select Price book"

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
    puts "Successfully select the product"
    sleep 8

  rescue Exception => ex
    putstr "Error occurred while opening a Product"
    putstr_withScreen ex.message
  end
end

And(/^I select contract and generate Opportunity with Name "(.*?)" with Account "(.*?)"$/) do |arg1,arg2|
  begin
    sleep 5
    within('.list') do
      first(:link).click
    end
    sleep 8
    within('#topButtonRow') do
    click_on "Generate Opportunity"
    puts "Click on Generate Opportunity"
    end
    fill_in "Name",:with=>arg1
    time = Time.new
    fill_in "Close Date",:with=>time.month.to_s + "/" + time.day.to_s + "/" +time.year.to_s
    sleep 1
    fill_in "Probability (%)",:with=>"10"
    sleep 1
    find(".class_StageName").select "Qualification"
    sleep 8
    within("#pgbtn") do
      click_on 'Save'
    end
  end
end
