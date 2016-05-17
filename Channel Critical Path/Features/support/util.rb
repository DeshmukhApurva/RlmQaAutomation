require 'rubygems'
require 'rspec/expectations'
require 'Capybara'

$Opp = Time.now.utc.to_i.to_s

def putstr(s)
   puts "<b><font color=red>#{s}</font></b>"
end

def screen_shot_and_save_page
  randomname = "#{Time.now.strftime('%Y-%m-%d-%H-%M-%S')}"
  page.save_screenshot '../Results/screenshots/'+ randomname +'.png',:full => true
  imagename = './screenshots/'+ randomname +'.png'
  #puts "Saved screenshot " + randomname +".png"
  puts "<img src='#{imagename}' />"
end

def putstr_withScreen(s)
   puts "<b><font color=red>#{s}</font></b>"
   screen_shot_and_save_page
end

def isAlertPresent
	status = false
	while (status)
		alert = driver.switch_to.alert rescue "exception happened"
		if (alert == "exception happened")
			status = false
			alert = "nothing happened"
		else
			status = true
			driver.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
		end
	end
end

def getDetails(yamlInfo)
	yamlinput = "../features/support/test_data/Details.yml"
	myoptions = YAML.load_file(yamlinput)
	myoptions[yamlInfo]
end

def getCredentialInfo
    yamlinput = "../features/support/test_data/login.yml"
    myoptions = YAML.load_file(yamlinput)
    myoptions[ENV['UserRole']]
end

def getReference(yamlInfo)
    arg = getCredentialInfo
	yamlinput = "../features/support/test_data/#{arg['Instance']}.yml"
	myoptions = YAML.load_file(yamlinput)
	myoptions[yamlInfo]
end

def getExpirationYears(noOfPlusMinusYears)
  ary = Array.new(2*noOfPlusMinusYears + 1)
  current_year = Date.today.year
  ary.each_index do |i|
      ary[i] = (current_year -(noOfPlusMinusYears - i)).to_s
   end
   return ary
end