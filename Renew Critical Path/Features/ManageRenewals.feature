@Opportunity
@ManageRenewalsFeature
Feature: All features related to Opportunity Management - Manage Renewals

  Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@invalid_rebuild_renewal_opportunity
Scenario: Rally Test Case ID: TC4657,TC4645,TC5361,TC5362 - Rebuild Opportunity Product Line - Invalid Renewal Relationship,Manage Renewals - Invalid OPLID - Identify,Manage Renewals - Enable Rebuild for UnSynced Quote
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Renewal Relationship → Opportunity Line Item" link
    And I Add Opportunity Product Line fields "Total Price" to "Total Price"
    And I save the Mapping
    When I click on "Opportunities" link
    And I click on "New" button
    And Create new Opportunity under an Account
    And I click on "Choose Price Book" button
    Then I Choose the Pricebook for the product
    And I click on "Add Product" button
    And I add the product
    And I resolve the "Opportunity"
    And I go to first row where column name is "Contributed To"
    And I delete the opportunity product
    When I click on "Manage Renewals" button
    And I select the "Renewal Relationship" product field
    Then I verify the invalid "Renewal Relationship" opportunity product
    And I click on renewal relationship "Rebuild Opportunity" button


#    When I click on "Opportunities" link
#    And I navigate to the "Renewal Relationship" opportunity
#    And I click on "Add Product" button
#    And I add the product
#    And I delete the "Renewal Relationship" opportunity product
#    When I click on "Manage Renewals" button
#    And I select the "Renewal Relationship" product field
#    And I click on renewal relationship "Rebuild Opportunity" button
#    Then I verify the invalid "Renewal Relationship" opportunity product
#	And I delete the "Renewal Relationship" opportunity product
    

@valid_renewal_relationship
Scenario: Rally Test Case ID: TC4646, TC4649 - Manage Renewals - Valid OPLID - Identify,Back button navigation
    When I click on "Opportunities" link
    And I click on "New" button
    And Create new Opportunity under an Account
    And I click on "Choose Price Book" button
    Then I Choose the Pricebook for the product
    And I click on "Add Product" button
    And I add the product
    And I resolve the "Opportunity"
    And I go to first row where column name is "Contributed To"
    When I click on "Manage Renewals" button
    And I select the "Renewal Relationship" product field
    And I click on renewal relationship "Rebuild Opportunity" button
    When I click on the "Back" button on "Renewal Relationship" page

@change_renewal_status
Scenario: Rally Test Case ID: TC4647,TC4650 - Manage Renewals - Change Renewal Status,Disable Renewal Status pick list
    When I click on "Opportunities" link
    And I go to existing renewal opportunities
    Then I should able to see the "Renewal Relationship" section
    And I click on "Add Product" button
    And I add the product
    When I click on "Manage Renewals" button
    And I select the "Renewal Relationship" product field
    And I click on "Renewal Relationship" "Renewal Status" button
    And I select the "Renewal Status" pick list "Lost" value
    Then user able to see the updated "Renewal Status" pick list "Lost" value


@bulk_update_renewal_status
Scenario: Rally Test Case ID: TC4648,TC4651 - Manage Renewals - Bulk update Renewal Status,Renewal Status pick list values population
    When I click on "Opportunities" link
    And I go to existing renewal opportunities
    Then I should able to see the "Renewal Relationship" section
    And I click on "Add Product" button
    And I add the product
    When I click on "Manage Renewals" button
    And I select the multiple "Renewal Relationship" product fields
    And I click on "Renewal Relationship" "Renewal Status" button
    And I select the "Renewal Status" pick list "Lost" value
    Then user able to see the updated "Renewal Status" pick list "Lost" value


@metric_fields_recalculation
Scenario: Rally Test Case ID: TC4652 - Manage Renewals - Metric Fields recalculation
    When I click on "Opportunities" link
    And I go to existing renewal opportunities
    Then I verify the renewal relationship currency metric field values
    Then I should able to see the "Renewal Relationship" section
    And I click on "Add Product" button
    And I add the product
    When I click on "Manage Renewals" button
    And I select the multiple "Renewal Relationship" product fields
    And I click on "Renewal Relationship" "Renewal Status" button
    And I select the "Renewal Status" pick list "Won" value
    Then user able to see the updated "Renewal Status" pick list "Won" value
    When I click on the "Back" button on "Renewal Relationship" page
    Then I should able to see the recalculated currency metric fields


