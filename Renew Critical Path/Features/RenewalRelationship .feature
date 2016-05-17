@OpportunityManagement
@RenewalRelationshipFeature
Feature: All features related to Opportunity Management - Renewal Relationship 

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@view_contract_line_item
Scenario: Rally Test Case ID: TC3586 - Renewal Relationship - View a contract line item to covered asset relationship in a service contract: Covered Asset
	When I click on "Opportunities" link
	And I go to existing renewal opportunities
	And I click on "Add Product" button
	And I select one or more product from the grid
	And I go to created renew opp which showing renewal service to covered asset relationship
	And I click on "Opportunities" link
	And I go to existing renewal opportunities
	And I click to service contract line item details link
	Then I verify that associated covered asset getting display there

@view_renewal_relationship_data
Scenario: Rally Test Case ID: TC3587 - Renewal Relationship -  View Renewal relationship data with service contract and service contract line item details
    When I click on "Opportunities" link
    And I click on "New" button
    And I enter mandatory details in "New" opportunity page
    And I click on "Choose Price Book" button
    Then I Choose the Pricebook for the product
    And I click on "Add Product" button
    And I select one or more product from the grid
    Then I should able to see the "Renewal Relationship" section
	And I resolve the "source opportunity"
	Then I verify that renewal relationship data populated with service contract and line item details

@renewal_relationship_product_association
Scenario: Rally Test Case ID: TC3588 - Renewal Relationship - Product Association
	When I click on "Opportunities" link
    And I click on "Go!" button from opportunity page
    And I open the first opportunity
    And I click on "Add Product" button
    And I select one or more product from the grid
	Then I should able to see the "Renewal Relationship" section
	Then I verify product getting associated with renewal relationship
