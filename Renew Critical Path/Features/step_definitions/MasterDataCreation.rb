#All Renew master data creation
#All Scenario mentioned in RenewMsterData.feature

Then(/^I create new Renew Account$/) do
  begin
    arg=getReference "Account"
    click_on "New"
    sleep 2
    puts "Creating a new Account"
#    arg.each do |key,val|
#      fill_in key,:with => val
#      puts "Filled value for " + key + " column"
#      sleep 1
#    end
    
    find("option[value='Healthy']").click
    
    sleep 1
    within(:id,"topButtonRow") do
      click_on "Save"
    end
    
    puts "Account  successfully created" 
    rescue Exception => ex
    puts "Error occurred while creating Account"
    puts ex.message
  end
end
