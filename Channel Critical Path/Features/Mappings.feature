@ServiceSourceSetUp
@MappingsFeature
Feature: All features related to Service Source setup - Mappings

  Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@add_quote_to_opportunity_fields
Scenario: Rally Test Case ID: TC5260 : Quote - Opportunity Mappings: Add and Save the Partner Account 1/2 related fields mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    When I delete "Quote → Opportunity" fields "Partner Account 1"
    And I Add "Quote → Opportunity" fields "Partner Account 1" and "Save"
    And I save the Mapping


@check_disable_quotes_checkbox
Scenario:Rally Test Case ID: TC5298,TC5306 - Mappings - Display of "Opportunity → Quote" mapping when Quote is disabled for org,Display of "Quote → Opportunity" mapping when Quote is disabled for org
    And user logout from "Channel Netops" application
    And I user login as a "Admin" user
    Then I should able to see the "Admin" page
    When I click on "Setup" from "Admin" app
    And I click on "Customize" tab
    And I click on "Quotes" tab
    And I click on "Quotes" tab
    And I click on "Quotes Settings" link
    And I check the "Disable Quotes" settings
    And user logout from "Admin" application
    Given that I navigate to the CRM application
    Then I should land on CRM home page
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    Then I should not able to see the "Quote → Opportunity" mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    Then I should not able to see the "Opportunity → Quote" mapping


@uncheck_disable_quotes_checkbox
Scenario:Rally Test Case ID: TC5297,TC5305 - Mappings - Display of "Opportunity → Quote" mapping when Quote is enabled for org,Display of "Quote → Opportunity" mapping when Quote is enabled for org
    And user logout from "Channel Netops" application
    And I user login as a "Admin" user
    Then I should able to see the "Admin" page
    When I click on "Setup" from "Admin" app
    And I click on "Customize" tab
    And I click on "Quotes" tab
    And I click on "Quotes" tab
    And I click on "Quotes Settings" link
    And I uncheck the "Disable Quotes" settings
    And user logout from "Admin" application
    Given that I navigate to the CRM application
    Then I should land on CRM home page
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    Then I should able to see the "Quote → Opportunity" mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    Then I should able to see the "Opportunity → Quote" mapping


@opportunity_quote_mappings
Scenario: Rally Test Case ID: TC5299,TC5300,TC5301,TC5302,TC5303,TC5304 : "Opportunity → Quote" Mapping - Select "Opportunity → Quote" mapping,Default Required fields mapping under Quote Fields Grid, Add and Save Fields mapping and verify in grid,Delete field mapping from Quote Fields Grid and Save the setting,Undelete field mapping from Quote Fields Grid when user clicks on Cancel button,Add and Save All Fields mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    Then all required fields should be displayed in Grey
    When I should be able to set required field value for description as "Description"
    When I delete "Quote Fields" fields "Partner Account 1"
    And I Add "Quote Fields" fields "Partner Account 1" and "Save"
    When I delete "Quote Fields" fields "Partner Account 1"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I Add "Quote Fields" fields "Partner Account 1" and "Cancel"
    And I verify the default value field is disabled for "Partner Account 1"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I Add "Quote Fields" fields "Partner Account 1" to "Partner Account 1"
    And I Edit "Quote Fields" fields "Partner Account 1" to "Account ID"
    And I delete "Quote Fields" fields "Partner Account 1"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I Add "Quote Fields" fields "Partner Account 1" to "Partner Account 1"
    Then "Quote Fields" Field "Partner Account 1" should be present
    When I delete "Quote Fields" fields "Partner Account 1"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I add multiple "Quote Fields" Fields
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I delete all mapping fields


