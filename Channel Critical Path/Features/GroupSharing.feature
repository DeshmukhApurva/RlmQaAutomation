@PartnerOpportunity
@PortalGroup
@GroupSharingFeature
Feature: All features related to Portal Group - Group Sharing

  Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@portal_groups_tab
Scenario: Rally Test Case ID: TS5459,TS5460,TS5461,TS5462,TS5463 - Portal Groups: Availability of Portal Group Tab,Verify Portal Group Tab,Verify New Button,Verify Create Portal Group page UI,Verify Group Name is a Mandatory Field
    When I click on the "Portal Groups" grid tab
    Then I should able to see the "New" button from "Portal Groups" page
    When I click on the "New" button from "Portal Groups" page
    Then I verify the create "Portal Groups" fields
    And I verify the mandatory field "Portal Group Name"


@verify_portal_groups_fields
Scenario: Rally Test Case ID: TS5464,TS5465,TS5466 - Portal Groups: Account based search on Portal Group page,Partner User based search on Portal Group page,Verify Blank Search on Portal Group Page
    When I click on the "Portal Groups" grid tab
    And I click on the "New" button from "Portal Groups" page
    And I select the "Accounts" radio button
    And I enter the partner account name
    And I click on partner "Search" button
    Then I verify the search results
    When I click on the "Portal Groups" grid tab
    And I click on the "New" button from "Portal Groups" page
    And I select the "Partner Users" radio button
    And I enter the partner user name
    And I click on partner "Search" button
    Then I verify the search results
    When I click on the "Portal Groups" grid tab
    And I click on the "New" button from "Portal Groups" page
    And I select the "Partner Users" radio button
    And I click on partner "Search" button
    Then I should able to see the search error message


@verify_portal_groups_error_messages
Scenario: Rally Test Case ID: TS5467 - Portal Groups: Search validation on Portal Group page
    When I click on the "Portal Groups" grid tab
    And I click on the "New" button from "Portal Groups" page
    And I enter the partner user name
    And I click on partner "Search" button
    Then I should able to see the account and partner user error message


@verify_portal_groups
Scenario: Rally Test Case ID: TS5468,TS5469 - Portal Groups: Verify "Selected Group Members" Section on Portal Groups pageVerify "Selected Group Members" Section display correct members,Verify validation message when user clicks on Add to Group without selecting any account or partner user
    When I click on the "Portal Groups" grid tab
    And I click on the "New" button from "Portal Groups" page
    And I select the "Partner Users" radio button
    And I enter the partner user name
    And I click on partner "Search" button
    And I select the "Partner Users" from "Add To Group" grid
    And I save the partners to "Add To Group"
    Then I verify the "Partner Users" records are added to the group
    When I "Save" the portal group


@verify_validation_message
Scenario: Rally Test Case ID: TS5470 - Portal Groups: Verify validation message when user clicks on Add to Group without selecting any account or partner user
    When I click on the "Portal Groups" grid tab
    And I click on the "New" button from "Portal Groups" page
    And I select the "Partner Users" radio button
    And I enter the partner user name
    And I click on partner "Search" button
    And I save the partners to "Add To Group"
    And I "Save" the portal group
    Then I should able to see the search error message


@remove_group_member
Scenario: Rally Test Case ID: TS5471 - Portal Groups: Ability of the user to remove members from "Selected Group Members" Section
    When I click on the "Portal Groups" grid tab
    And I click on the "New" button from "Portal Groups" page
    And I select the "Partner Users" radio button
    And I enter the partner user name
    And I click on partner "Search" button
    Then I verify the "Partner Users" group members
    When I select the "Partner Users" from "Add To Group" grid
    And I save the partners to "Add To Group"
    Then I verify the "Partner Users" records are added to the group
    When I remove the group member
    Then I verify the group member removed or not


