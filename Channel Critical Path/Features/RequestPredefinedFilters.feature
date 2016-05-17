@Requests
@RequestPredefinedFiltersFeature
Feature: All features related to Requests - Request Predefined Filters

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page

@verifyRequestFilters
Scenario: Rally Test Case ID: TC4347,TC4348,TC4349 : Request - Predefined filters,Request - Closed Request,Request - All Request
	When I Navigate to "Requests" tab
	And I check "PredefinedFilters"
	And I select "My Closed Requests"
	And I verify requests for "My Closed Requests" 
	And I select "All Requests"
	And I verify "All Requests" records