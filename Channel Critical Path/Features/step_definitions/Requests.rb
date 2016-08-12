#All Requests - Create New Sales Request,Attachments Tab,Details Tab,Notes Tab,Related To,Request Grid,Requests Page Overview - Start New Request action tile specific Step definitions
#All Scenario mentioned in AttachmentsTab.feature,CreateNewSalesRequest.feature,DetailsTab.feature,NotesTab.feature,RelatedTo.feature,StartNewRequestActionTile.feature,RequestGrid.feature,RequestsPage.feature

Then(/^I should be able to see the "([^"]*)" page$/) do |new_request|
  begin
    sleep 5
    arg = getDetails "NewSalesRequest"
    sleep 4
    if page.has_css?(".view-heading-section")
      puts "Successfully navigate to the #{new_request} page"
    else
      putstr "Failed to navigate to the #{new_request} page"
    end
    sleep 5
    if page.has_content?(arg["NewRequestField1"])
      puts "Successfully see the #{arg["NewRequestField1"]} field"
    else
      putstr "Failed to see the #{arg["NewRequestField1"]} field"
    end
    sleep 5
    if page.has_content?(arg["NewRequestField2"])
      puts "Successfully see the #{arg["NewRequestField2"]} field"
    else
      putstr "Failed to see the #{arg["NewRequestField2"]} field"
    end
    sleep 5
    if page.has_content?(arg["NewRequestField3"])
      puts "Successfully see the #{arg["NewRequestField3"]} field"
    else
      putstr "Failed to see the #{arg["NewRequestField3"]} field"
    end
    sleep 5
    if page.has_content?(arg["NewRequestField4"])
      puts "Successfully see the #{arg["NewRequestField4"]} field"
    else
      putstr "Failed to see the #{arg["NewRequestField4"]} field"
    end
    sleep 5
    if page.has_content?(arg["NewRequestField5"])
      puts "Successfully see the #{arg["NewRequestField5"]} field"
    else
      putstr "Failed to see the #{arg["NewRequestField5"]} field"
    end
    sleep 5
    if page.has_content?(arg["NewRequestField6"])
      puts "Successfully see the #{arg["NewRequestField6"]} field"
    else
      putstr "Failed to see the #{arg["NewRequestField6"]} field"
    end
    sleep 5
    if page.has_content?(arg["NewRequestField7"])
      puts "Successfully see the #{arg["NewRequestField7"]} field"
    else
      putstr "Failed to see the #{arg["NewRequestField7"]} field"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while navigating to the #{new_request} page"
    putstr_withScreen  ex.message
  end
end

And(/^I add the "([^"]*)" attachment file$/) do |url|
  begin
    sleep 4
    file_path = "#{Dir.pwd}/#{url}"
    sleep 2
    find(:xpath, ".//div/form/div[7]/div/div").set(file_path)
    # page.attach_file("btn-file-upload", file_path)
    sleep 10
    puts "Successfully attached the file"
  rescue Exception => ex
    putstr "Error occurred while attaching the file"
    putstr_withScreen  ex.message
  end
end

Then(/^I click on Cancel button$/) do
  begin
    arg = getDetails "OpportunitySalesRequest"
    sleep 2
    click_on "Cancel"
    sleep 2
    puts "Successfully clicked on Cancel button"
    if page.has_content?(arg["OOppCancel"])
      sleep 2
      puts "Navigated to Opportunity grid"
    end

  rescue Exception => ex
    putstr "Error occurred while click on Cancel"
    putstr_withScreen  ex.message
  end
end

When(/^I enter subject line "([^"]*)"$/) do |name|
  begin
    sleep 5
    $create_request = "#{name} #{Time.now.strftime('%m%d_%H%M_%S')}"
    sleep 5
    fill_in "subject",:with => $create_request
    sleep 5
    puts "Successfully added the #{$create_request} name"
  rescue Exception => ex
    putstr "Error occurred while entering the subject #{$create_request} name"
    putstr_withScreen  ex.message
  end
end

And(/^I select the Account "([^"]*)" from drop down$/) do |account_name|
  begin
    sleep 3
    within all(".col-xs-8")[1] do
      sleep 5
      find("div[placeholder='Search Accounts...']").click
      sleep 5
      find("input[placeholder='Search Accounts...']").send_keys account_name
      sleep 3
      puts "Successfully see the account field"
      find("input[placeholder='Search Accounts...']").send_keys :enter
      sleep 5
      puts "Successfully enter the #{account_name} name"
    end
  rescue Exception => ex
    putstr "Error occurred while "
    putstr_withScreen  ex.message
  end
end

Then(/^I should be able to see autopupulated account$/) do
  begin
    sleep 3
    within all(".col-xs-8")[1] do
      sleep 5
      $reqaccount=find(:xpath, '//div[2]/div/div/div/span/span[2]').text
      puts "#{$reqaccount}"
    end
    if  $oppgridpartneraccount == $reqaccount
      puts "Account Name  #{$oppgridpartneraccount} displaying on opp grid matching with the account name #{$reqaccount} displaying on request page "
    end
  end
end

