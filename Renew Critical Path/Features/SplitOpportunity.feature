@OpportunityManagement
@SplitOpportunityFeature
Feature: All features related to Opportunity Management - Split Opportunity

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@new_target_opportunity
Scenario: Rally Test Case ID: TC3497,TC3500,TC3501,TC3504,TC3505,TC3506,TC3507 - Split opportunity - New target opportunity,Covered assets and covered product Display after Split
	When I click on "Opportunities" link
    #And I open existing opportunity
    And I click on "New" button
    And Create new Opportunity under an Account
    And I click on "Choose Price Book" button
    Then I Choose the Pricebook for the product
	And I click on "Add Product" button
	And I select one or more product from the grid
	And I select the products
	And I click on "Split Opportunity" button
	And I select the "New Opportunity" option from the "Select target Opportunity Type" list
	And I fill the required fields
	And I click on "Split Selected" button
	Then I verify the renewal relationship & Metrics fields values are recalculated on the opportunity

@verify_validation_message
Scenario: Rally Test Case ID: TC3502 - Split opportunity - Validation Message
	When I click on "Opportunities" link
    #And I open existing opportunity
    And I click on "New" button
    And Create new Opportunity under an Account
    And I click on "Choose Price Book" button
    Then I Choose the Pricebook for the product
	And I click on "Add Product" button
	And I select one or more product from the grid
	And I select the products
	And I click on "Split Opportunity" button
	And I select the "New Opportunity" option from the "Select target Opportunity Type" list
	And I click on "Split Selected" button
	Then I should able to see the validation error messages

@new_cloned_target_opportunity
Scenario: Rally Test Case ID: TC3498 - Split opportunity - New Cloned target opportunity
	When I click on "Opportunities" link
    #And I open existing opportunity
    And I click on "New" button
    And Create new Opportunity under an Account
    And I click on "Choose Price Book" button
    Then I Choose the Pricebook for the product
	And I click on "Add Product" button
	And I select one or more product from the grid
	And I select the products
	And I click on "Split Opportunity" button
	And I select the "New Cloned Opportunity" option from the "Select target Opportunity Type" list
	Then I should able to see the "Target Opportunity" and "Opportunity Product(s)" section
	When I click on "Split Selected" button
	Then I should able to see the opportunity details

@existing_opportunity
Scenario: Rally Test Case ID: TC3499 - Split opportunity - Existing opportunity
	When I click on "Opportunities" link
    #And I open existing opportunity
    And I click on "New" button
    And Create new Opportunity under an Account
    And I click on "Choose Price Book" button
    Then I Choose the Pricebook for the product
	And I click on "Add Product" button
	And I select one or more product from the grid
	And I select the products
	And I click on "Split Opportunity" button
	#And I select the "Existing Opportunity" option from the "Select target Opportunity Type" list
	#And I fill the required fields from "Existing Opportunity" page
	And I select Existing split target opportunity and set value
	Then I should able to see the "Target Opportunity" and "Opportunity Product(s)" section
	And I click on "Split Selected" button
	Then I should able to see the opportunity details
	And I delete existing line items

@product_validation
Scenario: Rally Test Case ID: TC3503 - Split Opportunity - Product Validation Message
	When I click on "Opportunities" link
    #And I open existing opportunity
   	And I click on "New" button
    And Create new Opportunity under an Account
    And I click on "Choose Price Book" button
    Then I Choose the Pricebook for the product
	And I click on "Split Opportunity" button
	Then I should able to see the "Please select at least one Opportunity Line to proceed." alert message

