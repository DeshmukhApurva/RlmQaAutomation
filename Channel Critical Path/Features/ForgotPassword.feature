@Community
@ForgotPasswordFeature
Feature: All features related to Community - Forgot Password

Background: Login to the Application
    When I navigate to the Channel Portal

@forgotPassword
Scenario: Rally Test Case ID: TC4480,TC4481,TC4483,TC4484,TC4485 : Login- Forgot Password,Forgot Password - UI,Forgot Password - Username validation,Forgot Password - Keep Username field empty,Forgot Password - Back
	And I click on "Forgot Password?" link on Channel Portal Login screen
	Then I verify Forgot Password screen UI
	Then I enter incorrect username format