Then(/^I should be able to see autopupulated opportunity name$/) do
  begin
    sleep 3
    within all(".col-xs-8")[1] do
      sleep 5
      reqopportunity=first(:xpath, '//div[3]/div/div/div/span/span[2]/span').text

      puts "#{reqopportunity}"
    end
    within all(".col-xs-8")[1] do
      sleep 5
      $reqopportunityname=first(:xpath, '//div[2]/div/div/span/span[2]/span').text
      puts "#{$reqopportunityname}"
      if  $oppgridoppname == $reqopportunityname
        puts "Opportunity Name  #{$oppgridoppname} displaying on opp grid matching with the opportunity name #{$reqopportunityname} displaying on request page "
      end
    end
  rescue Exception => ex
    putstr "Opportunity name is NOT autopopulate"
    putstr_withScreen  ex.message
  end
end
And(/^I select the Related To "([^"]*)" and "([^"]*)" from drop down$/) do |opportunity, opportunity_name|
  begin
    sleep 3
    arg = getDetails "NewSalesRequest"
    sleep 5
    # Select Search Quote...
    find("div[placeholder='Select...']").click
    sleep 4
    find("input[placeholder='Select...']").send_keys arg["RelatedToSelectField1"]
    sleep 3
    puts "Successfully see the #{arg["RelatedToSelectField1"]} field"
    find("input[placeholder='Select...']").send_keys :enter
    sleep 5
    puts "Successfully selected the #{arg["RelatedToSelectField1"]} field value"
    find("div[placeholder='Search Quote...']").click
    sleep 4
    find("input[placeholder='Search Quote...']").send_keys [:control, 'a'], :backspace
    sleep 3
    find("input[placeholder='Search Quote...']").send_keys arg["RelatedToSelectRelatedField1"]
    sleep 3
    find("input[placeholder='Search Quote...']").send_keys :enter
    sleep 5
    puts "Successfully enter the #{arg["RelatedToSelectRelatedField1"]} name"

    # Select Search Asset...
    sleep 8
    find("div[placeholder='Select...']").click
    sleep 4
    find("input[placeholder='Select...']").send_keys arg["RelatedToSelectField2"]
    puts "Successfully see the #{arg["RelatedToSelectField2"]} field"
    sleep 3
    find("input[placeholder='Select...']").send_keys :enter
    puts "Successfully selected the #{arg["RelatedToSelectField2"]} field value"
    sleep 5
    find("div[placeholder='Search Asset...']").click
    sleep 4
    find("input[placeholder='Search Asset...']").send_keys [:control, 'a'], :backspace
    sleep 3
    find("input[placeholder='Search Asset...']").send_keys arg["RelatedToSelectRelatedField2"]
    sleep 3
    find("input[placeholder='Search Asset...']").send_keys :enter
    sleep 5
    puts "Successfully enter the #{arg["RelatedToSelectRelatedField2"]} name"

    # Select Search Service Contract...
    sleep 8
    find("div[placeholder='Select...']").click
    sleep 4
    find("input[placeholder='Select...']").send_keys arg["RelatedToSelectField3"]
    puts "Successfully see the #{arg["RelatedToSelectField3"]} field"
    sleep 3
    find("input[placeholder='Select...']").send_keys :enter
    puts "Successfully selected the #{arg["RelatedToSelectField3"]} field value"
    sleep 5
    find("div[placeholder='Search Service Contract...']").click
    sleep 4
    find("input[placeholder='Search Service Contract...']").send_keys [:control, 'a'], :backspace
    sleep 3
    find("input[placeholder='Search Service Contract...']").send_keys arg["RelatedToSelectRelatedField3"]
    sleep 3
    find("input[placeholder='Search Service Contract...']").send_keys :enter
    sleep 5
    puts "Successfully enter the #{arg["RelatedToSelectRelatedField3"]} name"

    # Select Search Opportunity...
    sleep 8
    find("div[placeholder='Select...']").click
    sleep 4
    find("input[placeholder='Select...']").send_keys opportunity
    puts "Successfully see the #{opportunity} field"
    sleep 3
    find("input[placeholder='Select...']").send_keys :enter
    puts "Successfully selected the #{opportunity} field value"
    sleep 5
    find("div[placeholder='Search Opportunity...']").click
    sleep 4
    find("input[placeholder='Search Opportunity...']").send_keys [:control, 'a'], :backspace
    sleep 3
    find("input[placeholder='Search Opportunity...']").send_keys opportunity_name
    sleep 3
    find("input[placeholder='Search Opportunity...']").send_keys :enter
    sleep 5
    puts "Successfully enter the #{opportunity_name} name"
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while selecting the Related To #{opportunity},#{arg["RelatedToSelectField1"]},#{arg["RelatedToSelectField2"]} and #{arg["RelatedToSelectField3"]} field values"
    putstr_withScreen  ex.message
  end
end

And(/^I select the Related To Quote from drop down$/) do
  begin
    sleep 3
    arg = getDetails "OpportunitySalesRequest"
    sleep 5
    # Select Search Quote...
    find("div[placeholder='Select...']").click
    sleep 4
    find("input[placeholder='Select...']").send_keys arg["OppRelatedToSelectField1"]
    sleep 3
    puts "Successfully see the #{arg["OppRelatedToSelectField1"]} field"
    find("input[placeholder='Select...']").send_keys :enter
    sleep 5
    puts "Successfully selected the #{arg["OppRelatedToSelectField1"]} field value"
    find("div[placeholder='Search...']").click
    sleep 4
    find("input[placeholder='Search...']").send_keys [:control, 'a'], :backspace
    sleep 3
    find("input[placeholder='Search...']").send_keys arg["OppRelatedToSelectRelatedField1"]
    sleep 3
    find("input[placeholder='Search...']").send_keys :enter
    sleep 5
    puts "Successfully enter the #{arg["OppRelatedToSelectRelatedField1"]} name"
  end
end
And(/^I select the Related To Asset from drop down$/) do
  begin
    sleep 3
    arg = getDetails "OpportunitySalesRequest"
    sleep 5
    # Select Search Asset...
    find("div[placeholder='Select...']").click
    sleep 4
    find("input[placeholder='Select...']").send_keys arg["OppRelatedToSelectField2"]
    sleep 3
    puts "Successfully see the #{arg["OppRelatedToSelectField2"]} field"
    find("input[placeholder='Select...']").send_keys :enter
    sleep 5
    puts "Successfully selected the #{arg["OppRelatedToSelectField2"]} field value"
    find("div[placeholder='Search...']").click
    sleep 4
    find("input[placeholder='Search...']").send_keys [:control, 'a'], :backspace
    sleep 3
    find("input[placeholder='Search...']").send_keys arg["OppRelatedToSelectRelatedField2"]
    sleep 3
    find("input[placeholder='Search...']").send_keys :enter
    sleep 5
    puts "Successfully enter the #{arg["OppRelatedToSelectRelatedField2"]} name"
  end
end
And(/^I select the Related To Service Contract from drop down$/) do
  begin
    sleep 3
    arg = getDetails "OpportunitySalesRequest"
    sleep 5
    # Select Search Service Contract...
    find("div[placeholder='Select...']").click
    sleep 4
    find("input[placeholder='Select...']").send_keys arg["OppRelatedToSelectField3"]
    sleep 3
    puts "Successfully see the #{arg["OppRelatedToSelectField3"]} field"
    find("input[placeholder='Select...']").send_keys :enter
    sleep 5
    puts "Successfully selected the #{arg["OppRelatedToSelectField3"]} field value"
    find("div[placeholder='Search...']").click
    sleep 4
    find("input[placeholder='Search...']").send_keys [:control, 'a'], :backspace
    sleep 3
    find("input[placeholder='Search...']").send_keys arg["OppRelatedToSelectRelatedField3"]
    sleep 3
    find("input[placeholder='Search...']").send_keys :enter
    sleep 5
    puts "Successfully enter the #{arg["OppRelatedToSelectRelatedField3"]} name"
  end
end
And(/^I select the Related To Opportunity from drop down$/) do
  begin
    sleep 3
    arg = getDetails "OpportunitySalesRequest"
    sleep 5
    # Select Search Opportunity...
    find("div[placeholder='Select...']").click
    sleep 4
    find("input[placeholder='Select...']").send_keys arg["OppRelatedToSelectField4"]
    sleep 3
    puts "Successfully see the #{arg["OppRelatedToSelectField4"]} field"
    find("input[placeholder='Select...']").send_keys :enter
    sleep 5
    puts "Successfully selected the #{arg["OppRelatedToSelectField4"]} field value"
    find("div[placeholder='Search...']").click
    sleep 4
    find("input[placeholder='Search...']").send_keys [:control, 'a'], :backspace
    sleep 3
    find("input[placeholder='Search...']").send_keys arg["OppRelatedToSelectRelatedField4"]
    sleep 3
    find("input[placeholder='Search...']").send_keys :enter
    sleep 5
    puts "Successfully enter the #{arg["OppRelatedToSelectRelatedField4"]} name"
  end
end

And(/^I select the opportunity-quote Request Type "([^"]*)" from drop down$/) do |arg|
  begin
    # Select Request Type...
    sleep 5
    find("div[placeholder='Select Request Type...']").click
    sleep 5
    find("input[placeholder='Select Request Type...']").send_keys arg
    sleep 5
    puts "Successfully see the #{arg} field"
    find("input[placeholder='Select Request Type...']").send_keys :enter
    sleep 8
    puts "Successfully selected the #{arg} field value"

  end
