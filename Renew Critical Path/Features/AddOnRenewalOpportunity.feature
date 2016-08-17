@OpportunityManagement
@AddOnRenewalOpportunityFeature
Feature: All features related to Opportunity Management - Add on Renewal Opportunity

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@destination_renewal_opportunity
Scenario: Rally Test Case ID: TC3539,TC3540 - AddOn Opportunity - Destination Renewal Opportunity
	When I click on "Opportunities" link
	And I click on "New" button
	Then I verify that opportunity have lookup to opportunity and field "Destination Renewal Opportunity" and "Destination Service Contract"

@service_contract_add_on_opportunity
Scenario: Rally Test Case ID: TC3543,TC3544,TC3546 - AddOn Opportunity - Same Currency of Opportunity & Service Contract
	When I click on "Opportunities" link
	And I click on "New" button
	And I enter mandatory details in "New" opportunity page
    And I click on "Choose Price Book" button
    Then I Choose the Pricebook for the product
	And I click on "Add Product" button
	And I select one or more product from the grid
    And I select the "Destination Service Contract" field
    And I resolve the "opportunity"
    Then I should be able to see the "Source Opportunity" should get resolved

@no_auto_renewal_opportunity_generated
Scenario: Rally Test Case ID: TC3541,TC3542 - AddOn Opportunity - Resolution,No auto renewal opportunity generated if user resolves the add-on
	When I click on "Opportunities" link 
	And I click on "New" button 
	And I enter mandatory details in "Destination_Renewal_Opportunity" opportunity 
	And I click on "Choose Price Book" button 
	Then I Choose the Pricebook for the product 
	When I create Source Opportunity "Opportunity_Line_Item" with Line Items and resolve it with destination "Destination_Renewal_Opportunity" 
	Then I verify the associated "Destination Renewal Opportunity" and "Source Opportunities" 
	And I manually delete Source opp
	And I manually delete Sources Inbound records
	And I manually delete destination opp
	
    