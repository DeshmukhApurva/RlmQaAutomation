@ServiceSourceSetup
@StatusUpdateConfigurationFeature
Feature: All features related to ServiceSource Setup - Status Update Configuration

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page
	
@verifyCancel
Scenario:Rally Test Case ID: TC4276 : Needs Status Update - Cancel
	When I Navigate to "ServiceSource Setup" tab
	And I click on "Channel Portal Configuration" link
	And I check the "Status Fields"
	And I verify "Number of Days Between Updates" text box with wrong data
	And I verify "Number of Days Between Updates" text box with correct data
	And I verify "Days Before Expiration" text box with wrong data
	And I verify "Days Before Expiration" text box with correct data	
	And I click on "Cancel"
	
@checkStatusFields
Scenario:Rally Test Case ID: TC4268,TC4269,TC4270,TC4271,TC4272,TC4273,TC4274,TC4275 : Needs Status Update - Check Status Fields,Status Fields - Add and save the fields,Status Fields- Add Criteria button behaviour,Status Fields - Delete,Number of days between updates - Save,Days Before Expiration - Save,Days Before Expiration -  Empty,Needs Status Update - Save the data
	When I Navigate to "ServiceSource Setup" tab
	And I click on "Channel Portal Configuration" link
	And I check the "Status Fields"
	And I verify "Number of Days Between Updates" text box with wrong data
	And I verify "Number of Days Between Updates" text box with correct data
	And I verify "Days Before Expiration" text box with wrong data
	And I verify "Days Before Expiration" text box with correct data
	And I click on "Save"

@verifySalesStages
Scenario:Rally Test Case ID: TC4287,TC4288 : Needs Status Update - Move sales stages from Not available to available list box, Needs Status Update - Move sales stages from available to not available list box
	When I Navigate to "ServiceSource Setup" tab
	And I click on "Channel Portal Configuration" link
	Then I move Sales stages from "Not Available to Partners" to "Available to Partners"
	Then I move Sales stages again from "Available to Partners" to "Not Available to Partners"
	