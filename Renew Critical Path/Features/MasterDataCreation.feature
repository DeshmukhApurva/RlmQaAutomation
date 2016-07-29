@MasterDataCreation
Feature: All features related to Renew - Master data creation
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@Createnewaccount
Scenario: Rally Test Case ID:  : Renew: New account creation
   	When I click on "Account" tab
	Then I create new Renew Account with value "PE Wealth"

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

@CreateAssetsRef
Scenario: Rally Test Case ID:  : Renew: Asset creation
  When I click on "Asset" tab
  Then I create new Asset with Name "PEW Asset" and its Status "Installed" 
  
@CreateAsset
Scenario: Rally Test Case ID:  : Renew: Asset creation
  When I click on "Asset" tab
  Then I create new Asset with Name "CA_CP_Asset" and its Product "Product A" 
  When I click on "Asset" tab 
  Then I create new Asset with Name "PESAsset" and its Product "Product A"
  
@CreateServiceContracts
Scenario: Rally Test Case ID:  : Renew: Asset creation
  When I click on "Service Contracts" tab
  Then I create new Service Contracts with Name "PEW SC" with Account "PE Wealth" 
		
@CreateSC
Scenario: Rally Test Case ID:  : Renew: Service Contract creation
  When I click on "Service Contracts" tab
  Then I create new Service Contracts with Name "RenewNetOpsSCTest" with Account "QA Test"
  When I click on "Service Contracts" tab 
  Then I select the first Contract with its Product "Product A"
   
@ServiceContractsCreation
 Scenario: Rally Test Case ID:  : Renew: Service Contract creation
  When I click on "Service Contracts" tab
  Then I create new Service Contracts with Name "SourceServiceContract" with Account "QA Test"
  When I click on "Service Contracts" tab
  Then I select with its Product "Product B"
 
@CreateCustomPriceBook
Scenario: Rally Test Case ID:  : Renew: CustomPriceBook creation
  Then I create new custom pricebook

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
 
#  When I click on "Opportunities" tab
#  Then I create new opportunity with Name "RenewNetOpsService" with Account "QA Test"
#  Then I add opportunity product "Product C"

@GenerateOppCreation
Scenario: Renew: Generate Opp
 When I click on "Opportunities" tab
 Then I create new opportunity with Name "PesSrcOpp" with Account "QA Test"
 When I click on "Opportunities" tab
 Then I select opportunity with its Product "Product B"
 When I click on "Service Contracts" tab
 Then I create new Service Contracts with Name "SourceServiceContract" with Account "QA Test"
 When I click on "Service Contracts" tab
 And I select contract and generate Opportunity with Name "PesSrcOpp" with Account "QA Test"
 When I click on "Opportunities" tab
 Then I create new opportunity with Name "CreateOppfromOpp" with Account "QA Test"
 When I click on "Opportunities" tab
 Then I create new opportunity with Name "Split_Target_Opportunity_RN" with Account "QA Test"
 When I click on "Opportunities" tab
 Then I select opportunity with its Product "Product B"
 
 @Pricebooks
Scenario: Renew: new pricebook
 When I click on "Price Books" tab
 # select standard pricebook checkbox
 Then I add new pricebook with the name "Standard Price Book" 
 When I click on "Price Books" tab
 Then I add new pricebook with the name "Test PriceBook"
 
@addProducts
Scenario: Renew: add products
 When I click on "Products" tab
 Then click on products views
 And click on "Add"
 Then add the product "Product A"
 When I click on "Products" tab
 Then click on products views
 And click on "Add"
 Then add the product "Product B"
 Then click on products views
 And click on "Add"
 Then add the product "Product C"
 Then click on products views
 And click on "Add"
 Then add the product "Product D"
 Then click on products views
 And click on "Add"
 Then add the product "GenWatt Diesel 10kW"
 Then click on products views
 And click on "Add"
 Then add the product "Installation: Industrial - High"
 
@assignPricebooktoProduct
Scenario: Renew: assign pricebook to products
 When I click on "Price Books" tab
 Then I click on  pricebook "Test PriceBook" 
 Then testing 
 Then I add "Product A", "Product B", "Product c", "Product D" , "Installation: Industrial - High" and "GenWatt Diesel 10kW"
 

 
  