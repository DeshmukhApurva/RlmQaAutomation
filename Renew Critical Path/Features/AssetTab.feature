@SuccessPlan
@AssetTabFeature
Feature: All features related to Success Plan - Asset Tab
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@verifyAssetCount
Scenario:Rally Test Case ID: TC3568 : Success Plan - Asset tab
	When I click on "Success Plans" link
	Then I select the created SuccessPlan
	Then I click on "Assets" subtab
	Then I verify the count of all "Assets"

@verifyGrid
Scenario:Rally Test Case ID: TC3571,TC3572,TC3574 : Success Plan - Show/Hide Columns, Success Plan - View all Asset field columns, Success Plan - Asset tab Verify Pagination
	When I click on "Success Plans" link
	Then I select the created SuccessPlan
	Then I click on "Assets" subtab
	Then I verify grid columns on "Assets" subtab
	Then I verify the show or hide columns of "Assets" grid
	Then I verify pagination
	
@verifyRenOppfields
Scenario:Rally Test Case ID: TC3569,TC3570,TC3573 : Success Plan - Renewal Opportunity Status, Success Plan - Close Date Verification, Success Plan - Renewal Opportunity Sales Stage
	When I click on "Success Plans" link
	Then I select the created SuccessPlan
	Then I click on "Assets" subtab
	Then I get data of "Assets"

	

	