end

And(/^I select the Request Type "([^"]*)" from drop down$/) do |type|
  begin
    sleep 3
    arg = getDetails "NewSalesRequest"
    # Select Request Type...
    sleep 5
    find("div[placeholder='Select Request Type...']").click
    sleep 5
    find("input[placeholder='Select Request Type...']").send_keys arg["SelectRequestTypeField1"]
    sleep 5
    puts "Successfully see the #{arg["SelectRequestTypeField1"]} field"
    find("input[placeholder='Select Request Type...']").send_keys :enter
    sleep 8
    puts "Successfully selected the #{arg["SelectRequestTypeField1"]} field value"

    find("div[placeholder='Select Request Type...']").click
    sleep 5
    find("input[placeholder='Select Request Type...']").send_keys arg["SelectRequestTypeField2"]
    sleep 5
    puts "Successfully see the #{arg["SelectRequestTypeField2"]} field"
    find("input[placeholder='Select Request Type...']").send_keys :enter
    sleep 8
    puts "Successfully selected the #{arg["SelectRequestTypeField2"]} field value"

    # Select Request Type...
    find("div[placeholder='Select Request Type...']").click
    sleep 5
    find("input[placeholder='Select Request Type...']").send_keys arg["SelectRequestTypeField3"]
    sleep 5
    puts "Successfully see the #{arg["SelectRequestTypeField3"]} field"
    find("input[placeholder='Select Request Type...']").send_keys :enter
    sleep 8
    puts "Successfully selected the #{arg["SelectRequestTypeField3"]} field value"

    # Select Request Type...
    find("div[placeholder='Select Request Type...']").click
    sleep 5
    find("input[placeholder='Select Request Type...']").send_keys type
    sleep 5
    puts "Successfully see the #{type} field"
    find("input[placeholder='Select Request Type...']").send_keys :enter
    sleep 8
    puts "Successfully selected the #{type} field value"
  rescue Exception => ex
    putstr "Error occurred while selecting the request type #{arg["SelectRequestTypeField1"]},#{arg["SelectRequestTypeField2"]},#{arg["SelectRequestTypeField3"]} and #{type} field values"
    putstr_withScreen  ex.message
  end
