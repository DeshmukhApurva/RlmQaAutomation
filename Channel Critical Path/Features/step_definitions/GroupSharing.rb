#All PortalGroup - GroupSharing specific Step definitions
#All Scenario mentioned in GroupSharing.feature


And(/^I open the existing assets$/) do
  begin
    sleep 5
    arg = getReference "NonIncumbentPartnerPricingDisplay"
    sleep 5
    within (".fBody") do
      click_button 'Go!'
    end
    sleep 10
    if page.has_css?(".listItemPad")
      sleep 4
      puts "Successfully see the Alphabetic Pagination"
      all(".listItemPad")[12].click
      sleep 8
      all(".selectArrow")[0].click
      sleep 8
      within(".bottomNav") do
        first("table").all("tr")[4].click
      end
    else
      putstr "Failed to see the Alphabetic Pagination"
    end
    sleep 10
    result = false
    all(:xpath, '//div/table/tbody/tr/td[4]/div/a/span').each do |activity|
      if activity.text.include? arg["AssetName"]
        puts "Successfully match the asset name"
        activity.click
        puts "Successfully opened the #{arg["AssetName"]} asset"
        result = true
        break
      end
    end
    putstr "Unable to find the #{arg["AssetName"]} asset" unless result
  rescue Exception => ex
    putstr "Error occurred while clicking on existing #{arg["AssetName"]} asset"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the "([^"]*)" tab$/) do |tab|
  begin
    sleep 5
    if page.has_content?(tab)
      puts "Successfully see the #{tab} tab"
    else
      putstr "Failed to see the #{tab} tab"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while verifying the #{tab} tab"
    putstr_withScreen  ex.message
  end
end



Then(/^I should able to see the "([^"]*)" button from "([^"]*)" page$/) do |button, tab|
  begin
    sleep 5
    if page.has_content?(tab)
      puts "Successfully see the #{tab} tab"
      sleep 4
      if page.has_button?(button)
        puts "Successfully see the #{button} button"
      else
        putstr "Failed to see the #{button} button"
      end
    else
      putstr "Failed to see the #{tab} tab"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the #{button} button from #{tab} page"
    putstr_withScreen  ex.message
  end
end

When(/^I click on the "([^"]*)" button from "([^"]*)" page$/) do |button, tab|
  begin
    sleep 4
    if page.has_button?(button)
      puts "Successfully see the #{button} button"
      sleep 3
      click_on button
      sleep 3
      puts "Successfully click the #{button} button"
    else
      putstr "Failed to see the #{button} button"
    end
    sleep 5
  rescue Exception => ex
    putstr "Error occurred while clicking the #{button} button from #{tab} page"
    putstr_withScreen  ex.message
  end
end


Then(/^I verify the create "([^"]*)" fields$/) do |tab|
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
    if page.has_content?(arg["PortalGroupNameField"])
      puts "Successfully see the #{tab} #{arg["PortalGroupNameField"]} field"
    else
      putstr "Failed to see the #{tab} #{arg["PortalGroupNameField"]} field"
    end
    sleep 3
    if page.has_content?(arg["RollUpHierarchyField"])
      puts "Successfully see the #{tab} #{arg["RollUpHierarchyField"]} field"
    else
      putstr "Failed to see the #{tab} #{arg["RollUpHierarchyField"]} field"
    end
    sleep 3
    if page.has_content?(arg["DescriptionField"])
      puts "Successfully see the #{tab} #{arg["DescriptionField"]} field"
    else
      putstr "Failed to see the #{tab} #{arg["DescriptionField"]} field"
    end
    sleep 3
    if page.has_content?(arg["CreatePortalGroupSection"])
      puts "Successfully see the #{tab} #{arg["CreatePortalGroupSection"]} field"
    else
      putstr "Failed to see the #{tab} #{arg["CreatePortalGroupSection"]} field"
    end
    sleep 3
    if page.has_content?(arg["AccountsField"])
      puts "Successfully see the #{tab} #{arg["AccountsField"]} field"
    else
      putstr "Failed to see the #{tab} #{arg["AccountsField"]} field"
    end
    sleep 3
    if page.has_content?(arg["PartnerUsersField"])
      puts "Successfully see the #{tab} #{arg["PartnerUsersField"]} field"
    else
      putstr "Failed to see the #{tab} #{arg["PartnerUsersField"]} field"
    end
    sleep 3
    if page.has_content?(arg["SearchTextField"])
      puts "Successfully see the #{tab} #{arg["SearchTextField"]} field"
    else
      putstr "Failed to see the #{tab} #{arg["SearchTextField"]} field"
    end
    if page.has_button?(arg["SearchButton"])
      puts "Successfully see the #{tab} #{arg["SearchButton"]} button"
    else
      putstr "Failed to see the #{tab} #{arg["SearchButton"]} button"
    end
    if page.has_button?(arg["SaveButton"])
      puts "Successfully see the #{tab} #{arg["SaveButton"]} button"
    else
      putstr "Failed to see the #{tab} #{arg["SaveButton"]} button"
    end
    sleep 3
    if page.has_button?(arg["CancelButton"])
      puts "Successfully see the #{tab} #{arg["CancelButton"]} button"
    else
      putstr "Failed to see the #{tab} #{arg["CancelButton"]} button"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the create #{tab} fields"
    putstr_withScreen  ex.message
  end
