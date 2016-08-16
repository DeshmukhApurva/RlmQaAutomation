@TwoTireOpportunityFeature
Feature: To verify Reseller and Distributor quotes in TwoTier

	Background: Login to the Application
	    Given that I navigate to the CRM application
	    Then I should land on CRM home page

	@TwoTireDistributerVsResellerQuote
	Scenario: Rally Test Case ID: TC6441 : Create Distributor Quote and Compare with Reseller Quote
		And I click on "Opportunities" tab
		And I Create New Source Opportunity
		And I select "Standard Price Book" pricebook
		And I Add "2" Products having product name as "Product" to Opportunity
		And I Renew Source Opportunity
		And I click on "Add New Partner Opportunity" button
		And I select the partner accounts from the accounts lookup list for Two Tire
		And I click on the "Grant Access"
		And I navigate to Opportunity from partner Opportunity page
		And I select the Reseller Quote from the quote related list
		And I check the distributor quote checkbox status for "reseller"
		And I edit the quotename as "TTReseller Quote"
		And I create Distributor Quote from Reseller Quote
		And I check the distributor quote checkbox status for "distributor"
		And I edit the quotename as "TTDistributor Quote"
		And I navigate to opportunity from quote page
		And I check checkbox status for reseller and distributor quotes
			
			
	@TwoTireDistributerAndResellerQuoteStatus
	Scenario: Rally Test Case ID: TC6442 : Create Distributor Quote and Compare with Reseller Quote
		And I click on "Opportunities" tab
		And I Create New Source Opportunity
		And I select "Standard Price Book" pricebook
		And I Add "2" Products having product name as "Product" to Opportunity
		And I Renew Source Opportunity
		And I click on "Add New Partner Opportunity" button
		And I select the partner accounts from the accounts lookup list for Two Tire
		And I click on the "Grant Access"
		And I navigate to Opportunity from partner Opportunity page
		And I create new "TTReseller Quote" quote for TwoTire
		And I check the distributor quote checkbox status for "reseller"
		And I create Distributor Quote from Reseller Quote
		And I edit the quotename as "TTDistributor Quote"
		And I check the distributor quote checkbox status for "distributor"
		And I navigate to opportunity from quote page
		And I check checkbox status for reseller and distributor quotes		