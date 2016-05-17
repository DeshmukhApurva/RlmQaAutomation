@Opportunities
@BulkUpdateFeature
Feature: All features related to Partner user - Opportunities - BulkUpdateFeature

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@BulkUpdate
Scenario: Rally-ID: TC4386 :Opportunity Bulk Update Div
	When I click on "Opportunities" link
	And I select the opportunity for field update for "BulkUpdate"
	Then I verify the Bulk Update window

@login
Scenario: Rally-ID: Login as OEM user and set the NeedStatusUpdate button as true.
    When user logs out from channel partner community
    And user login in to "OEM" application
    Then I should able to see the "OEM" home page
    When I Navigate to "Opportunities" tab
    Then I select the "RenewalOpportunity"
    And I set the Needs Status Update as true

@VerifyNeedStatusTrue
Scenario: Rally-ID: TC4387,TC4388,TC4389,TC4390,TC4391,TC4392 : Bulk Update - Field update for opportunities based on needs update flag False,Update with no change for opportunities where needs update flag is false,Update fields/notes and update status from TRUE to FALSE,Update the fields those are not designated on "Need Status Update Config" page, Update the status with no change,Cancel
	When I click on "Opportunities" link	
	Then I select one or more the opportunity "Cancel" and verify opportunity for "BulkUpdate" when status is true	
	Then I select one or more the opportunity "Update with no change" and verify opportunity for "BulkUpdate" when status is true	

@login
Scenario: Rally-ID: Login as OEM user and set the NeedStatusUpdate button as true.
	When user logs out from channel partner community
	And user login in to "OEM" application
	Then I should able to see the "OEM" home page
	When I Navigate to "Opportunities" tab	
	Then I select the "RenewalOpportunity"
	And I set the Needs Status Update as true
	
@Update
Scenario:Rally-ID: TC4392 : BulkUpdate-verify Update is working or not
	When I click on "Opportunities" link
	Then I select one or more the opportunity "Update" and verify opportunity for "BulkUpdate" when status is true	

@VerifyNeedStatusFalse
Scenario: Rally-ID: TC4387,TC4388,TC4389,TC4390,TC4391 : Bulk Update - Field update for opportunities based on needs update flag False,Update with no change for opportunities where needs update flag is false,Update fields/notes and update status from TRUE to FALSE,Update the fields those are not designated on "Need Status Update Config" page, Update the status with no change,Cancel
	When I click on "Opportunities" link	
	Then I select one or more the opportunity "Cancel" and verify opportunity for "BulkUpdate" when status is false
	Then I select one or more the opportunity "Update with no change" and verify opportunity for "BulkUpdate" when status is false
	Then I select one or more the opportunity "Update" and verify opportunity for "BulkUpdate" when status is false

@BulkUpdateNotes
Scenario: Rally-ID: TC4393,TC4394 : Bulk Update - Update with Notes,Do not select any opportunity record.
	When I click on "Opportunities" link
	And I select the opportunity for field update for "NeedStatusUpdate"
	When I click on the "Update" button
	And I update the notes for particular Opportunity