end



Then(/^I verify the mandatory field "([^"]*)"$/) do |field|
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
    within(".pbButtonb") do
      click_on arg["SaveButton"]
    end
    sleep 5
    puts "Successfully click the #{arg["SaveButton"]} button"
    sleep 3
    if page.has_content?(arg["GroupNameMandatoryMessage"])
      puts "Successfully see the #{arg["GroupNameMandatoryMessage"]} mandatory error message"
    else
      putstr "Failed to see the #{arg["GroupNameMandatoryMessage"]} mandatory error message"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying #{field} mandatory message"
    putstr_withScreen  ex.message
  end
end


# When(/^I fill the "([^"]*)" fields$/) do |arg|
#   pending
# end

And(/^I select the "([^"]*)" radio button$/) do |partner|
  begin
   sleep 3
   arg = getDetails "GroupSharing"
   sleep 3
   if page.has_content?(arg["AccountsField"]) && page.has_content?(arg["PartnerUsersField"])
     puts "Successfully see the partner #{arg["AccountsField"]} and #{arg["PartnerUsersField"]} fields"
     sleep 3
     begin
       choose partner
     rescue
       putstr "Unable to select the #{partner} radio button"
     end
     sleep 4
   else
     putstr "Failed to see the partner #{arg["AccountsField"]} and #{arg["PartnerUsersField"]} fields"
   end
   sleep 4
  rescue Exception => ex
    putstr "Error occurred while select the #{partner} radio button"
    putstr_withScreen  ex.message
  end
end

And(/^I enter the partner account name$/) do
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 3
   if page.has_content?(arg["AccountsField"])
     puts "Successfully see the partner #{arg["AccountsField"]} field"
     sleep 3
     within all(".pbSubsection")[2] do
       sleep 3
       first("input").send_keys [:control, 'a'], :backspace
       sleep 3
       first("input").send_keys arg["partnerAccountName"]
       sleep 4
       puts "Successfully enter the partner account name"
     end
   else
     putstr "Failed to see the partner #{arg["AccountsField"]} field"
   end
   sleep 3
  rescue Exception => ex
    putstr "Error occurred while entering the partner account name"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the search results$/) do
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
    if page.has_button?(arg["AddToGroupButton"])
      puts "Successfully see the #{arg["AddToGroupButton"]} button"
      sleep 3
      within all(".pbSubsection")[3] do
        within(".list") do
          if first("tbody").all("tr").count > 0
            puts "Successfully see the Group Members"
            sleep 3
          else
            putstr "Failed to see the Group Members"
          end
        end
      end
    else
      putstr "Failed to see the #{arg["AddToGroupButton"]} button"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the search results"
    putstr_withScreen  ex.message
  end
