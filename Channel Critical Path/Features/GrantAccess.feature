@GrantAccess
@GrantAccessFeature
Feature: All features related to Grant Access - Grant Access

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page
	
@OK
Scenario: Rally-ID: TC4322 :Set Partner opportunity as Primary-Click on OK
	When I Navigate to "Accounts" tab	
	Then I select the "PartnerAccount" for Partner Opportunity	
	And I select the contact 
	And I click on "Manage External User"
    Then I clicked on "Grant Access" link
    And I Accept the GrantAcess popup
	#Custom links is not seen ,need to write the test scripts
	#Then I clicked on "Custom Links" link
	
@Cancel
Scenario: Rally-ID: TC4323 :Set Partner opportunity as Primary-Click on Cancel
	When I Navigate to "Accounts" tab	
	Then I select the "PartnerAccount" for Partner Opportunity	
	And I select the contact 
	And I click on "Manage External User" primary button
    Then I clicked on "Grant Access" link
    And I Deny the GrantAcess popup
	#Custom links is not seen ,need to write the test scripts
	#Then I clicked on "Custom Links" link
	
	
	
	
