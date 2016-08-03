@ServiceSourceSetUp
@UpdateOpportunityFromAssetsFeature
Feature: All features related to Service Source setup - Update Opportunity From Assets

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@update_opportunity_assert_fields
Scenario: Rally Test Case ID: TC3407,TC3408,TC3409,TC3410,TC3411,TC3413: Opportunity Updates - Asset Field Change,Default AND Criteria,Add Filter Logic,Multiple Criteria,Clear Filter Logic,All Operator
#	When I click on "ServiceSource Setup" link
#	And I click on "Opportunity Generation" link
#	And I select the "Enable Generation of Opportunities" checkbox on opp generation
#	When I click on "ServiceSource Setup" link
#	And I click on "Mappings" link
#	And I click on "Opportunity → Renewal Opportunity" link
#	And I save the Mapping

#	When I click on "ServiceSource Setup" link
#	And I click on "Mappings" link
#	And I click on "Asset → Opportunity" link
#	Then all required fields should be displayed in Grey
#	And I should be able to edit Opportunity Product Line field Quantity
#	And I save the Mapping
	
	#When I click on "ServiceSource Setup" link
	#And I click on "Opportunity Updates" link
	#And I select the "Update opportunities when the following assets fields change"
	#And I add multiple criteria for asset fields and clear filter logic
	#And I add asset criteria and multiple filter logic "1 AND 2 OR 3" and "1 OR 2 OR 3"
	
#	When I click on "Opportunities" link
#	And I go to existing renewal opportunities
#	And I click on asset link
#	And I update the asset as per criteria set for asset field on opportunity generation
#	When I click on "Opportunities" link
#	And I go to existing renewal opportunities
#	Then I should see the renewal relationship & Metrics fields values are recalculated on the opportunity
	When I click on "Opportunities" link
	And I select Renew View
	And I click on the Go button if present
	And I click on "RenewNetOpsTesting" link
	#And I go to existing renewal opportunities
	And I open the asset
	And I update the asset as per criteria set for asset field on opportunity generation
	When I click on "Opportunities" link
	#And I go to the existing renewal opportunities
	And I select Renew View
	And I click on the Go button if present
	And I click on "RenewNetOpsTesting" link
	Then I should see the Metrics fields values are recalculated on the opportunity
@update_opportunity_checkbox
Scenario: Rally Test Case ID: TC3412 : Opportunity Updates - Update opportunity checkbox
#	When I click on "ServiceSource Setup" link
#	And I click on "Opportunity Generation" link
#	And I select the "Enable Generation of Opportunities" checkbox on opp generation
#	When I click on "ServiceSource Setup" link
#	And I click on "Mappings" link
#	And I click on "Opportunity → Renewal Opportunity" link
#	And I Add Opportunity Fields "Account ID" and "Save"
#	And I save the Mapping
#	When I click on "ServiceSource Setup" link
#	And I click on "Mappings" link
#	And I click on "Asset → Opportunity" link
#	Then all required fields should be displayed in Grey
#	And I should be able to edit Opportunity Product Line field Quantity
#	And I save the Mapping
	When I click on "ServiceSource Setup" link
	And I click on "Opportunity Updates" link
	And I unselect the "Update opportunities when the following assets fields change"
	#And I add asset criteria and multiple filter logic "1 AND 2 OR 3" and "1 OR 2 OR 3"
	When I click on "Opportunities" link
	And I select Renew View
	And I click on the Go button if present
	And I click on "RenewOpsTesting" link
	#And I go to existing renewal opportunities
	And I open the asset
	#And I go to existing renewal opportunities
	#And I click on asset link
	And I update the asset as per criteria set for asset field on opportunity generation
	When I click on "Opportunities" link
	#And I go to existing renewal opportunities
	And I select Renew View
	And I click on the Go button if present
	And I click on "RenewOpsTesting" link
	#And I go to existing renewal opportunities
	Then I should not able to see the updated renewal opportunity