end

And(/^I select the opportunity-request-Priority "([^"]*)" from drop down$/) do |arg|
  begin
    find("div[placeholder='Select Priority...']").click
    sleep 5
    find("input[placeholder='Select Priority...']").send_keys arg
    sleep 5
    puts "Successfully see the #{arg} field"
    find("input[placeholder='Select Priority...']").send_keys :enter
    sleep 5
    puts "Successfully selected the #{arg} field value"
  end
end

When(/^I select the Priority "([^"]*)" from drop down$/) do |priority|
  begin
    sleep 3
    arg = getDetails "NewSalesRequest"

    # Select Priority "High"...
    find("div[placeholder='Select Priority...']").click
    sleep 5
    find("input[placeholder='Select Priority...']").send_keys priority
    sleep 5
    puts "Successfully see the #{priority} field"
    find("input[placeholder='Select Priority...']").send_keys :enter
    sleep 5
    puts "Successfully selected the #{priority} field value"

    # Select Priority "Medium"...
    sleep 5
    find("div[placeholder='Select Priority...']").click
    sleep 5
    find("input[placeholder='Select Priority...']").send_keys arg["SelectPriorityField1"]
    sleep 5
    puts "Successfully see the #{arg["SelectPriorityField1"]} field"
    find("input[placeholder='Select Priority...']").send_keys :enter
    sleep 5
    puts "Successfully selected the #{arg["SelectPriorityField1"]} field value"

    # Select Priority "Low"...
    sleep 5
    find("div[placeholder='Select Priority...']").click
    sleep 5
    find("input[placeholder='Select Priority...']").send_keys arg["SelectPriorityField2"]
    sleep 5
    puts "Successfully see the #{arg["SelectPriorityField2"]} field"
    find("input[placeholder='Select Priority...']").send_keys :enter
    sleep 5
    puts "Successfully selected the #{arg["SelectPriorityField2"]} field value"

  rescue Exception => ex
    putstr "Error occurred while selecting the Priority #{priority},#{arg["SelectPriorityField1"]} and #{arg["SelectPriorityField2"]} field values"
    putstr_withScreen  ex.message
  end
end

And(/^I add the "([^"]*)" message$/) do |message|
  begin
    sleep 5
    within all(".col-xs-8")[4] do
      sleep 5
      first("textarea").send_keys message
    end
    sleep 5
    puts "Successfully added the #{message} message"
  rescue Exception => ex
    putstr "Error occurred while adding the #{message} message"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the "([^"]*)" fields$/) do |grid|
  begin
    sleep 5
    arg = getDetails "RequestGrid"
    sleep 4
    within all(".ui-grid-header-cell-row")[1] do
      request_type = all(".ui-grid-header-cell-label")[0].text
      if request_type == arg["RenewalSalesRequestGridField1"]
        puts "Successfully see the #{request_type} request grid name"
      else
        putstr "Failed to see the #{request_type} request grid name"
      end
      sleep 3
      request_number = all(".ui-grid-header-cell-label")[1].text
      if request_number == arg["RenewalSalesRequestGridField2"]
        puts "Successfully see the #{request_number} request grid name"
      else
        putstr "Failed to see the #{request_number} request grid name"
      end
      sleep 3
      account = all(".ui-grid-header-cell-label")[2].text
      if account == arg["RenewalSalesRequestGridField3"]
        puts "Successfully see the #{account} request grid name"
      else
        putstr "Failed to see the #{account} request grid name"
      end
      sleep 3
      status = all(".ui-grid-header-cell-label")[3].text
      if status == arg["RenewalSalesRequestGridField4"]
        puts "Successfully see the #{status} request grid name"
      else
        putstr "Failed to see the #{status} request grid name"
      end
      sleep 3
      date_opened = all(".ui-grid-header-cell-label")[4].text
      if date_opened == arg["RenewalSalesRequestGridField5"]
        puts "Successfully see the #{date_opened} request grid name"
      else
        putstr "Failed to see the #{date_opened} request grid name"
      end
      sleep 3
      date_closed = all(".ui-grid-header-cell-label")[5].text
      if date_closed == arg["RenewalSalesRequestGridField6"]
        puts "Successfully see the #{date_closed} request grid name"
      else
        putstr "Failed to see the #{date_closed} request grid name"
      end
      sleep 3
      from = all(".ui-grid-header-cell-label")[6].text
      if from == arg["RenewalSalesRequestGridField7"]
        puts "Successfully see the #{from} request grid name"
      else
        putstr "Failed to see the #{from} request grid name"
      end
      sleep 3
      description = all(".ui-grid-header-cell-label")[7].text
      if description == arg["RenewalSalesRequestGridField8"]
        puts "Successfully see the #{description} request grid name"
      else
        putstr "Failed to see the #{description} request grid name"
      end
      sleep 3
      subject = all(".ui-grid-header-cell-label")[8].text
      if subject == arg["RenewalSalesRequestGridField9"]
        puts "Successfully see the #{subject} request grid name"
      else
        putstr "Failed to see the #{subject} request grid name"
      end
      sleep 3
      related_to = all(".ui-grid-header-cell-label")[9].text
      if related_to == arg["RenewalSalesRequestGridField10"]
        puts "Successfully see the #{related_to} request grid name"
      else
        putstr "Failed to see the #{related_to} request grid name"
      end
      sleep 5
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{grid} columns"
    putstr_withScreen  ex.message
  end
