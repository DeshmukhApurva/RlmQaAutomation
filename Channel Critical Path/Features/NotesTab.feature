@Requests
@NotesTabFeature
Feature: All features related to Requests - Notes Tab

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@request_notes_tab
Scenario: Rally Test Case ID: TC4503,TC4504,TC4505: Sales Request Notes Tab: information of Notes Tab,Sequence of Notes added to Notes section,Display of Private notes on Community
  When I click on "Requests" tab
  And I click on the "Request Number" link
  When I click on "Notes" tab
  Then I verify the "Notes" details page fields
  When I add the new note from "Notes" page


