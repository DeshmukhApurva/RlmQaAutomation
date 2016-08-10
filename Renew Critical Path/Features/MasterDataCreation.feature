@MasterDataCreation 
Feature: All features related to Renew - Master data creation 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
	#@Createnewaccount 
	#Scenario: Rally Test Case ID:  : Renew: New account creation 
	#	When I click on "Account" tab 
	#	Then I create new Renew Account with value "PE Wealth" 
	#	When I click on "Account" tab 
	#	Then I create new Renew Account with value "QA Test" 
	
@PlayCreation 
Scenario: Rally Test Case ID : : Creation of Play 
	When I click on "ServiceSource Setup" link 
	And create a new Play with value "Play for Account" and "Account" and "High Risk Description" and its TaskName "PES Play Task" and its task type "Call" and AssignTo "CSM Manager" and Description "Enquiry of Play" and days "10" 
	
@PlaybookCreation 
Scenario: Rally Test Case ID : : Creation of Playbook 
	When I click on "ServiceSource Setup" link 
	And create a new Playbook with value "PES PlayBook" with play "Play for Account" and its Short Description "High Risk Description" and Object "Account" and its TaskName "PES Play Task" and its task type "Call" and AssignTo "CSM Manager" and Description "Enquiry of Play" and days "10" 
	
	#@CreateIndicatorGroupCreation 
	#Scenario: Rally Test Case ID : : Create Indicator Group and Add Indicators 
	#	When I click on "ServiceSource Setup" link 
	#	Then I create a new Indicator Group with name "CSM Indicator Group" 
	#	Then I add indicator 
	
@CreateSPTCreation 
Scenario: Rally Test Case ID : : Create Success Plan Template 
	When I click on "ServiceSource Setup" link 
	Then I create a new Success Plan Template with Template Name "PES New SPlan Template" PhaseName "PES SP Template Phase" Days "20" Indicator "Health Status" with PlayBook "PES PlayBook" Criteria1 Type: "Success" Criteria2 Type: "Meet" Criteria3 Type: "Fail" Criteria1: "Healthy" Criteria2: "Low Adoption" Criteria3: "Pending Churn" 
	
@SuccessPlanCreation 
Scenario: Rally Test Case ID: TC2895 : Create Success plan 
	When I click on "Success Plans" tab 
	Then I create a SuccessPlan with template "APT-000025" with Account "Action Machinery Co" 
	
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
	Then I create new Service Contracts with Name "Source_Service_Contract" with Account "QA Test" and Product "Product A" 
	When I click on "Service Contracts" tab 
	And I select SC and generate Opportunity with Name "Service_Contract_Opp" with Account "QA Test" with User "QA RenewNetOps" 
	
	
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
	Then I create new opportunity with Name "Split_Target_Opportunity_RN" with Account "QA Test" and Product "Product B" with pricebook "Standard Price Book" 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "N.ew1Opportunity_StNd_Pricebook" with Account "QA Test" and Product "Product B" with pricebook "Standard Price Book" 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "N.ew1Opportunity_Test_Pricebook" with Account "QA Test" and Product "Product B" with pricebook "Test_Pricebook" 
	When I create Source Opportunity with Line Items with Account "QA Test" and resolve it and rename it as "PES_Invalid_RR" 
	
	
@PES_Renewal_OpportunityresolveRenameOpp 
Scenario: Renew: Generate Opp 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "Source-RenewNetOpsTesting" with Account "QA Test" and Product "Product B" 
	Then I resolved the Source Opportunity and rename with name "RenewNetOpsTesting" 
	When I create Source Opportunity with Line Items with Account "QA Test" and resolve it and rename it as "PES_Renewal_Opportunity" 
	
@FiscalOpportunityresolveRenameOpp 
Scenario: Renew: Generate Opp 
	When I create Source Opportunity with Line Items with Account "QA Test" and resolve it and rename it as "FiscalOpportunity" 
	
@Batch_generation_Activity
Scenario: Renew: Batch_generation_Activity 	
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on create new Batch
	And I create Asset filter for batch
	And I put view Name for Asset Filter "Asset Filter 1" and add criteria
#	And I create Asset filter for batch
#	And I put view Name for Asset Filter "Asset Filter 2" with two criteria
	And I create Asset filter for batch
	And I put view Name for Asset Filter "Asset Filter 3" and add criteria
	And I create Asset filter for batch
	And I put view Name for Asset Filter "Asset Filter 4" and add criteria
	And I create Asset filter for batch
	And I put view Name for Asset Filter "Asset Filter 5" and add criteria
	And I create Asset filter for batch
	And I put view Name for Asset Filter "Asset Filter 6" and add criteria
	And I create Group Logic for batch
    And I put view Name for Asset Filter "Group Logic 1" and add Row
    And I create Group Logic for batch
    And I put view Name for Asset Filter "Group Logic 2" and add Row
    And I create Group Logic for batch
    And I put view Name for Asset Filter "Group Logic 3" and add Row
    And I create Group Logic for batch
    And I put view Name for Asset Filter "Group Logic 4" and add Row
    And I create Group Logic for batch
    And I put view Name for Asset Filter "Group Logic 5" and add Row
    And I create Group Logic for batch
    And I put view Name for Asset Filter "Group Logic 6" and add Row

	