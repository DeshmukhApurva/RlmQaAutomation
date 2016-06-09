@PartnerOpportunity
@Reports
@ReportsTabFeature
Feature: All features related to Reports - Reports To

  Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@hide_the_reports_tab
Scenario: Rally Test Case ID: TC5281 - Channel Community - Hide Reports Tab
    When I click on the "Accounts" grid tab
    And I open the existing account
    And I edit the existing "Account"
    And I check the "Prevent Portal Download" checkbox field
    And I "Save" the "Account"
    And user logout from "OEM" application
    And I user login in to "Channel Community" application
    Then I should able to see the "Channel Community" page
    And I should not able to see the "Reports" tab


@show_the_reports_tab
Scenario: Rally Test Case ID: TC5280 - Channel Community - Show Reports Tab
    When I click on the "Accounts" grid tab
    And I open the existing account
    And I edit the existing "Account"
    And I uncheck the "Prevent Portal Download" checkbox field
    And I "Save" the "Account"
    And user logout from "OEM" application
    And I user login in to "Channel Community" application
    Then I should able to see the "Channel Community" page
    And I should able to see the "Reports" tab


@hide_export_data_options
Scenario: Rally Test Case ID: TC5283 - Opportunities or Requests Tab - Hide Export data options
    When I click on the "Accounts" grid tab
    And I open the existing account
    And I edit the existing "Account"
    And I check the "Prevent Portal Download" checkbox field
    And I "Save" the "Account"
    And user logout from "OEM" application
    And I user login in to "Channel Community" application
    Then I should able to see the "Channel Community" page
    When I click on "Opportunities" tab
    Then I should able to see the "Opportunity Grid" columns
    When I click on the "Kebab Menu" menu button
    Then I should not able to see the export data fields
    When I click on "Requests" tab
    And I click on the "Kebab Menu" menu button
    Then I should not able to see the export data fields


@show_export_data_options
Scenario: Rally Test Case ID: TC5282 - Opportunities or Requests Tab - Show Export data options
    When I click on the "Accounts" grid tab
    And I open the existing account
    And I edit the existing "Account"
    And I uncheck the "Prevent Portal Download" checkbox field
    And I "Save" the "Account"
    And user logout from "OEM" application
    And I user login in to "Channel Community" application
    Then I should able to see the "Channel Community" page
    When I click on "Opportunities" tab
    Then I should able to see the "Opportunity Grid" columns
    When I click on the "Kebab Menu" menu button
    Then I verify the export data fields
    When I click on "Requests" tab
    And I click on the "Kebab Menu" menu button
    Then I verify the export data fields


@asset_service_contract
Scenario: Rally Test Case ID: TC5288 - Assets and Service Contracts Page - Value in Partner Account 1/2 related fields  when user re-new the Renewal Opportunity having PO that is syncing to RO as "To Master Opportunity"
    When I click on the "Accounts" grid tab
    And I open the existing account
    And I click renewal opportunity having products
    And I select the partner opportunity
    And I click on "Syncing" partner opportunity
    And I select the sync "From Master Opportunity" option
    And I resolve the renewal opportunity
    Then I verify the partner account fields
    When I click on the "Service Contracts" grid tab
    And I open the existing service contract
    Then I verify the partner account fields
    When I click on the "Accounts" grid tab
    And I open the existing account
    And I open the asset
    Then I verify the partner account fields


@hide_portal_report_records
Scenario: Rally Test Case ID: TC5284,TC5285,TC5286,TC5287 - Reports Tab - Hide Report records,Show particular Report records,View and download Report records with CSV and Excel option,View Report data(Child Accounts) to which Parent Account user has access
    And user logout from "OEM" application
    And I user login as a "Admin" user
    Then I should able to see the "Admin" page
    When I click on the "Reports" grid tab
    And I navigate to "Portal Reports" folder
    And user logout from "Admin" application
    And I user login in to "Channel Community" application
    Then I should able to see the "Channel Community" page
    And I should able to see the "Reports" tab
    When I click on "Reports" tab
    Then I should able to see the "Portal Reports" records