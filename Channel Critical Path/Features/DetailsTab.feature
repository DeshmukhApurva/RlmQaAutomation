@Requests
@DetailsTabFeature
Feature: All features related to Requests - Details Tab

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@request_details_tab
Scenario: Rally Test Case ID: TC4500 : Sales Request Details Tab- information of Details Tab
  When I click on "Requests" tab
  And I click on the "Request Number" link
  Then I verify the "Details" fields