@quote_opportunity_mappings
Scenario: Rally Test Case ID: TC5307,TC5308,TC5309,TC5310,TC5311,TC5312 - "Quote → Opportunity" Mapping - Select "Quote → Opportunity" mapping,Default Required fields mapping under Quote Fields Grid,Add and Save Fields mapping and verify in grid,Delete field mapping from Opportunity Fields Grid and Save the setting,Undelete field mapping from Opportunity Fields Grid when user clicks on Cancel button,Add and Save All Fields mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    Then all required fields should be displayed in Grey
    When I should be able to set required field value for description as "Description"
    When I delete "Opportunity Fields" fields "Account ID"
    And I Add "Opportunity Fields" fields "Account ID" and "Save"
    When I delete "Opportunity Fields" fields "Account ID"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I Add "Opportunity Fields" fields "Account ID" and "Cancel"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I Add "Opportunity Fields" fields "Account ID" to "Account ID"
    And I Edit "Opportunity Fields" fields "Account ID" to "Contact ID"
    And I delete "Opportunity Fields" fields "Account ID"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I Add "Opportunity Fields" fields "Account ID" to "Account ID"
    Then "Opportunity Fields" Field "Account ID" should be present
    When I delete "Opportunity Fields" fields "Account ID"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I add multiple "Opportunity Fields" Fields
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I delete all mapping fields


@quote_product_line_fields
Scenario: Rally Test Case ID: TC5313,TC5314,TC5315,TC5316,TC5317,TC5318 : "Opportunity → Quote" Mapping - Default Required fields mapping under Quote Product Line Fields Grid,Add and Save Fields mapping and verify in grid,Delete field mapping from Quote Product Line Fields Grid and Save the setting,Undelete field mapping from Quote Product Line Fields Grid when user clicks on Cancel button,Add and Save All Fields mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    Then "Quote Product Line Fields" all required fields should be displayed in grey
    And I delete "Asset" from "Quote Product Line Fields"
    And I Add "Asset" fields and "Save"
    And I delete "Asset" from "Quote Product Line Fields"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I Add "Asset" fields and "Cancel"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I Add "Asset" to "Opportunity ID" from "Quote Product Line Fields"
    And I Edit "Asset" to "Product ID" from "Quote Product Line Fields"
    And I delete "Asset" from "Quote Product Line Fields"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I Add "Asset" to "Opportunity ID" from "Quote Product Line Fields"
    Then "Asset" field on "Quote Product Line Fields" should be present
    And I delete "Asset" from "Quote Product Line Fields"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I Add "Total Price" to "Total Price" from "Quote Product Line Fields"
    Then I verify the validation message
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I add multiple fields to "Quote Product Line Fields"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I delete all mapping fields


@opportunity_line_item_fields
Scenario: Rally Test Case ID: TC5319,TC5320,TC5321,TC5322,TC5323,TC5324 : "Quote → Opportunity" Mapping - Default Required fields mapping under Opportunity Product Line Fields Grid,Add and Save Fields mapping and verify under Opportunity Product Line Fields Grid,Delete field mapping from Opportunity Product Line Fields Grid and Save the setting, Undelete field mapping from Quote Product Line Fields Grid when user clicks on Cancel button,Add and Save All Fields mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    Then "Opportunity Line Item Fields" all required fields should be displayed in grey
    And I delete "Source Opportunity" from "Opportunity Line Item Fields"
    And I Add "Source Opportunity" fields and "Save"
    And I delete "Source Opportunity" from "Opportunity Line Item Fields"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I Add "Source Opportunity" fields and "Cancel"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I Add "Source Opportunity" to "Created By ID" from "Opportunity Line Item Fields"
    And I Edit "Source Opportunity" to "Product ID" from "Opportunity Line Item Fields"
    And I delete "Source Opportunity" from "Opportunity Line Item Fields"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I Add "Source Opportunity" to "Created By ID" from "Opportunity Line Item Fields"
    Then "Source Opportunity" field on "Opportunity Line Item Fields" should be present
    And I delete "Source Opportunity" from "Opportunity Line Item Fields"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I Add "Total Price" to "Total Price" from "Opportunity Line Item Fields"
    Then I verify the validation message
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I add multiple fields to "Opportunity Line Item Fields"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I delete all mapping fields