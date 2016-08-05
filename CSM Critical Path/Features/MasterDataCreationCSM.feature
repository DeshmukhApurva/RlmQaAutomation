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
	
 	    