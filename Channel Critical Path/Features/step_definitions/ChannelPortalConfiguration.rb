#All ServiceSource Setup - Channel Portal Configuration specific Step definitions
#All Scenario mentioned in ChannelPortalConfiguration.feature

And(/^I verify the "(.*?)"$/) do |arg|
  begin
    if page.has_content? arg
      puts "Channel Management section is displayed under ServiceSource Setup"
    else
      puts "Channel Management section is not displayed under ServiceSource Setup"
    end
  rescue Exception => ex
    putstr "Error while verifying Channel Management section display under ServiceSource Setup tab"
    putstr_withScreen  ex.message
  end
end

Then(/^I verify Portal Overview page Pipeline Chart section$/) do
  begin

    within all(".divelement")[1] do

      if page.has_content? "Hidden from Pipeline"
        puts "Hidden from Pipeline header is displayed"
      else
        putstr "Hidden from Pipeline header is not displayed"
      end

      if page.has_xpath? (".//*[contains(@id, 'targetSelectList')]")
        puts "Hidden from Pipeline selection section is displayed"
      else
        putstr "Hidden from Pipeline selection section is not displayed"
      end

      if page.has_content? "Display in Pipeline"
        puts "Display in Pipeline header is displayed"
      else
        putstr "Display in Pipeline header is not displayed"
      end

      if page.has_xpath? (".//*[contains(@id, 'destinationSelectList')]")
        puts "Display in Pipeline selection section is displayed"
      else
        putstr "Display in Pipeline selection section is not displayed"
      end

      if page.has_css?(".rightArrowIcon")
        puts "Select button is displayed"
      else
        putstr "Select button is not displayed"
      end

      if page.has_css?(".leftArrowIcon")
        puts "Remove button is displayed"
      else
        putstr "Remove button is not displayed"
      end
    end

  rescue Exception => ex
    putstr "Error occurred while verifying Portal Overview page Pipeline Chart section"
    putstr_withScreen ex.message
  end
end

Then(/^I add or remove Sales stages from "(.*?)" to "(.*?)"$/) do |item1,item2|
  begin
    arg1 = getDetails "SalesStages"
    saveMessage = arg1["CorrectText"]

    within all(".divelement")[1] do

      availableStages = find(:xpath, ".//*[contains(@id, 'destinationSelectList')]").all('option').collect(&:text)

      if availableStages.to_s.size > 0
        puts "SalesStages available in #{item1} : #{availableStages}"

        availableStages.each do |option|
          find(:xpath, ".//*[contains(@id, 'destinationSelectList')]").select(option)
          puts "Selected #{option}"
          sleep 2
        end

        find(:css, ".leftArrowIcon").click
        puts "Moved all the stages from #{item2} to #{item1}"
        sleep 2

      else
        puts "#{item2} is empty"
      end
    end

    sleep 5

    within all(".divelement")[1] do

      LOV = find(:xpath, ".//*[contains(@id, 'targetSelectList')]").all('option').collect(&:text)

      if LOV.size > 0

        LOV.each do |option|
          find(:xpath, ".//*[contains(@id, 'targetSelectList')]").select(option)
          puts "Selected #{option}"
          sleep 2
        end

        find(:css, ".rightArrowIcon").click
        puts "Moved Sales stages from #{item1} to #{item2}"
        sleep 2

      else
        puts "No Sales stages to select to move from #{item1} to #{item2}"
      end
    end

    sleep 5

    within(".pbButtonb") do
      click_on "Save"
      puts "Clicked on Save button"
    end
    sleep 3

    if page.has_content? saveMessage
      puts "#{saveMessage} message displayed."
    else
      puts "#{saveMessage} message is not displayed."
    end
    sleep 3

  rescue Exception => ex
    putstr "Error occurred while moving Sales stages from #{item1} to #{item2}"
    putstr_withScreen ex.message
  end
end

