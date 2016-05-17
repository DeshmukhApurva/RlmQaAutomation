@ServiceSourceSetup
@SuccessPlanTemplatesFeature
Feature: All features related to Service Source Setup - Success Plan Templates
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@CreateSPT
Scenario: Rally Test Case ID : TC2852,TC2856,TC2857,TC2859,TC2862 : Create Success Plan Template
    When I click on "ServiceSource Setup" link
	Then I create a new Success Plan Template
	
@SPTClone
Scenario:Rally Test Case ID : TC2855 : Clone a Success Plan Template
	When I click on "ServiceSource Setup" link
	And I Clone a Success Plan Template

@SPIndicatorDeletion
Scenario: Rally Test Case ID : TC2853,TC2863 : Edit success plan template,Delete Indicator from Success Plan Template
	When I click on "ServiceSource Setup" link
	And I edit Success Plan Templates
	Then I delete SuccessPlanIndicator

@SPTCloneDelete
Scenario: Rally Test Case ID : TC2854 : Delete Clone of a Success Plan Template to verify Success Plan Delete
	When I click on "ServiceSource Setup" link
	And I Delete a clone Success Plan Templates

@CreatePlaybookfromSPT
Scenario:Rally Test Case ID : TC2860 : Create a Playbook from Success Plan Template
	When I click on "ServiceSource Setup" link
	And I edit Success Plan Templates
	And create a new Playbook from SPT
	When I click on "ServiceSource Setup" link
	And I edit Success Plan Templates
	Then I should view the "created" Playbook

@EditPlaybookfromSPT
Scenario: Rally Test Case ID : TC2861 : Edit a Playbook from Success Plan Template
	When I click on "ServiceSource Setup" link
	And I edit Success Plan Templates
	Then I should edit a Playbook
	When I click on "ServiceSource Setup" link
	And I edit Success Plan Templates
	Then I should view the "edited" Playbook

