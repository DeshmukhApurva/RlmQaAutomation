@RenServiceContract
@RenMergeServiceContractFeature
Feature: All features related to Renew user - Service Contract - Merge Service Contract
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@renValidateSCselection
Scenario: Rally Test Case ID: TC3230,TC3231 : Merge Service Contracts - Validation Message (Select two Service Contracts),Merge Service Contracts - Validation Message (More than two Service Contracts)
	When I click on "Service Contracts" link
	And I click on Go
	And I click on "Merge" button
	Then I verify the validation message "Select two Service Contracts to merge."
	And I select more than two Service Contract
	And I click on "Merge" button
	Then I verify the validation message "Only two Service Contracts may be selected."

@renVerifyPricebook
Scenario: Rally Test Case ID: TC3239 : Merge Service Contracts - Validation Message (Different Pricebook)
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
	
@renVerifySCMergeProcess
Scenario: Rally Test Case ID: TC3232,TC3233,TC3234,TC3235,TC3237,TC3238 : Merge Service Contracts - Verify Read Only fields,Merge Service Contracts - Conflicting Data row,Merge service contract - Verify select all link,Merge Service Contracts - Verify sorting,Merge Service Contracts - Consolidated Flag check,Merge Service Contracts - Service Contract Line Item/s Removal
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
	
@renVerifyConsolidatedSC
Scenario:Rally Test Case ID: TC3236 : Merge Service Contracts - Validation Message
	When I click on "Service Contracts" link
	And I click on Go
	And I select "first" Service Contract 
	And I select "third" Service Contract
	And I click on "Merge" button
	Then I verify the consolidated SC validation message
	Then I delete the "first" Service Contract
	Then I delete the "third" Service Contract
