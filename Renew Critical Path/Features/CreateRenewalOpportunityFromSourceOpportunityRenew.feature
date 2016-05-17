@RenOpportunityGenerationModule
@RenCreateRenewalOpportunityFromSourceOpportunityFeature
Feature: All features related to Renew user - Opportunity Generation - Create Renewal Opportunity From Source Opportunity

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@renGenerateOpp
Scenario: Rally-ID: TC3355,TC3356,TC3357: Manual renewal opportunity creation - From opportunity, Verify renewal opp - "Renewal" flag to be checked, Verify renewal opp - Fields
	When I Navigate to "Opportunities" tab
	Then I select the Source Opportunity for Opportunity Generation from Opportunity	
	Then I generate Opportunity from Opportunity	
	And I verify the generated opportunity for "SourceOppDetails"

@renNewOpp
Scenario: Rally-ID: TC3358,TC3359,TC3360,TC3361: Verify renewal opp - Covered Asset and Covered Product from source opp,Create Renewal Opp page - Opp->Renew opp mapping values,Create Renewal Opp page - Edit the auto populated values, Create Renewal Opp page - Delete the opp. product line item
	When I Navigate to "Opportunities" tab	
	Then I create a new source Opportunity	
	And I click on "Choose Price Book" button
	Then I Choose the Pricebook for the product
	And I click on "Add Product" button
	And I select more than one product from the product grid
	And I select the products for the new opportunity
	When I Navigate to "Opportunities" tab	
	Then I select the Renewal Opportunity
	Then I set the covered product 	
	When I Navigate to "Opportunities" tab	
	Then I select the Renewal Opportunity
	Then I set the covered asset	
	When I Navigate to "Opportunities" tab	
	Then I select the Renewal Opportunity	
	Then I Resolved the opportunity	
	When I Navigate to "Opportunities" tab	
	And I select the resolved Opportunity	
	And I verify the resolved opportunity 
	And I delete the product from the opportunity	

@renErrormessage
Scenario: Rally-ID: TC3362: Create Renewal Opp page - Check the message if mandatory fields are empty
	When I Navigate to "Opportunities" tab
	Then I select the Source Opportunity for Opportunity Generation from Opportunity		
	Then I check for the errors to be displayed while generating opportunity for Opportunity
	

	

	

	
	