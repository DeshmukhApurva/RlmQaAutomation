#All Service Source Setup -Install Base Data Rules Generation specific Step definitions
#All Scenario mentioned in IBDRGeneration.feature

Then(/^I add update more than "(\d+)" criteria for "(.*?)"$/) do |item_count,item|
  begin
    param = getDetails item+"Param"
    count = item_count.to_i
    addDisabled = 1
    rowCount = 0
    clickCount = 0
    within all(".pbSubsection")[param["section"]] do
      within(".detailList") do
        within(".list") do
          rowCount = first("tbody").all("tr").count
          puts "#{rowCount} Criteria are present before adding/updating"
        end
      end
      if page.has_css?(".btnDisabled")
        addDisabled = 0
      end
    end
    clickCount = count-rowCount
    sleep 2
    if (addDisabled > 0)
      within all(".pbSubsection")[param["section"]] do
        click_on "Add Criteria"
      end
      sleep 2
      0.upto(clickCount) do |i|
        if i>0
          within all(".pbSubsection")[param["section"]] do
            if page.has_css?(".btnDisabled")
              puts "Add Criteria button is disabled after adding/updating #{count} Criteria's"
              addDisabled = 0
              break
            else
              click_on "Add Criteria"
            end
          end
        end
      end
    end
    sleep 3
  rescue Exception => ex
    puts "Error while setting more than 10 criteria"
    putstr_withScreen  ex.message
  end
end

Then(/^I add update criteria for "(.*?)" without values$/) do |item|
  begin
    if item == "OppFields"
      arg = getDetails item+"Criteria"
      #puts arg
      field = arg["Fieldvalue3"]
      puts "Setting empty value for field :#{field}"

      all(".dataRow")[0].all(".dataCell")[2].select(arg["Fieldvalue1"])
      sleep 8
      all(".dataRow")[0].all(".dataCell")[3].select(arg["Operator1"])
      sleep 10
      all(".dataRow")[0].all(".dataCell")[4].first("input").set(arg["Value1"])
      sleep 5

      all(".dataRow")[1].all(".dataCell")[2].select(arg["Fieldvalue2"])
      sleep 8
      all(".dataRow")[1].all(".dataCell")[3].select(arg["Operator2"])
      sleep 10
      all(".dataRow")[1].all(".dataCell")[4].first("input").set(arg["Value2"])
      sleep 5

      all(".dataRow")[2].all(".dataCell")[2].select(field)
      sleep 8
      all(".dataRow")[2].all(".dataCell")[3].select(arg["Operator3"])
      sleep 10
      all(".dataRow")[2].all(".dataCell")[4].first("input").set("")
      sleep 5

      within(:css ,".pbButton") do
        click_on "Save"
      end
      if page.has_content?("Value must be populated for #{field}")
        puts "Validation Error : Value must be populated for #{field} is displayed"
      else
        putstr "Validation Error : Value must be populated for #{field} is not displayed"
      end
      #end

    elsif item == "ProductFields"
      arg = getDetails "ProductFields"
      #field = arg["Fieldvalue3"]
      field = "Product Family"
      #puts field

      within(:css ,".pbButton") do
        click_on "Save"
      end

      if page.has_content?("Value must be populated for #{field}")
        puts "Validation Error : Value must be populated for #{field} is displayed"
      else
        puts "Validation Error : Value must be populated for #{field} is not displayed"
      end
    end

  rescue Exception => ex
    puts "Error while verifying the Validation message"
    putstr_withScreen  ex.message
  end
end

And(/^I "(.*?)"$/) do |arg|
  begin
    within('.pbButton ') do
      click_on arg
      puts "Clicked on #{arg}"
    end
    sleep 5
  rescue Exception => ex
    puts "Error while clicking on #{arg}"
    putstr_withScreen  ex.message
  end
end