end

When(/^I click on the "([^"]*)" menu button$/) do |menu|
  begin
    sleep 5
    if page.has_css?(".ui-grid-header-cell-row")
      sleep 4
      find(".ui-grid-icon-menu").click
      sleep 5
      puts "Successfully clicked the #{menu} button"
    else
      putstr "Tab is not loading"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{menu} button"
    putstr_withScreen  ex.message
  end
end

And(/^I uncheck the "([^"]*)" fields$/) do |grid|
  begin
    sleep 5
    i = 0
    if page.has_css?(".ui-grid-icon-ok")
      all(".ui-grid-icon-ok").each do |icon|
        i = i+1
        sleep 4
        icon.click
        sleep 4
        if i == 10
          break
        end
      end
      sleep 5
      puts "Successfully uncheck the #{grid} fields"
      sleep 5
    else
      putstr "Failed to see the #{grid} ok fields"
    end
    sleep 5
    find(".ui-grid-icon-menu").click
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while un-checking the #{grid} fields"
    putstr_withScreen  ex.message
  end
end

Then(/^I should not able to see the "([^"]*)" fields$/) do |grid|
  begin
    sleep 5
    arg = getDetails "RequestGrid"
    sleep 4
    unless page.has_content?(arg["RenewalSalesRequestGridField1"])
      puts "Unable to see the #{arg["RenewalSalesRequestGridField1"]} request grid name"
    else
      putstr "Able see the #{arg["RenewalSalesRequestGridField1"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["RenewalSalesRequestGridField2"])
      puts "Unable to see the #{arg["RenewalSalesRequestGridField2"]} request grid name"
    else
      putstr "Able see the #{arg["RenewalSalesRequestGridField2"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["RenewalSalesRequestGridField4"])
      puts "Unable to see the #{arg["RenewalSalesRequestGridField4"]} request grid name"
    else
      putstr "Able see the #{arg["RenewalSalesRequestGridField4"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["RenewalSalesRequestGridField5"])
      puts "Unable to see the #{arg["RenewalSalesRequestGridField5"]} request grid name"
    else
      putstr "Able see the #{arg["RenewalSalesRequestGridField5"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["RenewalSalesRequestGridField6"])
      puts "Unable to see the #{arg["RenewalSalesRequestGridField6"]} request grid name"
    else
      putstr "Able see the #{arg["RenewalSalesRequestGridField6"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["RenewalSalesRequestGridField7"])
      puts "Unable to see the #{arg["RenewalSalesRequestGridField7"]} request grid name"
    else
      putstr "Able see the #{arg["RenewalSalesRequestGridField7"]} request grid name"
    end
    sleep 3
    unless page.has_content?(arg["RenewalSalesRequestGridField8"])
      puts "Unable to see the #{arg["RenewalSalesRequestGridField8"]} request grid name"
    else
      putstr "Able see the #{arg["RenewalSalesRequestGridField8"]} request grid name"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{grid} names"
    putstr_withScreen  ex.message
  end
end

When(/^I click on the "([^"]*)" field$/) do |field|
  begin
    sleep 5
    if page.has_css?(".ui-grid-header-cell-row")
      sleep 4
      all("button[type='button']")[2].click
      sleep 5
      puts "Successfully click the #{field} field"
    else
      puts "No Opportunity fields Found"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{field} field"
    putstr_withScreen  ex.message
  end
end

And(/^I search with account "([^"]*)" name$/) do |account_name|
  begin
    sleep 4
    find("input[placeholder='Search Requests...']").send_keys [:control, 'a'], :backspace
    sleep 3
    find("input[placeholder='Search Requests...']").send_keys account_name
    sleep 3
    find("input[placeholder='Search Requests...']").send_keys :enter
    sleep 4
    puts "Successfully enter the #{account_name} name"
    sleep 5
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      within all(".ui-grid-canvas")[1] do
        within all("div[role='gridcell']")[2] do
          search_data = first("div").text
          if search_data == account_name
            puts "Successfully see the search #{account_name} results"
          else
            putstr "Failed to see the search #{account_name} results"
          end
        end
      end
    else
      puts "No Request Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while searching and verifying the #{account_name} results"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the created "([^"]*)" request$/) do |request|
  begin
    sleep 12
    find("input[placeholder='Search Requests...']").send_keys [:control, 'a'], :backspace
    sleep 3
    find("input[placeholder='Search Requests...']").send_keys $create_request
    sleep 3
    find("input[placeholder='Search Requests...']").send_keys :enter
    sleep 4
    puts "Successfully search the #{$create_request} request"
    sleep 6
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 5
      result = false
      all(:xpath, '//div[2]/div/div/div/div[9]/div').each do |create_request|
        if create_request.text == $create_request
          puts "Successfully see the created #{$create_request} new request"
          result = true
          break
        end
      end
      putstr "Failed to see the created #{$create_request} new request" unless result
    else
      puts "No Request Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{request} new request"
    putstr_withScreen  ex.message
  end
