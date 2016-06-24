@PartnerOpportunity
@AddPartnerOpportunityFeature
Feature: All features related to Partner Opportunity - Add Partner Opportunity

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@verify_opportunity_account_name
Scenario: Rally Test Case ID: TC4296,TC4297,TC4298 : Add New Partner Opportunity - SS License On/Off, Opportunity and Account Name, Partner Accounts
    When I click on the "Opportunities" grid tab
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



@with_no_previous_term_line_items
Scenario: Rally Test Case ID: TC4299 : Add New Partner opportunity - With no Previous Term Line Items
    When I click on the "Opportunities" grid tab
    And I open the existing opportunity
    And I click on "Add New Partner Opportunity" button
    And I select the partner account
    And I click on the "Grant Access"
    Then I should be able to see the partner opportunity details


@deselect_previous_term_line_items
Scenario: Rally Test Case ID: TC4300,TC4301,TC4302 : Add New Partner opportunity -Previous Term Line Items,Deselect Previous Term Line Items,Select Previous Term Line Items
    When I click on the "Opportunities" grid tab
    And I open the existing opportunity
    And I click on "Add New Partner Opportunity" button
    And I select the partner account
    And I navigate to "Previous Term Line Items" section
    Then I verify the all term "Previous Term Line Items" are selected
    And I "Deselect All" and "Select All" any previous term line item from the grid
    And I click on the "Grant Access"
    Then I should be able to see the partner opportunity details


@deselect_quote_line_items
Scenario: Rally Test Case ID: TC4303,TC4304,TC4305 : Add New Partner opportunity - Quote Line Items,Deselect Quote Line Items,Select Quote Line Items
    When I click on the "Opportunities" grid tab
    And I open the existing opportunity
    And I click on "Add New Partner Opportunity" button
    And I select the partner account
    And I navigate to "Quote Line Items" section
    Then I verify the all "Quote Line Items" are selected
    And I "Deselect All" and "Select All" any quote line item from the grid
    And I click on the "Grant Access"
    Then I should be able to see the partner opportunity details

@add_attachment
Scenario: Rally Test Case ID: TC4306,TC4307,TC4308,TC4309,TC4310 : Add attachment and notes,Delete attachment,Grant Access,Primary quote synced if opportunity - Primary checkbox selected.
    When I click on the "Opportunities" grid tab
    And I open the existing opportunity
    When I click on "Add New Partner Opportunity" button
    And I select the partner account
    And I navigate to "Previous Term Line Items" section
    And I navigate to "Quote Line Items" section
    And I navigate to "Attachments" section
    And I add the "Documents/DataStage.pdf" attachment
    And I click on the "Grant Access"
    And I delete the "DataStage.pdf" attachment
    Then I should be able to see the partner opportunity details
    When I click on the "Opportunities" grid tab
    And I open the existing opportunity
    And I set the "Set as Primary" opportunity
    Then I should able to see the selected "Set as Primary" opportunity


@opportunity_access_with_parent_account
Scenario: Rally Test Case ID: TC4311,TC4319 : Add New Partner Opportunity - Check the opportunity access with parent account
    When I click on the "Opportunities" grid tab
    And I open the existing opportunity
    And I click on "Add New Partner Opportunity" button
    Then I verify the "Opportunity" name and corresponding "Account" name
    When I navigate to "Partner Organization(s)" section
    And I select the "Partner Account" account
    And I navigate to "Partner Contact(s)" section
    And I select the "Partner Account Contact" contact
    And I select the "Incumbent" checkbox
    And I click on the "Grant Access"
    Then I should be able to see the partner account hierarchy details
    
@HidePartnerAccount1_2Type
Scenario: Rally Test Case ID: TS5457,TS5458 : Two Tier Pricing - Check box enabled to hide partner account type picklists on create partner opportunity page
	When I Navigate to "ServiceSource Setup" tab
	And I click on "Channel Portal Configuration" link
	Then I "Check" the "Enable 2 Tier Pricing" checkbox
	When user logout from "OEM" application
	When I log into "CHANNELMANAGER_EETEST4" details
	When I Navigate to "Accounts" tab
	Then I "Hide" partner account 1_2 picklist on PO

@ShowPartnerAccount1_2Type	
Scenario: Rally Test Case ID: TS5457,TS5458 : Two Tier Pricing - Check box disabled to show partner account type picklists on create partner opportunity page
	When I Navigate to "ServiceSource Setup" tab
	And I click on "Channel Portal Configuration" link
	Then I "Uncheck" the "Enable 2 Tier Pricing" checkbox
	When user logout from "OEM" application
	When I log into "CHANNELMANAGER_EETEST4" details
	When I Navigate to "Accounts" tab
	Then I "Show" partner account 1_2 picklist on PO    