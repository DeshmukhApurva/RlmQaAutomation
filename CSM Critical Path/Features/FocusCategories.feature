@ServiceSourceSetup
@FocusCategoriesFeature
Feature: All features related to Service Source Setup - Focus Categories and Focus Category Group
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@createTileFCGroup
Scenario:Rally Test Case ID : TC2825 : Creation of Focus Category Group
	When I click on "ServiceSource Setup" link
	And create a new Tile FC group
	
@EditTileFCG
Scenario: Rally Test Case ID : TC2826 : Edit Focus Category Group, Add Columns to FC Group, Add Focus Categories to FCG Columns
	When I click on "ServiceSource Setup" link
	And edit a tile FC group

@createFCGroup
Scenario:Rally Test Case ID: TC2827 : Creation of Focus Category Group
	When I click on "ServiceSource Setup" link
	And create a new FC group


@EditFCG
Scenario:Rally Test Case ID: TC2828,TC2829,TC2830,TC2831,TC2833 : Edit Focus Category Group, Add Columns to FC Group, Add Focus Categories to FCG Columns
	When I click on "ServiceSource Setup" link
	And edit a main FC group
    And I click on "Overview" link
    And I select the "Focus Category Group" name from "Focus Categories" drop down
    Then I able to see the "Focus Category" results


@DeleteFCfromFCG
Scenario:Rally Test Case ID: TC2832 : Delete Focus Category from Focus Category Group
	When I click on "ServiceSource Setup" link
	And  I delete a Focus Category from a FC group
    And I click on "Overview" link
    And I select the "Focus Category Group" name from "Focus Categories" drop down
    Then I should not able to see the "Focus Category" results


@CloneFCG
Scenario: Rally Test Case ID: TC2834 : Clone Focus Category Group
	When I click on "ServiceSource Setup" link
	And I Clone a FC group

@DeleteFCG
Scenario:Rally Test Case ID: TC2835 : Delete Focus Category Group without confirmation dialog
	When I click on "ServiceSource Setup" link
	And I Delete a Clone FC group
	
@CreateFC
Scenario:Rally Test Case ID : TC2814,TC2818,TC2822 : Creation of Focus Category
	When I click on "ServiceSource Setup" link
	And create a new FC
	Then I view the created FC

@CreateFCwithCriteriaAndCol
Scenario: Rally Test Case ID: TC2815,TC2816,TC2817 : Focus Categories View Criteria - Set Criteria,Creation of Focus Category with Criteria and Column
	When I click on "ServiceSource Setup" link
	And create a new FC with Criteria
	Then I edit the created FC


@DeleteFCwithConfirm
Scenario:Rally Test Case ID: TC2819,TC2820,TC2821 : Focus Categories Delete notification dialogue for FC that is associated to any FCG, Focus Categories Delete notification dialogue for FC that is associated to any FCG,Focus Categories Delete notification dialogue - count/list of impacted record,Focus Categories - Delete
    When I click on "Success Tasks" link
    And I create a new "Create New" success task
    When I click on "ServiceSource Setup" link
    And I click on "Focus Category Groups" link
    And I add one or more "Focus Category Groups"
    And I click on "ServiceSource Setup" link
    Then Delete a FC with confirm dialog
    And I click on "ServiceSource Setup" link
    And I click on "Focus Category Groups" link
    And I delete the created "Focus Category" group



