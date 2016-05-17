@Overview
@UpdateOpportunityStatusActionTileFeature
Feature: All features related to Overview - Update Opportunities Status action tile

@updateOppStatus
Scenario: Rally Test Case ID: TC4458,TC4459 : Overview - Update Opportunities Status action tile, Overview - Click on Update Opportunity Status action tile
	And user login in to "OEM" application
	Then I should able to see the "OEM" home page
	When I click on "Opportunities" link
	And I open an opportunity for "NeedStatusUpdate"
    And I enable the "NeedStatusUpdate" field
	When user logout from "OEM" application
	Given that I navigate to the CRM application
    Then I should land on CRM home page
	When I Navigate to "Overview" tab
	And I click on "Update Opportunity Status" tile
	