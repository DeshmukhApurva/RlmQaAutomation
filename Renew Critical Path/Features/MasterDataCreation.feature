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
	
#@PlayCreation 
#Scenario: Rally Test Case ID : : Creation of Play 
#	When I click on "ServiceSource Setup" link 
#	And create a new Play with value "Play for Account" and "Account" and "High Risk Description" and its TaskName "PES Play Task" and its task type "Call" and AssignTo "CSM Manager" and Description "Enquiry of Play" and days "10" 
#	
#@PlaybookCreation 
#Scenario: Rally Test Case ID : : Creation of Playbook 
#	When I click on "ServiceSource Setup" link 
#	And create a new Playbook with value "PES PlayBook" with play "Play for Account" and its Short Description "High Risk Description" and Object "Account" and its TaskName "PES Play Task" and its task type "Call" and AssignTo "CSM Manager" and Description "Enquiry of Play" and days "10" 
	
#	@CreateIndicatorGroupCreation 
#	Scenario: Rally Test Case ID : : Create Indicator Group and Add Indicators 
#		When I click on "ServiceSource Setup" link 
#		Then I create a new Indicator Group with name "CSM Indicator Group" 
#		Then I add indicator 
	
#@CreateSPTCreation 
#Scenario: Rally Test Case ID : : Create Success Plan Template 
#	When I click on "ServiceSource Setup" link 
#	Then I create a new Success Plan Template with Template Name "PES New SPlan Template" PhaseName "PES SP Template Phase" Days "20" Indicator "Health Status" with PlayBook "PES PlayBook" Criteria1 Type: "Success" Criteria2 Type: "Meet" Criteria3 Type: "Fail" Criteria1: "Healthy" Criteria2: "Low Adoption" Criteria3: "Pending Churn" 
	
#@SuccessPlanCreation 
#Scenario: Rally Test Case ID: TC2895 : Create Success plan 
#	When I click on "Success Plans" tab 
#	Then I create a SuccessPlan with template "APT-000716" with Account "QA Test" 

@renewManagement	
Scenario: Rally Test Case ID:  : Renew: Setup 
    When I click on "All Tabs" tab 
    When I Navigate to "ServiceSource Setup" tab 
	And I click on "Opportunity Generation" link 
	And I select the "Enable Generation of Opportunities" checkbox on opp generation 
	And I add criteria for Sale Stage
    And I delete Product Criteria
    When I click on "All Tabs" tab
    When I Navigate to "ServiceSource Setup" tab 
    And I click on "Install Base Data Rules" link
    And I enable "Enable Generation of Assets" checkbox
    And I enable "Enable Generation of Service Contract" checkbox 
    And I add criteria for Sale Stage
    And I delete Product Criteria
    When I click on "All Tabs" tab 
    When I Navigate to "ServiceSource Setup" tab 
	And I click on "Opportunity Updates" link 
    And I unselect the "Update opportunities when the following service contract line item fields change" 
    And I unselect the "Update opportunities when the following assets fields change"
    And I unselect the "Update opportunities when new service contract line items are created"

@renewManagementMApping
Scenario: Rally Test Case ID:  : Renew: Setup 
    When I click on "All Tabs" tab 
    When I Navigate to "ServiceSource Setup" tab  
    And I click on "Mappings" link
    And I select first Mapping
    And I Put Sales Stage as "Prospecting" 
    And I Put Close Date as "2018/10/10"
    And I Put Owner ID as "Created By ID"
    And I Add Opportunity Fields on "Account ID" and "Account ID"
    And I Add Mapping Fields "Sales Price" and Mapping Field "Price"
    And I Go to next Maping with Value "Opportunity → Renewal Opportunity"
    And I Put Sales Stage as "Prospecting" 
    And I Put Close Date as on Opp "Close Date"
    And I Put Owner ID as "Owner ID"
    And I Add Opportunity Fields on "Account ID" and "Account ID"
    And I Add Mapping Fields on oppTorr "Sales Price" and Mapping Field "Sales Price"
    And I Go to next Maping with Value "Opportunity Line Item → Asset"
    And I Add Mapping Fields on Asset "Price" and Mapping Field "Sales Price" 
    And I Go to next Maping with Value "Service Contract → Opportunity"
    And I Put Sales Stage as "Prospecting" 
    And I Put Close Date as "2018/10/10"
    And I Add Opportunity Fields on "Account ID" and "Account ID"
    And I Add Mapping Fields on scTopp "Sales Price" and Mapping Field "Sales Price"
    And I Go to next Maping with Value "Renewal Relationship → Opportunity Line Item"
    And I Add Mapping Fields on scTopp "Sales Price" and Mapping Field "Previous Price"
    And I Go to next Maping with Value "Opportunity Line Item → Renewal Relationship"
    And I Put Owner ID as "Created By ID"
    And I Go to next Maping with Value "Renewal Status"
    And I Choose Lost Value with "Lost"
    And I Choose Open Value with "Open"
    And I Choose Won Value with "Won"
    And I Save All Data

