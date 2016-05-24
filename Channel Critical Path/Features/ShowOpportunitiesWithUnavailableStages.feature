@Opportunities
@ShowOpportunitiesWithUnavailableStagesFeature
Feature: All features related to Opportunities - Show Opportunities with Unavailable Stages


Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@update_sales_stage_opportunities
Scenario: Rally Test Case ID: TC4534,TC4535,TC4536,TC4537,TC4539 : Opportunities Tab: "Show Opportunities with Unavailable Stages" checkbox is Checked, Error message when user inline edits the PO if "Show Opportunities with Unavailable Stages" checkbox is Checked
     When I click on "Opportunities" tab
     Then I should able to see the "Opportunity Grid" columns
   	 When I verify the current expiration quarter value in Expiration Quarter filter
   	 When I verify the current expiration year value in Expiration Year filter
     And I select the "New Last Week" filter value
     And I update the "PES_Add_Partner" column values
     When I verify the current expiration quarter value in Expiration Quarter filter
   	 When I verify the current expiration year value in Expiration Year filter
     And I select the "New Last Week" filter value
     And I click on "Opportunities" tab
     And I select more than one "PES_Add_Partner" from the grid
     And I click on "Opportunities" tab
     Then I should able to see the "Sales Stage" drop down values
     When I click on "Opportunities" tab
     And I select the multiple without "Sales Stage" opportunities
     And I update the "Opportunities" columns


@update_the_status_partner_opportunity
Scenario: Rally Test Case ID: TC4538,TC4540,TC4542 : Opportunities Tab: Error message when user updates the status of the PO if "Show Opportunities with Unavailable Stages" checkbox is Checked,Opportunities Tab: Error message when user updates the status of the PO with No Change if "Show Opportunities with Unavailable Stages" checkbox is Checked
    When I click on "Opportunities" tab
    Then I should able to see the "Opportunity Grid" columns
   	When I verify the current expiration quarter value in Expiration Quarter filter
   	When I verify the current expiration year value in Expiration Year filter
    And I select the "New Last Week" filter value
    And I click on "Update" icon
    Then I should be able to see the "No Change" and "Update" buttons
    When I click on "Opportunities" tab
    And I enter status is "TRUE" and click on "Update" button


@verifyLastWeekOpp
Scenario: Rally Test Case ID: TC4541 : Opportunities Tab: Clicking on "See New Opportunities" Action Tile when "Show Opportunities with Unavailable Stages" checkbox is Checked
    When I Navigate to "Overview" tab
    And I click on "See New Opportunities" action tile

@SalesStagesPipelineChart
Scenario: Rally Test Case ID: TC4543 : Opportunities Tab: Sales Stages displayed for Pipeline Chart and Expired Opportunity when "Show Opportunities with Unavailable Stages" checkbox is Checked
    When I Navigate to "Overview" tab
    And I verify the "Expired Opportunity" display
    When I Navigate to "Overview" tab
    And I verify data display on charts
    And I verify the orange chart
    When I Navigate to "Overview" tab
    And I verify the blue chart


