@ServiceSourceSetUp
@UpdateOpportunityFromServiceContractsFeature
Feature: All features related to Service Source setup - Update Opportunity From Service Contracts

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@service_contracts_line_item
Scenario: Rally Test Case ID: TC3414,TC3415,TC3416,TC3417: Opportunity Updates - Service Contract Line Item Change on Add/Edit
	When I click on "ServiceSource Setup" link
	And I click on "Opportunity Generation" link
	And I select the "Enable Generation of Opportunities" checkbox on opp generation
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity → Renewal Opportunity" link
	And I Add Opportunity Fields "Account ID" and "Save"
	And I save the Mapping
	When I click on "ServiceSource Setup" link
	And I click on "Opportunity Updates" link
	And I select the "Update opportunities when the following service contract line item fields change" checkbox
	And I add multiple criteria for service contract line item fields and clear filter logic
	And I add asset criteria and multiple filters logic "1 AND 2 OR 3" and "1 OR 2 OR 3"
	When I click on "Opportunities" link
	And I go to existing renewal opportunities
	And I click on service contract link
	And I update the service contract line item fields
	Then I verify that renewal opportunity update accordingly
	When I click on "Service Contracts" link
	And I click on "New" button
	And I enter mandatory details
	Then I should able to see the created "Service Contracts"

@service_contracts_checkbox
Scenario: Rally Test Case ID: TC3418,TC3419 : Opportunity Updates - No Change to Renewal Opportunity,Update Opportunity checkbox (New Service Contract) line item
	When I click on "ServiceSource Setup" link
	And I click on "Opportunity Generation" link
	And I unselect the "Enable Generation of Opportunities" checkbox on opp generation
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity → Renewal Opportunity" link
	And I Add Opportunity Fields "Account ID" and "Save"
	And I save the Mapping
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Asset → Opportunity" link
	Then all required fields should be displayed in Grey
	And I should be able to edit Opportunity Product Line field Quantity
	And I save the Mapping
	When I click on "ServiceSource Setup" link
	And I click on "Opportunity Updates" link
	And I unselect the "Update opportunities when the following service contract line item fields change" checkbox
	And I add asset criteria and multiple filters logic "1 AND 2 OR 3" and "1 OR 2 OR 3"
	When I click on "Opportunities" link
	And I go to existing renewal opportunities
	And I click on service contract link
	And I update the service contract line item fields
	Then I verify that renewal opportunity update accordingly

@service_contracts_data_types
Scenario:Rally Test Case ID: TC3420 : Opportunity Updates - Data Types
	When I click on "ServiceSource Setup" link
	And I click on "Opportunity Generation" link
	And I select the "Enable Generation of Opportunities" checkbox on opp generation
	And I verify the Data Types of "OppFields"
	And I verify the list of Operators for "OppFields"



