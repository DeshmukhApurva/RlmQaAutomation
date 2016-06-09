@RenOpportunityManagement
@RenSplitOpportunityFeature
Feature: All features related to Renew user - Opportunity Management - Split Opportunity

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@ren_new_target_opportunity
Scenario: Rally Test Case ID: TC3201,TC3204,TC3205,TC3208,TC3209,TC3210,TC3211 : Split opportunity - New target opportunity,Split opportunity - Covered assets and covered product Display after Split,Split opportunity - Verify "Renewal" check after Split completion,Split Opportunity - Header Amount Recalculation,Split Opportunity - Linking a Renewal Relationship Object to the New Opportunity,Split Opportunity - Selected product line items getting removed from source opp,Split Opportunity - Different Pricebook
	When I click on "Opportunities" link
    And I open existing opportunity
	And I click on "Add Product" button
	And I select one or more product from the grid
	And I select the products
	And I click on "Split Opportunity" button
	And I select the "New Opportunity" option from the "Select target Opportunity Type" list
	And I fill the required fields
	And I click on "Split Selected" button
	Then I verify the renewal relationship & Metrics fields values are recalculated on the opportunity

@ren_verify_validation_message
Scenario: Rally Test Case ID: TC3206 : Split opportunity - Validation Message
	When I click on "Opportunities" link
    And I open existing opportunity
	And I click on "Add Product" button
	And I select one or more product from the grid
	And I select the products
	And I click on "Split Opportunity" button
	And I select the "New Opportunity" option from the "Select target Opportunity Type" list
	And I click on "Split Selected" button
	Then I should able to see the validation error messages

@ren_new_cloned_target_opportunity
Scenario: Rally Test Case ID: TC3202 : Split opportunity - New Cloned target opportunity
	When I click on "Opportunities" link
    And I open existing opportunity
	And I click on "Add Product" button
	And I select one or more product from the grid
	And I select the products
	And I click on "Split Opportunity" button
	And I select the "New Cloned Opportunity" option from the "Select target Opportunity Type" list
	Then I should able to see the "Target Opportunity" and "Opportunity Product(s)" section
	When I click on "Split Selected" button
	Then I should able to see the opportunity details

@ren_existing_opportunity
Scenario: Rally Test Case ID: TC3203 : Split opportunity - Existing opportunity
	When I click on "Opportunities" link
    And I open existing opportunity
	And I click on "Add Product" button
	And I select one or more product from the grid
	And I select the products
	And I click on "Split Opportunity" button
	And I select the "Existing Opportunity" option from the "Select target Opportunity Type" list
	And I fill the required fields from "Existing Opportunity" page
	Then I should able to see the "Target Opportunity" and "Opportunity Product(s)" section
	And I click on "Split Selected" button
	Then I should able to see the opportunity details

@ren_product_validation
Scenario: Rally Test Case ID: TC3207 : Split Opportunity - Validation Message
	When I click on "Opportunities" link
    And I open existing opportunity
	And I click on "Split Opportunity" button
	Then I should able to see the "Please select at least one Opportunity Line to proceed." alert message

