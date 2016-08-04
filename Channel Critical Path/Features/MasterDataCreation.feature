@MasterDataCreationChannel 
Feature: All features related to Channel Manager - Master data creation 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
@CreationAsset 
Scenario: Channel  :Asset creation 
	When I click on "Assets" tab 
	Then I create new Asset with Name "My_PES_Asset" and its Product "Product B" and its Status "Installed" and price "2500" and account "PES Channel Account" 
	
@CreationServiceContracts 
Scenario: Channel : Service Contract creation 
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "PES_Service_Contract" with Account "PES Channel Account" and Product "Product B" 
	
@Createsourceopportunity 
Scenario: Channel  :Asset creation 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "PES_SplitOpp" with Account "PES Channel Account" and Product 
	
@RenewalOpportunityCreation 
Scenario: Channel: Generate Renew Opp 
	When I create Source Opportunity with Line Items with Account "PES Channel Account" and resolve it and rename it as "PES_Add_Partner" 
	When I create Source Opportunity with Line Items with Account "PES Channel Account" and resolve it and rename it as "PES_Split_Target_Opp" 
	
@PartnerOpportunityCreation 
Scenario: Channel: Generate Partner Opportunity 
	When I create Source Opportunity with Line Items with Account "PES Channel Account" and resolve it and rename it as "PES_Pipeline_Opportunity" 
	And I click on "Add New Partner Opportunity" button 
	And I select partner account one "PES Channel Account" 
	And I navigate to "Partner Contact(s)" section 
	And I select the partner account one contact "PES Channel User" from the contacts lookup list 
	And I select the partner account one as "Reseller" 
	And I select partner account two "PES Channel Account" 
	And I navigate to "Partner Contact(s)" section 
	And I select the partner account two contact "PES Channel User" from the contacts lookup list 
	And I select the partner account two as "Distributor" 
	And I rename the partner opportunity as "PES_Orange_Pipeline" 
	And I click on the "Grant Access" 
	
	When I create Source Opportunity with Line Items with Account "PES Channel Account" and resolve it and rename it as "TwoTierAutomationRO" 
	And I click on "Add New Partner Opportunity" button 
	And I select partner account one "Automation Reseller" 
	And I navigate to "Partner Contact(s)" section 
	And I select the partner account one contact "" from the contacts lookup list 
	And I select the partner account one as "Reseller" 
	And I select partner account two "Automation Distributor" 
	And I navigate to "Partner Contact(s)" section 
	And I select the partner account two contact "" from the contacts lookup list 
	And I select the partner account two as "Distributor" 
	And I select the "To Master Opportunity" option from syncing dropdown 
	And I rename the partner opportunity as "TwoTierAutomationPO" 
	And I click on the "Grant Access" 
	And I navigate to Opportunity from partner Opportunity page 
	And I navigate to synced quote details page from opportunity 
	And I rename the quote as "ResellerQuote" 
	
	When I create Source Opportunity with Line Items with Account "PES Channel Account" and resolve it and rename it as "PES_CHL_Opp" 
	And I click on "Add New Partner Opportunity" button 
	And I select partner account one "PES Channel Account" 
	And I navigate to "Partner Contact(s)" section 
	And I select the partner account one contact "PES Channel User" from the contacts lookup list 
	And I select the partner account one as "Reseller" 
	And I rename the partner opportunity as "Portal Agreement" 
	And I click on the "Grant Access" 
	And I navigate to Opportunity from partner Opportunity page 
	And I click on "Add New Partner Opportunity" button 
	And I select partner account one "PES Channel Account" 
	And I navigate to "Partner Contact(s)" section 
	And I select the partner account one contact "PES Channel User" from the contacts lookup list 
	And I select the partner account one as "Reseller" 
	And I rename the partner opportunity as "Partner Agreement" 
	And I click on the "Grant Access" 
	And I navigate to Opportunity from partner Opportunity page 
	And I click on "Add New Partner Opportunity" button 
	And I select partner account one "PES Channel Account" 
	And I navigate to "Partner Contact(s)" section 
	And I select the partner account one contact "PES Channel User" from the contacts lookup list 
	And I select the partner account one as "Reseller" 
	And I select partner account two "PES Channel Account" 
	And I navigate to "Partner Contact(s)" section 
	And I select the partner account two contact "PES Channel User" from the contacts lookup list 
	And I select the partner account two as "Distributor" 
	And I rename the partner opportunity as "PES_NeedStatusUpdate" 
	And I click on the "Grant Access" 
	
		 