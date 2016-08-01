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
	

@CreateAsset 
Scenario: Rally Test Case ID:  : Renew: Asset creation 
	When I click on "Assets" tab 
	Then I create new Asset with Name "Test PEW Asset" and its Product "Product B" and its Status "Installed" and price "2500" and account "QA Test" 
	When I click on "Assets" tab 
	Then I create new Asset with Name "CA_CP_Asset" and its Product "Product B" and its Status "Installed" and price "2000" and account "QA Test" 
	When I click on "Assets" tab 
	Then I create new Asset with Name "PESAsset" and its Product "Product A" and its Status "Installed" and price "1500" and account "QA Test" 
	When I click on "Assets" tab 
	Then I create new Asset with Name "RenewNetOpsAsset" and its Product "Product A" and its Status "Installed" and price "500" and account "QA Test" 
	When I click on "Assets" tab 
	Then I create new Asset with Name "IBDRAsset" and its Product "Product A" and its Status "Installed" and price "3000" and account "QA Test" 
	
@CreateServiceContracts 
Scenario: Rally Test Case ID:  : Renew: Asset creation 
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "PEW SC" with Account "PE Wealth" and Product "Product B"
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "RenewNetOpsSCTest" with Account "QA Test" and Product "Product B"
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "SourceServiceContract" with Account "QA Test" and Product "Product C"
	
@CreatemasterdataforAddOnRenewalOpp 
Scenario: Renew: Add on Renewals creation 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "SourceOpportunity" with Account "QA Test" and Product "Product B"
	When I click on "Service Contracts" tab 
    Then I create new Service Contracts with Name "RenewNetOpsService" with Account "QA Test" and Product "Product A"
    	
@OppCreation 
Scenario: Renew: Generate Opp 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "PesSrcOpp" with Account "QA Test" and Product "Product B"
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "SourceOpportunity" with Account "QA Test" and Product "Product B"
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "SourceOpportunity09" with Account "QA Test" and Product "Product B"
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "CreateOppfromOpp" with Account "QA Test" and Product "Product A"
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "RenewNetOpsService" with Account "QA Test" and Product "Product A"
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "Split_Target_Opportunity_RN" with Account "QA Test" and pricebook "Standard Price Book"
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "Source-RenewNetOpsTesting" with Account "QA Test" and Product "Product B"
	Then I resolved the Source Opportunity
	When I create Source Opportunity with Line Items and resolve it and rename it as "PES_Renewal_Opportunity"
	
@StandardPricebooks 
Scenario: Renew: new pricebook 
	When I click on "All Tabs" tab 
	Then I click on Price Books with the name "Standard Price Book" 

@CustomPricebooks
Scenario: Renew: new pricebook 
    When I click on "All Tabs" tab  
	Then I click on Price Books and create pricebook with the name "Test PriceBook" 
	
# Below steps tested - products getting added but pricebook assignments NOT working		
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
	

@assignPricebooktoProduct 
Scenario: Renew: assign pricebook to products 
	When I click on the "All Tabs" grid tab 
	Then I click on  pricebook "Test PriceBook" 
	Then I add "Product A", "Product B", "Product c", "Product D" , "Installation: Industrial - High" and "GenWatt Diesel 10kW" 
	
	
	
  