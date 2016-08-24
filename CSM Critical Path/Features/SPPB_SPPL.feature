@SPPB_SPPL
Feature: All features related to Opportunity Management - Manage Renewals

  Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page

#  @CreatePL_PLC
#  Scenario: Rally Test Case ID: TC6462 - Split Opportunity RR - New Cloned Opportunity Details editable
#    When I connect to SalesforceAPI using "SYSTEMADMIN_CSMDEV20" user role
#    And I create PLAY with TASK using map data "SPPBSPPL"
#    And I create PLAYBOOK with PLAY using map data "SPPBSPPL"

  @NewPlaybookSPT
  Scenario: Rally Test Case ID : TC5911 : Success Plan - Playbook: Create new SPT , associate it with success plan and add playbook
	When I connect to SalesforceAPI using "SYSTEMADMIN_CSMDEV20" user role
	And I create Account using map data "SPPBSPPL" 
	When I click on "ServiceSource Setup" link
	Then I click on "Success Plan Templates" link
	Then I create a new Success Plan Template with name "SP1" and playbook "SPPB1"
	Then I fetch URI of template
	When I click on "Success Plans" tab
	Then I create a SuccessPlan using map data "SPPBSPPL"
	Then I Save success plan Name value
	#Then I verify Playbooks subtab for "SPPB1"
	Then I verify Playbooks subtab using map data "SPPBSPPL" for "Playbook1"
	
  @AddAnotherPlaybookSPT
  Scenario: Rally Test Case ID : TC5906 : Success Plan - Playbook: Add playbook @SPT (Success Plan is associated)
	#When I connect to SalesforceAPI using "SYSTEMADMIN_CSMDEV20" user role
	When I click on "ServiceSource Setup" link
	Then I click on "Success Plan Templates" link
	Then I add another playbook using map data "SPPBSPPL" to SPT
	When I click on "Success Plans" tab
	Then I select SP for verifying Playbooks
	Then I verify Playbooks subtab using map data "SPPBSPPL" for "Playbook2"
	
  @DeletePlaybookSPT
  Scenario: Rally Test Case ID : TC5913 : Success Plan - Playbook: Add playbook @SPT (Success Plan is associated)
	#When I connect to SalesforceAPI using "SYSTEMADMIN_CSMDEV20" user role
	When I click on "Success Plans" tab
	Then I select SP for verifying Playbooks
	
	When I click on "ServiceSource Setup" link
	Then I click on "Success Plan Templates" link
	Then I delete playbook using map data "SPPBSPPL" to SPT
	Then I click on "Success Plans" tab
 	 
  @PlaybookSPT_Test
  Scenario: Rally Test Case ID : TC5906 : Success Plan - Playbook: Add playbook @SPT (Success Plan is associated)
	#When I connect to SalesforceAPI using "SYSTEMADMIN_CSMDEV20" user role
	When I click on "Success Plans" tab
	Then I select playbook for test
	Then I verify Playbooks subtab using map data "SPPBSPPL" for "Playbook1"