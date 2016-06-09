@Requests
@RequestGridFeature
Feature: All features related to Requests - Request Grid

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@request_grid
Scenario: Rally Test Case ID: TC4342,TC4343,TC4344,TC4345,TC4346 : Request - Request grid, Add/Remove column,Export,Sorting and pagination,Search the Request
    When I click on "Requests" tab
    And I click on the "New Request"
    Then I should be able to see the "New Request" page
    When I enter subject line "Community"
    And I select the Account "PES Channel Account" from drop down
    And I select the Related To "Opportunity" and "Partner_Opportunity" from drop down
    And I select the Request Type "General Assistance" from drop down
    And I select the Priority "High" from drop down
    And I add the "Test_Message" message
    And I click on the "Submit"
    When I click on "Requests" tab
    Then I should able to see the created "Community" request
    When I click on "Requests" tab
    Then I should able to see the "Request Grid" fields
    When I click on the "Kebab Menu" menu button
    And I uncheck the "Request Grid" fields
    Then I should not able to see the "Request Grid" fields
    When I click on "Opportunities" tab
    And I click on "Requests" tab
    Then I should able to see the "Request Grid" fields
    And user sorts by "Subject" in "Ascending" order
    Then files should be sorted by "Subject" in "Ascending" order
    When I click on "Requests" tab
    And user sorts by "Subject" in "Descending" sort order
    Then files should be sorted by "Subject" in "Descending" sort order
    When I click on "Requests" tab
    And I search with account "PES Channel Account" name