And(/^I verify grid display related to Service Contract$/) do
  begin
    labeltext = "Enable Generation of Service Contract"
    if find_field("#{labeltext}").checked?
      find_field("#{labeltext}").set(false)
      puts "Service Contract entitlement is disabled"
      sleep 4
      within('.pbButton ') do
        click_on "Save"
        puts "Clicked on Save"
      end
      sleep 5
    else
      puts "Service Contract entitlement is already disabled"
    end

    if page.has_content?("Specify which products to generate service contracts for.")
      puts "Service Contract grid is displayed"
    else
      puts "Service Contract grid is not displayed"
    end
    sleep 3
  rescue Exception => ex
    puts "Error while verifying Service Contract section display"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify filter logic for "(.*?)"$/) do |item|
  begin
    param = getDetails item+"Param"
    section = param["section"]
    addFilterText = "Add Filter Logic"
    within all(".pbSubsection")[section] do
      within(".detailList")do
        puts "#{first(:xpath,".//*[contains(@id,'addFilterLogicId')]").text} is present"
        if first(:xpath,".//*[contains(@id,'addFilterLogicId')]").text == addFilterText
          all(:xpath,'//tbody/tr[position() <= 2]/td[6]', :visible => false).each do |asset|
            if asset['style'] == "display: none;"
              puts "AND text is not present across the columns"
              break
            else
              puts "AND text is present across the columns"
              break
            end
          end
        else
          all(:xpath,'//tbody/tr[position() <= 2]/td[6]', :visible => true).each do |asset|
            if (asset['style']).should_not include('display:none', 'display: none')
              puts "AND text is  present"
              break
            else
              puts "AND text is not present"
              break
            end
          end
        end
        @@filtertext = first(:xpath,".//*[contains(@id,'addFilterLogicId')]").text
        first(:xpath,".//*[contains(@id,'addFilterLogicId')]").click
        puts "#{@@filtertext} is clicked"
        sleep 5
        puts "#{@@filtertext} is changed to #{first(:xpath,".//*[contains(@id,'addFilterLogicId')]").text}"
      end
    end
  rescue Exception => ex
    puts "Error while verifying the filter logic"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify validation message for undefined reference for "(.*?)"$/) do |item|
  begin
    param = getDetails item+"Param"
    section = param["section"]
    rowCount = 0
    within all(".pbSubsection")[section] do
      within(".detailList") do
        within(".list") do
          rowCount = first("tbody").all("tr").count
          puts "#{rowCount} Criteria are present before adding/updating"
        end
      end
    end
    if rowCount >= 3
      within all(".pbSubsection")[section] do
        first(:xpath,"//*[contains(@id,'bool_filter')]").first("input").set("1 OR 2")
      end
    else
      break
    end
    within(:css ,".pbButton") do
      click_on "Save"
    end
    if page.has_content?("Some filter conditions are defined but not referenced in your filter logic.")
      puts "Validation Error : Some filter conditions are defined but not referenced in your filter logic. is displayed"
    else
      putstr "Validation Error : Some filter conditions are defined but not referenced in your filter logic. is not displayed"
    end
  rescue Exception => ex
    puts "Error while verifying validation message for undefined reference"
    putstr_withScreen  ex.message
  end
end

And(/^I set the "([^"]*)" mapping$/) do |field_name|
  begin
    sleep 5
    arg = getDetails "InstallBaseDataRules"
    fieldPresent = 0
    within all(".pbSubsection")[1] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == field_name
            sleep 5
            fieldPresent = 1
            puts "#{field_name} field found"
            sleep 5
            row.first(:xpath, ".//*[contains(@id, 'rOFDFields')]").find(:xpath, 'option[1]').select_option
            sleep 5
            row.first(:xpath, ".//*[contains(@id, 'FM_DefaultTextField')]").set arg["IBDRMappingOpportunity"]
            sleep 10
            break
          end
        end
      end
    end
    sleep 6
    if fieldPresent > 0
      puts "#{field_name} field set"
    else
      putstr "#{field_name} field was not set"
    end
    sleep 5
    puts "Added #{field_name} Opportunity Field"
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while adding #{field_name} Opportunity Field"
    putstr_withScreen  ex.message
  end
end

