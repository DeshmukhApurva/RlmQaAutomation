@Opportunities
@ActionTileFeature
Feature: All features related to Opportunities - Action Tile

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@see_new_opportunities_action_tile
Scenario: Rally Test Case ID: TC4513 : Opportunity Page- Clicking on See New Opportunities Action Tile
   When I Navigate to "Overview" tab
   And I click on "See New Opportunities" action tile


@update_opportunity_status_action_tile
Scenario: Rally Test Case ID: TC4514 : Opportunity Page- Clicking on Update Opportunity Status Action Tile
    When I Navigate to "Overview" tab
    And I click on "Update Opportunity Status" tile


@see_completed_requests_action_tile
Scenario: Rally Test Case ID: TC4515 : Opportunity Page- Clicking on See Completed Requests Action Tile
   When I Navigate to "Overview" tab
   And I click on the "See Completed Requests" action tile

