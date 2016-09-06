@CSMSuccessPlanTabFeature
Feature: Followup Tasks related TCs

  Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page

  @CreateCSMData
  Scenario: Rally Test Case ID: TC2759 : Create Success plan
    When I connect to SalesforceAPI using "SYSTEMADMIN_CSMDEV20" user role
    And I get ownerId of "CSMNetOps_DEV20" using map data "MasterData" and key "Owner_Id"
    And I create Account "ComityAcc" using map data "MasterData" and key "Account"
    And I create PLAY "ComityPlay1ComityPlayBook1" for object "Account" using map data "MasterData" and key "ComityPlay1ComityPlayBook1"
    And I create Task "ComiyTask1ComityPlay1" in PLAY "ComityPlay1ComityPlayBook1" using map data "MasterData" and key "ComiyTask1ComityPlay1"
    And I create PLAYBOOK "ComityPlayBook1ComitySPT1" using map data "MasterData" and key "ComityPlayBook1ComitySPT1"
    And I add PLAY "ComityPlay1ComityPlayBook1" to PLAYBOOk "ComityPlayBook1ComitySPT1" using map data "MasterData" 
    And I create SPT "ComitySPT1" using map data "MasterData" and key "ComitySPT1"
    And I add PLAYBOOk "ComityPlayBook1ComitySPT1" to SPT "ComitySPT1" using map data "MasterData"
    

  @SetSPPLDefaultID
  Scenario: Rally Test Case ID: TC2759 : Create Success plan
    When user logout from "OEM" application
    When I log into "SYSTEMADMIN_CSMDEV20" details
    When I navigate to Setup
    And I search for "Custom Settings" from Quick Find
    And I set the value of "SPPL Default ID" Custom Setting
