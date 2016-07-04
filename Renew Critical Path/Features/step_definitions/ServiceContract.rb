#All Service Contract - Merge Service Contract specific Step definitions
#All Scenario mentioned in ServiceContract.feature

And(/^I click on Go$/) do
  begin
    select "All Service Contracts", :from => "fcf"
    sleep 3
    within(".fBody") do
      click_on "Go!"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking Go"
    putstr_withScreen ex.message
  end
end

Then(/^I verify the validation message "(.*?)"$/) do |alert_message|
  begin
    sleep 5
    if page.driver.browser.switch_to.alert.text.to_s == alert_message.to_s
      puts page.driver.browser.switch_to.alert.text + " message displayed in confirmation dialog."
      page.driver.browser.switch_to.alert.accept
    else
      putstr "#{alert_message} validation message is not displayed."
    end
  rescue Selenium::WebDriver::Error::NoAlertOpenError
    putstr "Error while validating message displayed in confirmation dialog"
  end
end

And(/^I select more than two Service Contract$/) do
  begin
    within(".x-grid3-body") do
      all(".x-grid3-row")[0].first('input[type=checkbox]').set(true)
      all(".x-grid3-row")[1].first('input[type=checkbox]').set(true)
      all(".x-grid3-row")[2].first('input[type=checkbox]').set(true)
    end
  rescue Exception => ex
    putstr "Error occurred while selecting more than two Service Contracts"
    putstr_withScreen ex.message
  end
end

# And(/^I select "(.*?)" consolidated Service Contract$/) do |arg|
# begin
# sleep 5
# arg1 = getReference "ConsolidatedSC"
# consolidatedSC = arg1["SC"+arg]
# sleep 5
# foundCount = 0
# begin
# within(".x-grid3-body") do
# tr = all(".x-grid3-row")
# tr.each do |row|
# if row.all("td")[2].text == consolidatedSC
# row.first('input[type=checkbox]').set(true)
# foundCount = 1
# break
# end
# end
# end
# if page.has_css?('.next')
# find(".next").click
# sleep 3
# else
# break
# end
# end until (page.has_css?('.nextoff'))
# if foundCount == 0
# within(".x-grid3-body") do
# tr = all(".x-grid3-row")
# tr.each do |row|
# if row.all("td")[2].text==consolidatedSC
# row.first('input[type=checkbox]').set(true)
# foundCount = 1
# break
# end
# end
# end
# end
# if foundCount > 0
# puts "Selected the Service Contract"
# else
# putstr "Service Contract to be selected not found"
# end
# sleep 5
# rescue Exception => ex
# putstr "Error occurred while selecting Service Contract"
# putstr_withScreen ex.message
# end
# end

Then(/^I verify the consolidated SC validation message$/) do
  begin
    puts page.driver.browser.switch_to.alert.text + " message displayed in confirmation dialog."
    page.driver.browser.switch_to.alert.accept
  rescue Selenium::WebDriver::Error::NoAlertOpenError
    puts "Service Contract is already consolidated validation message is not displayed."
  end
end

Then(/^I verify the merge SC process$/) do
  begin
    sleep 5
    readonlycols = Array.new
    arg1 = getDetails "SCcolumns"
    readonlycols =  arg1["readcols"].split(",")
    #arg1["Columns"].split(",")
    puts "Read-only fields : #{readonlycols}"

    within(".mergeEntity") do
      sleep 3

      all("#selectLink").each do |color|
        sleep 3
        if  color.first("font")[:color] == "#1E90FF"
          puts "Select All font is displayed in blue color"
        else
          puts "Select All font is not displayed in blue color"
        end
        sleep 3
      end
      i=0
      isConflictBlue = 0
      isNoConflict = 0
      rows = all("tr")
      numRows = rows.count - 14
      1.upto(numRows-1) do |j|
        if i==0
          i=1
        else
          if rows[j].all("td")[0].native.style('background-color').to_s.include? "227, 243, 255"
            if rows[j].all("td")[0].text.chomp == rows[j].all("td")[1].text.chomp
              isConflictBlue = 1
              break
            end
          else
            if rows[j].all("td")[0].text.chomp != rows[j].all("td")[1].text.chomp
              puts rows[j].all("td")[0].text.chomp  + ":" + rows[j].all("td")[1].text.chomp
              isNoConflict = 1
              break
            end
            #puts "Not able to see the conflicting data rows in blue color"
          end
        end
      end
      if isConflictBlue==0
        puts "Conflict data in blue background"
      end
      if isNoConflict==0
        puts "No Conflict data in white background"
      end

      rowsCount = all("tr").count - 1
      gridcols = Array.new

      numRows.upto(rowsCount) do |index|
        gridcols << all("tr")[index].first("th").text
      end

      if readonlycols.to_s == gridcols.to_s
        puts "Read-only fields are displayed at the bottom of the grid"
      else
        puts "Read-only fields are not displayed at the bottom of the grid"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying merge process of Service Contracts"
    putstr ex.backtrace.inspect
    putstr_withScreen  ex.message
  end
