@ServiceContract
@MergeServiceContractFeature
Feature: All features related to Service Contract - Merge Service Contract
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@validateSCselection
Scenario: Rally Test Case ID: TC3526,TC3527 : Merge Service Contracts - Validation Message (Select two Service Contracts),Merge Service Contracts - Validation Message (More than two Service Contracts)
	When I click on "Service Contracts" link
	And I click on Go
	And I click on "Merge" button
	Then I verify the validation message "Select two Service Contracts to merge."
	And I select more than two Service Contract
	And I click on "Merge" button
	Then I verify the validation message "Only two Service Contracts may be selected."

@verifyPricebook
Scenario: Rally Test Case ID: TC3535 : Merge Service Contracts - Validation Message (Different Pricebook)
	When I click on "Service Contracts" link
	And I click on Go
	And I click on "New Service Contract" button
	And I create "first" Service Contract
	Then I Choose "first" Pricebook for the SC
	When I click on "Service Contracts" link
	And I click on Go
	And I click on "New Service Contract" button
	And I create "second" Service Contract
	Then I Choose "second" Pricebook for the SC
	When I click on "Service Contracts" link
	And I click on Go
	And I select "first" Service Contract 
	And I select "second" Service Contract
	And I click on "Merge" button
	Then I verify the different pricebook validation message
	Then I delete the "second" Service Contract
	
@verifySCMergeProcess
Scenario: Rally Test Case ID: TC3528,TC3529,TC3530,TC3531,TC3533,TC3534 : Merge Service Contracts - Verify Read Only fields,Merge Service Contracts - Conflicting Data row,Merge service contract - Verify select all link,Merge Service Contracts - Verify sorting,Merge Service Contracts - Consolidated Flag check,Merge Service Contracts - Service Contract Line Item/s Removal
	When I click on "Service Contracts" link
	And I click on Go
	And I click on "New Service Contract" button
	And I create "third" Service Contract
	Then I Choose "first" Pricebook for the SC
	When I click on "Service Contracts" link
	And I click on Go
	And I select "first" Service Contract 
	And I select "third" Service Contract
	And I click on "Merge" button
	Then I verify the merge SC process
	And I select a master record to merge
	Then I verify the lineitem added to the merged ServiceContract
	When I click on "Service Contracts" link
	And I click on Go
	And I open "third" Service Contract
	Then I verify consolidated field is checked or not
	
@verifyConsolidatedSC
Scenario: Rally Test Case ID: TC3532 : Merge Service Contracts - Validation Message
	When I click on "Service Contracts" link
	And I click on Go
	And I select "first" Service Contract 
	And I select "third" Service Contract
	And I click on "Merge" button
	Then I verify the consolidated SC validation message
	Then I delete the "first" Service Contract
	Then I delete the "third" Service Contract
