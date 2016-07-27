@ServiceSourceSetup
@PartnerDataSyncFeature
Feature: All features related to Service Source Setup - Partner Data Sync

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@cancelMapping
Scenario: Rally Test Case ID: TC4279 : Fields to Sync - Cancel the mapping between Renewal partner and opportunity fields
	When I Navigate to "ServiceSource Setup" tab
	And I click on "Renewal Partner Data Sync" link
  And I Add Partner Opportunity field "Earliest Expiration Date" and Opportunity Field "Earliest Expiration Date"
	#And I click on "Cancel" button
	And I click on the mapping button "Cancel"

@fieldsMapping
Scenario: Rally Test Case ID: TC4277,TC4278,TC4280,TC4281,TC4282,TC4283,TC4284 : Fields to Sync - Add the fields, Fields to Sync - Map the fields between Renewal partner and opportunity fields, Fields to Sync -  Add the picklist with different picklist values, Fields to Sync - Save,Fields to Sync - Edit, Fields to Sync -  Delete,Fields to Sync - Cancel
	When I Navigate to "ServiceSource Setup" tab
	And I click on "Renewal Partner Data Sync" link
  And I Add Partner Opportunity field "Earliest Expiration Date" and Opportunity Field "Earliest Expiration Date"
	And I click on the mapping button "Save"
	Then I verify message "Renewals Partner Data has been saved."
	Then Partner Opportunity field "Earliest Expiration Date" should be present
	And I delete Partner Opportunity field "Earliest Expiration Date"
	And I click on "Save"
	And I edit Partner Opportunity field "Sales Stage" mapping as "Opportunity Type"
	And I click on "Save"
	Then I verify message "Picklist fields must match.Either select a different field or update picklist values."
	And I click on "Cancel"
	Then I verify Partner Opportunity field "Sales Stage" and Opportunity Field "Opportunity Type" is not saved

@oppQuoteOptions
Scenario: Rally Test Case ID: TC4285 : Opportunity Quote - options
    When I Navigate to "ServiceSource Setup" tab
    And I click on "Renewal Partner Data Sync" link
    And I choose "SalesForce Quotes" for Opportunity Quote
    And I verify available options "SalesForce Quotes" selected or not
    And I verify available options "Attachment Quotes" selected or not
    And I click on "Save"


