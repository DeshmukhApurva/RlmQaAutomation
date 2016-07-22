@RenOpportunityManagement
@RenRenewalOpportunityFieldsFeature
Feature: All features related to Renew user - Opportunity Management - Renewal Opportunity Fields

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@ren_opportunity_detail_fields
Scenario: Rally Test Case ID: TC3293,TC3304,TC3305,TC3307,TC3312,TC3313,TC3317,TC3314,TC3315,TC3322 : Renewal Opportunity Specific fields - Verify the 'Earliest Expiration Date' field, Renewal Opportunity Specific fields - Expiration Quarter, Renewal Opportunity Specific fields - Expiration Year, Renewal Opportunity Specific fields - Renewal Target, Renewal Opportunity Specific fields - Renewal Target Multiplier, Renewal Opportunity Specific fields - Previous Price, Renewal Opportunity Specific fields - Verify the Earliest Expiration Date field,Renewal Opportunity Specific fields - Assets and Service Contract Line Items: Start Date, Renewal Opportunity Specific fields - Assets and Service Contract Line Items: End Date, Fiscal Year Calender - Values in Fiscal Year Range
	When I click on "Opportunities" link
	And I go to existing renewal opportunities
	And I change the earliest expiration date value and set the new date range
	Then I should able to see the opportunity detail fields

@ren_renewals_indicators_fields
Scenario: Rally Test Case ID: TC3294,TC3295,TC3298,TC3299,TC3308,TC3310,TC3311 : Renewal Opportunity Specific fields - Loss Rate,Renewal Opportunity Specific fields - DIA Contacted,Renewal Opportunity Specific fields - DIA Quoted,Renewal Opportunity Specific fields - DIA Closed,Renewal Opportunity Specific fields - Adds Ratio,Renewal Opportunity Specific fields - Days Until Expiration,Renewal Opportunity Specific fields - Status
	When I click on "Opportunities" link
	And I go to existing renewal opportunities
	#And I click on "Add Product" button
	#And I select one or more product from the grid
	#And I change renewal status of one of the line items to "Closed Won"
	Then I should able to see the renewals indicators fields

@ren_renewal_tracking_fields
Scenario: Rally Test Case ID: TC3296,TC3297,TC3300,TC3301,TC3302,TC3303,TC3306,TC3309,TC3316,TC3318,TC3319,TC3320,TC3321 : Renewal Opportunity Specific fields - First Contact Date,Renewal Opportunity Specific fields - First Quote Date,Renewal Opportunity Specific fields - Adds Amount,Renewal Opportunity Specific fields - Renewal Target - Resolved,Renewal Opportunity Specific fields - Renewal Target - Lost,Renewal Opportunity Specific fields - Renewal Target - Won, Renewal Opportunity Specific fields - Resolution Date, Renewal Opportunity Specific fields - Conversion Rate, Renewal Opportunity Specific fields - Assets and Service Contract Line Items: Renewal Target, Renewal Opportunity Specific fields - Verify the Renewal Target - Resolved field, Renewal Opportunity Specific fields - Verify the Renewal Target - Lost field, Renewal Opportunity Specific fields - Verify the Renewal Target - Won field, Renewal Opportunity Specific fields - Verify the Renewal Target field
	When I click on "Opportunities" link
	#And I click on RenewTesting link
	And I go to existing renewal opportunities
	And I click on "Add Product" button
	And I select one or more product from the grid
	And I should able to see the "Renewal Relationship" section
	And I change renewal status of one of the line items to "Closed Lost"
	Then I should able to see the renewal tracking fields

