@Opportunities
@SalesStageFeature
Feature: All features related to Opportunities - Sales Stage

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@verify_order_sales_stage_edit_opportunity
Scenario: Rally Test Case ID: TC4544,TC4545 : Verify that order of Sales Stages dropdown values of Partner Opportunity should be same as Sales Stages order saved in Available to Partner Section,Verify that on Bulk Edit page order of Sales Stages dropdown values should be same as Sales Stages order saved in Available to Partner Section
    Then I verify Account search box
    When I search an Account
    And I click on "Opportunities" tab from account details page
    And I click "Sales Stage" drop down value
    Then I should able to see the "Sales Stage" drop down values
    And I click on "Opportunities" tab from account details page
    And I select the multiple "Opportunities" columns
    And I update the "Opportunities" columns
