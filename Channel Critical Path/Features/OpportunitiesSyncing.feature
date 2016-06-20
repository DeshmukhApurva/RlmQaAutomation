@Opportunities
@OpportunitiesSyncingFeature
Feature: All features related to Opportunities - Syncing

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@ToMasteropp
Scenario: Rally-ID : TC4511 : Opportunity Page- Auto update of MO when PO (PO is having Syncing value as "TO Master Opportunity")  gets updated from Channel Community.
    When I click on "Opportunities" tab
    And I verify the current expiration quarter value in Expiration Quarter filter
    And I verify the current expiration year value in Expiration Year filter
    Then I Select the Partner Opportunity with sync "ToMaster" and Update
    When user logs out from channel partner community
    And user login in to "OEM" application
    Then I should able to see the "OEM" home page
    When I click on the "Opportunities" grid tab
    Then I select the "RenewalOpportunity"
    And I verify Tomaster opportunity

@bulkUpdate_sync
Scenario: Rally-ID: TC4512,TC4522 : Opportunity Page: Auto update of MO when user perform bulk update of Opporuntities (Opp having Syncing value as "TO Master Opportunity") from Channel Community, Syncing partner opportunity quote sync with the master opportunity
  When I click on "Opportunities" tab
  And I verify the current expiration quarter value in Expiration Quarter filter
  And I verify the current expiration year value in Expiration Year filter
  Then I Select the Partner Opportunity and bulkupdate with sync "ToMaster"
  When user logs out from channel partner community
  And user login in to "OEM" application
  Then I should able to see the "OEM" home page
  When I click on the "Opportunities" grid tab
  Then I select the "RenewalOpportunity"
  And I verify Tomaster opportunity
  And I verify master opportunity

@PrimaryQuote_sync
Scenario: Rally-ID: TC4521 : Opportunity - Set the Primary quote for PO
  When I click on "Opportunities" tab
  Then I Select the Partner Opportunity to set primary
  And I verify the opportunity "Amount" field value