end

And(/^I create "(.*?)" Service Contract$/) do |arg|
  begin
    sleep 5
    arg1 = getDetails "CreateSC"
    arg2 = getReference "CreateSC"
    SCName = arg1["SC"+arg]
    within all(".pbSubsection")[0] do
      sleep 3
      fill_in "Contract Name",:with => SCName
      # all("input[type='text']")[0].set arg["ServiceContractName"]
      sleep 4
      fill_in "Account Name",:with => arg2["ServiceContractAccountName"]
      # all("input[type='text']")[3].set arg["ServiceContractAccountName"]
      sleep 3
    end
    sleep 5
    within("#topButtonRow") do
      click_on 'Save'
    end
    puts "Successfully created #{SCName}"
    sleep 3

    click_on "Add Line Item"
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while entering the mandatory details in new service contract page"
    putstr_withScreen ex.message
  end
end

Then(/^I Choose "(.*?)" Pricebook for the SC$/) do |arg|
  begin
    arg1 = getReference "Pricebooks"
    pricebook = arg1[arg]

    select pricebook,:from=>"p1"
    click_on "Save"
    sleep 3

    within("#undefined_grid") do

      if all('input[type=checkbox]').count > 0
        all('input[type=checkbox]')[1].set(true)
      else
        puts "No lineitems to add to Service Contract"
      end
    end

    sleep 4
    click_on 'Select'
    puts "Successfully added a lineitem to Service Contract"
    sleep 6
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[3]/input").set 1
    sleep 5
    all(:xpath,'//td/input[@value=" Save "]')[0].click
    sleep 6
  rescue Exception => ex
    putstr "Error in choosing the pricebook for the product "
    putstr_withScreen ex.message
  end
end

And(/^I select "(.*?)" and "(.*?)" records on List View$/) do |firstName, secondName|
  begin
    sleep 5
    arg1 = getDetails "CreateSC"
    puts "Searching #{firstName} and  #{secondName}..."
    #    all(".listItemPad")[12].click
    sleep 5
    foundSC1 = false
    foundSC2 = false
    begin
      within(".x-grid3-body") do
        if !foundSC1 && has_link?(firstName)
          foundSC1 = true
          first('a', :text => firstName).find(:xpath, '../../..').first("input").click
        end
        sleep 2
        if !foundSC2 && has_link?(secondName)
          foundSC2 = true
          first('a', :text => secondName).find(:xpath, '../../..').first("input").click
        end
        sleep 2
      end
      if (!foundSC1 || !foundSC2) && page.has_css?('.next')
        find(".next").click
        sleep 3
      else
        break
      end
    end until (page.has_css?('.nextoff'))
    if !foundSC1
      putstr "Record name '#{firstName}' not found."
    end
    if !foundSC2
      putstr "Record name '#{secondName}' not found."
    end
  rescue Exception => ex
    putstr "Error in choosing the '#{firstName}' and '#{secondName}' records"
    putstr ex.backtrace.inspect
    putstr_withScreen  ex.message
  end
end

And(/^I select "(.*?)" Service Contract$/) do |arg|
  begin
    sleep 5
    arg1 = getDetails "CreateSC"
    servicecontract = arg1["SC"+arg]
    puts "Searching #{servicecontract}"
    sleep 5
    foundCount = 0
    begin
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          if row.all("td")[2].text == servicecontract
            row.first('input[type=checkbox]').set(true)
            foundCount = 1
            break
          end
        end
      end
      if page.has_css?('.next')
        find(".next").click
        sleep 3
      else
        break
      end
    end until (page.has_css?('.nextoff'))
    if foundCount == 0
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          if row.all("td")[2].text==servicecontract
            row.first('input[type=checkbox]').set(true)
            foundCount = 1
            break
          end
        end
      end
    end
    if foundCount > 0
      puts "Selected the Service Contract"
    else
      putstr "#{servicecontract} not found to select"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while selecting Service Contract"
    putstr_withScreen ex.message
  end
