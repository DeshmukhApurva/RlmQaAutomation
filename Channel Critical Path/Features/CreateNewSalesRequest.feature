@Requests
@CreateNewSalesRequestFeature
Feature: All features related to Requests - Create New Sales Request

    Background: Login to the Application
      Given that I navigate to the CRM application
      Then I should land on CRM home page



@create_new_request
Scenario: Rally Test Case ID: TC4350,TC4351,TC4352,TC4353,TC4354,TC4355 : Request - New Request fields,Related To field,Requests Type field check,Priority field check,Attachment, Create New Request
    When I click on "Requests" tab
    And I click on the "New Request"
    Then I should be able to see the "New Request" page
    When I enter subject line "Community"
    And I select the Account "PES Channel Account" from drop down
    And I select the Related To "Opportunity" and "Partner_Opportunity" from drop down
    And I select the Request Type "General Assistance" from drop down
    And I select the Priority "High" from drop down
    And I add the "Test_Message" message
    And I add the "Documents/DataStage.pdf" attachment file
    And I click on the "Submit"
    When I click on "Opportunities" tab
    And I click on "Requests" tab
    Then I should able to see the created "Community" request


@cancel_the_request
Scenario: Rally Test Case ID: TC4356 : Request - Cancel
    When I click on "Requests" tab
    And I click on the "New Request"
    Then I should be able to see the "New Request" page
    When I enter subject line "Community"
    And I select the Account "PES Channel Account" from drop down
    And I select the Related To "Opportunity" and "Partner_Opportunity" from drop down
    And I select the Request Type "General Assistance" from drop down
    And I select the Priority "High" from drop down
    And I add the "Test_Message" message
    And I click on the "Cancel"
