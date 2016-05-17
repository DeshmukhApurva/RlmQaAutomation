@Overview
@SeeNewOpportunitiesActionTileFeature
Feature: All features related to Overview - See New Opportunities Action Tile

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page

@clickSeeNewOppTile
Scenario: Rally Test Case ID: TC4454,TC4472,TC4473 : Overview Page - Verify count of Partner Opportunities on "See New Opportunities" tile having Stage that is Available/Not Available for Partner user,Last Week Opportunities Count in "See New Opportunities" tile and Clicking on "See New Opportunities" tile,Verify count after clicking on "See New Opportunities" tile
	When I Navigate to "Overview" tab
	And I click on "See New Opportunities" action tile


@account_is_selected_as_reseller_distributor
Scenario: Rally Test Case ID: TC4455 : Overview Page - "See New Opportunities"  action tile count if logged in  user is selected as Reseller/Distributor,
    And user logs out from channel partner community
    And user login in to "OEM" application
    Then I should able to see the "OEM" home page
    When I click on "Opportunities" link
    And I open the existing opportunity
    And I click on "Add New Partner Opportunity" button
    Then I verify the "Opportunity" name and corresponding "Account" name
    When I navigate to "Partner Organization(s)" section
    And I select the "Partner Accounts" from the accounts lookup list
    And I navigate to "Partner Contact(s)" section
    And I select the "Partner Account Contacts" from the contacts lookup list
    And I select the account as "Reseller" or "Distributor"
    And I select the "Incumbent" checkbox
    And I click on the "Grant Access"
    Then I should be able to see the partner opportunity account details
    When user logout from "OEM" application
    Given that I navigate to the CRM application
    Then I should land on CRM home page
    When I Navigate to "Overview" tab
    And I click on "See New Opportunities" action tile


@account_is_not_selected_as_reseller_distributor
Scenario: Rally Test Case ID: TC4456,TC4457 : Overview Page - See New Opportunities action tile if logged in user/contact is NOT a Reseller/Distributor,Overview - See New Opportunities action tile if account is NOT selected as a Reseller/Distributor
    And user logs out from channel partner community
    And user login in to "OEM" application
    Then I should able to see the "OEM" home page
    When I click on "Opportunities" link
    And I open the existing opportunity
    And I click on "Add New Partner Opportunity" button
    Then I verify the "Opportunity" name and corresponding "Account" name
    When I navigate to "Partner Organization(s)" section
    And I select the "Partner Accounts" from the accounts lookup list
    And I navigate to "Partner Contact(s)" section
    And I select the "Partner Account Contacts" from the contacts lookup list
    And I select the account as "Reseller" or "Distributor"
    And I select the "Incumbent" checkbox
    And I click on the "Grant Access"
    Then I should be able to see the partner opportunity account details
    When user logout from "OEM" application
    Given that I navigate to the CRM application
    Then I should land on CRM home page
    When I Navigate to "Overview" tab
    And I click on "See New Opportunities" action tile