end

When(/^user sorts by "([^"]*)" in "([^"]*)" order$/) do |sort_parameter, sort_order|
  begin
    sleep 5
    if page.has_css?(".ui-grid-header-cell-row")
      sleep 4
      all(".ui-grid-icon-angle-down")[8].click
      sleep 5
      all("button[ng-focus='focus=true']")[1].click
      sleep 4
      puts "Changing order to: #{sort_order}"
    else
      puts "No Request Records Found"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the sorted by #{sort_parameter} in #{sort_order} order"
    putstr_withScreen  ex.message
  end
end

Then(/^files should be sorted by "([^"]*)" in "([^"]*)" order$/) do |sort_parameter, sort_order|
  begin
    sleep 3
    arg = getDetails "RequestGrid"
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 5
      all_files = all(:xpath, '//div[2]/div/div[position() <= 6]/div/div[9]/div').collect(&:text)
      sleep 6
      # within all(".ui-grid-header-cell-row")[1] do
      all(".ui-grid-icon-angle-down")[8].click
      # end
      sleep 5
      ascending_order = find(".ui-grid-menu-item-active").text
      sleep 5
      if ascending_order == arg["SortAscendingOrder"]

        puts "Verifying ascending order selection"

        original_array = all_files
        all_files = all_files.map(&:downcase)

        sorted_array = all_files.sort_by { |f| f.class == Array ? f.first : f }
        original_array = original_array.map(&:downcase)

        puts "Application Sorting Result: #{original_array}"
        puts "Internal Sorting Result: #{sorted_array} "
        sleep 5
      else
        puts "Verifying descending order selection"

        original_array = all_files
        all_files = all_files.map(&:downcase)

        sorted_array = all_files.sort_by { |f| f.class == Array ? f.first : f }
        sorted_array = sorted_array.reverse!

        original_array = original_array.map(&:downcase)

        puts "Application Sorting Result: #{original_array}"
        puts "Internal Sorting Result: #{sorted_array}"
        sleep 5
      end
    else
      puts "No Request Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the sorted by #{sort_parameter} in #{sort_order} order"
    putstr_withScreen  ex.message
  end
end

When(/^user sorts by "([^"]*)" in "([^"]*)" sort order$/) do |sort_parameter, sort_order|
  begin
    sleep 5
    if page.has_css?(".ui-grid-header-cell-row")
      sleep 4
      #within all(".ui-grid-header-cell-row")[1] do
      all(".ui-grid-icon-angle-down")[8].click
      #end
      sleep 5
      all("button[ng-focus='focus=true']")[2].click
      sleep 4
      puts "Changing order to: #{sort_order}"
    else
      puts "No Request Records Found"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the sorted by #{sort_parameter} in #{sort_order} order"
    putstr_withScreen  ex.message
  end
end

Then(/^files should be sorted by "([^"]*)" in "([^"]*)" sort order$/) do |sort_parameter, sort_order|
  begin
    sleep 3
    arg = getDetails "RequestGrid"
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 5
      all_files = all(:xpath, '//div[2]/div/div[position() <= 6]/div/div[9]/div').collect(&:text)
      sleep 6
      # within all(".ui-grid-header-cell-row")[1] do
      all(".ui-grid-icon-angle-down")[8].click
      # end
      sleep 5
      descending_order = find(".ui-grid-menu-item-active").text
      sleep 5
      if descending_order == arg["SortDescendingOrder"]

        puts "Verifying descending order selection"

        original_array = all_files
        all_files = all_files.map(&:downcase)

        sorted_array = all_files.sort_by { |f| f.class == Array ? f.first : f }
        original_array = original_array.map(&:downcase)

        puts "Application Sorting Result: #{original_array}"
        puts "Internal Sorting Result: #{sorted_array} "
        sleep 5
      else
        puts "Verifying ascending order selection"

        original_array = all_files
        all_files = all_files.map(&:downcase)

        sorted_array = all_files.sort_by { |f| f.class == Array ? f.first : f }
        sorted_array = sorted_array.reverse!

        original_array = original_array.map(&:downcase)

        puts "Application Sorting Result: #{original_array}"
        puts "Internal Sorting Result: #{sorted_array}"
        sleep 5
      end
    else
      puts "No Request Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the sorted by #{sort_parameter} in #{sort_order} order"
    putstr_withScreen  ex.message
  end
end

When(/^I click on "([^"]*)" new tile$/) do |action_tile|
  begin
    sleep 5
    find("div[ng-click='newRequest();']").click
    sleep 5
    puts "Successfully clicked the #{action_tile} action tile"
  rescue Exception => ex
    putstr "Error occurred while clicking the #{action_tile} action tile"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" link$/) do |request|
  begin
    sleep 10
    if page.has_css?(".view-heading-section")
      sleep 10
      within(".data-table.ng-scope") do
        $partner_opportunity = first("a").text
        puts $partner_opportunity
        if page.has_link?($partner_opportunity)
          puts "Successfully see the #{$partner_opportunity} link"
        else
          putstr "Failed see the #{$partner_opportunity} link"
        end
      end
    else
      putstr "Failed to see the #{request} details page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the request details page fields"
    putstr_withScreen  ex.message
  end
