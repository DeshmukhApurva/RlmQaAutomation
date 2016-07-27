@MasterDataCreation
Feature: All features related to Renew - Master data creation
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@Createnewaccount
Scenario: Rally Test Case ID:  : Renew: New account creation
	When I click on the Renew "Account" grid tab
	Then I create new Renew Account
	
@CreateSuccessPlan
Scenario: Rally Test Case ID:  : Renew: New Success Plan creation
  When I click on the Renew "Success Plans" grid tab
  Then I create new Success Plan 
  
@CreateAsset
Scenario: Rally Test Case ID:  : Renew: Asset creation
  When I click on the Renew "Asset" grid tab
  Then I create new Asset
  
@CreateServiceContracts
Scenario: Rally Test Case ID:  : Renew: Asset creation
  When I click on the Renew "Service Contracts" grid tab
  Then I create new Service Contracts
  
# needs to add exact steps to create pricebook  
@CreateCustomPriceBook
Scenario: Rally Test Case ID:  : Renew: Asset creation
  Then I create new custom pricebook
  
  

  
  

	
	

