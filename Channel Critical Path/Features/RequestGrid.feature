@Requests
@RequestGridFeature
Feature: All features related to Requests - Request Grid

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@request_grid
Scenario: Rally Test Case ID: TC4342,TC4343,TC4344,TC4345,TC4346 : Request - Request grid, Add/Remove column,Export,Sorting and pagination,Search the Request
    When I click on "Requests" tab
    And I click on the "New Request"
    Then I should be able to see the "New Request" page
    When I enter subject line "Community"
    And I select the Account "PES Channel Account" from drop down
    And I select the Related To "Opportunity" and "Partner_Opportunity" from drop down
    And I select the Request Type "General Assistance" from drop down
    And I select the Priority "High" from drop down
    And I add the "Test_Message" message
    And I click on the "Submit"
    When I click on "Requests" tab
    Then I should able to see the created "Community" request
    When I click on "Requests" tab
    Then I should able to see the "Request Grid" fields
    When I click on the "Kebab Menu" menu button
    And I uncheck the "Request Grid" fields
    Then I should not able to see the "Request Grid" fields
    When I click on "Opportunities" tab
    And I click on "Requests" tab
    Then I should able to see the "Request Grid" fields
    And user sorts by "Subject" in "Ascending" order
    Then files should be sorted by "Subject" in "Ascending" order
    When I click on "Requests" tab
    And user sorts by "Subject" in "Descending" sort order
    Then files should be sorted by "Subject" in "Descending" sort order
    When I click on "Requests" tab
    And I search with account "PES Channel Account" name
    
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
	