end

And(/^I enter the partner user name$/) do
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 3
    if page.has_content?(arg["PartnerUsersField"])
      puts "Successfully see the #{arg["PartnerUsersField"]} field"
      sleep 3
      within all(".pbSubsection")[2] do
        sleep 3
        first("input").send_keys [:control, 'a'], :backspace
        sleep 3
        first("input").send_keys arg["PartnerUserName"]
        sleep 4
        puts "Successfully enter the partner user name"
      end
      sleep 4
    else
      putstr "Failed to see the #{arg["PartnerUsersField"]} field"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while entering the partner user name"
    putstr_withScreen  ex.message
  end
end

And(/^I click on partner "([^"]*)" button$/) do |arg|
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 3
    if page.has_button?(arg["SearchButton"])
      puts "Successfully see the #{arg["SearchButton"]} button"
      sleep 3
      within all(".pbSubsection")[2] do
        click_on arg["SearchButton"]
      end
      sleep 4
    else
      putstr "Failed to see the #{arg["SearchButton"]} button"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while entering the partner user name"
    putstr_withScreen  ex.message
  end
end

And(/^I "([^"]*)" the portal group$/) do |button|
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 3
    if page.has_button?(button)
      puts "Successfully see the #{button} button"
      sleep 3
      within(".pbButtonb") do
        click_on button
      end
      sleep 5
    else
      putstr "Failed to see the #{button} button"
    end
    sleep 3
    puts "Successfully save the portal group"
  rescue Exception => ex
    putstr "Error occurred while clicking the #{button} button"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the search error message$/) do
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
    if page.has_content?(arg["SearchErrorMessage"])
      puts "Successfully see the <b> #{arg["SearchErrorMessage"]}</b> error message"
      sleep 4
    else
      putstr "Failed to see the <b>#{arg["SearchErrorMessage"]}</b> error message"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the search error message"
    putstr_withScreen  ex.message
  end
end

Then(/^I should able to see the account and partner user error message$/) do
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
    if page.has_content?(arg["ObjectErrorMessage"])
      puts "Successfully see the account and partner user <b> #{arg["ObjectErrorMessage"]}</b> error message"
      sleep 4
    else
      putstr "Failed to see the account and partner user <b>#{arg["ObjectErrorMessage"]}</b> error message"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the account and partner user error message"
    putstr_withScreen  ex.message
  end
end

And(/^I enter the "([^"]*)" name$/) do |field|
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
    $group_name = "#{arg["PortalGroupName"]} #{Time.now.strftime('%m%d_%H%M_%S')}"
    sleep 4
   within all(".pbSubsection")[0] do
     first("input").send_keys $group_name
   end
   sleep 4
   puts "Successfully enter the #{field} name"
  rescue Exception => ex
    putstr "Error occurred while entering the #{field} name"
    putstr_withScreen  ex.message
  end
end

And(/^I enter the "([^"]*)"$/) do |field|
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
    within all(".pbSubsection")[0] do
      all("tr")[1].all("td")[0].first("textarea").send_keys arg["PortalDescription"]
    end
    sleep 4
    puts "Successfully enter the #{field} name"
  rescue Exception => ex
    putstr "Error occurred while "
    putstr_withScreen  ex.message
  end
end

And(/^I check the "([^"]*)" group$/) do |checkbox|
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
    within all(".pbSubsection")[0] do
      if all("tr")[0].all("td")[1].first("input").checked?
        puts "#{checkbox} is already selected"
      else
        sleep 3
        all("tr")[0].all("td")[1].first("input").click
        sleep 4
        puts "#{checkbox} is selected"
      end
    end
    sleep 4
    puts "Successfully check the #{checkbox}"
  rescue Exception => ex
    putstr "Error occurred while checking the #{checkbox} checkbox"
    putstr_withScreen  ex.message
  end
