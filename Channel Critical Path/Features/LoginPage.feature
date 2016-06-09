@Community
@LoginPageFeature
Feature: All features related to Community - Login Page

Background: Login to the Application
    When I navigate to the Channel Portal

@verifyLoginPage
Scenario: Rally Test Case ID: TC4474,TC4475,TC4476,TC4477,TC4478,TC4479  : Login screen UI,Login - Sign In,Login - Keep Username and Password fields empty,Login - Keep Username empty,Login - Keep Password empty,Login - Incorect Username or Password
	Then I verify Login screen UI
	And I enter incorrect credentials
	And I enter correct credentials
	