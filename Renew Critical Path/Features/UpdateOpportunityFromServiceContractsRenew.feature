@RenOpportunityManagement
@RenUpdateOpportunityFromServiceContractsFeature
Feature: All features related to Renew user - Opportunity Management - Update Opportunity From Service Contracts

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@ren_service_contracts_line_item
Scenario: Rally Test Case ID: TC3387: Opportunity Updates - Service Contract Line Item Change on Add/Edit
	When I click on "Opportunities" link
	#And I go to existing renewal opportunities
	Then I select SCOpp view
	And I click on the Go button if present
	And I click on "Service_Contract_Opp" link
	And I click on service contract link
	And I update the service contract line item fields
	Then I verify that renewal opportunity update accordingly
	When I click on "Service Contracts" link
	And I click on "New" button
	And I enter mandatory details
	Then I should able to see the created "Service Contracts"