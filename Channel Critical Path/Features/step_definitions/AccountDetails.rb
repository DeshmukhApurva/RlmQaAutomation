#All Accounts - Account Details specific Step definitions
#All Scenario mentioned in AccountDetails.feature



Then(/^I should able to see the "([^"]*)" page columns$/) do |tab_name|
  begin
    sleep 5
    arg = getDetails "AccountDetailsPage"
    sleep 5
    if page.has_content?(arg["AssetTabField1"])
      puts "Successfully see the #{arg["AssetTabField1"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["AssetTabField1"]} #{tab_name} column"
    end
    sleep 3
    if page.has_content?(arg["AssetTabField2"])
      puts "Successfully see the #{arg["AssetTabField2"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["AssetTabField2"]} #{tab_name} column"
    end
    sleep 3

    if page.has_content?(arg["AssetTabField3"])
      puts "Successfully see the #{arg["AssetTabField3"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["AssetTabField3"]} #{tab_name} column"
    end
    sleep 3

    if page.has_content?(arg["AssetTabField4"])
      puts "Successfully see the #{arg["AssetTabField4"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["AssetTabField4"]} #{tab_name} column"
    end
    sleep 3

    if page.has_content?(arg["AssetTabField5"])
      puts "Successfully see the #{arg["AssetTabField5"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["AssetTabField5"]} #{tab_name} column"
    end
    sleep 3

    if page.has_content?(arg["AssetTabField6"])
      puts "Successfully see the #{arg["AssetTabField6"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["AssetTabField6"]} #{tab_name} column"
    end
    sleep 3
    if page.has_content?(arg["AssetTabField7"])
      puts "Successfully see the #{arg["AssetTabField7"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["AssetTabField7"]} #{tab_name} column"
    end
    sleep 3

    if page.has_content?(arg["AssetTabField8"])
      puts "Successfully see the #{arg["AssetTabField8"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["AssetTabField8"]} #{tab_name} column"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{tab_name} columns"
    putstr_withScreen  ex.message
  end
end


Then(/^I should able to see the "([^"]*)" page fields$/) do |tab_name|
  begin
    sleep 5
    arg = getDetails "AccountDetailsPage"
    sleep 5
    if page.has_content?(arg["ContractsTabField1"])
      puts "Successfully see the #{arg["ContractsTabField1"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["ContractsTabField1"]} #{tab_name} column"
    end
    sleep 3
    if page.has_content?(arg["ContractsTabField2"])
      puts "Successfully see the #{arg["ContractsTabField2"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["ContractsTabField2"]} #{tab_name} column"
    end
    sleep 3

    if page.has_content?(arg["ContractsTabField3"])
      puts "Successfully see the #{arg["ContractsTabField3"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["ContractsTabField3"]} #{tab_name} column"
    end
    sleep 3

    if page.has_content?(arg["ContractsTabField4"])
      puts "Successfully see the #{arg["ContractsTabField4"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["ContractsTabField4"]} #{tab_name} column"
    end
    sleep 3

    if page.has_content?(arg["ContractsTabField5"])
      puts "Successfully see the #{arg["ContractsTabField5"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["ContractsTabField5"]} #{tab_name} column"
    end
    sleep 3

    if page.has_content?(arg["ContractsTabField6"])
      puts "Successfully see the #{arg["ContractsTabField6"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["ContractsTabField6"]} #{tab_name} column"
    end
    sleep 3
    if page.has_content?(arg["ContractsTabField7"])
      puts "Successfully see the #{arg["ContractsTabField7"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["ContractsTabField7"]} #{tab_name} column"
    end
    sleep 3
    if page.has_content?(arg["ContractsTabField8"])
      puts "Successfully see the #{arg["ContractsTabField8"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["ContractsTabField8"]} #{tab_name} column"
    end
    sleep 3
    if page.has_content?(arg["ContractsTabField9"])
      puts "Successfully see the #{arg["ContractsTabField9"]} #{tab_name} column"
    else
      putstr "Failed to see the #{arg["ContractsTabField9"]} #{tab_name} column"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{tab_name} columns"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the the grid scroll up and scroll down and pagination$/) do
  begin
    sleep 5
    arg = getDetails "OpportunityModule"
    sleep 5
    default_pagination_count = find("button[type='button']").text
    if default_pagination_count.to_i == arg["DefaultPaginationValue"].to_i
      puts "Successfully see the default value: #{default_pagination_count}"
    else
      putstr "Failed to see the default value: #{default_pagination_count}"
    end
    sleep 5
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount >= 25
      sleep 5
      all("button[type='button']")[1].send_keys :page_down
      sleep 5
      all("button[type='button']")[1].send_keys :page_up
      sleep 5
    else
      puts "Scroll bar is disabled"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the scroll up and scroll down the page and default pagination value"
    putstr_withScreen  ex.message
  end
end