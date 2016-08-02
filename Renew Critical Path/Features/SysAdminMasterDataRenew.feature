@SystemAdminMasterDataCreation 
Feature: All features related to System Admin Master Data 

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
	Then I click on Products and create product with the name "TestProduct A" 
	When I click on "All Tabs" tab 
	Then I click on Products and create product with the name "TestProduct B" 
	When I click on "All Tabs" tab 
	Then I click on Products and create product with the name "TestProduct C" 
	When I click on "All Tabs" tab 
	Then I click on Products and create product with the name "TestProduct D" 
	When I click on "All Tabs" tab 
	Then I click on Products and create product with the name "TestGenWatt Diesel 10kW" 
	When I click on "All Tabs" tab 
	Then I click on Products and create product with the name "TestInstallation: Industrial - High"
	
 
		
		