end


Then(/^I verify the "([^"]*)" group members$/) do |partner_user|
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
    if page.has_button?(arg["AddToGroupButton"])
      puts "Successfully see the #{arg["AddToGroupButton"]} button"
      sleep 3
      within all(".pbSubsection")[3] do
        within(".list") do
          if first("tbody").all("tr").count > 0
            puts "Successfully see the #{partner_user} Group Members"
            sleep 3
          else
            putstr "Failed to see the #{partner_user} Group Members"
          end
        end
      end
    else
      putstr "Failed to see the #{arg["AddToGroupButton"]} button"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the #{partner_user} search results"
    putstr_withScreen  ex.message
  end
end

And(/^I select the "([^"]*)" from "([^"]*)" grid$/) do |partner_user, group|
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
    if page.has_button?(arg["AddToGroupButton"])
      puts "Successfully see the #{arg["AddToGroupButton"]} button"
      sleep 3
      within all(".pbSubsection")[3] do
        within(".list") do
         if first("tbody").all("tr").count > 0
           puts "Successfully see the #{partner_user} records"
           sleep 3
             if all('input[type=checkbox]')[1].checked?
               sleep 3
               puts "#{partner_user} checkbox is already selected"
             else
               sleep 3
               all('input[type=checkbox]')[1].click
               sleep 3
               puts "#{partner_user} checkbox is selected"
               break
             end
         else
           putstr "Failed to see the #{partner_user} records"
         end
        end
      end
    else
      putstr "Failed to see the #{arg["AddToGroupButton"]} button"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while selecting the #{partner_user} reocords from #{group}"
    putstr_withScreen  ex.message
  end
end


And(/^I save the partners to "([^"]*)"$/) do |button|
  begin
    sleep 3
    click_on button
    sleep 3
    puts "Successfully save the partners to group"
  rescue Exception => ex
    putstr "Error occurred while clickig the #{button} button"
    putstr_withScreen  ex.message
  end
end



Then(/^I verify the "([^"]*)" records are added to the group$/) do |partner_user|
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
    if page.has_content?(arg["SelectedGroupMembersSection"])
      puts "Successfully see the #{arg["SelectedGroupMembersSection"]} section"
      sleep 3
      within all(".pbSubsection")[4] do
        within(".list") do
          if first("tbody").all("tr").count > 0
            puts "#{partner_user} added to the group"
          else
            putstr "#{partner_user} not added to group"
          end
        end
      end
    else
      putstr "Failed to see the #{arg["SelectedGroupMembersSection"]} section"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verify the #{partner_user} added to group"
    putstr_withScreen  ex.message
  end
end



And(/^I remove the group member$/) do
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
    if page.has_content?(arg["SelectedGroupMembersSection"])
      puts "Successfully see the #{arg["SelectedGroupMembersSection"]} section"
      sleep 3
      within all(".pbSubsection")[4] do
        within(".list") do
          if first("tbody").all("tr").count > 0
            puts "partner user added to the group"
            first("tbody").all("tr")[0].all("td")[0].first(:link,"Remove").click
            sleep 3
            puts "Successfully remove the group member"
          else
            putstr "partner user not added to group"
          end
        end
      end
    else
      putstr "Failed to see the #{arg["SelectedGroupMembersSection"]} section"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while remove the group member"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the group member removed or not$/) do
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
    if page.has_button?(arg["AddToGroupButton"])
      puts "Successfully see the #{arg["AddToGroupButton"]} button"
      sleep 3
      within all(".pbSubsection")[3] do
        within(".list") do
          if first("tbody").all("tr").count > 0
            puts "Successfully remove group member"
            sleep 3
          else
            putstr "Failed to remove the group member"
          end
        end
      end
    else
      putstr "Failed to see the #{arg["AddToGroupButton"]} button"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying removed the group members"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify the created portal group$/) do
  begin
    sleep 4
    if page.has_css?(".pageDescription")
      puts "Successfully see the portal group page"
      sleep 3
      if page.has_content?($group_name)
        puts "Successfully create the portal group: #{$group_name}"
      else
        putstr "Failed to create the portal group: #{$group_name}"
      end
    else
      putstr "Failed to see the portal group page"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying created portal group"
    putstr_withScreen  ex.message
  end