And(/^I add multiple criteria and filter logic "([^"]*)"$/) do |filter_logic|
  begin
    sleep 8
    arg = getDetails "InstallBaseDataRules"
    all(:xpath,'//td/input[@value="Add Criteria"]')[0].click
    sleep 5
    all(:xpath,'//td/input[@value="Add Criteria"]')[0].click
    sleep 5
    within all(".pbBody")[1] do
      within(".list") do
        sleep 5
        all(:xpath, ".//*[contains(@id, 'slFieldId')]")[0].select arg["FirstIBDRFieldValue"]
        sleep 5
        all(:xpath, ".//*[contains(@id, 'outOperator')]")[0].select arg["FirstIBDROperator"]
        sleep 5
        all(:xpath, ".//*[contains(@id, 'outValue')]")[0].send_keys [:control, 'a'], :backspace
        sleep 5
        all(:xpath, ".//*[contains(@id, 'outValue')]")[0].send_keys arg["FirstIBDRValue"]
        sleep 5
        all(:xpath, ".//*[contains(@id, 'slFieldId')]")[1].select arg["SecondIBDRFieldValue"]
        sleep 5
        all(:xpath, ".//*[contains(@id, 'outOperator')]")[1].select arg["SecondIBDROperator"]
        sleep 5
        all(:xpath, ".//*[contains(@id, 'outValue')]")[1].send_keys [:control, 'a'], :backspace
        sleep 5
        all(:xpath, ".//*[contains(@id, 'outValue')]")[1].send_keys arg["SecondIBDRValue"]
        sleep 5
        all(:xpath, ".//*[contains(@id, 'slFieldId')]")[2].select arg["ThirdIBDRFieldValue"]
        sleep 5
        all(:xpath, ".//*[contains(@id, 'outOperator')]")[2].select arg["ThirdIBDROperator"]
        sleep 5
        all(:xpath, ".//*[contains(@id, 'outValue')]")[2].send_keys [:control, 'a'], :backspace
        sleep 5
        all(:xpath, ".//*[contains(@id, 'outValue')]")[2].send_keys arg["ThirdIBDRValue"]
        sleep 5
      end
    end
    sleep 5
    within(".pbHeader") do
      click_on 'Save'
    end
    sleep 5
    within all(".pbBody")[1] do
      sleep 8
      filter_data = '//tr/td/span/div/div/div/div[1]/a'
      if "#{all(:xpath,filter_data)[0].text}".to_s == arg["AddFilterLogicIBDRText"].to_s
        sleep 5
        all(:xpath,filter_data)[0].click
        sleep 5
        first(".Opportunity_To_Asset_filterText").send_keys [:control, 'a'], :backspace
        sleep 5
        first(".Opportunity_To_Asset_filterText").set filter_logic
        sleep 5
      else
        sleep 5
        first('.Opportunity_To_Asset_filterText').send_keys [:control, 'a'], :backspace
        sleep 5
        first('.Opportunity_To_Asset_filterText').set filter_logic
        sleep 5
      end
    end
    sleep 6
    within(".pbHeader") do
      click_on 'Save'
    end
    sleep 10
    all(:xpath,'//td/input[@value="Add Criteria"]')[1].click
    sleep 5
    all(:xpath,'//td/input[@value="Add Criteria"]')[1].click
    sleep 5
    within all(".pbBody")[2] do
      within(".list") do
        sleep 5
        all(:xpath, ".//*[contains(@id, 'slFieldId')]")[0].select arg["IBDRProductField"]
        sleep 5
        all(:xpath, ".//*[contains(@id, 'outOperator')]")[0].select arg["IBDRProductOperator"]
        sleep 5
        all(:xpath, ".//*[contains(@id, 'outValue')]")[0].send_keys [:control, 'a'], :backspace
        sleep 5
        all(:xpath, ".//*[contains(@id, 'outValue')]")[0].send_keys arg["IBDRProductValue"]
        sleep 5
      end
    end
    sleep 5
    within(".pbHeader") do
      click_on 'Save'
    end
    sleep 6
    within all(".pbBody")[2] do
      sleep 8
      filter_data = '//tr/td/span/div/div/div/div[1]/a'
      if "#{all(:xpath,filter_data)[1].text}".to_s == arg["AddFilterLogicIBDRText"].to_s
        sleep 5
        all(:xpath,filter_data)[1].click
        sleep 5
        first(".Opportunity_Product_To_Asset_filterText").send_keys [:control, 'a'], :backspace
        sleep 5
        first(".Opportunity_Product_To_Asset_filterText").set filter_logic
        sleep 5
      else
        sleep 5
        first(".Opportunity_Product_To_Asset_filterText").send_keys [:control, 'a'], :backspace
        sleep 5
        first(".Opportunity_Product_To_Asset_filterText").set filter_logic
        sleep 5
      end
    end
    sleep 5
    within(".pbHeader") do
      click_on 'Save'
    end
    sleep 5
    puts "Successfully added the multiple criteria and filter logic"
  rescue Exception => ex
    putstr "Error occurred while adding the multiple criteria and filter logic"
    putstr_withScreen  ex.message
  end
end

