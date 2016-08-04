@SystemAdminMasterDataCreation 
Feature: All features related to Channel System Admin Master Data 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
@PartnerAccount 
Scenario: Channel: new Account 
	When I click on "Account" tab 
	Then I create new Channel Account with value "PES Channel Account" with AccountNumber "QA-0001" and Country "USA" 
	And I Manage Partner Account with contact "PES Channel User" and its Owner "QA ChannelManager"     
	When I click on "Account" tab 
	Then I create new Channel Account with value "Automation Reseller" with AccountNumber "QA-0001" and Country "USA" 
	And I Manage Partner Account with contact "PES Channel User" and its Owner "QA ChannelManager"    
	When I click on "Account" tab 
	Then I create new Channel Account with value "Automation Distributor" with AccountNumber "QA-0001" and Country "USA" 
	And I Manage Partner Account with contact "PES Channel User" and its Owner "QA ChannelManager"  
	When I click on "Account" tab 
	Then I create new Channel Account with value "TwoTierAutomation" with AccountNumber "QA-0001" and Country "USA" 
	And I Manage Partner Account with contact "PES Channel User" and its Owner "QA ChannelManager" 
	When I click on "Account" tab 
	Then I create new Channel Account with value "PartnerAccount1" with AccountNumber "QA-0001" and Country "USA" 
	And I Manage Partner Account with contact "PES Channel User" and its Owner "QA ChannelManager"   
	   