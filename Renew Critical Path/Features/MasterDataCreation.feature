@MasterDataCreation 
Feature: All features related to Renew - Master data creation 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
@Createnewaccount 
Scenario: Rally Test Case ID:  : Renew: New account creation 
	When I click on "Account" tab 
	Then I create new Renew Account with value "PE Wealth" 
	When I click on "Account" tab 
	Then I create new Renew Account with value "QA Test" 
	
	#@SuccessPlanCreation 
	#Scenario: Rally Test Case ID: : Create Success plan 
	#	When I click on "Success Plans" tab 
	#	Then I create a SuccessPlan with template "APT-000019" with Account "PE Wealth"
	
@CreateAsset 
Scenario: Rally Test Case ID:  : Renew: Asset creation 
	When I click on "Asset" tab 
	Then I create new Asset with Name "PEW Asset" and its Product "Product B" and its Status "Installed" and account "QA Test" 
	When I click on "Home" tab 
	When I click on "Asset" tab 
	Then I create new Asset with Name "CA_CP_Asset" and its Product "Product B" and its Status "Installed" and account "QA Test" 
	When I click on "Home" tab 
	When I click on "Asset" tab 
	Then I create new Asset with Name "PESAsset" and its Product "Product A" and its Status "Installed" and account "QA Test" 
	When I click on "Home" tab 
	When I click on "Asset" tab 
	Then I create new Asset with Name "RenewNetOpsAsset" and its Product "Product A" and its Status "Installed" and account "QA Test" 
	When I click on "Home" tab 
	When I click on "Asset" tab 
	Then I create new Asset with Name "IBDRAsset" and its Product "Product A" and its Status "Installed" and account "QA Test" 
	
@CreateServiceContracts 
Scenario: Rally Test Case ID:  : Renew: Asset creation 
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "PEW SC" with Account "PE Wealth" 
	When I click on "Service Contracts" tab 
	Then I select with its Product "Product A" 
	#	When I click on "Home" tab 
	#	When I click on "Service Contracts" tab 
	#	Then I create new Service Contracts with Name "RenewNetOpsSCTest" with Account "QA Test" 
	#	When I click on "Service Contracts" tab 
	#	Then I select with its Product "Product C" 
	#	When I click on "Home" tab 
	#	When I click on "Service Contracts" tab 
	#	Then I create new Service Contracts with Name "SourceServiceContract" with Account "QA Test" 
	#	When I click on "Service Contracts" tab 
	#	Then I select with its Product "Product B" 
	
@CreatemasterdataforAddOnRenewalOpp 
Scenario: Renew: Add on Renewals creation 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "SourceOpportunity" with Account "QA Test" 
	When I click on "Opportunities" tab 
	Then I select opportunity with its Product "Product B" 
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "RenewNetOpsService" with Account "QA Test" 
	When I click on "Service Contracts" tab 
	Then I select with its Product "Product B" 
	
@OppCreation 
Scenario: Renew: Generate Opp 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "PesSrcOpp" with Account "QA Test" 
	When I click on "Opportunities" tab 
	Then I select opportunity with its Product "Product B" 
	When I click on "Home" tab 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "RenewNetOpsTesting" with Account "QA Test" 
	When I click on "Opportunities" tab 
	Then I select opportunity with its Product "Product B" 
	When I click on "Home" tab 
	
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "SourceServiceContract" with Account "QA Test" 
	When I click on "Service Contracts" tab 
	Then I select with its Product "Product A" 
	When I click on "Home" tab 
	
	When I click on "Service Contracts" tab 
	And I select contract and generate Opportunity with Name "PesSrcOpp" with Account "QA Test" 
	When I click on "Home" tab 
	
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "Split_Target_Opportunity_RN" with Account "QA Test" 
	When I click on "Home" tab 
	
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "CreateOppfromOpp" with Account "QA Test" 
	When I click on "Opportunities" tab 
	Then I select opportunity with its Product "Product B" 
	When I click on "Home" tab 
	
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "SourceOpportunity" with Account "QA Test" 
	When I click on "Opportunities" tab 
	Then I select opportunity with its Product "Product B" 
	
#@StandardPricebooks 
#Scenario: Renew: new pricebook 
#	When I click on "All Tabs" tab 
#	Then I click on Price Books with the name "Temp Standard Price Book" 
		
@CustomPricebooks
Scenario: Renew: new pricebook 
    When I click on "All Tabs" tab  
	Then I click on Price Books and create pricebook with the name "Test PriceBook" 
	
	
@addProducts 
Scenario: Renew: add products 
    When I click on "All Tabs" tab
	Then I click on Products and create product with the name "Auto Product Purpleberry"
#	When I click on "All Tabs" tab
#	Then I click on Products and create product with the name "Product B"
#	When I click on "All Tabs" tab
#	Then I click on Products and create product with the name "Product C"
#	When I click on "All Tabs" tab
#	Then I click on Products and create product with the name "Product D"
#	When I click on "All Tabs" tab
#	Then I click on Products and create product with the name "GenWatt Diesel 10kW"
#	When I click on "All Tabs" tab
#	Then I click on Products and create product with the name "Installation: Industrial - High"
	

@assignPricebooktoProduct 
Scenario: Renew: assign pricebook to products 
	When I click on the "All Tabs" grid tab 
	Then I click on  pricebook "Test PriceBook" 
	Then I add "Product A", "Product B", "Product c", "Product D" , "Installation: Industrial - High" and "GenWatt Diesel 10kW" 
	
	
	
  