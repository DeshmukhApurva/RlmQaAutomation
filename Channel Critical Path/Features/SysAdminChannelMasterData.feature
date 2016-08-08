@SystemAdminMasterDataCreation 
Feature: All features related to Channel System Admin Master Data 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 

@CustomPricebooks 
Scenario: Renew: new pricebook 
    When I click on "All Tabs" tab 
	Then I click on Price Books and create pricebook with the name "Test PriceBook" 
	
@addProducts 
Scenario: Renew: add products 
    When I click on "All Tabs" tab 
	Then I click on Products and create product with the name "Product A" 
	When I click on "All Tabs" tab 
	Then I click on Products and create product with the name "Product B" 
	When I click on "All Tabs" tab 
	Then I click on Products and create product with the name "Product C" 
	When I click on "All Tabs" tab 
	Then I click on Products and create product with the name "Product D" 
	When I click on "All Tabs" tab 
	Then I click on Products and create product with the name "GenWatt Diesel 10kW" 
	When I click on "All Tabs" tab 
	Then I click on Products and create product with the name "Installation: Industrial - High"
		
@PartnerAccount 
Scenario: Channel: new Account 
	When I click on "Account" tab 
	Then I create new Channel Account with value "PES Channel Account" with AccountNumber "QA-0001" and Country "USA" 
	And I Manage Partner Account with contact "PES Channel User" and its Owner "QA ChannelManager"     
	When I click on "Account" tab 
	Then I create new Channel Account with value "Automation Reseller" with AccountNumber "QA-0001" and Country "USA" 
	And I Manage Partner Account with contact "Reseller PartnerUser" and its Owner "QA ChannelManager"    
	When I click on "Account" tab 
	Then I create new Channel Account with value "Automation Distributor" with AccountNumber "QA-0001" and Country "USA" 
	And I Manage Partner Account with contact "Distributor PartnerUser" and its Owner "QA ChannelManager"  
	When I click on "Account" tab 
	Then I create new Channel Account with value "TwoTierAutomation" with AccountNumber "QA-0001" and Country "USA" 
	And I Manage Partner Account with contact "PES Channel User" and its Owner "QA ChannelManager" 
	When I click on "Account" tab 
	Then I create new Channel Account with value "PartnerAccount1" with AccountNumber "QA-0001" and Country "USA" 
	And I Manage Partner Account with contact "Con1PA1" and its Owner "QA ChannelManager"   
	   