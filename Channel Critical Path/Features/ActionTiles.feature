@Overview
@ActionTilesFeature
Feature: All features related to Overview - Action Tiles

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page

@verifyActionTiles
Scenario: Rally Test Case ID: TC4453 : Overview - Action Tiles
	When I Navigate to "Overview" tab
	And I verify the "Action Tiles" for Overview
	