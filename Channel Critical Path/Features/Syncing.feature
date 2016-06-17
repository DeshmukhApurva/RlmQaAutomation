@PartnerOpportunity
@SyncingFeature
Feature: All features related to Channel Manager user - Partner Opportunity - Syncing

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page
  
@Syncing_opp
Scenario: Rally-ID: TC4324,TC4325,TC4326,TC4327,TC4328 : Opportunity Page- Syncing button on Partner Opportunities Related List related functionalities
	When I click on the "Opportunities" grid tab	
	Then I select the "RenewalOpportunity"
	And I verify "Syncing" button on Partner Opportunity Page
	When I select more than one Partner Opportunity
	When I select "First" Partner Opportunity
	Then I select the further options for syncing
	And I verify the changes after sync for "First" Partner Opportunity

@SyncFromMasterOpp
Scenario: Rally-ID: TC4329,TC4330,TC4331,TC4332 : Opportunity Page- From Master Opportunity Syncing while granting access to new PO and related functionalities
	When I click on the "Opportunities" grid tab	
	Then I select the "RenewalOpportunity"
	And I click on "Add New Partner Opportunity" button
	When I grant access to "From Master Opportunity" for new Partner Opportunity
	And I verify the changes after sync for NewPartnerOpp Partner Opportunity

@SyncToMasterOpp
Scenario: Rally-ID : TC4333,TC4334,TC4335 : Opportunity Page- Auto update of Master Opportunity
	When I click on the "Opportunities" grid tab
	Then I select the "RenewalOpportunity"
	When I select NewPartnerOpp Partner Opportunity
	Then I choose the sync options
	And I verify the master opportunity after changing the sync options
    When I click on the "Opportunities" grid tab
    Then I select the "RenewalOpportunity"
    Then I verify the sync opportunity

@StopSync_opp
Scenario: Rally-ID : TC4336,TC4341 : Opportunity Page- Stop syncing of Master Opportunity and partner opportunity
	When I click on the "Opportunities" grid tab
	Then I select the "RenewalOpportunity"
	When I select NewPartnerOpp Partner Opportunity
	Then I stop the syncing
	And I verify the master opportunity after changing the sync options
    When I click on the "Opportunities" grid tab
    Then I select the "RenewalOpportunity"
    Then I verify the sync opportunity