And(/^I create a new opportunity$/) do
  begin
    sleep 5
    arg = getDetails "InstallBaseDataRules"
    arg1 = getReference "InstallBaseDataRules"
    within all(".pbSubsection")[0] do
      sleep 4
      all("input[type='text']")[0].set arg["NewIBDROpportunity"]
      sleep 5
      all("input[type='text']")[1].set arg1["IBDRAccountName"]
      sleep 5
      all("input[type='text']")[3].set arg["IBDROpportunityCloseDate"]
      sleep 5
      find("#opp11").select arg["IBDROpportunityStageValue"]
    end
    sleep 5
    within("#topButtonRow") do
      click_on 'Save'
    end
    sleep 6
    puts "Successfully created the opportunity"
  rescue Exception => ex
    putstr "Error occurred while entering the mandatory details in opportunity page"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the created products$/) do
  begin
    within all(".pbBody")[1] do
      sleep 5
      if page.has_xpath?('//table/tbody/tr/th/a')
        puts "Successfully see the products"
        sleep 4
        $first_product_name = all(:xpath,"//table/tbody/tr/th/a")[0].text
        #         sleep 4
        if page.has_xpath?('//table/tbody/tr[1]/th/a')
          $second_product_name = all(:xpath,"//table/tbody/tr/th/a")[1].text
          puts $second_product_name
        end
        puts $first_product_name
        sleep 1
      else
        putstr "Failed to see the products"
      end
    end
    sleep 1
  rescue Exception => ex
    putstr "Error occurred while verifying the created products"
    putstr_withScreen  ex.message
  end
end

And(/^I open the resolved opportunity$/) do
  begin
    sleep 6
    arg = getDetails "InstallBaseDataRules"
    result = false
    all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
      if activity.text == arg["IBDRMappingOpportunity"]
        puts "Successfully see the Resolved Opportunity"
        sleep 4
        activity.click
        puts "Successfully opened the Opportunity"
        sleep 5
        result = true
        break
      end
    end
    putstr "Failed to see the Resolved Opportunity" unless result
    sleep 8
  rescue Exception => ex
    putstr "Error occurred while open the resolved opportunity"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify that opportunity products get generated$/) do
  begin
    sleep 10
    if (all(:xpath,"//table/tbody/tr/th/a")[0].text.to_s == $first_product_name.to_s) || (all(:xpath,"//table/tbody/tr/th/a")[1].text.to_s == $second_product_name.to_s)
      puts "Successfully see the #{$first_product_name} #{$second_product_name} products"
    else
      puts "Failed to see the #{$first_product_name} #{$second_product_name} products"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the opportunity products"
    putstr_withScreen  ex.message
  end
end

And(/^I set the "([^"]*)" mapping for Service Contracts$/) do |field_name|
  begin
    sleep 5
    arg = getDetails "InstallBaseDataRules"
    fieldPresent = 0
    within all(".pbSubsection")[1] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == field_name
            sleep 5
            fieldPresent = 1
            puts "#{field_name} field found"
            sleep 5
            row.first(:xpath, ".//*[contains(@id, 'rOFDFields')]").find(:xpath, 'option[1]').select_option
            sleep 5
            row.first(:xpath, ".//*[contains(@id, 'FM_DefaultTextField')]").set arg["IBDRServiceContractMapping"]
            sleep 10
            break
          end
        end
      end
    end
    sleep 6
    if fieldPresent > 0
      puts "#{field_name} field set"
    else
      putstr "#{field_name} field was not set"
    end
    sleep 5
    puts "Added #{field_name} Opportunity Field"
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while adding #{field_name} Opportunity Field"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the service contract get generated$/) do
  begin
    sleep 5
    arg = getDetails "InstallBaseDataRules"
    sleep 3
    within all(".customnotabBlock")[0] do
      within(".pbBody") do
        sleep 5
        #all("tr")[2].all("td")[9].first("a").send_keys :page_down

        sleep 5
        page.driver.browser.manage.window.maximize
        sleep 5
        service_contract = all("tr")[2].all("td")[9].first("a").text
        puts service_contract
        sleep 5
        if service_contract == arg["IBDRServiceContractMapping"]
          puts "Successfully see the #{service_contract} service contract"
        else
          putstr "Failed to see the #{service_contract} service contract"
        end
        sleep 5
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the service contracts"
    putstr_withScreen  ex.message
  end
end

