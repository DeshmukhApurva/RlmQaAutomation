@OpportunityGeneration
@CreateRenewalOpportunityFromAssetsFeature
Feature: All features related to Opportunity Generation - Create Renewal Opportunity From Assets

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page
	
@asset
Scenario: Rally-ID: TC3728,TC3729,TC3730,TC3731,TC3732,TC3734: Manual renewal opp creation - From assets,Verify renewal opp - "Renewal" flag to be checked,Verify renewal opp - Verify the products from selected assets,Create Renewal Opp page - Edit the auto populated values,Create Renewal Opp page - Delete the opp product line item.
	When I Navigate to "Assets" tab	
	Then I select more than one Asset
	And I click on "Generate Opportunity" button
	Then I generate new opportunity from the asset
	And I verify the generated opportunity for "Asset"
	And I delete the product from the opportunity for "Asset"	

@assetErrorMsg
Scenario: Rally-ID: TC3733: Create Renewal Opp page - Mandatory Messages
	When I Navigate to "Assets" tab	
	Then I select more than one Asset
	And I click on "Generate Opportunity" button
	Then I check for the errors to be displayed while generating opportunity