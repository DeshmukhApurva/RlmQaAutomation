@OpportunityGeneration
@CreateRenewalOpportunityFromSourceOpportunityFeature
Feature: All features related to Opportunity Generation - Create Renewal Opportunity From Source Opportunity

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@GenerateOpp
Scenario: Rally-ID: TC3717,TC3718,TC3719: Manual renewal opportunity creation - From opportunity, Verify renewal opp - "Renewal" flag to be checked, Verify renewal opp - Fields
	When I Navigate to "Opportunities" tab
	Then I select the Source Opportunity for Opportunity Generation from Opportunity	
	Then I generate Opportunity from Opportunity	
	And I verify the generated opportunity for "SourceOppDetails"


@NewOpp
Scenario: Rally-ID: TC3720,TC3721,TC3722,TC3723: Verify renewal opp - Covered Asset and Covered Product from source opp,Create Renewal Opp page - Opp->Renew opp mapping values,Create Renewal Opp page - Edit the auto populated values, Create Renewal Opp page - Delete the opp. product line item
	When I Navigate to "Opportunities" tab	
	Then I create a new source Opportunity	
	And I click on "Choose Price Book" button
	Then I Choose the Pricebook for the product
	And I click on "Add Product" button
	And I select more than one product from the product grid
	And I select the products for the new opportunity
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

@Errormessage
Scenario: Rally-ID: TC3724: Create Renewal Opp page - Check the message if mandatory fields are empty
	When I Navigate to "Opportunities" tab
	Then I select the Source Opportunity for Opportunity Generation from Opportunity		
	Then I check for the errors to be displayed while generating opportunity for Opportunity
