@Opportunities 
@OpportunityGridFeature 
Feature: All features related to Opportunities - Opportunity Grid 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
@opportunity_grid 
Scenario: 
	Rally Test Case ID: TC4367,TC4368,TC4369,TC4370,TC4371,TC4372: Opportunity - Data grid columns,Adding/Removing Columns,Grid Sorting,Export,Search 
	When I click on "Opportunities" tab 
	Then I should able to see the "Opportunity Grid" columns 
	When I click on the "Kebab Menu" menu button 
	And I uncheck the "Opportunity Grid" fields from "Opportunities" page 
	Then I should not able to see the "Opportunity Grid" fields from "Opportunities" page 
	When I click on "Requests" tab 
	And I click on "Opportunities" tab 
	Then I should able to see the "Opportunity Grid" columns 
	When I click on the "Kebab Menu" menu button 
	And I click on the "Export all data as CSV" field 
	And I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	And I select the "Need Status Updates" filter value 
	And user sorts by "Name" in "Ascending" order from "Opportunities" page 
	Then files should be sorted by "Name" in "Ascending" order from "Opportunities" page 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	And I select the "Need Status Updates" filter value 
	And user sorts by "Name" in "Descending" sort order from "Opportunities" page 
	Then files should be sorted by "Name" in "Descending" sort order from "Opportunities" page 
	When I click on "Opportunities" tab 
	And I search with account "PES Channel Account" name from "Opportunities" page 
	Then I verify the grid scroll up and scroll down the page and default pagination value 
	
	
@editing_field_opportunity 
Scenario: 
	Rally Test Case ID: TC4373,TC4374,TC4375,TC4376,TC4377 : Opportunity - Inline field editing 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	And I select the "Open Opportunities" filter value 
	And I update the "PES_Add_Partner" column values 
	Then I verify the "Reseller Rep" and "Distributor Rep" column where Rep is not yet selected 
	When I select the "Reseller Rep" and "Distributor Rep" and verify the selected rip value 
	
	
@update_the_status_fields 
Scenario: 
	Rally Test Case ID: TC4378,TC4379,TC4380 : Update the status (True to False),Change the field which is not defined on admin screen and check the needs update flag,Update Status date display(flag is False) 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	And I select the "Need Status Updates" filter value 
	And I update the "Sales Stage" sales field 
	Then I verify the updated "Sales Stage" sales field 
	And I verify the last status update "Current Date" field 
	When I update the "Probability" field 
	Then I verify the updated "Probability" field 
	
	
@update_dialogue_box 
Scenario: 
	Rally Test Case ID: TC4381,TC4382,TC4383,TC4384,TC4385 : Opportunity - Toggle the field from TRUE to FALSE or vice versa,Update dialogue box,Update dialogue box - No Change button,Update dialogue box - Update status,Close the Dialogue box 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	And I select the "Need Status Updates" filter value 
	And I click on "Update" icon 
	Then I should be able to see the "No Change" and "Update" buttons 
	When I enter status is "FALSE" and click on the "No Change" button 
	And I click on "Opportunities" tab 
	And I enter status is "FALSE" and click on "Update" button 
	And I click on "Opportunities" tab 
	And I enter status is "TRUE" and click on the "No Change" button 
	And I click on "Opportunities" tab 
	And I enter status is "TRUE" and click on "Update" button 
	And I click on "Opportunities" tab 
	And I click close the "Status Update" dialogue box 
	Then I should not able to see the "Status Update" dialogue box 
	
	
@download_quote_attachment 
Scenario: 
	Rally Test Case ID: TC4461,TC4462,TC4463 : Opportunity grid - Download attachment - Sales Force Quotes pdf 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	Then I should able to see the "Opportunity Grid" columns 
	When I search with the "PES_Add_Partner_Attachment" opportunities 
	Then I should able to see the "Opportunity Grid" columns 
	When I click on "PES_Add_Partner_Attachment" link from "Opportunities" page 
	
@RequestfromOpportunity_FieldVerification 
Scenario:
Rally Test Case ID: TC6351: Opportunity grid - new request page field verification 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	Then I click on Request icon 
	Then I should be able to see the "New Request" page 
	
@RequestfromOpportunity_auotpopulatedfields 
Scenario:
Rally Test Case ID: TC6352, TC6353 and TC6356: Opportunity grid - request page autopopulate fields 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	Then I should able to see partner opportunities account
	Then I should able to see partner opportunity name
	And I click on Request icon 
	When I enter subject line "Community - new request from Opportunity" 
	Then I should be able to see autopupulated account 
	Then I should be able to see autopupulated opportunity name 
	And I select the opportunity-quote Request Type "General Assistance" from drop down 
	And I select the opportunity-request-Priority "Low" from drop down 
	And I add the "Test_Message_new request created with attachment" message
	And I click on the "Submit" 
	When I click on "Requests" tab 
	Then I should able to see the created "Community" request 
	And I click on the "Request Number" link 
	 
	
@RequestfromOpportunity_RequestTypeandPriority_values 
Scenario:
Rally Test Case ID: TC6354,TC6355: 	Opportunities - New Request- Request Type and Priority Field Check 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	Then I click on Request icon 
	And I select the Request Type "General Assistance" from drop down 
	And I select the Priority "Low" from drop down
		
	
