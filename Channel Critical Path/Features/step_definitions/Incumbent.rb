#All Partner Partner Opportunity Module Features - Step definitions
#All Scenario mentioned in Incumbent.feature

Then (/^I Select the "(.*?)" Partner Opportunity$/) do |argument1|
    begin
        arg1 = getReference argument1
        find("input[placeholder='Search Opportunities...']").send_keys arg1['Name']
        sleep 3
        puts "Successfully see the Partner Agreement Opportunity"
        sleep 2
        within all(".ui-grid-canvas")[1] do
          tr = all(".ui-grid-row")
          td = all("div[role='gridcell']")
          tr.each do |row|
            if row.all("div[role='gridcell']")[0].text == arg1['Name']
              row.all("div[role='gridcell']")[0].click
              puts "Successfully clicked #{arg1['Name']}"
            end
          end
        end
        sleep 5
    rescue Exception=> ex
      puts "Error in Selecting the #{argument1} Partner Opportunity"
      putstr_withScreen  ex.message
    end
end

And (/^I verify the "(.*?)" field value$/) do |field_name|
  begin
    sleep 3
    if page.has_content? "Opportunity Name"
      puts "Successfully navigated to Details tab"
    else
      putstr "Could not navigate to Details tab"
    end
    within(".data-table") do
        $renewalFieldValue=all("tr")[4].all("td")[2].text
        $amountFieldValue=all("tr")[5].all("td")[2].text
    end
      if $renewalFieldValue != "0.00"
        puts "Incumbent is checked and #{field_name} field is not empty and has #{$renewalFieldValue}"
      else
        puts "Incumbent is not checked and #{field_name} field is not empty and has #{$renewalFieldValue}"
      end
      if $amountFieldValue != "0.00"
        puts "Amount field is populated if the latest quote item is assigned"
      else
        puts "Amount field is populated if the latest quote item is not assigned"
      end
  rescue Exception=>ex
    puts "Error in verifying #{field_name} field values."
    putstr_withScreen  ex.message
  end
end