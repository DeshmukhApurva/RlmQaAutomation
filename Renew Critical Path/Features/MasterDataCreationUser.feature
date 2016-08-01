@MasterDataCreationUser
Feature: All features related to Renew - Master data creation for User

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
@Renew_Createnewaccount 
Scenario: Rally Test Case ID:  : Renew: New account creation 
	When I click on "Account" tab 
	Then I create new Renew Account with value "Revenue Industries" 
	When I click on "Account" tab 
	Then I create new Renew Account with value "GE Force" 
	
@Renew_CreateAsset 
Scenario: Rally Test Case ID:  : Renew: Asset creation 
	When I click on "Assets" tab 
	Then I create new Asset with Name "RI Asset" and its Product "Product B" and its Status "Installed" and price "2500" and account "GE Force" 
	When I click on "Assets" tab 
	Then I create new Asset with Name "RenewAsset" and its Product "Product B" and its Status "Installed" and price "2000" and account "GE Force" 
	When I click on "Assets" tab 
	Then I create new Asset with Name "CA_CP_AssetRenew" and its Product "Product A" and its Status "Installed" and price "1500" and account "GE Force" 
	When I click on "Assets" tab 
	Then I create new Asset with Name "PESAssetRenew" and its Product "Product A" and its Status "Installed" and price "500" and account "GE Force" 
	
@Renew_CreateServiceContracts 
Scenario: Rally Test Case ID:  : Renew: Asset creation 
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "RI SC" with Account "Revenue Industries" and Product "Product B"
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "RenewService" with Account "GE Force" and Product "Product B"
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "RenewNetOpsSCTest" with Account "GE Force" and Product "Product C"

@Renew_Service_Contract_OppCreation 
Scenario: Renew: Generate Contract 
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "SourceServiceContract" with Account "GE Force" and Product "Product A"
	When I click on "Service Contracts" tab 
	And I select contract and generate Opportunity with Name "Service_Contract_Opp" with Account "GE Force" 
	
	  	
@Renew_OppCreation 
Scenario: Renew: Generate Opp 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "RenewTesting" with Account "GE Force" and Product "Product B"
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "RenewService" with Account "GE Force" and Product "Product B"
	
	
