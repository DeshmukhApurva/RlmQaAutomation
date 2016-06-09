@Accounts
@AccountSearchTextEntryBoxFeature
Feature: All features related to Accounts - Account Search Text Entry Box

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page

@verifyAccSearchBox
Scenario: Rally Test Case ID: TC4357,TC4358,TC4359 : Account - Search,Account - Search box behaviour and default text,Account - Search account name with account number
	Then I verify Account search box  
	When I search an Account