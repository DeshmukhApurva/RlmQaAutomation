@ServiceSourceSetup
@PlaysFeature
Feature: All features related to Service Source Setup - Plays,Playbooks and Indicator Groups
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

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

@CreateIndicatorGroup
Scenario:Rally Test Case ID : TC2836,TC2837,TC2838 : Create Indicator Group and Add Indicators
    When I click on "ServiceSource Setup" link
	Then I create a new Indicator Group
	Then I add indicators

@RecordTypePlays
Scenario: Rally Test Case ID: TC5185, TC5186, TC5187 : Availability of Task Record Type on Create/Edit Play page, Availability when Task Record Types values exist in org, Create Play Tasks using Record types
	When I goto Setup, customize, Activities, Task Record Types
	And I record the values
	When I click on "ServiceSource Setup" link
	And Select Plays link
	And I click on Create Play button
	And I provide details and click Create button
	Then I verify that Record Type field is available
	And I record the Record Type dropdown values
	Then I verify Record Type values
	And I select Record Type value and click Save
	Then I verify Play task creation with Record Type values


@RecordTypeDiffPlays
Scenario: Rally Test Case ID: TC5189, TC5190, TC5191, TC5192: Verify Task Record type for Account based Plays, Verify for Opportunity based Plays, Verify for Case based Plays, Verify for CSM_Account_Plan_c based Plays
	When I click on "Accounts" link
	And I click on New to create Account Name
	And I provide details and click Save
	And I create New Task in Account
	And I select Record Type task and continue
	And I provide details and Save Task
	And I click on Task Subject
	Then I verify Record Type field for Task
	And I click on "Accounts" link
	And I select an Account Name
	And I create New Opportunity in Account
	And I provide Opportunity details and Save
	And I create New Task in Opportunity
	And I select Record Type task and continue
	And I provide details and Save Task
	And I click on "Accounts" link
	And I select an Account Name
	And I click on Opportunity Name
	And I click on Task Subject in Opportunity
	Then I verify Record Type field for Task
	And I click on "Accounts" link
	And I select an Account Name
	And I create New Case in Account
	And I provide details and Save Case
	And I create New Task in Case
	And I select Record Type task and continue
	And I provide details and Save Task
	And I click on "Accounts" link
	And I select an Account Name
	And I click on Case Name
	And I click on Task Subject in Case
	Then I verify Record Type field for Task
	And I click on "Accounts" link
	And I select an Account Name
	And I create New Success Plan in Account
	And I provide details and Save Plan
	



@RTPlaysAccess
Scenario: Rally Test Case ID: TC5188: Verify Accessability of Record Type field
  When I click logout
  And I provide different User credentials to login
  When I click on "ServiceSource Setup" link
  And Select Plays link
  And I click on edit link of a Play
  Then I verify that Record Type field is available