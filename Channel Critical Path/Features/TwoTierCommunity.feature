@TwoTierDirstributor
@TwoTierReseller
Feature: To verify the TwoTier functionality

@Quotes4Dis
Scenario: Rally Test Case ID: TS5484 : Distributor Rep should to See both Quote
    When I log into "CPEETEST4DIST" details
    And I click on "Opportunities" tab
    When I search for the "TwoTierAutomationRO-TwoTierAutomation" opportunities
    And I click on "Quotes" tab
    And I verify "Distributor" Quote
    
@Quotes4Res
Scenario: Rally Test Case ID: TS5484 : Distributor Rep should to See both Quote
    When I log into "CPEETEST4RES" details
    And I click on "Opportunities" tab
    When I search for the "TwoTierAutomationRO-TwoTierAutomation" opportunities
    And I click on "Quotes" tab
    And I verify "Reseller" Quote    