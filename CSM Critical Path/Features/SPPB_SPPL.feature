@SPPB_SPPL
Feature: All features related to Opportunity Management - Manage Renewals

  Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page

  @CreatePL_PLC
  Scenario: Rally Test Case ID: TC6462 - Split Opportunity RR - New Cloned Opportunity Details editable
    When I connect to SalesforceAPI using "SYSTEMADMIN_CSMDEV20" user role
    And I create PLAY with TASK using map data "SPPBSPPL"
    And I create PLAYBOOK with PLAY using map data "SPPBSPPL"
