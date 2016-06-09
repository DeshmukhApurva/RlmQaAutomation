@PartnerOpportunity
@NonIncumbentPartnerPricingDisplay
@NonIncumbentPartnerPricingDisplayFeature
Feature: All features related to Asset - Non incumbent partner pricing display

  Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@verify_prevent_portal_download_field
Scenario: Rally Test Case ID: TC5261,TC5262,TC5263 - Account: "Prevent Portal Download" checkbox on  Account Details Pa,Asset Page - Partner Account 1 and 2 related fields on Opportunity Page,Service Contracts Page - Partner Account 1 and 2 related fields on Opportunity Page
    When I click on the "Accounts" grid tab
    And I open the existing account
    Then I verify the "Prevent Portal Download" field
    When I click on the "Assets" grid tab
    And I open the existing asset
    Then I verify the partner account fields
    When I click on the "Service Contracts" grid tab
    And I open the existing service contract
    Then I verify the partner account fields


@no_syncing_asset_service_contract_fields
Scenario: Rally Test Case ID: TC5264 - Assets and Service Contracts Page - Value in Partner Account 1/2 related fields when first time Renewal Opportunity gets created and user adds PO to that RO
    When I click on the "Accounts" grid tab
    And I open the existing account
    And I click renewal opportunity having products
    When I click on "Add New Partner Opportunity" button
    Then I verify the "Opportunity" name and corresponding "Account" name
    When I navigate to "Partner Organization(s)" section
    And I select the "Partner Account" account
    And I navigate to "Partner Contact(s)" section
    And I select the "Partner Account Contact" contact
    And I click on the "Grant Access"
    When I click on the "Assets" grid tab
    And I open the existing asset
    Then I verify the partner account fields
    When I click on the "Service Contracts" grid tab
    And I open the existing service contract
    Then I verify the partner account fields


@syncing_asset_service_contract_fields
Scenario: Rally Test Case ID: TC5265,TC5270,TC5277,TC5279 - Assets and Service Contracts Page - Value in Partner Account 1/2 related fields  when user rerenew the Renewal Opportunity having PO that is syncing to RO as "To Master Opportunity",Opportunity and Quote Page: Populating  value in Partner Account 1/2 related fields when user creates PO with "From Master Opportunity" syncing option,Populating value in Partner Account 1/2 related fields when user creates PO which is syncing as "To Master Opportunity"
    When I click on the "Accounts" grid tab
    And I open the existing account
    And I click renewal opportunity having products
    When I click on "Add New Partner Opportunity" button
    Then I verify the "Opportunity" name and corresponding "Account" name
    When I navigate to "Partner Organization(s)" section
    And I select the "Partner Account" account
    And I navigate to "Partner Contact(s)" section
    And I select the "Partner Account Contact" contact
    And I select the "To Master Opportunity" syncing
    And I click on the "Grant Access"
    When I click on the "Assets" grid tab
    And I open the existing asset
    Then I verify the partner account fields
    When I click on the "Service Contracts" grid tab
    And I open the existing service contract
    Then I verify the partner account fields
    When I click on the "Opportunities" grid tab
    And I open the existing opportunity
    Then I verify the partner account fields
    And I open the quote
    Then I verify the partner account fields


@opportunity_partner_account_fields
Scenario: Rally Test Case ID: TC5266,TC5269 - Opportunity Page - Partner Account 1 and 2 related fields on Opportunity Page
    When I click on the "Opportunities" grid tab
    And I open the existing opportunity
    Then I verify the partner account fields
    When I click on the "Opportunities" grid tab
    And I open the existing opportunity
    And I edit the existing "Opportunity"
    Then I verify the partner account fields


@quote_partner_account_fields
Scenario: Rally Test Case ID: TC5267,TC5268,TC5270 - Quote Page - Partner Account 1 and 2 related fields on Quote Page,Populating value in Partner Account 1/2 related fields when user creates PO,Opportunity and Quote Page: Populating value in Partner Account 1/2 related fields when user creates PO which is syncing as "To Master Opportunity"
    When I click on the "Opportunities" grid tab
    And I open the existing opportunity
    Then I verify the partner account fields
    And I open the quote
    Then I verify the partner account fields
    When I click on the "Opportunities" grid tab
    And I open the existing opportunity
    And I click on the "Add New Partner Opportunity"


@populating_updated_quote_value
Scenario: Rally Test Case ID: TC5272,TC5274 - Quote Page: Populating updated value in Partner Account 1/2 related fields when user creates quote manually and associated to a partner opportunity,Updating value in Partner Account 1/2 related fields when user updates the partner opportunity field value of Quote
    When I click on the "Opportunities" grid tab
    And I open the existing opportunity
    Then I verify the partner account fields
    And I click on the "New Quote"
    And I fill the quote required fields
    Then I verify the partner account fields
    And I "Save" the quote
    Then I verify the partner account fields
    When I "Edit" the quote
    And I update the partner opportunity
    And I "Save" the quote
    Then I verify the partner account fields
    

@populating_opportunity_quote_value
Scenario: Rally Test Case ID: TC5273,TC5275,TC5276 - Opportunity and Quote Page: Populating  value in Partner Account 1/2 related fields when user creates quote manually and associat it to a partner opportunity and syncs it,Updating value in Partner Account 1/2 related fields when user updates the partner opportunity field value of syncing Quote,Removing PO reference from Quote when it is Syncing
    When I click on the "Opportunities" grid tab
    And I open the existing opportunity
    Then I verify the partner account fields
    And I click on the "New Quote"
    And I fill the quote required fields
    Then I verify the partner account fields
    And I "Save" the quote
    When I "Start Sync" the quote page
    And I click on the "Continue"
    And I click on the "Sync"
    And I click on the "Done"
    Then I verify the partner account fields
    When I "Edit" the quote
    And I update the partner opportunity
    And I "Save" the quote
    Then I verify the partner account fields
    When I "Edit" the quote
    And I remove the partner opportunity
    And I "Save" the quote
    Then I verify the partner account fields


@syncing_to_master_opportunity
Scenario: Rally Test Case ID: TC5271 - Opportunity and Quote Page: Populating value in Partner Account 1/2 related fields when user syncs the PO as "To Master Opportunity" which is not yet synced
    When I click on the "Accounts" grid tab
    And I open the existing account
    And I click renewal opportunity having products
    And I select the partner opportunity
    And I click on "Syncing" partner opportunity
    And I select the sync "To Master Opportunity" option
    Then I verify the partner account fields


@syncing_from_master_opportunity
Scenario: Rally Test Case ID: TC5278 - Opportunity Page: Populating  value in Partner Account 1/2 related fields when user syncs the PO (which was not syncing) with "To Master Opportunity" syncing option
    When I click on the "Accounts" grid tab
    And I open the existing account
    And I click renewal opportunity having products
    And I select the partner opportunity
    And I click on "Syncing" partner opportunity
    And I select the sync "From Master Opportunity" option
    Then I verify the partner account fields
