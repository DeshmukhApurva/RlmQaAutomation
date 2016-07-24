@RenOpportunityGeneration
@RenCreateRenewalOpportunityFromServiceContractFeature
Feature: All features related to Renew user - Opportunity Generation - Create Renewal Opportunity From ServiceContract

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@renGenerateOppfromSourceSC
Scenario: Rally Test Case-ID:TC3376,TC3377,TC3378,TC3379,TC3380: Verify renewal opp - "Renewal" flag to be checked,Verify renewal opp - Fields Display, Create Renewal Opp page - Service contract -> Opp line item mapping values,Create Renewal Opp page - Edit the auto populated values, Create Renewal Opp page - Delete the opp. product line item
	When I Navigate to "Service Contracts" tab
	Then I select Test SC view
	And I click on the Go button if present
	And I click on "RenewNetOpsSCTest" link
	Then I generate Opportunity from the Service Contract	
	And I verify the generated opportunity for "ServiceContracts"
	And I manually delete the opportunity
#	Then I select the Source Service Contract for Opportunity Generation from ServiceContract
#	Then I generate Opportunity from Service Contract	
#	And I verify the generated opportunity for "ServiceContracts"
#    When I Navigate to "Opportunities" tab
#	And I select the renewal opportunity for "ServiceContracts"
#	And I delete the product from the generated opportunity for "ServiceContracts"
	
@renErrorMsgForServiceContract
Scenario: Rally Test Case-ID: TC3381: Create Renewal Opp page - Mandatory Messsages
	When I Navigate to "Service Contracts" tab	
	#Then I select the Source Service Contract for Opportunity Generation from ServiceContract
	Then I select Test SC view
	And I click on the Go button if present
	And I click on "RenewNetOpsSCTest" link
	And I click on "Generate Opportunity" button to Generate Opportunity
	Then I check for the errors to be displayed while generating opportunity for serviceContract
