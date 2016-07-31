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

#Then(/^I click on Products and create product with the name "(.*?)" and product code "(.*?)" $/) do |arg1,arg2|
#Then(/^I click on Products and create product with the name "(.*?)" and product code "(.*?)"$/) do |arg1,arg2|
Then (/^I click on Products and create product with the name "(.*?)"$/) do |arg|

  begin
    sleep 5
    click_on "Products"
    sleep 5
    puts "I click on Products"
    sleep 6

    #    within all(".bSubBlock brandSecondaryBrd secondaryPalette") do
    #      puts "m in"
    #      first(:xpath, "//*[contains(@name, 'go')]").click
    #    end
    click_on "New"
    puts "Adding products"
    sleep 5
    fill_in "Product Name",:with=>arg
    fill_in "Product Code",:with=> "Pro1234"
    sleep 5
    find('input[type=checkbox]').click
    #topButtonRow
    within(".pbBottomButtons") do
      first(:xpath, "//*[contains(@name, 'save')]").click
      sleep 5
    end

    puts "Product added successfully"
    sleep 5
    click_on "Add"
    sleep 5
    find(:xpath, "//*[contains(@title, 'Unit Price')]").send_keys "3000"
    sleep 5
    click_on "Save"
    sleep 5
    puts "product price added successfully"
    sleep 5
    click_on "Add to Price Book"
    sleep 5
    find(:xpath, "//*[contains(@title, 'Select Test_PriceBook')]").click
    select 3
    #find(:xpath, "//*[contains(@value, 'Select')]").click
    #find(:xpath, "//input[@value='Select']").click
    #first(:xpath, "//*[contains(@title, 'Select')]").click
    #first(:xpath, "//*[contains(@name, 'edit')]").click
    click_on "Select"

    select 3

  rescue Exception => ex
    raise "Error occurred while adding product"
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
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[3]/input").set arg["ProductQuantity"]
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[4]/span/input").set $startDateOLI
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[17]/td[5]/span/input").set $endDateOLI
    all(:xpath,'//td/input[@value=" Save "]')[0].click

  rescue Exception => ex
    putstr "Error occurred while opening a Product"
    putstr_withScreen ex.message
  end
end

Then(/^I create new opportunity with Name "(.*?)" with Account "(.*?)" and Product "(.*?)"$/) do |arg1,arg2,arg|
  begin
    ProductName=arg

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

    click_on "Add Product"
    sleep 5
    click_on "Save"
    # find(:xpath, "(//input[@type='checkbox'])[2]").set(true)
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

    #find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[3]/input").send_keys "1"
    find(:xpath, "//*[contains(@name, 'Quantity')]").send_keys "1"
    sleep 3
    all(:xpath,'//td/input[@value=" Save "]')[0].click
    puts "Successfully added product to opportunity"

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