And(/^I select the products and covered assets$/) do
  begin
    sleep 6
    arg = getDetails "SplitOpportunity"
    arg2 = getReference "InstallBaseDataRules"
    within("#undefined_grid") do
      all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["SingleProductCheckboxIndex"].to_i
          sleep 5
          unless checkbox.checked?
            checkbox.click
            puts "Successfully enabled the the product"
            break
          else
            puts "Product is already enabled"
          end
        else
          # puts "#{index}"
        end
      end
    end
    sleep 5
    within("#undefined_grid") do
      all('input[type=checkbox]').each_with_index do |checkbox , index|
        if index.to_i == arg["MultipleProductCheckboxIndex"].to_i
          sleep 5
          unless checkbox.checked?
            checkbox.click
            puts "Successfully enabled the the product"
            break
          else
            puts "Product is already enabled"
          end
        else
          # puts "#{index}"
        end
      end
    end
    sleep 4
    click_on 'Select'
    puts "Successfully select the product"
    sleep 6
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[3]/input").set arg["ProductQuantity"]
    sleep 5
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[6]/input").set arg["ProductSalesPrice"]
    sleep 5
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[5]/td[10]/span/input").set arg2["IBDRCoveredProduct"]
    sleep 4
    puts "Successfully set the Covered Product"
    sleep 5
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[3]/input").set arg["ProductQuantity"]
   
    sleep 5
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[6]/input").set arg["ProductSalesPrice"]
    puts "2"
    sleep 5
    find(:xpath,"//*[@id='editPage']/table/tbody/tr[9]/td[9]/span/input").set arg2["IBDRCoveredAsset"]
   
    sleep 4
    puts "Successfully set the Covered Asset"
    sleep 5
    
    all(:xpath,'//td/input[@value=" Save "]')[1].click
    
    puts"clicked on the save"
  rescue Exception => ex
    putstr "Error occurred while selecting the product from grid, product quality, sales price, Covered Product and Covered Asset"
    putstr_withScreen  ex.message
  end
end

And(/^I set the "([^"]*)" mapping for Asset$/) do |field_name|
  begin
    sleep 5
    arg = getDetails "InstallBaseDataRules"
    fieldPresent = 0
    within all(".pbSubsection")[1] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == field_name
            sleep 5
            fieldPresent = 1
            puts "#{field_name} field found"
            sleep 5
            first(:xpath, ".//*[contains(@id, 'rOFDFields')]").select arg["IBDRAssetNameMapping"]
            sleep 10
            break
          end
        end
      end
    end
    sleep 6
    if fieldPresent > 0
      puts "#{field_name} field set"
    else
      putstr "#{field_name} field was not set"
    end
    sleep 5
    puts "Added #{field_name} Opportunity Field"
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while adding #{field_name} Opportunity Field"
    putstr_withScreen  ex.message
  end
end

And(/^I verify the covered asset and covered product$/) do
  begin
    sleep 6
    arg = getReference "InstallBaseDataRules"
    within(".opportunityLineItemBlock") do
      within(".pbBody") do
        product = all("tr")[1].all("td")[8].first("a").text
        sleep 5
        asset = all("tr")[2].all("td")[8].first("a").text
        sleep 5
        if product.include? arg["IBDRCoveredProduct"]
          puts "Successfully see the #{product}"
        else
          puts "Failed to see the #{product}"
        end
        sleep 5
        if asset == arg["IBDRCoveredAsset"]
          puts "Successfully see the #{asset}"
        else
          puts "Failed to see the #{asset}"
        end
      end
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the Covered Product and Covered Asset"
    putstr_withScreen  ex.message
  end
end

When(/^I delete the created opportunity$/) do
  begin
    sleep 6
    arg = getDetails "InstallBaseDataRules"
    result = false
    all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
      #if activity.text == arg["NewIBDROpportunity"]
      if activity.text == arg["IBDRMappingOpportunity"]
        #puts "Successfully see the #{arg["NewIBDROpportunity"]} Opportunity"
        puts "Successfully see the #{arg["IBDRMappingOpportunity"]} Opportunity"
        activity.click
        #puts "Successfully opened the #{arg["NewIBDROpportunity"]} Opportunity"
        puts "Successfully opened the #{arg["IBDRMappingOpportunity"]} Opportunity"
        sleep 5
        within("#topButtonRow") do
          click_on 'Delete'
        end
        sleep 6
        page.driver.browser.switch_to.alert.accept
        sleep 5
        #puts "Successfully deleted the #{arg["NewIBDROpportunity"]} Opportunity"
        puts "Successfully deleted the #{arg["IBDRMappingOpportunity"]} Opportunity"
        result = true
        break
      end
    end
    #putstr "Failed to see the #{arg["NewIBDROpportunity"]} Opportunity" unless result
    putstr "Failed to see the #{arg["IBDRMappingOpportunity"]} Opportunity" unless result
    sleep 8
  rescue Exception => ex
    #putstr "Error occurred while deleting the #{arg["NewIBDROpportunity"]} opportunity"
    putstr "Error occurred while deleting the #{arg["IBDRMappingOpportunity"]} opportunity"
    putstr_withScreen  ex.message
  end
