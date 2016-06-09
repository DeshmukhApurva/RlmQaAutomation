@RenOpportunityManagement
@RenAddOnRenewalOpportunityFeature


Feature: All features related to Renew User - Opportunity Management - Add on Renewal Opportunity

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@ren_destination_renewal_opportunity
Scenario: Rally Test Case ID: TC3243,TC3244 : AddOn Opportunity - Destination Service Contract,AddOn Opportunity - Destination Renewal Opportunity
	When I click on "Opportunities" link
	And I click on "New" button
	Then I verify that opportunity have lookup to opportunity and field "Destination Renewal Opportunity" and "Destination Service Contract"

@ren_service_contract_add_on_opportunity
Scenario: Rally Test Case ID: TC3247,TC3248,TC3250 : AddOn Opportunity - Validation Message (Pricebook), AddOn Opportunity - Validation Message, AddOn Opportunity - Same Currency of Opportunity & Service Contract
	When I click on "Opportunities" link
	And I click on "New" button
	And I enter mandatory details in "New" opportunity page
    And I click on "Choose Price Book" button
    Then I Choose the Pricebook for the product
	And I click on "Add Product" button
	And I select one or more product from the grid
    And I select the "Destination Service Contract" field
    And I resolve the "opportunity"
    Then I should be able to see the "Source Oppportunity" should get resolved

@ren_no_auto_renewal_opportunity_generated
Scenario: Rally Test Case ID: TC3245,TC3246 : AddOn Opportunity - Resolution, AddOn Opportunity - No auto renewal opportunity generated if user resolves the add-on
	When I click on "Opportunities" link
    And I click on "Go!" button from opportunity page
    And I open the first opportunity
	And I associate opportunity to "Destination Renewal Opportunity"
	And I add new line items to the "Source Opportunities" and resolve the source opportunity
	Then I verify the associated "Destination Renewal Opportunity" and "Source Opportunities"