end

When(/^I click on the "([^"]*)" opportunity link$/) do |related_to|
  begin
    sleep 5
    if page.has_css?(".view-heading-section")
      sleep 5
      within(".data-table.ng-scope") do
        sleep 3
        first("a").click
        sleep 5
      end
      sleep 3
      if page.has_content?("Renewals")
        puts "Successfully navigate to the Partner Opportunity page"
        sleep 3
        if page.has_content?($partner_opportunity)
          puts "Successfully see the #{$partner_opportunity}"
        else
          putstr "Failed to see the #{$partner_opportunity}"
        end
      else
        putstr "Failed to navigate to the Partner Opportunity page"
      end
    else
      putstr "Failed to see the #{related_to} details page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" opportunity details$/) do |related_to|
  begin
    sleep 5
    arg = getDetails "ContactsOpportunitySubTab"
    sleep 4
    if page.has_css?(".view-heading-section")
      sleep 5
      click_on 'Contacts'
      sleep 5
      if page.has_content?(arg["ContactsOpportunityField1"])
        puts "Successfully see the #{arg["ContactsOpportunityField1"]} field"
      else
        putstr "Failed to see the see the #{arg["ContactsOpportunityField1"]} field"
      end
      sleep 3
      if page.has_content?(arg["ContactsOpportunityField2"])
        puts "Successfully see the #{arg["ContactsOpportunityField2"]} field"
      else
        putstr "Failed to see the see the #{arg["ContactsOpportunityField2"]} field"
      end
      sleep 5
    else
      putstr "Failed to see the #{related_to} Opportunity details page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while"
    putstr_withScreen  ex.message
  end
end

And(/^I click on the "([^"]*)" link$/) do |request|
  begin
    expect(page).to have_content 'Request Number'
    if page.has_css?(".ui-grid-icon-ok")
      rowcountCheckbox = all(".ui-grid-selection-row-header-buttons.ui-grid-icon-ok.ng-scope").count
      puts "true"
    end

    puts rowcountCheckbox

    if rowcountCheckbox > 0
      sleep 3
      within all(".ui-grid-canvas")[1] do
        page.within all("div[role='gridcell']")[1] do
          sleep 5
          request_number = first("div").first("a").text
          puts request_number
          puts "grid canvas 2 block"
          first("div").first("a").click
        end
      end
      sleep 5
      puts "Successfully open the #{request} details page"
    else
      within all(".ui-grid-canvas")[0] do
        page.within all("div[role='gridcell']")[1] do
          sleep 5
          request_number = first("div").first("a").text
          puts request_number
          puts "grid canvas 1 block"
          first("div").first("a").click
        end
      end
      sleep 5
      puts "Successfully open the #{request} details page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while clicking the #{request} link"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" fields$/) do |request|
  begin
    sleep 5
    arg = getDetails "RequestDetailsPage"
    sleep 3
    if page.has_css?(".view-heading-section")
      sleep 5
      if page.has_content?(arg["RequestDeatilsField1"])
        puts "Successfully see the #{arg["RequestDeatilsField1"]} request details field"
      else
        putstr "Failed to see the #{arg["RequestDeatilsField1"]} request details field"
      end
      sleep 3
      if page.has_content?(arg["RequestDeatilsField2"])
        puts "Successfully see the #{arg["RequestDeatilsField2"]} request details field"
      else
        putstr "Failed to see the #{arg["RequestDeatilsField2"]} request details field"
      end
      sleep 3

      if page.has_content?(arg["RequestDeatilsField3"])
        puts "Successfully see the #{arg["RequestDeatilsField3"]} request details field"
      else
        putstr "Failed to see the #{arg["RequestDeatilsField3"]} request details field"
      end
      sleep 3

      if page.has_content?(arg["RequestDeatilsField4"])
        puts "Successfully see the #{arg["RequestDeatilsField4"]} request details field"
      else
        putstr "Failed to see the #{arg["RequestDeatilsField4"]} request details field"
      end
      sleep 3

      if page.has_content?(arg["RequestDeatilsField5"])
        puts "Successfully see the #{arg["RequestDeatilsField5"]} request details field"
      else
        putstr "Failed to see the #{arg["RequestDeatilsField5"]} request details field"
      end
      sleep 3

      if page.has_content?(arg["RequestDeatilsField6"])
        puts "Successfully see the #{arg["RequestDeatilsField6"]} request details field"
      else
        putstr "Failed to see the #{arg["RequestDeatilsField6"]} request details field"
      end
      sleep 3
      if page.has_content?(arg["RequestDeatilsField7"])
        puts "Successfully see the #{arg["RequestDeatilsField7"]} request details field"
      else
        putstr "Failed to see the #{arg["RequestDeatilsField7"]} request details field"
      end
      sleep 3
      if page.has_content?(arg["RequestDeatilsField8"])
        puts "Successfully see the #{arg["RequestDeatilsField8"]} request details field"
      else
        putstr "Failed to see the #{arg["RequestDeatilsField8"]} request details field"
      end
      sleep 3
      if page.has_content?(arg["RequestDeatilsField9"])
        puts "Successfully see the #{arg["RequestDeatilsField9"]} request details field"
      else
        putstr "Failed to see the #{arg["RequestDeatilsField9"]} request details field"
      end
      sleep 3
      if page.has_content?(arg["RequestDeatilsField10"])
        puts "Successfully see the #{arg["RequestDeatilsField10"]} request details field"
      else
        putstr "Failed to see the #{arg["RequestDeatilsField10"]} request details field"
      end
      sleep 3
      if page.has_content?(arg["RequestDeatilsField11"])
        puts "Successfully see the #{arg["RequestDeatilsField11"]} request details field"
      else
        putstr "Failed to see the #{arg["RequestDeatilsField11"]} request details field"
      end
      sleep 5
    else
      putstr "Failed to see the #{request} details page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the request details page fields"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" columns$/) do |attachment_tab|
  begin
    sleep 5
    arg = getDetails "RequestDetailsPage"
    sleep 3
    if page.has_css?(".view-heading-section")
      sleep 5
      if page.has_content?(arg["AttachmentPageField1"])
        puts "Successfully see the #{arg["AttachmentPageField1"]} request details field"
      else
        putstr "Failed to see the #{arg["AttachmentPageField1"]} request details field"
      end
      sleep 3
      if page.has_content?(arg["AttachmentPageField2"])
        puts "Successfully see the #{arg["AttachmentPageField2"]} request details field"
      else
        putstr "Failed to see the #{arg["AttachmentPageField2"]} request details field"
      end
      sleep 3

      if page.has_content?(arg["AttachmentPageField3"])
        puts "Successfully see the #{arg["AttachmentPageField3"]} request details field"
      else
        putstr "Failed to see the #{arg["AttachmentPageField3"]} request details field"
      end
      sleep 5
    else
      putstr "Failed to see the #{attachment_tab} details page"
    end
    sleep 3
    if page.has_button?(arg["AttachFileText"])
      puts "Successfully see the #{arg["AttachFileText"]} button"
    else
      putstr "Failed to see the #{arg["AttachFileText"]} button"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{attachment_tab} page fields"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" details page fields$/) do |notes|
  begin
    sleep 5
    arg = getDetails "RequestDetailsPage"
    sleep 3
    if page.has_css?(".clearfix.ng-scope")
      puts "Successfully see the #{notes} page"
      sleep 3
      if page.has_css?(".clearfix.ng-scope")
        sleep 5
        puts "Successfully see the #{notes} text box"
      else
        putstr "Failed to see the #{notes} text box"
      end
      sleep 5
      if page.has_content?(arg["NotesSendText"])
        puts "Successfully see the #{notes} #{arg["NotesSendText"]} button field"
      else
        putstr "Failed to see the #{notes} #{arg["NotesSendText"]} button field"
      end
      sleep 3
      if page.has_button?(arg["NotesSendText"])
        puts "Successfully see the #{arg["NotesSendText"]} button"
      else
        putstr "Failed to see the #{arg["NotesSendText"]} button"
      end
      sleep 5
    else
      putstr "Failed to see the #{notes} page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{notes} fields"
    putstr_withScreen  ex.message
  end
