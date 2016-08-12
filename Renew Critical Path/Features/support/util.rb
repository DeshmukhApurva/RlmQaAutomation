require 'rubygems'
require 'rspec/expectations'
require 'Capybara'
require 'Restforce'
require 'openssl'
require 'pry'

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
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
  raise s
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

def connectSalesforceAPI
  Restforce.configure do |config|
    config.api_version = "36.0"
    # ...
  end
#    client = Restforce.new :username => 'amit-csmdev07@comitydesigns.com',
#    :password       => 'Passw7rd',
#    :security_token => 'ECVzzSlTX8HHrE0PE0vStyW2',
#    :client_id      => '3MVG9fMtCkV6eLhdTHzExvFId0bZutnJg30N.KV_OFKhgrEgIip4kq6HzduedM7RPBRcNWGDkgrTyyNrVpVJm',
#    :client_secret  => '7847893736189474237'

  client = Restforce.new :username => 'vishal-csmdev20@comitydesigns.com',
  :password       => 'passw0rd',
  :client_id      => '3MVG9fMtCkV6eLhf.aL9eep2R9flaPaK00XxIzX7SwD5OyoRcRTsTV9eGABbZwa5R005iVcwZ4d6MgkloNZF4',
  :client_secret  => '9181097014607636178'
  puts "#{client.user_info.username}"

  accounts = client.query("select Name from Account where Id='001j000000uBebwAAC'")
  account = accounts.first
  puts "#{account.Name}"
  # Get the global describe for all sobjects
  client.describe
  # => { ... }
  
  # Get the describe for the Account object
  fields = client.describe_fieldSets('Opportunity','Opportunity Split Edit')
  #fieldSet = fields.fieldSets('Opportunity Split Edit')
  puts fields
  # => { ... }
end

def getSalesForceAPIinfo(userRole)
  yamlinput = "../features/support/test_data/login.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[userRole]
end