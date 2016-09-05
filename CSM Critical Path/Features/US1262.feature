@CSMSuccessPlanTabFeature
Feature: Followup Tasks related TCs

  Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page

  @CreateCSMData
  Scenario: Rally Test Case ID: TC2759 : Create Success plan
    When I connect to SalesforceAPI using "SYSTEMADMIN_EE4" user role
    And I get ownerId of "CSMNetOps_DEV20" using map data "MasterData" and key "Owner_Id"
    #And I create Account "ComityAcc" using map data "MasterData" and key "Account"
    #And I create PLAY "ComityPlay#ComityPlayBook#" for object "Account" using map data "MasterData" and key "ComityPlay#ComityPlayBook#"
    #And I create Task "ComiyTask#ComityPlay#" in PLAY "ComityPlay#ComityPlayBook#_Id" using map data "MasterData" and key "ComiyTask#ComityPlay#"
    #And I create PLAYBOOK "ComityPlayBook#ComitySPT#" using map data "MasterData" and key "ComityPlayBook#ComitySPT#"
    #And I add PLAY "ComityPlay#ComityPlayBook#" to PLAYBOOk  "ComityPlayBook#ComitySPT#" using map data "MasterData"
    #And I create SPT "ComitySPT#" using map data "MasterData" and key "ComitySPT#"
    #And I add PLAYBOOk "ComityPlayBook#ComitySPT#" to SPT "ComitySPT#" using map data "MasterData"
    

  @SetSPPLDefaultID
  Scenario: Rally Test Case ID: TC2759 : Create Success plan
    When user logout from "OEM" application
    When I log into "SYSTEMADMIN_CSMDEV20" details
    When I navigate to Setup
    And I search for "Custom Settings" from Quick Find
    And I set the value of "SPPL Default ID" Custom Setting
