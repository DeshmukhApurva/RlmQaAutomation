@Opportunities
@NonIncumbentPOFeature
Feature: All features related to Partner user - Opportunities - NonIncumbent PO

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@NonIncumbent
Scenario: Rally-ID : TC4519 : Opportunity Details and Renewal Tab: Value of Renewal Target field/Renewal Target column/Previous Price column when Incumbent flag is unchecked for PO
    When I click on "Opportunities" link
    Then I Select the "NonIncumbent" Partner Opportunity
    When I navigate to "Details" tab
    And I verify the "Renewal Target" field value