@ServiceSourceSetup
@PlaysFeature
Feature: All features related to Service Source Setup - Plays,Playbooks and Indicator Groups
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@CreateIndicatorGroup
Scenario:Rally Test Case ID : TC2836,TC2837,TC2838 : Create Indicator Group and Add Indicators
    When I click on "ServiceSource Setup" link
	Then I create a new Indicator Group
	Then I add indicators
	
@CreatePlay
Scenario:Rally Test Case ID : TC2839,TC2840,TC2841 : Creation of Play
	When I click on "ServiceSource Setup" link
	And create a new Play

@EditPlay
Scenario:Rally Test Case ID : TC2842 : Update Play
	When I click on "ServiceSource Setup" link
	Then edit a Play

@DeletePlay
Scenario: Rally Test Case ID : TC2843 : Delete play (plays associated to playbook) - notification dialogue
	When I click on "ServiceSource Setup" link
	Then delete a Play

@CreatePlaybook
Scenario: Rally Test Case ID : TC2847,TC2848 : Creation of Playbook
	When I click on "ServiceSource Setup" link
	And create a new Playbook

@ClonePlaybook
Scenario:Rally Test Case ID : TC2851 : Cloning a Playbook
	When I click on "ServiceSource Setup" link
	And clone a Playbook
	
@DeletePlaywithConfirm
Scenario: Rally Test Case ID : TC2844,TC2845 : Delete play notification dialogue - count/list of impacted playbooks
	When I click on "ServiceSource Setup" link
	Then delete a PlaywithConfirm

@DeletePlaybook
Scenario:Rally Test Case ID : TC2850 : Delete Playbook which is not associated to any SPT
	When I click on "ServiceSource Setup" link
	Then I Delete a Playbook
	Then Delete a PBwithConfirm
	
@CreatePlayfromPlaybook
Scenario: Rally Test Case ID : TC2849 : Create play from playbook using "Create Play" button
	When I click on "ServiceSource Setup" link
	And create a new Play from Playbook
	When I click on "ServiceSource Setup" link
	Then verify if Play is associated with Playbook



