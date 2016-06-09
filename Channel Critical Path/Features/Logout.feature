@Community
@LogoutFeature
Feature: All features related to Community - Logout

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page
	

@verifyLogout
Scenario: Rally Test Case ID: TC4492,TC4493 : Logout from Partner Portal Community-All Instances, The About Me link -Removed from the channel portal
	Then I logout
	Then I verify user logged out from Channel Portal