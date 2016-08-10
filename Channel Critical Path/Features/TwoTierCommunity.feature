@TwoTierDirstributor
@TwoTierReseller
Feature: To verify the TwoTier functionality

@Quotes4Dis
Scenario: Rally Test Case ID: TS5484 : Distributor Rep should to See both Quote
    When I log into "CPEETEST4DIST" details
    And I click on "Opportunities" tab
    When I search for the "TwoTierAutomationPO" opportunities
    And I click on "Quotes" tab
    And I verify "Distributor" Quote
    
@Quotes4Res
Scenario: Rally Test Case ID: TS5487 : Two Tier Pricing - Reseller to see only the Reseller Quote & not the Distributor Quote Value
    When I log into "CPEETEST4RES" details
    And I click on "Opportunities" tab
    When I search for the "TwoTierAutomationPO" opportunities
    And I click on "Quotes" tab
    And I verify "Reseller" Quote
    
@SetDisQuoteAsPrimary
Scenario: Rally Test Case ID: TS5488 : Two Tier Pricing - Distributor  Quote syncing on opportunity grid.
    When I log into "CPEETEST4DIST" details
    And I click on "Opportunities" tab
    When I search for the "TwoTierAutomationPO" opportunities
    And I click on "Quotes" tab
    And I Set "Reseller" Quote as primary

@ResSetNonPrimaryQuoteAsPrimary
Scenario: Rally Test Case ID: TC5891 : Two Tier Pricing - Reseller to be able to set non-primary quote as Primary Quote
    When I log into "CPEETEST4RES" details
    And I click on "Opportunities" tab
    When I search for the "TwoTierAutomationPO" opportunities
    And I click on "Quotes" tab
    And I Set "Distributor" Quote as primary

@DisSetNonPrimaryQuoteAsPrimary
Scenario: Rally Test Case ID: TC5892 : Two Tier Pricing - Distributor to be able to set non-primary quote as Primary Quote
    When I log into "CPEETEST4DIST" details
    And I click on "Opportunities" tab
    When I search for the "TwoTierAutomationPO" opportunities
    And I click on "Quotes" tab
    And I Set "NonPrimary" Quote as primary

@RequestPageRes2SeeResQuote
Scenario: Rally Test Case ID: TC5893 : Two Tier Pricing - Hide Distributor quote from Reseller in new request form
    When I log into "CPEETEST4RES" details
    And I click on "Requests" tab
    And I click on the "New Request"
    When I enter subject line "Community"
    And I select the Account "TwoTierAutomation" from drop down
    And I "Reseller" verify Reseller and Distributor Quotes in Related To Quote field

@RequestPageDis2SeeResDisQuotes
Scenario: Rally Test Case ID: TC5894 : Two Tier Pricing - Distributor to view both reseller and distributor quotes in the new request form
    When I log into "CPEETEST4DIST" details
    And I click on "Requests" tab
    And I click on the "New Request"
    When I enter subject line "Community"
    And I select the Account "TwoTierAutomation" from drop down
    And I "Distributor" verify Reseller and Distributor Quotes in Related To Quote field    
    
    
    
@TwoTireDistributerVsResellerQuote
Scenario: Rally Test Case ID: TC6441 : Create Distributor Quote and Compare with Reseller Quote
		When I log into "CHANNELMANAGER_DEV25" details
		And I click on "Opportunities" tab
		And I Create New Source Opportunity
		And I select "Standard Price Book" pricebook
		And I Add "2" Products having product name as "Product" to Opportunity
		And I Renew Source Opportunity
		
		
		
		