@consolidate_opportunity
Scenario: Rally Test Case ID: TC4667,TC4668,TC4669,TC4670,TC5368- New Button - Consolidate Opportunity,move all renewal relationship lines selected, Action performed,Manage Renewals - Enable RR Consolidation for UnSynced Quote
    When I click on "Opportunities" link
    And I open the renewal relationship opportunity
    Then I should able to see the "Renewal Relationship" section
    Then I verify the "Renewal Relationship" line items
    And I click on "Add Product" button
    And I add the product
    When I click on "Manage Renewals" button
    Then I verify the "Consolidate Opportunity" button
    When I click on "Consolidate Opportunity" button
    And I select the "New Opportunity" opportunity option and fill the required fields
    And I click on "Consolidate" button from renewal relationship page
    Then I verify the renewal relationship lines should be moved to the target opportunity


@verifying_original_previous_opportunity
Scenario: Rally Test Case ID: TC4658 - Manage Renewals - Tracking of "Original Opportunity " and "Previous Opportunity "- In Renewal opportunity
    When I click on "Opportunities" link
    And I click on "New" button
    And I enter mandatory details in "New" opportunity page
    Then I should able to see the "Renewal Relationship" section
    And I click on "Choose Price Book" button
    Then I Choose the Pricebook for the product
    And I click on "Add Product" button
    And I add the product
    Then I verify the created products
    And I resolve the "Opportunity"
    When I click on "Manage Renewals" button
    Then I should able to see the "Original Opportunity" and "Previous Opportunity" fields as empty
    When I click on the "Back" button on "Renewal Relationship" page
    And I delete the created renewal opportunity


@split_new_renewal_opportunity
Scenario: Rally Test Case ID: TC4659,TC4661,TC4663,TC5364 - Manage Renewals - Tracking of "Original Opportunity" and "Previous Opportunity" - In New opp after Split,Tracking of "Original Opportunity"and "Previous Opportunity "- In New opportunity after Second Split,Tracking of "Original Opportunity"and "Previous Opportunity " -In New opportunity after Third Split,Enable RR Split for UnSynced Quote
    When I click on "Opportunities" link
    And I open the renewal relationship opportunity
    Then I should able to see the "Renewal Relationship" section
    And I click on "Add Product" button
    And I add the product
    When I click on "Manage Renewals" button
    And I select the multiple "Renewal Relationship" product fields
    And I click on "Split Opportunity" button from renewal relationship page
    And I select the "New Opportunity" opportunity option and fill the required fields
    And I click on "Split Selected" button from renewal relationship page
    Then I verify the renewal relationship & Metrics fields values


@split_existing_renewal_opportunity
Scenario: Rally Test Case ID: TC4660,TC4662,TC4664,TC5366 - Manage Renewals - Tracking of "Original Opportunity" and "Previous Opportunity" -In Existing opportunity after Split,Tracking of "Original Opportunity"and "Previous Opportunity " -In Existing opportunity after Second Split,Tracking of "Original Opportunity"and "Previous Opportunity "-In Existing opportunity after Third Split,Enable RR Split for UnSynced Quote on Target Opportunity
    When I click on "Opportunities" link
    And I open the renewal relationship opportunity
    Then I should able to see the "Renewal Relationship" section
    And I click on "Add Product" button
    And I add the product
    When I click on "Manage Renewals" button
    And I select the multiple "Renewal Relationship" product fields
    And I click on "Split Opportunity" button from renewal relationship page
    And I select the "Existing Opportunity" opportunity and fill the required fields
    Then I verify the "Target Opportunity" and "Opportunity Product(s)" section
    And I click on "Split Selected" button from renewal relationship page
    Then I verify the renewal relationship & Metrics fields values