end

When(/^I delete the mapping generated opportunity$/) do
  begin
    sleep 6
    arg = getDetails "InstallBaseDataRules"
    result = false
    all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
      if activity.text == arg["IBDRMappingOpportunity"]
        puts "Successfully see the #{arg["IBDRMappingOpportunity"]} Opportunity"
        activity.click
        puts "Successfully opened the #{arg["IBDRMappingOpportunity"]} Opportunity"
        sleep 10
        within all(".pbBody")[3] do
          sleep 10
          puts "Successfully see the sources"
          sleep 5
          begin
            sleep 4
            first("tbody").all(".dataRow")[0].first("td").all("a")[1].click
            sleep 6
            page.driver.browser.switch_to.alert.accept
            sleep 6
            puts "Successfully deleted the source Name"
          rescue
            puts "No source records found"
          end
          sleep 5
          begin
            sleep 8
            first("tbody").all(".dataRow")[0].first("td").all("a")[1].click
            sleep 6
            page.driver.browser.switch_to.alert.accept
            sleep 6
            puts "Successfully deleted the source Name"
          rescue
            puts "No source records found"
          end
          sleep 5
        end
        sleep 8
        within("#topButtonRow") do
          click_on 'Delete'
        end
        sleep 6
        page.driver.browser.switch_to.alert.accept
        sleep 5
        puts "Successfully deleted the #{arg["IBDRMappingOpportunity"]} Opportunity"
        result = true
        break
      end
    end
    putstr "Failed to see the sources and #{arg["IBDRMappingOpportunity"]} Opportunity" unless result
    sleep 8
  rescue Exception => ex
    putstr "Error occurred while deleting the sources and #{arg["IBDRMappingOpportunity"]} opportunity"
    putstr_withScreen  ex.message
  end
end

And(/^I clear the "([^"]*)" mapping$/) do |field_name|
  begin
    sleep 5
    fieldPresent = 0
    within all(".pbSubsection")[1] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == field_name
            sleep 5
            fieldPresent = 1
            puts "#{field_name} field found"
            sleep 5
            first(:xpath, ".//*[contains(@id, 'rOFDFields')]").select field_name
            sleep 10
            break
          end
        end
      end
    end
    sleep 6
    if fieldPresent > 0
      puts "Clear the #{field_name} mapping"
    else
      putstr "Clear the #{field_name} mapping"
    end
    sleep 5
    puts "Clear the #{field_name} Opportunity Field"
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while clearing the #{field_name} Opportunity Field"
    putstr_withScreen  ex.message
  end
end

And(/^I clear the "([^"]*)" mapping for Service Contracts$/) do |field_name|
  begin
    sleep 5
    fieldPresent = 0
    within all(".pbSubsection")[1] do
      within('.list') do
        tr = first("tbody").all("tr")
        tr.each do |row|
          if row.all("td")[2].text == field_name
            sleep 5
            fieldPresent = 1
            puts "#{field_name} field found"
            sleep 5
            #all(:xpath, ".//*[contains(@id, 'rOFDFields')]")[1].select "Name"
            row.first(:xpath, ".//*[contains(@id, 'rOFDFields')]").select "Name"
            sleep 10
            break
          end
        end
      end
    end
    sleep 6
    if fieldPresent > 0
      puts "Clear the #{field_name} mapping"
    else
      putstr "Clear the #{field_name} mapping"
    end
    sleep 5
    puts "Clear the #{field_name} Opportunity Field"
    sleep 10
  rescue Exception => ex
    putstr "Error occurred while clearing #{field_name} Opportunity Field"
    putstr_withScreen  ex.message
  end
end