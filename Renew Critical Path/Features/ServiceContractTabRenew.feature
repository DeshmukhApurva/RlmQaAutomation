@RenSuccessPlan
@RenServiceContractTabFeature
Feature: All features related to Renew User - Success Plan - Service Contract Tab
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@renVerifySCCount
Scenario: Rally Test Case ID: TC3281 : Success Plan - Service Contract Line Items
	When I click on "Success Plans" link
	Then I select the created SuccessPlan
	Then I click on "Service Contracts" subtab
	Then I verify the count for "Service Contracts"

@renVerifySCGrid
Scenario: Rally Test Case ID: TC3284,TC3285,TC3287 : Success Plan - Show/Hide Columns, Success Plan - View all Service Contract Line Item field columns, Success Plan - Service Contracts tab Verify Pagination
	When I click on "Success Plans" link
	Then I select the created SuccessPlan
	Then I click on "Service Contracts" subtab
	Then I verify grid columns on "Service Contracts" subtab
	Then I verify the show or hide columns of "Service Contracts" grid
	Then I verify pagination
	
@renVerifySCGridFields
Scenario: Rally Test Case ID: TC3282,TC3283,TC3286  : Success Plan - Renewal Opportunity Status,Success Plan - Close Date Verification, Success Plan - Renewal Opportunity Sales Stage
	When I click on "Success Plans" link
	Then I select the created SuccessPlan
	Then I click on "Service Contracts" subtab
	Then I get data of "Service Contracts"

	