Then(/^I add or remove Sales stages again from "(.*?)" to "(.*?)"$/) do |item1,item2|
  begin
    arg1 = getDetails "SalesStages"

    unavailableStages = arg1["Unavailablestages"].split(",")

    stagesAvailable = Array.new
    saveMessage = arg1["CorrectText"]

    within all(".divelement")[1] do

      stagesAvailable = find(:xpath, ".//*[contains(@id, 'destinationSelectList')]").all('option').collect(&:text)

      if stagesAvailable.size > 0
        puts "SalesStages available in #{item2} : #{stagesAvailable}"

        unavailableStages.each do |option|

          if stagesAvailable.to_s.include? option.to_s

            find(:xpath, ".//*[contains(@id, 'destinationSelectList')]").select(option)
            puts "Selected #{option}"
            sleep 2
          else
            puts "Sales Stages were already moved to Not Available to Partners"
          end

        end
        find(:css, ".leftArrowIcon").click
        puts "Moved Sales stages from #{item1} to #{item2}"
        sleep 2
      else
        puts "No Sales stages to select to move from #{item1} to #{item2}"
      end
    end

    sleep 5

    within(".pbButtonb") do
      click_on "Save"
    end
    sleep 3

    if page.has_content? saveMessage
      puts "#{saveMessage} message displayed."
    else
      puts "#{saveMessage} message is not displayed."
    end
    sleep 3

  rescue Exception => ex
    putstr "Error occurred while moving Sales stages from #{item1} to #{item2}"
    putstr_withScreen ex.message
  end
end

#And(/^I verify "(.*?)" checkbox$/) do |arg|
#  begin
#    sleep 3
#
#    if all("input[type='checkbox']").last.checked?
#      puts "#{arg} is already enabled"
#    else
#      puts "#{arg} is disabled"
#      all("input[type='checkbox']").last.set(true)
#      sleep 3
#      puts "#{arg} is enabled"
#    end
#
#    within(".pbButtonb") do
#      click_on "Save"
#    end
#    sleep 3
#
#  rescue Exception => ex
#    putstr "Error occurred while verifying #{arg} checkbox"
#    putstr_withScreen ex.message
#  end
#end

And(/^I verify "(.*?)" checkbox$/) do |arg|
  begin
    sleep 3

    if page.has_content?("Enable 2 Tier Pricing")
      puts "#{arg} checkbox displayed"
    else
      putstr "#{arg} checkbox not displayed"
    end

    if arg == "Enable 2 Tier Pricing"
      #puts find(:xpath, "//*/label[text()='Enable 2 Tier Pricing']/following-sibling::td/input[contains(@id,'in_tier_pricing')]").checked?
      if find(:xpath, "//*/input[@id='pageCHLAdmin:frmCHLAdmin:j_id61:j_id66:in_tier_pricing']").checked?
        find(:xpath, "//*/input[@id='pageCHLAdmin:frmCHLAdmin:j_id61:j_id66:in_tier_pricing']").set(false)
        puts "#{arg} is disabled now"
      else
        puts "#{arg} is disabled"
        find(:xpath, "//*/input[@id='pageCHLAdmin:frmCHLAdmin:j_id61:j_id66:in_tier_pricing']").set(true)
        sleep 3
        puts "#{arg} is enabled now"
      end
    else
      sleep 3
      if all("input[type='checkbox']").last.checked?
        puts "#{arg} is already enabled"
      else
        puts "#{arg} is disabled"
        all("input[type='checkbox']").last.set(true)
        sleep 3
        puts "#{arg} is enabled"
      end
    end

    within(".pbButtonb") do
      click_on "Save"
    end
    sleep 3

  rescue Exception => ex
    putstr "Error occurred while verifying #{arg} checkbox"
    putstr_withScreen ex.message
  end
end

Then(/^I "(.*?)" the "(.*?)" checkbox$/) do |arg1,arg2|
  begin
    sleep 3

    if page.has_content?("Enable 2 Tier Pricing")
      puts "#{arg} checkbox displayed"
    else
      putstr "#{arg} checkbox not displayed"
    end

    if arg1 == "Check" and arg2 == "Enable 2 Tier Pricing"
      find(:xpath, "//*[contains(@id, 'in_tier_pricing')]").set(true)
      sleep 3
    elsif arg1 == "Uncheck" and arg2 == "Enable 2 Tier Pricing"
      find(:xpath, "//*[contains(@id, 'in_tier_pricing')]").set(false)
      sleep 3
    end

    within(".pbButtonb") do
      click_on "Save"
    end
    sleep 3
    
  rescue Exception => ex
    putstr "Error occurred while verifying #{arg} checkbox"
    putstr_withScreen ex.message
  end
end
