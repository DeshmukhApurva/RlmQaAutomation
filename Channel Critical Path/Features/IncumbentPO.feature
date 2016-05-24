@Opportunities
@IncumbentPOFeature
Feature: All features related to Partner user - Opportunities - Incumbent PO

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@Incumbent
Scenario: Rally-ID : TC4520 : Opportunity Details and Renewal Tab: Value of Renewal Target field/Renewal Target column/Previous Price column when Incumbent flag is checked for PO
	When I click on "Opportunities" link
	And I verify the current expiration quarter value in Expiration Quarter filter
   	And I verify the current expiration year value in Expiration Year filter
    Then I Select the "Incumbent" Partner Opportunity
    When I Navigate to "Details" tab
    And I verify the "Renewal Target" field value