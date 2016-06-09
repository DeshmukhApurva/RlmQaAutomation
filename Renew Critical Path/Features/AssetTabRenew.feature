@RenSuccessPlan
@RenAssetTabFeature
Feature: All features related to Renew User - Success Plan - Asset Tab
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@renVerifyAssetCount
Scenario:Rally Test Case ID: TC3272 : Success Plan - Asset tab
	When I click on "Success Plans" link
	Then I select the created SuccessPlan
	Then I click on "Assets" subtab
	Then I verify the count of all "Assets"

@renVerifyGrid
Scenario:Rally Test Case ID: TC3275,TC3276,TC3278 : Success Plan - Show/Hide Columns, Success Plan - View all Asset field columns, Success Plan - Asset tab Verify Pagination
	When I click on "Success Plans" link
	Then I select the created SuccessPlan
	Then I click on "Assets" subtab
	Then I verify grid columns on "Assets" subtab
	Then I verify the show or hide columns of "Assets" grid
	Then I verify pagination
	
@renVerifyRenOppfields
Scenario:Rally Test Case ID: TC3273,TC3274,TC3277 : Success Plan - Renewal Opportunity Status, Success Plan - Close Date Verification, Success Plan - Renewal Opportunity Sales Stage
	When I click on "Success Plans" link
	Then I select the created SuccessPlan
	Then I click on "Assets" subtab
	Then I get data of "Assets"

	

	
