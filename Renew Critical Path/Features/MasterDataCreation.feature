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
  Then I select with its Product "Product B"
  When I click on "Service Contracts" tab
  Then I create new Service Contracts with Name "RenewNetOpsService" with Account "QA Test"
  When I click on "Service Contracts" tab
  Then I select with its Product "Product B"
 
#  When I click on "Opportunities" tab
#  Then I create new opportunity with Name "RenewNetOpsService" with Account "QA Test"
#  Then I add opportunity product "Product C"

@GenerateOpp
Scenario: Renew: Generate Opp
 When I click on "Opportunities" tab
 Then I create new opportunity with Name "PesSrcOpp" with Account "QA Test"
 Then I add opportunity products
 

 
  