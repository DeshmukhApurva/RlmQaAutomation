require 'rubygems'
require 'rspec/expectations'
require 'Capybara'

@data1
@data2
@healthy1
@low1
@Pending1
@Undetermined1
@Total


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


def changeUsers(change)
begin
	yamlinput = "../features/support/test_data/login.yml"
	myoptions = YAML.load_file(yamlinput)
	otherusername = ""
	arg = getCredentialInfo
	instanceName=arg["Server"]
	userName=arg["Name"]
	myoptions.each do |myoption|
	if myoption[1]["Server"]==instanceName
	   if myoption[1]["Name"] != userName
		   otherusername = myoption[1]["Name"]
		   puts "Fetched alternate user name for switching user."
	   end
	end
	end
	if change=="user1"
		return otherusername
	else
		return userName
	end
rescue Exception=>ex
	putstr ex.message
end
end

def getArraySum(name)
	@num = 0.0
		name.each do |row|
			@num = @num + row
		 end
	@num	 
end