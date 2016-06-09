@RenOpportunityGeneration
@RenCreateRenewalOpportunityFromAssetsFeature
Feature: All features related to Renew user - Opportunity Generation - Create Renewal Opportunity From Assets

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page
	
@renAsset
Scenario: Rally-ID: TC3366,TC3367,TC3368,TC3369,TC3370,TC3372: Manual renewal opp creation - From assets,Verify renewal opp - "Renewal" flag to be checked,Verify renewal opp - Verify the products from selected assets,Create Renewal Opp page - Edit the auto populated values,Create Renewal Opp page - Delete the opp product line item.
	When I Navigate to "Assets" tab	
	Then I select more than one Asset
	And I click on "Generate Opportunity" button
	Then I generate new opportunity from the asset
	And I verify the generated opportunity for "Asset"
	And I delete the product from the opportunity for "Asset"	

@renAssetErrorMsg
Scenario: Rally-ID: TC3371: Create Renewal Opp page - Mandatory Messages
	When I Navigate to "Assets" tab	
	Then I select more than one Asset
	And I click on "Generate Opportunity" button
	Then I check for the errors to be displayed while generating opportunity