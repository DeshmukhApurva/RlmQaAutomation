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

