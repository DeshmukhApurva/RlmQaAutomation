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

def connectSalesforceAPI(salesForceAppConnectDetails)
  sleep 5
  Restforce.configure do |config|
    config.api_version = "36.0"
    # ...
  end

  $client = Restforce.new :username => salesForceAppConnectDetails["userName"],
  :password       => salesForceAppConnectDetails["pwd"],
  :security_token => salesForceAppConnectDetails["security_token"],  
  :client_id      => salesForceAppConnectDetails["client_id"],
  :client_secret  => salesForceAppConnectDetails["client_secret"]
  puts "#{$client.user_info.username} connected"

end

def getSalesForceAPIinfo(userRole)
  sleep 5
  yamlinput = "../features/support/test_data/login.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions[userRole]
end

def deleteOppRenOppSourceObj(sourceOpp, renOpp)
  sleep 5
  oppRecord = $client.query("select Id,Name from Opportunity where Name = \'#{sourceOpp}\'")
  renOppRecord = $client.query("select Id,Name from Opportunity where Name = \'#{renOpp}\'")

  opp = oppRecord.first
  renOpp = renOppRecord.first
  puts opp.Id + " " + opp.Name
  puts renOpp.Id + " " + renOpp.Name

  oppid = opp.Id
  renOppid = renOpp.Id

  sourceObj = $client.query("select Id,Name from ServiceSource1__REN_Source__c where ServiceSource1__REN_Inheriting_Opportunity__c = \'#{renOppid}\'")
  puts sourceObj

  sourceOppRecords = Array.new
  sourceOppRecords = sourceObj
  
  sourceOppRecords.each do |rec|
    puts rec.Id + " " + rec.Name
    rec.destroy
  end    

#  puts sourceOppfirstRecord.Name + " " + sourceOppfirstRecord.Name
#  sourceOppfirstRecord.destroy
#  sleep 3
#
#  sourceRecord = $client.query("select Id,Name from ServiceSource1__REN_Source__c where ServiceSource1__REN_Inheriting_Opportunity__c = \'#{renOppid}\'")
#  sourceOppfirstRecord = sourceRecord.first
#  puts sourceOppfirstRecord.Name
#  sourceOppfirstRecord.destroy
  sleep 3

  $client.destroy!('Opportunity', renOppid[0,15])
  sleep 5
  $client.destroy!('Opportunity', oppid[0,15])
  #oPPRecord.destroy
  sleep 5

  #binding.pry
  visit $renOppURL
  sleep 5
  if page.has_content?('Record deleted')
    puts "Source Opportunity #{$RenAutomationRO} deleted"
  end

  visit $sourceOppURL
  sleep 5
  if page.has_content?('Record deleted')
    puts "Source Opportunity #{$RenAutomationSO} deleted"
  end
  sleep 5
end