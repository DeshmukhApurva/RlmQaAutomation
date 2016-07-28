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
        sleep 4
        click_on tab
      end
      sleep 3
      puts "Successfully navigate to the #{tab} page"
    else
      raise "Failed to see the All Tab Icon"
    end
    sleep 3
  rescue Exception => ex
    raise "Error occurred while clicking the #{tab} tab"
    putstr_withScreen  ex.message
  end
end

Then(/^I create new  Account$/) do
  begin
    arg=getReference "Account"
    click_on "New"
    sleep 2
    puts "Creating a new Account"
    
    fill_in "acc2",:with => arg
    puts "Filled value for Account name"
    sleep 1
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