end

Then(/^I verify the different pricebook validation message$/) do
  begin
    sleep 5
    puts page.driver.browser.switch_to.alert.text + " message displayed in confirmation dialog."
    page.driver.browser.switch_to.alert.accept
  rescue Selenium::WebDriver::Error::NoAlertOpenError
    puts "The Selected Service Contracts must have matching Pricebooks. Please update the Pricebooks and then try again validation message is not displayed."
  end
end

Then(/^I delete the "(.*?)" Service Contract$/) do |arg|
  begin
    sleep 5
    arg1 = getDetails "CreateSC"
    servicecontract = arg1["SC"+arg]
    sleep 5
    foundCount = 0
    begin
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          if row.all("td")[2].text == servicecontract
            page.accept_confirm { row.first(:link,"Del").click }
            foundCount = 1
            break
          end
        end
      end
      if page.has_css?('.next')
        find(".next").click
        sleep 3
      else
        break
      end
    end until (page.has_css?('.nextoff'))
    if foundCount == 0
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          if row.all("td")[2].text==servicecontract
            page.accept_confirm { row.first(:link,"Del").click }
            foundCount = 1
            break
          end
        end
      end
    end
    if foundCount > 0
      puts "Successfully deleted the Service Contract - #{servicecontract}"
    else
      putstr "#{servicecontract} not found to delete"
    end
    sleep 5

  rescue Exception => ex
    putstr "Error occurred while deleting a Service Contract"
    putstr_withScreen ex.message
  end
end

And(/^I select a master record to merge$/) do
  begin
    all("#selectLink")[0].click
    puts "Selected a master record to merge Service Contracts"
    sleep 2
    within(".pbButton ") do
      click_on "Merge"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while determining master record to merge Service Contracts"
    putstr_withScreen ex.message
  end
end

Then(/^I verify the lineitem added to the merged ServiceContract$/) do
  begin
    within(:xpath,"//*[contains(@id,'RelatedContractLineItemList_body')]") do
      if first("tbody").all("tr").count > 1
        puts "Successfully added lineitem to Service Contract"
      else
        putstr "Unable to add the lineitem to Service Contract"
      end
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying merged Service Contract"
    putstr_withScreen ex.message
  end
end

And(/^I open "(.*?)" Service Contract$/) do |arg|
  begin
    sleep 5
    arg1 = getDetails "CreateSC"
    servicecontract = arg1["SC"+arg]
    sleep 5
    foundCount = 0
    begin
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          if row.all("td")[2].text == servicecontract
            row.all("td")[2].all('a')[0].click
            foundCount = 1
            break
          end
        end
      end
      if page.has_css?('.next')
        find(".next").click
        sleep 3
      else
        break
      end
    end until (page.has_css?('.nextoff'))
    if foundCount == 0
      within(".x-grid3-body") do
        tr = all(".x-grid3-row")
        tr.each do |row|
          if row.all("td")[2].text==servicecontract
            row.all("td")[2].all('a')[0].click
            foundCount = 1
            break
          end
        end
      end
    end
    if foundCount > 0
      puts "Successfully opened the Service Contract - #{servicecontract}"
    else
      putstr "#{servicecontract} not found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while opening consolidated Service Contract"
    putstr_withScreen ex.message
  end

end

Then(/^I verify consolidated field is checked or not$/) do
  begin
    if page.has_content? ("Is Consolidated?")
      if all(:xpath,"//img[contains(@src, 'checkbox_checked.gif')]").count > 0
        puts "Consolidated flag is checked"
      elsif all(:xpath,"//img[contains(@src, 'checkbox_unchecked.gif')]").count > 0
        putstr "Consolidated flag is not checked"
      else
        puts "Consolidated flag not found"
      end
    else
      puts "Field - Is Consolidated? not found on Service Contract page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying Consolidated flag on consolidated Service Contract"
    putstr_withScreen ex.message
  end
end