@RequestfromOpportunity_Quote 
Scenario: Rally Test Case ID:TC6358,TC6357: Opportunity grid - request - Quote Object 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	Then I click on Request icon 
	When I enter subject line "Community- Quote related  request from Opportunity" 
	And I select the Account "PES Channel Account" from drop down 
	And I select the Related To Quote from drop down 
	And I select the opportunity-quote Request Type "General Assistance" from drop down 
	And I select the opportunity-request-Priority "Low" from drop down 
	And I add the "Test_Message_quote related request from opportunity" message 
	And I click on the "Submit" 
	When I click on "Requests" tab 
	Then I should able to see the created "Community" request 
	And I click on the "Request Number" link 
	
	
@RequestfromOpportunity_Asset 
Scenario: Rally Test Case ID:TC6358,TC6357: Opportunity grid - request - Asset Object 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	Then I click on Request icon 
	When I enter subject line "Community- Asset related  request from Opportunity" 
	And I select the Account "PES Channel Account" from drop down 
	And I select the Related To Asset from drop down 
	And I select the opportunity-quote Request Type "Pricing Request" from drop down 
	And I select the opportunity-request-Priority "High" from drop down 
	And I add the "Test_Message_asset related request from opportunity" message 
	And I click on the "Submit" 
	When I click on "Requests" tab 
	Then I should able to see the created "Community" request 
	And I click on the "Request Number" link 
	
	
@RequestfromOpportunity_ServiceContract 
Scenario: Rally Test Case ID:TC6358,TC6357: Opportunity grid - request - Service Contract Object 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	Then I click on Request icon 
	Then I should be able to see the "New Request" page 
	When I enter subject line "Community- Service Contract related  request from Opportunity" 
	And I select the Account "PES Channel Account" from drop down 
	And I select the Related To Service Contract from drop down 
	And I select the opportunity-quote Request Type "Data Access" from drop down 
	And I select the opportunity-request-Priority "Medium" from drop down 
	And I add the "Test_Message_service contract related request from opportunity" message 
	And I click on the "Submit" 
	When I click on "Requests" tab 
	Then I should able to see the created "Community" request 
	And I click on the "Request Number" link 
	
	
@RequestfromOpportunity_Opportunity 
Scenario: Rally Test Case ID:TC6358,TC6357: Opportunity grid - request - Opportunity Object 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	Then I click on Request icon 
	When I enter subject line "Community- Opportunity related  request from Opportunity" 
	And I select the Account "PES Channel Account" from drop down 
	And I select the Related To Opportunity from drop down 
	And I select the opportunity-quote Request Type "Data Update" from drop down 
	And I select the opportunity-request-Priority "Low" from drop down 
	And I add the "Test_Message_opportunity related request from opportunity" message 
	And I click on the "Submit" 
	When I click on "Requests" tab 
	Then I should able to see the created "Community" request 
	And I click on the "Request Number" link 
	
		
@RequestfromOpportunity_CancelRequest 
Scenario:
Rally Test Case ID:TC6359: Opportunity grid - request page - Cancel 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	And I click on Request icon 
	Then I click on Cancel button
	
@verify_the_distributor_reseller 
Scenario: 
	Rally Test Case ID: TS5484,TS5486,TS5488,TS5490 - Two Tier Pricing - Distributor to see both Reseller Quote & Distributor Quote on the partner Renewal Opportunity grid,Reseller to see only the Reseller Quote & not the Distributor Quote Value,Distributor  Quote syncing on opportunity grid,Reseller to choose the Reseller Quote from the latest quote column but syncing happens of the Distributor Quote 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	And I select the "Need Status Updates" filter value 
	Then I able to see the "Reseller Quotes" and "Distributor Quotes" quotes 
	And I verify the "Reseller Quotes" quotes 
	And I verify the "Reseller Quotes" quote amount 
	
	
@distributor_reseller_quotes 
Scenario: 
	Rally Test Case ID: TS5485,TS5487,TS5489,TS5491 - Two Tier Pricing - Distributor to see both Reseller Quote & Distributor Quote on the quote sub tab,Reseller to see only the Reseller Quote & not the Distributor Quote Value,Distributor  Quote Primary quote,Reseller to choose the Reseller Quote as primary but syncing happens of the Distributor Quote 
	When user logs out from channel partner community 
	And I user login in to "Channel Netops" app 
	Then I should able to see the "Channel Netops" page 
	When I Navigate to "ServiceSource Setup" tab 
	And I click on "Channel Portal Configuration" link 
	And I check the "Enable 2 Tier Pricing" checkbox 
	And I click on "Save" button from "Channel Portal Configuration" page 
	And user logout from "ChannelNetops" application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	And I select the "Need Status Updates" filter value 
	And I search with opportunity 
	And I navigate to the "Quotes" page 
	Then I verify the "Distributor" and "Reseller" quotes 
	When user logs out from channel partner community 
	And I user login in to "Channel Netops" app 
	Then I should able to see the "Channel Netops" page 
	When I Navigate to "ServiceSource Setup" tab 
	And I click on "Channel Portal Configuration" link 
	And I uncheck the "Enable 2 Tier Pricing" checkbox 
	And I click on "Save" button from "Channel Portal Configuration" page 
	And user logout from "ChannelNetops" application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	When I click on "Opportunities" tab 
	And I verify the current expiration quarter value in Expiration Quarter filter 
	And I verify the current expiration year value in Expiration Year filter 
	And I select the "Need Status Updates" filter value 
	And I search with opportunity 
	Then I see the reseller and distributor quotes 
