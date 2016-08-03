@MasterDataCreationChannel 
Feature: All features related to Channel Manager - Master data creation 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
@CreateNewAccount 
Scenario: Rally Test Case ID:  : Renew: New account creation 
	When I click on "Account" tab 
	Then I create new Channel Account with value "PES Channel Account" with AccountNumber "QA-0001"
 
@CreationAsset 
Scenario: Rally Test Case ID:  : Renew: Asset creation 
	When I click on "Assets" tab 
	Then I create new Asset with Name "My_PES_Asset" and its Product "Product B" and its Status "Installed" and price "2500" and account "PES Channel Account" 

@CreationServiceContracts 
Scenario: Rally Test Case ID:  : Renew: Asset creation 
	When I click on "Service Contracts" tab 
	Then I create new Service Contracts with Name "PES_Service_Contract" with Account "PES Channel Account" and Product "Product B" 
 
@RenewalOpportunityCreation 
Scenario: Renew: Generate Renew Opp 
    When I click on "Opportunities" tab 
	Then I create new opportunity with Name "Source-ChannelOpsTesting" with Account "PES Channel Account" and Product "Product B" 
	Then I resolved the Source Opportunity and rename with name "ChannelOpsTesting" 
	When I create Source Opportunity with Line Items and resolve it and rename it as "PES_Add_Partner" 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "Source-ChannelOpsTesting" with Account "PES Channel Account" and Product "Product B" 
	Then I resolved the Source Opportunity and rename with name "ChannelOpsTesting" 
	When I create Source Opportunity with Line Items and resolve it and rename it as "PES_Pipeline_Opportunity" 
	When I click on "Opportunities" tab 
	Then I create new opportunity with Name "Source-ChannelOpsTesting" with Account "PES Channel Account" and Product "Product B" 
	Then I resolved the Source Opportunity and rename with name "ChannelOpsTesting" 
	When I create Source Opportunity with Line Items and resolve it and rename it as "PES_CHL_Opp" 

@PartnerOpportunityCreation
Scenario: Channel: Generate Partner Opportunity 
     When I create Source Opportunity with Line Items and resolve it and rename it as "PES_Pipeline_Opportunity" 
     And I click on "Add New Partner Opportunity" button
     And I select partner account one "PES Channel Account"
     And I navigate to "Partner Contact(s)" section
     And I select the partner account one contact "PES Channel User" from the contacts lookup list
     And I select the partner account one as "Reseller"
     And I select partner account two "PES Channel Account"
     And I navigate to "Partner Contact(s)" section
     And I select the partner account two contact "PES Channel User" from the contacts lookup list
     And I select the partner account two as "Distributor"
     And I rename the partner opportunity name as "PES_Orange_Pipeline"
     And I click on the "Grant Access"
     
      
     
     
     
    
		 