end


When(/^I open the partner opportunity$/) do
  begin
  sleep 4
  within all(".pbBody")[1] do
    within(".list") do
      sleep 3
      all(".dataRow")[0].first("th").all("a")[0].click
      sleep 5
      puts "Successfully open the Partner Opportunity"
    end
  end
  sleep 3
  rescue Exception => ex
    putstr "Error occurred while clicking the partner opportunity"
    putstr_withScreen  ex.message
  end
end


When(/^I "([^"]*)" the partner opportunity$/) do |share_button|
  begin
    sleep 4
    within("#topButtonRow") do
      sleep 3
      click_on share_button
      sleep 5
      puts "Successfully open the Partner Opportunity"
    end
    sleep 3
  rescue Exception => ex
    putstr "Error occurred while sharing the partner opportunity"
    putstr_withScreen  ex.message
  end
end


And(/^I "([^"]*)" the "([^"]*)" for sharing$/) do |button, public_group|
  begin
    sleep 4
    within(".pbButton") do
      sleep 3
      click_on button
      sleep 5
      puts "Successfully click the #{button} button"
    end
    sleep 3
    within(".duelingListBox") do
      find("#sharing_search").send_keys public_group
    end
    sleep 4
    within(".pbSubsection") do
      within(".layout") do
        first("select").find(:xpath, 'option[5]').select_option
      end
    end
    sleep 3
    puts "Successfully selected the public group value"
    sleep 4
    find(".rightArrowIcon").click
    sleep 4
    within("#bottomButtonRow") do
      click_on 'Save'
    end
    sleep 3
    puts "Successfully added the public groups"
  rescue Exception => ex
    putstr "Error occurred while adding the public groups"
    putstr_withScreen  ex.message
  end
end


Then(/^I verify the shared "([^"]*)"$/) do |public_groups|
  begin
  sleep 4
  within(".pbBody") do
    if first("tbody").all(".dataRow").count > 0
       puts "Successfully see the group sharing records"
       public_group = first("tbody").all(".dataRow")[0].first("th").text
       sleep 3
       puts public_group
    else
      puts "No Group Sharing Records Found"
    end
  end
  sleep 4
  rescue Exception => ex
    putstr "Error occurred while verify the shared #{public_groups}"
    putstr_withScreen  ex.message
  end
end

Then(/^I should not able to create portal group$/) do
  begin
    sleep 4
    unless page.has_content?($group_name)
      puts "Portal Group is not created"
    else
      putstr "Portal Group is created"
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying the cancel portal groups"
    putstr_withScreen  ex.message
  end
end



And(/^I fill the "([^"]*)"$/) do |field|
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
    within all(".pbSubsection")[0] do
      first("input").send_keys arg["PortalGroupName"]
    end
    sleep 4
    puts "Successfully enter the #{field} name"
  rescue Exception => ex
    putstr "Error occurred while entering the #{field} name"
    putstr_withScreen  ex.message
  end
end

Then(/^I should not able to create the duplicate portal groups$/) do
  begin
    sleep 3
    arg = getDetails "GroupSharing"
    sleep 4
   if page.has_css?(".messageTable")
     puts "Successfully see the duplicate portal group error message"
     sleep 3
      if page.has_content?(arg["DuplicatePortalGroupErrorMessage"])
        puts "Duplicate Portal Group is not created"
      else
        putstr "Duplicate Portal Group is created"
      end
   else
     putstr "Failed to find the duplicate portal group error message"
   end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while verifying craete the duplicate portal groups"
    putstr_withScreen  ex.message
  end
end

