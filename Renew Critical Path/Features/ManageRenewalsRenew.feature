@RenOpportunity
@RenManageRenewalsFeature
Feature: All features related to Opportunity - Manage Renewals

  Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@ren_verify_column_fields
Scenario: Rally Test Case ID: TC4641,TC4642,TC4643,TC4644 - Manage Renewals - Field set display fields,Add Fields on Fieldset to display (RR object + Cross object {Asset/Contract Line Item}), Add Custom Field on Fieldset to display,Remove Fields on Fieldset to display
    When I click on "Opportunities" link
    And I open the renewal relationship opportunity
    Then I should able to see the "Renewal Relationship" section
    When I click on "Manage Renewals" button
    Then I verify the "Renewal Relationship" column fields
    And I should able to see the column fields
    When I select and deselect the column fields
    Then I verify the adding and removing column fields
    When I select the all "Renewal Relationship" column fields
    Then I verify the "Renewal Relationship" column fields

@ren_SplitOppLineItemNewClonedOppEditDetails
Scenario: Rally Test Case ID: TC6461 - Split Opportunity Line Items - New Cloned Opportunity Details editable
    When I click on the "Opportunities" grid tab
		And I Create New Source Opportunity
		And I select "Standard Price Book" pricebook
		And I Add "2" Products having product name as "Product" to Opportunity
		And I Renew Source Opportunity
		And I select "1" products from Products section
		When I click on "Split Opportunity" button
    And I select the "New Cloned Opportunity" Split Opportunity option
    And I fill the required fields on Split Opportunity
    And I click on "Split Selected" button
    And I verify required fields value on New Split Opportunity
    
@ren_SplitOppRRNewClonedOppEditDetails
Scenario: Rally Test Case ID: TC6462 - Split Opportunity RR - New Cloned Opportunity Details editable
    When I click on the "Opportunities" grid tab
		And I Create New Source Opportunity
		And I select "Standard Price Book" pricebook
		And I Add "2" Products having product name as "Product" to Opportunity
		And I Renew Source Opportunity
		When I click on "Manage Renewals" button
		And I select the "Renewal Relationship" product field
    And I click on "Split Opportunity" button from renewal relationship page
    And I select the "New Cloned Opportunity" Split Opportunity option
    And I fill the required fields on Split Opportunity
    And I click on "Split Selected" button
    And I verify required fields value on New Split Opportunity

@ren_ConsolidateOppRRNewClonedOppEditDetails
Scenario: Rally Test Case ID: TC6462 - Split Opportunity RR - New Cloned Opportunity Details editable
    When I click on the "Opportunities" grid tab
		And I Create New Source Opportunity
		And I select "Standard Price Book" pricebook
		And I Add "2" Products having product name as "Product" to Opportunity
		And I Renew Source Opportunity
		When I click on "Manage Renewals" button
		Then I select "1" product from "Renewal Relationship" page
    And I click on "Consolidate Opportunity" button from renewal relationship page
    And I select the "New Cloned Opportunity" Split Opportunity option
    And I fill the required fields on Split Opportunity
    And I click on "Consolidate" button
    And I verify required fields value on New Split Opportunity