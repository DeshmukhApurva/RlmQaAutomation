@SuccessPlan
@ServiceContractTabFeature
Feature: All features related to Success Plan - Service Contract Tab
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@verifySCCount
Scenario: Rally Test Case ID: TC3577 : Success Plan - Service Contract Line Items
	When I click on "Success Plans" link
	Then I select the created SuccessPlan
	Then I click on "Service Contracts" subtab
	Then I verify the count for "Service Contracts"

@verifySCGrid
Scenario: Rally Test Case ID: TC3580,TC3581,TC3583 : Success Plan - Show/Hide Columns, Success Plan - View all Service Contract Line Item field columns, Success Plan - Service Contracts tab Verify Pagination
	When I click on "Success Plans" link
	Then I select the created SuccessPlan
	Then I click on "Service Contracts" subtab
	Then I verify grid columns on "Service Contracts" subtab
	Then I verify the show or hide columns of "Service Contracts" grid
	Then I verify pagination
	
@verifySCGridFields
Scenario: Rally Test Case ID: TC3578,TC3579,TC3582  : Success Plan - Renewal Opportunity Status,Success Plan - Close Date Verification, Success Plan - Renewal Opportunity Sales Stage
	When I click on "Success Plans" link
	Then I select the created SuccessPlan
	Then I click on "Service Contracts" subtab
	Then I get data of "Service Contracts"

	