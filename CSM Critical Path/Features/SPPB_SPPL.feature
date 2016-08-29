@SuccessPlan
@SPPB_SPPL
Feature: All features related to Opportunity Management - Manage Renewals

  Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page
		
  @CreatePL_PLC_SPT
  Scenario: Rally Test Case ID: TC6462 - Split Opportunity RR - New Cloned Opportunity Details editable
    When I connect to SalesforceAPI using "SYSTEMADMIN_CSMDEV20" user role
    And I create PLAY with TASK using map data "SPPBSPPL"
    And I create PLAYBOOK with PLAY using map data "SPPBSPPL"
    And I create SPT with PLAYBOOK using map data "SPPBSPPL"

  @US1276 @SPPBEditSPT
  Scenario: US1276, Rally TC ID: TC5949 - user edit the SPT for the SP then entries should get update in SP-PB subtab.
    When I connect to SalesforceAPI using "SYSTEMADMIN_CSMDEV20" user role
    And I create Account using map data "SPPBSPPL"
    When I click on the "Success Plans" grid tab
    Then I create SuccessPlan using map "SPPBSPPL" and key "ASPT1"
    Then I click on "Playbooks" tab
    Then I store "Old" Play and PlayBook details of Succcess Plan
    Then I "Edit" Success Plan record
    Then I change the SPT of SP using map "SPPBSPPL" and key "ASPT2"
    Then I "Open" Success Plan record
    Then I click on "Playbooks" tab
    Then I store "New" Play and PlayBook details of Succcess Plan
    Then I verify Play and PlayBook details of Succcess Plan
    And I delete Success Plan from DB
    And I delete Account

  @US1276 @DeletePlayFromSPT
  Scenario: US1276, Rally TC ID:TC5953: Success Plan - Playbook: Delete play from playbook from SPT (Success Plan is associated)
    When I connect to SalesforceAPI using "SYSTEMADMIN_CSMDEV20" user role
    And I create Account using map data "SPPBSPPL"
    When I click on the "Success Plans" grid tab
    Then I create SuccessPlan using map "SPPBSPPL" and key "ASPT2"
    Then I click on "Playbooks" tab
    When I click on "ServiceSource Setup" link
    When I click on "ServiceSource Setup" link
    Then I click on "Success Plan Templates" link
    Then I click on "Edit" link of SPT for "SPPBSPPL" and key "ASPT2"
    Then I verify playbooks in SPT using map data "SPPBSPPL" and key "APB2ASPT2"
    Then I click on "Edit" link of SPT for "SPPBSPPL" and key "APB2ASPT2"
    Then I verify playbooks in SPT using map data "SPPBSPPL" and key "APL2APB2"
    Then I delete playbook from SPT using map data "SPPBSPPL" and key "APL2APB2"
    Then I "Open" Success Plan record
    Then I click on "Playbooks" tab
    Then I verify Play "APL2APB2" on Success Plan using map data "SPPBSPPL" after "deleting" it to_From playbook
    And I delete Success Plan from DB
		And I delete Account
  
  @US1276 @AddPlayToSPTForSP
  Scenario: US1276, Rally TC ID: TC5951: Success Plan - Playbook: Add play to playbook on SPT (Success Plan is associated)
    When I connect to SalesforceAPI using "SYSTEMADMIN_CSMDEV20" user role
    And I create Account using map data "SPPBSPPL"
    When I click on the "Success Plans" grid tab
    Then I create SuccessPlan using map "SPPBSPPL" and key "ASPT1"
    Then I click on "Playbooks" tab
    When I click on "ServiceSource Setup" link
    Then I click on "Success Plan Templates" link
    Then I click on "Edit" link of SPT for "SPPBSPPL" and key "ASPT1"
    Then I verify playbooks in SPT using map data "SPPBSPPL" and key "APB1ASPT1"
    Then I click on "Edit" link of SPT for "SPPBSPPL" and key "APB1ASPT1"
    And I click on "Add Play" button
    Then I add play to SPT using map data "SPPBSPPL" and key "APL3APB3"
    Then I "Open" Success Plan record
    Then I click on "Playbooks" tab
    Then I verify Play "APL3APB3" on Success Plan using map data "SPPBSPPL" after "adding" it to_From playbook
		And I delete Success Plan from DB
		And I delete Account

  #@US1200
  @US1200 @NewPlaybookSPT
  Scenario: US1200 Rally Test Case ID : TC5911 : Success Plan - Playbook: Create new SPT , associate it with success plan and add playbook
    When I connect to SalesforceAPI using "SYSTEMADMIN_CSMDEV20" user role
    And I create Account using map data "SPPBSPPL"
    When I click on "ServiceSource Setup" link
    Then I click on "Success Plan Templates" link
    Then I create a new Success Plan Template with mapData "SPPBSPPL" and playbook "APB1"
    Then I fetch URI of template
    When I click on "Success Plans" tab
    Then I create a SuccessPlan using map data "SPPBSPPL"
    Then I Save success plan Name value
    Then I click on "Playbooks" tab
    Then I verify Playbooks subtab using map data "SPPBSPPL" for "APB1" after "adding" playbook

  @US1200 @AddAnotherPlaybookSPT
  Scenario: US1200 Rally Test Case ID : TC5906 : Success Plan - Playbook: Add playbook @SPT (Success Plan is associated)
    When I click on "ServiceSource Setup" link
    Then I click on "Success Plan Templates" link
    Then I add another playbook using map data "SPPBSPPL" to SPT
    When I click on "Success Plans" tab
    Then I select SP for verifying Playbooks
    Then I click on "Playbooks" tab
    Then I verify Playbooks subtab using map data "SPPBSPPL" for "APB2" after "adding" playbook

  @US1200 @DeletePlaybookSPT
  Scenario: US1200 Rally Test Case ID : TC5913 : Success Plan - Playbook: Delete playbook from SPT (Success Plan is associated)
    When I click on "Success Plans" tab
    Then I select SP for verifying Playbooks
    Then I click on "Playbooks" tab
    Then I verify Playbooks subtab for Playbooks and Plays Grid
    When I click on "ServiceSource Setup" link
    Then I click on "Success Plan Templates" link
    Then I click on "Edit" link of SPT for "SPPBSPPL" and key "SPT1"
    Then I delete playbook from SPT using map data "SPPBSPPL" and key "APB2"
    Then I click on "Success Plans" tab
    Then I select SP for verifying Playbooks
    Then I click on "Playbooks" tab
    Then I verify Playbooks subtab using map data "SPPBSPPL" for "APB2" after "deleting" playbook

  @US1200 @AddPlaybookToSP
  Scenario: US1200 Rally Test Case ID : TC5915 : Success Plan - Playbook:: Add playbook with Add button.
    When I click on "Success Plans" tab
    Then I select SP for verifying Playbooks
    Then I click on "Playbooks" tab
    Then I verify Playbooks subtab for Playbooks and Plays Grid
    Then I click on "Add Playbook" link
    Then I add playbook or add and skip criteria to SP using map data "SPPBSPPL" and key "APB2"
    Then I click on "Playbooks" tab
    Then I verify Playbooks subtab using map data "SPPBSPPL" for "APB2" after "adding" playbook
    When I click on "ServiceSource Setup" link
    Then I click on "Success Plan Templates" link
    Then I click on "Edit" link of SPT for "SPPBSPPL" and key "SPT1"
    Then I verify playbooks in SPT using map data "SPPBSPPL" and key "APB2"

  @US1200 @DeletePlaybookFromSP
  Scenario: US1200 Rally Test Case ID : TC5920 : Success Plan - Playbook:: Delete playbook.
    When I click on "Success Plans" tab
    Then I select SP for verifying Playbooks
    Then I click on "Playbooks" tab
    Then I verify Playbooks subtab for Playbooks and Plays Grid
    Then I delete a Playbook "APB2" from SP using mapdata "SPPBSPPL"
    Then I click on "Actions" tab
    Then I click on "Playbooks" tab
    Then I verify Playbooks subtab using map data "SPPBSPPL" for "APB2" after "deleting" playbook

  @US1200 @AddPlaybookWithAddAndSkipToSP
  Scenario: US1200 Rally Test Case ID : TC5918 : Success Plan - Playbook:: Add playbook with Add & Skip criteria button.
    When I click on "Success Plans" tab
    Then I select SP for verifying Playbooks
    Then I click on "Playbooks" tab
    Then I verify Playbooks subtab for Playbooks and Plays Grid
    Then I click on "Add and Skip Criteria" link
    Then I add playbook or add and skip criteria to SP using map data "SPPBSPPL" and key "APB2"
    Then I click on "Playbooks" tab
    Then I verify Playbooks subtab using map data "SPPBSPPL" for "APB2" after "adding" playbook
    When I click on "ServiceSource Setup" link
    Then I click on "Success Plan Templates" link
    Then I click on "Edit" link of SPT for "SPPBSPPL" and key "SPT1"
    Then I verify playbooks in SPT using map data "SPPBSPPL" and key "APB2"
    And I delete Success Plan from DB
    And I delete Account

  @DeleteRecordsPL_PB_SPT_ACC
  Scenario: Rally Test Case ID: TC6462 - Split Opportunity RR - New Cloned Opportunity Details editable
    And I delete Success Plan from DB
    And I delete Play_PlayBook_SPT using map data "SPPBSPPL"
    
  @Yml_Test
  Scenario: Rally Test Case ID: TC6462 - Split Opportunity RR - New Cloned Opportunity Details editable
    When I connect to SalesforceAPI using "SYSTEMADMIN_CSMDEV20" user role
    And I create Account using map data "SPPBSPPL"
    