@create_partner_user_portal_group
Scenario: Rally Test Case ID: TS5472,TS5473,TS5474,TS5477 - Portal Group : Ability of the user to create portal groups,Ability of the user to create portal groups with Partner Account only,Ability of the user to create portal groups with Partner User only,Save portal group when Roll Up hierarchy is true (checked)
    When I click on the "Portal Groups" grid tab
    And I click on the "New" button from "Portal Groups" page
    And I enter the "Portal Group Name" name
    And I enter the "Description"
    And I check the "Roll Up Hierarchy" group
    And I select the "Partner Users" radio button
    And I enter the partner user name
    And I click on partner "Search" button
    Then I verify the search results
    And I select the "Partner Users" from "Add To Group" grid
    And I save the partners to "Add To Group"
    Then I verify the "Partner Users" records are added to the group
    When I "Save" the portal group
    Then I verify the created portal group


@create_account_portal_group
Scenario: Rally Test Case ID: TS5475 - Portal Group : Ability of the user to create portal groups with combination of Partner user as well as partner account
    When I click on the "Portal Groups" grid tab
    And I click on the "New" button from "Portal Groups" page
    And I enter the "Portal Group Name" name
    And I enter the "Description"
    And I check the "Roll Up Hierarchy" group
    And I select the "Accounts" radio button
    And I enter the partner account name
    And I click on partner "Search" button
    Then I verify the search results
    When I select the "Partner Users" from "Add To Group" grid
    When I save the partners to "Add To Group"
    Then I verify the "Partner Users" records are added to the group
    And I select the "Partner Users" radio button
    And I enter the partner user name
    When I click on partner "Search" button
    Then I verify the search results
    When I select the "Partner Users" from "Add To Group" grid
    When I save the partners to "Add To Group"
    Then I verify the "Partner Users" records are added to the group
    When I "Save" the portal group
    Then I verify the created portal group


@duplicate_portal_groups
Scenario: Rally Test Case ID: TS5476 - Portal Groups : Duplicate portal groups are not allowed
    When I click on the "Portal Groups" grid tab
    And I click on the "New" button from "Portal Groups" page
    And I fill the "Portal Group Name"
    And I enter the "Description"
    And I check the "Roll Up Hierarchy" group
    And I select the "Partner Users" radio button
    And I enter the partner user name
    And I click on partner "Search" button
    Then I verify the search results
    When I select the "Partner Users" from "Add To Group" grid
    And I save the partners to "Add To Group"
    Then I verify the "Partner Users" records are added to the group
    When I "Save" the portal group
    When I click on the "Portal Groups" grid tab
    And I click on the "New" button from "Portal Groups" page
    And I fill the "Portal Group Name"
    And I enter the "Description"
    And I check the "Roll Up Hierarchy" group
    And I select the "Partner Users" radio button
    And I enter the partner user name
    And I click on partner "Search" button
    Then I verify the search results
    When I select the "Partner Users" from "Add To Group" grid
    And I save the partners to "Add To Group"
    Then I verify the "Partner Users" records are added to the group
    When I "Save" the portal group
    Then I should not able to create the duplicate portal groups



@cancel_partner_user_portal_group
Scenario: Rally Test Case ID: TS5478 - Portal Groups : Verify portal group creation when user clicks on Cancel button
    When I click on the "Portal Groups" grid tab
    And I click on the "New" button from "Portal Groups" page
    And I enter the "Portal Group Name" name
    And I enter the "Description"
    And I check the "Roll Up Hierarchy" group
    And I select the "Partner Users" radio button
    And I enter the partner user name
    And I click on partner "Search" button
    Then I verify the search results
    When I select the "Partner Users" from "Add To Group" grid
    And I save the partners to "Add To Group"
    Then I verify the "Partner Users" records are added to the group
    When I "Cancel" the portal group
    Then I should not able to create portal group


@share_partner_opportunity
Scenario: Rally Test Case ID: TS5479,TS5480 - Group Sharing : Verify instant access to partner opportunity when Portal group consists of Partner Accounts only,Verify instant access to partner opportunity when Portal group consists of Partner Accounts as well Users
    When I click on the "Opportunities" grid tab
    And I open the existing opportunity
    And I click on "Add New Partner Opportunity" button
    Then I verify the "Opportunity" name and corresponding "Account" name
    And I select the "Partner Account" account
    And I select the "Partner Account Contact" contact
    And I select the "Incumbent" checkbox
    And I click on the "Grant Access"
    Then I should be able to see the partner account hierarchy details
    And I "Sharing" the partner opportunity
    And I "Add" the "Public Groups" for sharing
    Then I verify the shared "Public Groups"