@MasterDataCreation 
Feature: All features related to Renew - Master data creation 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
@CustomPricebooks 
Scenario: Renew: new pricebook 
    When user logout from "RENEW" application
    When I log into "SYSTEMADMIN_EETEST4" details	
    When I click on "All Tabs" tab 
	Then I click on Price Books and create pricebook with the name "Test PriceBook" 
	
@addProducts 
Scenario: Renew: add products 
    #When user logout from "RENEW" application
    #When I log into "SYSTEMADMIN_EETEST4" details	
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
	
@Createnewaccount 
Scenario: Rally Test Case ID:  : Renew: New account creation 
	When I click on "Account" tab 
	Then I create new Renew Account with value "PE Wealth" 
	When I click on "Account" tab 
	Then I create new Renew Account with value "QA Test" 
	
@PlayCreation 
Scenario: Rally Test Case ID : : Creation of Play 
	When I click on "ServiceSource Setup" link 
	And create a new Play with value "Play for Account" and "Account" and "High Risk Description" and its TaskName "PES Play Task" and its task type "Call" and AssignTo "CSM Manager" and Description "Enquiry of Play" and days "10" 
	
@PlaybookCreation 
Scenario: Rally Test Case ID : : Creation of Playbook 
	When I click on "ServiceSource Setup" link 
	And create a new Playbook with value "PES PlayBook" with play "Play for Account" and its Short Description "High Risk Description" and Object "Account" and its TaskName "PES Play Task" and its task type "Call" and AssignTo "CSM Manager" and Description "Enquiry of Play" and days "10" 
	
@CreateIndicatorGroupCreation 
Scenario: Rally Test Case ID : : Create Indicator Group and Add Indicators 
	When I click on "ServiceSource Setup" link 
	Then I create a new Indicator Group with name "CSM Indicator Group" 
	Then I add indicator 
	
@CreateSPTCreation 
Scenario: Rally Test Case ID : : Create Success Plan Template 
	When I click on "ServiceSource Setup" link 
	Then I create a new Success Plan Template with Template Name "PES New SPlan Template" PhaseName "PES SP Template Phase" Days "20" Indicator "Health Status" with PlayBook "PES PlayBook" Criteria1 Type: "Success" Criteria2 Type: "Meet" Criteria3 Type: "Fail" Criteria1: "Healthy" Criteria2: "Low Adoption" Criteria3: "Pending Churn" 
	
@SuccessPlanCreation 
Scenario: Rally Test Case ID: TC2895 : Create Success plan 
	When I click on "Success Plans" tab 
	Then I create a SuccessPlan with template "APT-000002" with Account "Action Machinery Co" 
	
@CreateAsset 
Scenario: Rally Test Case ID:  : Renew: Asset creation 
	When I click on "Assets" tab 
	Then I create new Asset with Name "PEW Asset" and its Product "Product B" and its Status "Installed" and price "2500" and account "QA Test" 
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
	
@Service_Contract_OppCreation 
Scenario: Renew: Generate Contract 
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "SourceServiceContract" with Account "QA Test" and Product "Product A" 
	When I click on "Service Contracts" tab 
	And I select SC and generate Opportunity with Name "Service_Contract_Opp" with Account "QA Test" 
	
	
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
	Then I create new opportunity with Name "SplitOpportunity" with Account "QA Test" and Product "Product B" 
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
	
@PES_Renewal_OpportunityresolveRenameOpp 
Scenario: Renew: Generate Opp 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "Source-RenewNetOpsTesting" with Account "QA Test" and Product "Product B" 
	Then I resolved the Source Opportunity and rename with name "RenewNetOpsTesting" 
	When I create Source Opportunity with Line Items and resolve it and rename it as "PES_Renewal_Opportunity" 
	
@FiscalOpportunityresolveRenameOpp 
Scenario: Renew: Generate Opp 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "Source-RenewNetOpsTesting" with Account "QA Test" and Product "Product B" 
	Then I resolved the Source Opportunity and rename with name "RenewNetOpsTesting" 
	When I create Source Opportunity with Line Items and resolve it and rename it as "FiscalOpportunity" 
	

	
	#@assignPricebooktoProduct 
	#Scenario: Renew: assign pricebook to products 
	#	When I click on the "All Tabs" grid tab 
	#	Then I click on  pricebook "Test PriceBook" 
	#	Then I add "Product A", "Product B", "Product c", "Product D" , "Installation: Industrial - High" and "GenWatt Diesel 10kW" 
	#	
	
	
  