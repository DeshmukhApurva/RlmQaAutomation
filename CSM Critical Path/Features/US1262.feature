@CSMSuccessPlanTabFeature
Feature: Followup Tasks related TCs

  Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page

  @SetSPPLDefaultID
  Scenario: Rally Test Case ID: TC2759 : Create Success plan
    When user logout from "OEM" application
    When I log into "SYSTEMADMIN_CSMDEV20" details
    When I navigate to Setup
    And I search for "Custom Settings" from Quick Find
    And I set the value of "SPPL Default ID" Custom Setting
