#All Renew master data creation
#All Scenario mentioned in RenewMsterData.feature

When(/^I click on "([^"]*)" tab$/) do |tab|
  begin
    sleep 3
    click_on tab
    sleep 8
    puts "Successfully to open the #{tab} page"
  rescue Exception => ex
    putstr "Error occurred while clicking the #{tab} tab"
    putstr_withScreen  ex.message
 end
end

Then(/^I create new Renew Account with value "(.*?)"$/) do |arg|
  begin 
    click_on "New"
    sleep 2
    puts "Creating a new Account"
    sleep 4
    fill_in "acc2",:with => arg
    puts "Filled value for Account name"
    sleep 5
    within(:id,"topButtonRow") do
      click_on "Save"
    end
    sleep 5
    puts "Account  successfully created" 
    rescue Exception => ex
    puts "Error occurred while creating Account"
    puts ex.message
  end
end

Then(/^I create new Asset with Name "(.*?)" and its Status "(.*?)"$/) do |arg1,arg2|
  begin
    click_on "New"
    sleep 2
    puts "Creating a new Asset"
    sleep 4
    fill_in "Name",:with => arg1
    puts "Filled value for Assest name"
    sleep 5
    first(:xpath, "//*[contains(@id, 'Status')]").select(arg2)
    sleep 5
    within(:id,"topButtonRow") do
      click_on "Save"
    end
    
    puts "Assest  successfully created" 
    rescue Exception => ex
    puts "Error occurred while creating Assest"
    puts ex.message
  end
end    

Then(/^I create new Service Contracts with Name "(.*?)" with Account "(.*?)"^$/) do |arg1,arg2|  
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
    
    puts "Service Contract  successfully created" 
    rescue Exception => ex
    puts "Error occurred while creating Service Contract"
    puts ex.message
  end
end 

Then(/^I create new Asset with Name "(.*?)" and its Product "(.*?)"$/) do |arg1,arg2|
  begin
     puts "Inside Method"
     click_on "New"
    sleep 2
    puts "Creating a new Asset"
    sleep 4
    fill_in "Name",:with => arg1
    puts "Filled value for Assest name"
    sleep 5
    fill_in "Product2",:with =>arg2
    sleep 5
    within(:id,"topButtonRow") do
      click_on "Save"
    end
    
    puts "Assest  successfully created" 
    rescue Exception => ex
    puts "Error occurred while creating Assest"
    puts ex.message
  end
 end 

