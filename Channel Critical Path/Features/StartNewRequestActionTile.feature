@Overview
@StartNewRequestActionTileFeature
Feature: All features related to Overview - Start New Request action tile

Background: Login to the Application
  Given that I navigate to the CRM application
  Then I should land on CRM home page


@create_new_request_from_overview
Scenario: Rally Test Case ID: TC4460 : Overview - Click on Start New Request action tile
  When I click on "Overview" tab
  And I click on "Start New Request" new tile
  Then I should be able to see the "New Request" page
  When I enter subject line "Community"
  And I select the Account "PES Channel Account" from drop down
  And I select the Related To "Opportunity" and "Partner_Opportunity" from drop down
  And I select the Request Type "General Assistance" from drop down
  And I select the Priority "High" from drop down
  And I add the "Test_Message" message
  And I click on the "Submit"
  When I click on "Opportunities" tab
  And I click on "Requests" tab
  Then I should able to see the created "Community" request