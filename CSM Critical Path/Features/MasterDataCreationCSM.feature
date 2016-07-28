@CSMMasterDetailForUser 
@CSMMasterDetailFeaturForUser 
Feature: All features related to MasterDetail Creation for User 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
@CSM_AccountCreation 
Scenario: Rally Test Case ID :TC2898 :  Creation Of Account 
	When I click on "Accounts" tab 
	Then I create new Account with value "University of Canada" 
	
@CSM_TaskTypeCreation 
Scenario: Rally Test Case ID: TC2935 : Create Task 
	When I click on "Success Tasks" link 
	Then create new Tasks with Type "Call" and its FCView "PES FC Task" with SPPL "SPPL-0000005"  with Account "University of Canada" with status "In Progress"
	
@CSM_SuccessPlanCreation 
Scenario: Rally Test Case ID: TC2895 : Create Success plan 
	When I click on "Success Plans" tab 
	Then I create a SuccessPlan with template "APT-000003" with Account "Action Machinery Co" 
	
@CSM_EmailSPTaskCreation 
Scenario: Rally Test Case ID: TC2908 : Complete task from Success Plan 
	When I click on "Contact" tab 
	Then create new contact with FirstName "Sydney" and LastName "Sheldon" and email "xyz@comitydesigns.com"
	 	
@CSM_AdditionalAccountCreation 
Scenario: Add one Account To Existing Account 
	When I click on "Accounts" tab 
	Then I create new Account with value "FURNITURE INC" 
	
@CSM_AdditionalContactNameCreation 
Scenario: Add one Account To Existing Account 
	When I click on "Contact" tab 
	Then create new contact with FirstName "Steve" and LastName "Gilbert" and email "xyz@comitydesigns.com"
	
 	    