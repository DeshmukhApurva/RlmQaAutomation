@Opportunities
@OpportunitiesSyncingFeature
Feature: All features related to Opportunities - Syncing

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@ToMasteropp
Scenario: Rally-ID : TC4511 : Opportunity Page- Auto update of MO when PO (PO is having Syncing value as "TO Master Opportunity")  gets updated from Channel Community.
    When I click on "Opportunities" link
    Then I Select the Partner Opportunity with sync "ToMaster" and Update
    When user logs out from channel partner community
    And user login in to "OEM" application
    Then I should able to see the "OEM" home page
    When I Navigate to "Opportunities" tab
    Then I select the "RenewalOpportunity"
    And I verify Tomaster opportunity

@bulkUpdate
Scenario: Rally-ID: TC4512,TC4522 : Opportunity Page: Auto update of MO when user perform bulk update of Opporuntities (Opp having Syncing value as "TO Master Opportunity") from Channel Community, Syncing partner opportunity quote sync with the master opportunity
  When I click on "Opportunities" link
  Then I Select the Partner Opportunity and bulkupdate with sync "ToMaster"
  When user logs out from channel partner community
  And user login in to "OEM" application
  Then I should able to see the "OEM" home page
  When I Navigate to "Opportunities" tab
  Then I select the "RenewalOpportunity"
  And I verify Tomaster opportunity
  And I verify master opportunity

@PrimaryQuote
Scenario: Rally-ID: TC4521 : Opportunity - Set the Primary quote for PO
  When I click on "Opportunities" link
  Then I Select the Partner Opportunity to set primary
  And I verify the "Amount" field value
  When I click on "Quotes" link
#  And I verify the primary quote field









