@RenOpportunityManagement
@RenUpdateOpportunityFromAssetsFeature
Feature: All features related to Renew user - Opportunity Management - Update Opportunity From Assets

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@ren_update_opportunity_assert_fields
Scenario: Rally Test Case ID: TC3386: Opportunity Updates - Asset Field Change
	When I click on "Opportunities" link
	And I select Renew View
	And I click on the Go button if present
	And I click on "RenewOpsTesting" link
	#And I go to existing renewal opportunities
	And I open the asset
	And I update the asset as per criteria set for asset field on opportunity generation
	When I click on "Opportunities" link
	#And I go to the existing renewal opportunities
	And I select Renew View
	And I click on the Go button if present
	And I click on "RenewOpsTesting" link
	Then I should see the Metrics fields values are recalculated on the opportunity