@createView
Scenario: Renew: View creation
    When I click on "Opportunities" tab
    And I click "Create New View" link
    And I Fill All data for View "OppToOpp" with "Opportunity Name" and "Owner Last Name" with "equals" with "CreateOppfromOpp" and "RenewNetOps"
    And I Fill All data for View "ScOpp" with "Opportunity Name" and "Owner Last Name" with "equals" with "Service_Contract_Opp" and "RenewNetOps"
    And I Fill All data for View "Renew View" with "Opportunity Name" and "Owner Last Name" with "equals" with "RenewNetOpsTesting" and "RenewNetOps"
    And I Fill All data for View "RenewNetOpsSCTest" with "Opportunity Name" and "Owner Last Name" with "equals" with "CreateOppfromOpp" and "RenewNetOps"
    
#@CreateAsset 
#Scenario: Rally Test Case ID:  : Renew: Asset creation 
#	When I click on "Assets" tab 
#	Then I create new Asset with Name "PEW Asset" and its Product "Product B" and its Status "Installed" and price "2500" and account "QA Test" 
#	When I click on "Assets" tab 
#	Then I create new Asset with Name "CA_CP_Asset" and its Product "Product B" and its Status "Installed" and price "2000" and account "QA Test" 
#	When I click on "Assets" tab 
#	Then I create new Asset with Name "PESAsset" and its Product "Product A" and its Status "Installed" and price "1500" and account "QA Test" 
#	When I click on "Assets" tab 
#	Then I create new Asset with Name "RenewNetOpsAsset" and its Product "Product A" and its Status "Installed" and price "500" and account "QA Test" 
#	When I click on "Assets" tab 
#	Then I create new Asset with Name "IBDRAsset" and its Product "Product A" and its Status "Installed" and price "3000" and account "QA Test" 
#	
#@CreateServiceContracts 
#Scenario: Rally Test Case ID:  : Renew: Asset creation 
#	When I click on "Service Contracts" tab 
#	Then I create new Service Contracts with Name "PEW SC" with Account "PE Wealth" and Product "Product B" 
#	When I click on "Service Contracts" tab 
#	Then I create new Service Contracts with Name "RenewNetOpsSCTest" with Account "QA Test" and Product "Product B" 
#	When I click on "Service Contracts" tab 
#	Then I create new Service Contracts with Name "SourceServiceContract" with Account "QA Test" and Product "Product C" 
#	
#@Service_Contract_OppCreation 
#Scenario: Renew: Generate Contract 
#	When I click on "Service Contracts" tab 
#	Then I create new Service Contracts with Name "Source_Service_Contract" with Account "QA Test" and Product "Product A" 
#	When I click on "Service Contracts" tab 
#	And I select SC and generate Opportunity with Name "Service_Contract_Opp" with Account "QA Test" with User "QA RenewNetOps" 
#	
#	
#@CreatemasterdataforAddOnRenewalOpp 
#Scenario: Renew: Add on Renewals creation 
#	When I click on "Opportunities" tab 
#	Then I create new opportunity with Name "SourceOpportunity" with Account "QA Test" and Product "Product B" 
#	When I click on "Service Contracts" tab 
#	Then I create new Service Contracts with Name "RenewNetOpsService" with Account "QA Test" and Product "Product A" 
#	
#@OppCreation 
#Scenario: Renew: Generate Opp 
##	When I click on "Opportunities" tab 
##	Then I create new opportunity with Name "PesSrcOpp" with Account "QA Test" and Product "Product B" 
##	When I click on "Opportunities" tab 
##	Then I create new opportunity with Name "SplitOpportunity" with Account "QA Test" and Product "Product B" 
##	When I click on "Opportunities" tab 
##	Then I create new opportunity with Name "SourceOpportunity09" with Account "QA Test" and Product "Product B" 
##	When I click on "Opportunities" tab 
##	Then I create new opportunity with Name "CreateOppfromOpp" with Account "QA Test" and Product "Product A" 
##	When I click on "Opportunities" tab 
##	Then I create new opportunity with Name "RenewNetOpsService" with Account "QA Test" and Product "Product A" 
##	When I click on "Opportunities" tab 
##	Then I create new opportunity with Name "Split_Target_Opportunity_RN" with Account "QA Test" and Product "Product B" with pricebook "Standard Price Book" 
##	When I click on "Opportunities" tab 
##	Then I create new opportunity with Name "N.ew1Opportunity_StNd_Pricebook" with Account "QA Test" and Product "Product B" with pricebook "Standard Price Book" 
##	When I click on "Opportunities" tab 
##	Then I create new opportunity with Name "N.ew1Opportunity_Test_Pricebook" with Account "QA Test" and Product "Product B" with pricebook "Test_PriceBook" 
#	When I create Source Opportunity with Line Items with Account "QA Test" and resolve it and rename it as "PES_Invalid_RR" 
#	
#	
#@PES_Renewal_OpportunityresolveRenameOpp 
#Scenario: Renew: Generate Opp 
#	When I click on "Opportunities" tab 
#	Then I create new opportunity with Name "Source-RenewNetOpsTesting" with Account "QA Test" and Product "Product B" 
#	Then I resolved the Source Opportunity and rename with name "RenewNetOpsTesting" 
#	When I create Source Opportunity with Line Items with Account "QA Test" and resolve it and rename it as "PES_Renewal_Opportunity" 
#	
#@FiscalOpportunityresolveRenameOpp 
#Scenario: Renew: Generate Opp 
#	When I create Source Opportunity with Line Items with Account "QA Test" and resolve it and rename it as "FiscalOpportunity" 
#	
#@Batch_generation_Activity
#Scenario: Renew: Batch_generation_Activity 	
#	When I click on "ServiceSource Setup" link
#	And I click on "Batch Generation Activity" link
#	And I click on create new Batch
##	And I create Asset filter for batch
##	And I put view Name for Asset Filter "Filter 1" and add criteria
##	And I create Asset filter for batch
##	And I put view Name for Asset Filter "Filter 2" with two criteria
##	And I create Asset filter for batch
##	And I put view Name for Asset Filter "Filter 3" and add criteria
##	And I create Asset filter for batch
##	And I put view Name for Asset Filter "Filter 4" and add criteria
##	And I create Asset filter for batch
##	And I put view Name for Asset Filter "Filter 5" and add criteria
##	And I create Asset filter for batch
##	And I put view Name for Asset Filter "Filter 6" and add criteria
#	And I create Group Logic for batch
#    And I put view Name for Asset Filter "Grouping 1" and add Row
#    And I create Group Logic for batch
#    And I put view Name for Asset Filter "Grouping 2" and add Row
#    And I create Group Logic for batch
#    And I put view Name for Asset Filter "Grouping 3" and add Row
#    And I create Group Logic for batch
#    And I put view Name for Asset Filter "Grouping 4" and add Row
#    And I create Group Logic for batch
#    And I put view Name for Asset Filter "Grouping 5" and add Row
#    And I create Group Logic for batch
#    And I put view Name for Asset Filter "Grouping 6" and add Row
#
#	