@add_and_remove_column_fields
Scenario: Rally Test Case ID: TC4665,TC4666,TC4677,TC4678,TC4679,TC4680 - Manage Renewals - Select fields for display,Retain selected fields,Field set display fields,Add Fields on Fieldset to display (RR object + Cross object {Asset/Contract Line Item}),Add Custom Field on Fieldset to display,Remove Fields on Fieldset to display
    When I click on "Opportunities" link
    And I open the renewal relationship opportunity
    Then I should able to see the "Renewal Relationship" section
    And I click on "Add Product" button
    And I add the product
    When I click on "Manage Renewals" button
    Then I verify the "Renewal Relationship" column fields
    And I should able to see the column fields
    When I select and deselect the column fields
    Then I verify the adding and removing column fields
    When I select the all "Renewal Relationship" column fields
    Then I verify the "Renewal Relationship" column fields


@consolidate_existing_opportunity
Scenario: Rally Test Case ID: TC5370 - Manage Renewals - Enable RR Consolidation for UnSynced Quote on Target Opportunity
    When I click on "Opportunities" link
    And I open the renewal relationship opportunity
    Then I should able to see the "Renewal Relationship" section
    Then I verify the "Renewal Relationship" line items
    And I click on "Add Product" button
    And I add the product
    When I click on "Manage Renewals" button
    Then I verify the "Consolidate Opportunity" button
    When I click on "Consolidate Opportunity" button
    And I select the "Existing Opportunity" opportunity and fill the required fields
    Then I verify the "Target Opportunity" and "Opportunity Product(s)" section
    And I click on "Consolidate" button from renewal relationship page
    Then I verify the renewal relationship lines should be moved to the target opportunity


@sync_invalid_rebuild_renewal_opportunity
Scenario: Rally Test Case ID: TC5361 - Manage Renewals - Disable Rebuild for Synced Quote
    When I click on "Opportunities" link
    And I navigate to the "Renewal Relationship" opportunity
    And I sync the quotes to renewal opportunity
    When I click on "Opportunities" link
    And I navigate to the "Renewal Relationship" opportunity
    And I click on "Add Product" button
    And I add the product
    And I delete the "Renewal Relationship" opportunity product
    When I click on "Manage Renewals" button
    And I select the "Renewal Relationship" product field
    And I click on renewal relationship "Rebuild Opportunity" button
    Then I should able to see the sync error message
    When I click on "Opportunities" link
    And I navigate to the "Renewal Relationship" opportunity
    And I stop the syncing the renewal opportunity


@sync_split_renewal_opportunity
Scenario: Rally Test Case ID: TC5363,TC5365 - Manage Renewals - Disable RR Split for Synced Quote,Disable RR Split for Synced Quote on Target Opportunity
    When I click on "Opportunities" link
    And I click on "New" button
    And Create new Opportunity under an Account
    And I click on "Choose Price Book" button
    Then I Choose the Pricebook for the product
    And I click on "Add Product" button
    And I add the product
    And I resolve the "Opportunity"
    And I go to first row where column name is "Contributed To"
    And I sync the quotes to renewal opportunity
    When I click on "Manage Renewals" button
    And I select the "Renewal Relationship" product field
    And I click on "Split Opportunity" button from renewal relationship page
    Then I should able to see the sync error message


@sync_consolidate_opportunity
Scenario: Rally Test Case ID: TC5367,TC5369 - Manage Renewals - Disable RR Consolidation for Synced Quote,Disable RR Consolidation for Synced Quote on Target Opportunity
    When I click on "Opportunities" link
    And I click on "New" button
    And Create new Opportunity under an Account
    And I click on "Choose Price Book" button
    Then I Choose the Pricebook for the product
    And I click on "Add Product" button
    And I add the product
    And I resolve the "Opportunity"
    And I go to first row where column name is "Contributed To"
    And I sync the quotes to renewal opportunity
    When I click on "Manage Renewals" button
    And I select the "Renewal Relationship" product field
    And I click on "Consolidate Opportunity" button from renewal relationship page
    Then I should able to see the sync error message