end

When(/^I add the new note from "([^"]*)" page$/) do |notes|
  begin
    sleep 5
    arg = getDetails "RequestDetailsPage"
    sleep 3
    if page.has_css?(".clearfix.ng-scope")
      sleep 3
      puts "Successfully see the #{notes} page"
      sleep 3
      all("input[type='text']")[1].send_keys "Testing"
      sleep 5
      click_on 'Send'
      sleep 5
      puts "Successfully added the note"
    else
      putstr "Failed to see the #{notes} page"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while adding the note from #{notes} page"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" links$/) do |request_number|
  begin
    expect(page).to have_content 'Request Number'
    rowcount = all(".ui-grid-row.ng-scope").count
    if rowcount > 0
      sleep 3
      within all(".ui-grid-canvas")[1] do
        within all("div[role='gridcell']")[1] do
          sleep 3
          request_number = first("div").first("a").text
          if page.has_link?(request_number)
            puts "Successfully see the #{request_number} #{request_number} link"
          else
            putstr "Failed see the #{request_number} #{request_number} link"
          end
          sleep 5
        end
      end
    else
      puts "No Opportunities Records Found"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while verifying the #{request_number} link"
    putstr_withScreen  ex.message
  end
end

And(/^I attach the "([^"]*)" file$/) do |url|
  begin
    sleep 4
    file_path = "#{Dir.pwd}/#{url}"
    sleep 6
    page.attach_file("btn-file-upload", file_path)
    sleep 6
    puts "Successfully attached the file"
    click_on 'Upload'
    sleep  15
  rescue Exception => ex
    putstr "Error occurred while attaching the file"
    putstr_withScreen  ex.message
  end
end

And(/^I attach "([^"]*)" file$/) do |url|
  begin
    sleep 4
    file_path = "#{Dir.pwd}/#{url}"
    sleep 6
    page.attach_file("btn-file-upload", file_path)
    sleep 6
    puts "Successfully attached the file"
  rescue Exception => ex
    putstr "Error occurred while attaching the file"
    putstr_withScreen  ex.message
  end
end

And(/^I filter the "([^"]*)" record$/) do |related_to|
  begin
    sleep 3
    all(".ui-grid-header-cell-label")[9].click
    sleep 4
    puts "Successfully filter the #{related_to} record"
  rescue Exception => ex
    putstr "Error occurred while filtering the #{related_to} record"
    putstr_withScreen  ex.message
  end
end
