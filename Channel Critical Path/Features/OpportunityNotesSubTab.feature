@Opportunities
@OpportunityNotesSubTabFeature
Feature: All features related to Opportunities - Opportunity Notes Sub Tab

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@notes_opportunity_sub_tab
Scenario: Rally Test Case ID: TC4425,TC4426,TC4427 : Opportunity - add notes from bulk edit and check Notes subtab,add notes in status column,Add notes from different contact from the same account
    When I click on "Opportunities" tab
    And I clear the filters
    And I select the "New Last Week" filter value
    And I select more than one "PES_Add_Partner" from the grid
    And I click on "Opportunities" tab
    And I clear the filters
    And I select the "New Last Week" filter value
    And I search with "PES_Add_Partner" opportunity
    And I navigate to the "Notes" opportunity sub tab
    And I click on "Notes" tab
    Then I verify the notes gets updated in "Notes" opportunity sub tab
    When I click on "Opportunities" tab
    And I clear the filters
    And I select the "New Last Week" filter value
    And I search with "PES_Add_Partner" opportunity
    And I click on "Update" icon
    Then I should be able to see the "No Change" and "Update" buttons
    When I enter status is "TRUE" and click on "Update" button
    And I click on "Opportunities" tab
    And I clear the filters
    And I select the "New Last Week" filter value
    And I search with "PES_Add_Partner" opportunity
    And I navigate to the "Notes" opportunity sub tab
    And I click on "Notes" tab
    Then I verify the notes gets updated in "Notes" opportunity sub tab
