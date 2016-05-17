@OpportunityGeneration
@CreateRenewalOpportunityFromServiceContractFeature
Feature: All features related to Opportunity Generation - Create Renewal Opportunity From ServiceContract

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@generateOppfromSourceSC
Scenario: Rally Test Case-ID: TC3738,TC3739,TC3740,TC3741,TC3742 : Verify renewal opp - "Renewal" flag to be checked,Verify renewal opp - Fields Display, Create Renewal Opp page - Service contract -> Opp line item mapping values,Create Renewal Opp page - Edit the auto populated values, Create Renewal Opp page - Delete the opp. product line item
	When I Navigate to "Service Contracts" tab
	Then I select the Source Service Contract for Opportunity Generation from ServiceContract
	Then I generate Opportunity from Service Contract	
	And I verify the generated opportunity for "ServiceContracts"
	And I Navigate to "Opportunities" tab
	And I select the renewal opportunity for "ServiceContracts"
	And I delete the product from the generated opportunity for "ServiceContracts"
	
@ErrorMsgForServiceContract
Scenario: Rally Test Case-ID: TC3743 : Create Renewal Opp page - Mandatory Messages
	When I Navigate to "Service Contracts" tab	
	Then I select the Source Service Contract for Opportunity Generation from ServiceContract
	Then I check for the errors to be displayed while generating opportunity for serviceContract
