@MasterDataCreationUser 
Feature: All features related to Renew - Master data creation for User 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
	#@Renew_Createnewaccount 
	#Scenario: Rally Test Case ID:  : Renew: New account creation 
	#	When I click on "Account" tab 
	#	Then I create new Renew Account with value "Revenue Industries" 
	#	When I click on "Account" tab 
	#	Then I create new Renew Account with value "GE Force" 
	
@Renew_CreateAsset 
Scenario: Rally Test Case ID:  : Renew: Asset creation 
	When I click on "All Tabs" tab 
	When I click on "Assets" tab 
	Then I create new Asset with Name "RI Asset" and its Product "Product B" and its Status "Installed" and price "2500" and account "GE Force" 
	When I click on "All Tabs" tab 
	When I click on "Assets" tab 
	Then I create new Asset with Name "RenewAsset" and its Product "Product B" and its Status "Installed" and price "2000" and account "GE Force" 
	When I click on "All Tabs" tab 
	When I click on "Assets" tab 
	Then I create new Asset with Name "CA_CP_AssetRenew" and its Product "Product A" and its Status "Installed" and price "1500" and account "GE Force" 
	When I click on "All Tabs" tab 
	When I click on "Assets" tab 
	Then I create new Asset with Name "PESAssetRenew" and its Product "Product A" and its Status "Installed" and price "500" and account "GE Force" 
	
@Renew_CreateServiceContracts 
Scenario: Rally Test Case ID:  : Renew: Asset creation 
	When I click on "All Tabs" tab 
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "RI SC" with Account "Revenue Industries" and Product "Product B" 
	When I click on "All Tabs" tab 
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "RenewService" with Account "GE Force" and Product "Product B" 
	When I click on "All Tabs" tab 
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "RenewNetOpsSCTest" with Account "GE Force" and Product "Product C" 
	When I click on "All Tabs" tab 
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "SourceSCRenew" with Account "GE Force" and Product "Product C" 
	
@Renew_OppCreation 
Scenario: Renew: Generate Opp
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "PesSrcOpp" with Account "QA Test" and Product "Product B" 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "SplitOpportunity" with Account "QA Test" and Product "Product B" 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "SourceOpportunity" with Account "QA Test" and Product "Product B" 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "CreateOppfromOpp" with Account "QA Test" and Product "Product A" 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "RenewNetOpsService" with Account "QA Test" and Product "Product A" 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "RenewService" with Account "GE Force" and Product "Product B" 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "RenewNetOpsService" with Account "QA Test" and Product "Product A" 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "Split_Target_Opportunity_RU" with Account "QA Test" and Product "Product B" with pricebook "Standard Price Book" 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "N.ew1Opportunity_StNd_Pricebook" with Account "QA Test" and Product "Product B" with pricebook "Standard Price Book" 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "N.ew1Opportunity_Test_Pricebook" with Account "QA Test" and Product "Product B" with pricebook "Test_PriceBook" 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "RenewNetOpsTesting" with Account "QA Test" and Product "Product B"
	When I create Source Opportunity with Line Items with Account "QA Test" and resolve it and rename it as "PES_Invalid_RR" 
	When I create Source Opportunity with Line Items with Account "QA Test" and resolve it and rename it as "PES_Renewal_Opportunity" 
	When I create Source Opportunity with Line Items with Account "QA Test" and resolve it and rename it as "SourceOpportunity9" 
	When I create Source Opportunity with Line Items with Account "QA Test" and resolve it and rename it as "FiscalOpportunity" 
	When I create Source Opportunity with Line Items with Account "QA Test" and resolve it and rename it as "RenewTesting" 
	
@Renew_Service_Contract_OppCreation 
Scenario: Renew: Generate Contract 
	When I click on "All Tabs" tab 
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "Auto_Source_Service_Contract" with Account "QA Test" and Product "Product A" 
	When I click on "All Tabs" tab 
	When I click on "Service Contracts" tab 
	And I select SC and generate Opportunity with Name "Service_Contract_Opp" with Account "QA Test" with User "QA Renew" 
	
@Renew_createView 
Scenario: Renew: View creation 
	When I click on "Accounts" tab 
	And I click "Create New View" link 
	And I Fill for AccountView "QA Test" with "Account Name" with "equals" with "QA Test" 
	When I click on "Opportunities" tab 
	And I click "Create New View" link 
	And I Fill All data for View "OppToOpp" with "Opportunity Name" and "Owner Last Name" with "equals" with "CreateOppfromOpp" and "Renew" 
	When I click on "Opportunities" tab 
	And I click "Create New View" link 
	And I Fill All data for View "ScOpp" with "Opportunity Name" and "Owner Last Name" with "equals" with "Service_Contract_Opp" and "Renew" 
	When I click on "Opportunities" tab 
	And I click "Create New View" link 
	And I Fill All data for View "Renew View" with "Opportunity Name" and "Owner Last Name" with "equals" with "RenewNetOpsTesting" and "Renew" 
	
	
	
	
	