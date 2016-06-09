@OpportunityManagement
@RenewalOpportunityFieldsFeature
Feature: All features related to Opportunity Management - Renewal Opportunity Fields

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@opportunity_detail_fields
Scenario: Rally Test Case ID: TC3589,TC3600,TC3601,TC3603,TC3608,TC3609,TC3613,TC3610,TC3611,TC3618 : Renewal Opportunity Specific fields - Verify the 'Earliest Expiration Date' field, Renewal Opportunity Specific fields - Expiration Quarter, Renewal Opportunity Specific fields - Expiration Year, Renewal Opportunity Specific fields - Renewal Target, Renewal Opportunity Specific fields - Renewal Target Multiplier, Renewal Opportunity Specific fields - Previous Price, Renewal Opportunity Specific fields - Verify the Earliest Expiration Date field,Renewal Opportunity Specific fields - Assets and Service Contract Line Items: Start Date, Renewal Opportunity Specific fields - Assets and Service Contract Line Items: End Date, Fiscal Year Calender - Values in Fiscal Year Range
	When I click on "Opportunities" link
	And I go to existing renewal opportunities
	And I change the earliest expiration date value and set the new date range
	Then I should able to see the opportunity detail fields

@renewals_indicators_fields
Scenario: Rally Test Case ID: TC3590,TC3591,TC3594,TC3595,TC3604,TC3606,TC3607 : Renewal Opportunity Specific fields - Loss Rate,Renewal Opportunity Specific fields - DIA Contacted,Renewal Opportunity Specific fields - DIA Quoted,Renewal Opportunity Specific fields - DIA Closed,Renewal Opportunity Specific fields - Adds Ratio,Renewal Opportunity Specific fields - Days Until Expiration,Renewal Opportunity Specific fields - Status
	When I click on "Opportunities" link
	And I go to existing renewal opportunities
	And I click on "Add Product" button
	And I select one or more product from the grid
	And I change renewal status of one of the line items to "Closed Won"
	Then I should able to see the renewals indicators fields

@renewal_tracking_fields
Scenario: Rally Test Case ID: TC3592,TC3593,TC3596,TC3597,TC3598,TC3599,TC3602,TC3605,TC3612,TC3614,TC3615,TC3616,TC3617 : Renewal Opportunity Specific fields - First Contact Date,Renewal Opportunity Specific fields - First Quote Date,Renewal Opportunity Specific fields - Adds Amount,Renewal Opportunity Specific fields - Renewal Target - Resolved,Renewal Opportunity Specific fields - Renewal Target - Lost,Renewal Opportunity Specific fields - Renewal Target - Won, Renewal Opportunity Specific fields - Resolution Date, Renewal Opportunity Specific fields - Conversion Rate, Renewal Opportunity Specific fields - Assets and Service Contract Line Items: Renewal Target, Renewal Opportunity Specific fields - Verify the Renewal Target - Resolved field, Renewal Opportunity Specific fields - Verify the Renewal Target - Lost field, Renewal Opportunity Specific fields - Verify the Renewal Target - Won field, Renewal Opportunity Specific fields - Verify the Renewal Target field
	When I click on "Opportunities" link
	And I go to existing renewal opportunities
	And I click on "Add Product" button
	And I select one or more product from the grid
	And I should able to see the "Renewal Relationship" section
	And I change renewal status of one of the line items to "Closed Lost"
	Then I should able to see the renewal tracking fields

