@Accounts
@AccountDetailsFeature
Feature: All features related to Accounts - Account Details

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@asset_tab_details_page
Scenario: Rally Test Case ID: TC4506,TC4507 : Account Details Page- Details of Assets Tab,Account Details Page- Sorting/Pagination/Hide/Show Columns in Assets Tab
  Then I verify Account search box
  When I search an Account
  And I click on "Assets" tab
  Then I should able to see the "Assets" page columns
  When I click on the "Kebab Menu" menu button
  Then I verify the "Kebab Menu" button
  When I click on "Assets" tab
  And user sorts by "Asset Name" in "Ascending" order from "Assets" page
  Then files should be sorted by "Asset Name" in "Ascending" order from "Assets" page
  And I click on "Assets" tab
  And user sorts by "Asset Name" in "Descending" sort order from "Assets" page
  Then files should be sorted by "Asset Name" in "Descending" sort order from "Assets" page
  When I click on "Assets" tab
  Then I verify the the grid scroll up and scroll down and pagination


@contract_tab_details_page
Scenario: Rally Test Case ID: TC4508,TC4509,TC4510 : Account Details Page - Details of Service Contract Line Items Tab,Sorting/Pagination/Hide/Show Columns in Contracts Tab,Display of Service Contract record(s) in Service Contract Line Items Tab when Entitlement is Off for Org
  Then I verify Account search box
  When I search an Account
  And I click on "Contracts" tab
  Then I should able to see the "Contracts" page fields
  When I click on the "Kebab Menu" menu button
  Then I verify the "Kebab Menu" button
  And I click on "Contracts" tab
  And user "Contract Name" in "Ascending" sort order
  Then files should be sorted by "Contract Name" in "Ascending" order from "Contracts" page
  When I click on "Contracts" tab
  And user "Contract Name" in "Descending" order
  Then files should be sorted by "Contract Name" in "Descending" sort order from "Contracts" page
  When I click on "Contracts" tab
  Then I verify the the grid scroll up and scroll down and pagination


@verify_order_sales_stage_edit_opportunity
Scenario: Rally Test Case ID: TC4546,TC4547 : Verify that order of Sales Stages dropdown values of Partner Opportunity should be same as Sales Stages order saved in Available to Partner Section,Verify that on Bulk Edit page order of Sales Stages dropdown values should be same as Sales Stages order saved in Available to Partner Section
  Then I verify Account search box
  When I search an Account
  And I click on "Opportunities" tab from account details page
  And I click "Sales Stage" drop down value
  Then I should able to see the "Sales Stage" drop down values
  When I click on "Opportunities" tab from account details page
  And I select the multiple "Opportunities" columns
  And I update the "Opportunities" columns
