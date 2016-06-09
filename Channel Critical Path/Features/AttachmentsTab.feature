@Requests
@AttachmentsTabFeature
Feature: All features related to Requests - Attachments Tab

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@request_attachment_tab
Scenario: Rally Test Case ID: TC4501 : Sales Request Attachments Tab- information of Attachments Tab,Search
  When I click on "Requests" tab
  And I click on the "Request Number" link
  And I click on "Attachments" tab
  Then I verify the "Attachments" columns