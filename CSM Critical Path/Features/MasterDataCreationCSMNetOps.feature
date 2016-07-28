@MasterDetail 
@MasterDetailFeature 
Feature: All features related to MasterDetail Creation for Admin 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
@AccountCreation 
Scenario: Rally Test Case ID :TC2898 :  Creation Of Account 
	When I click on "Accounts" tab 
	Then I create new Account with value "Action Machinery Co" 
	
@FCCreation 
Scenario: Rally Test Case ID : TC2814,TC2818,TC2822 : Creation of Focus Category 
	When I click on "ServiceSource Setup" link 
	And create a new FC with value "PES FC Task" 
	
@TaskTypeCreation 
Scenario: Rally Test Case ID: TC2935 : Create Task 
	When I click on "Success Tasks" link 
	Then create new Tasks with Type "Call" and its FCView "PES FC Task" with SPPL "SPPL-0000005" with Account "Action Machinery Co" with status "In Progress" 
	
@PlayCreation 
Scenario: Rally Test Case ID : TC2839,TC2840,TC2841 : Creation of Play 
	When I click on "ServiceSource Setup" link 
	And create a new Play with value "Play for Account" and "Account" and "High Risk Description" and its TaskName "PES Play Task" and its task type "Call" and AssignTo "CSM Manager" and Description "Enquiry of Play" and days "10" 
	
@PlaybookCreation 
Scenario: Rally Test Case ID : TC2847,TC2848 : Creation of Playbook 
	When I click on "ServiceSource Setup" link 
	And create a new Playbook with value "PES PlayBook" with play "Play for Account" and its Short Description "High Risk Description" and Object "Account" and its TaskName "PES Play Task" and its task type "Call" and AssignTo "CSM Manager" and Description "Enquiry of Play" and days "10" 
	
@SuccessPlanCreation 
Scenario: Rally Test Case ID: TC2895 : Create Success plan 
	When I click on "Success Plans" tab 
	Then I create a SuccessPlan with template "APT-000003" with Account "Action Machinery Co" 
	
@FCWidgetViewCreation 
Scenario: 
	Rally Test Case ID : TC2814,TC2818,TC2822 : Creation of Focus Category for Widget 
	When I click on "ServiceSource Setup" link 
	And create a new FC with value "FC for Widgets" 
	
@FCGroupCreation 
Scenario: Rally Test Case ID: TC2827 : Creation of Focus Category Group 
	When I click on "ServiceSource Setup" link 
	And create a new FC group with value "PES Indicator Group" 
	
@FCCategoryCreation 
Scenario: Rally Test Case ID: TC2827 : Creation of Focus Category Group 
	When I click on "ServiceSource Setup" link 
	And create a new FC group with value "PES FCG Overview" 
	
@EmailSPTaskCreation 
Scenario: Rally Test Case ID: TC2908 : Complete task from Success Plan 
	When I click on "Contact" tab 
	Then create new contact with FirstName "Kevin" and LastName "Danials" and email "xyz@comitydesigns.com"
	 	
@AdditionalAccountCreation 
Scenario: Add one Account To Existing Account 
	When I click on "Accounts" tab 
	Then I create new Account with value "DATACOMM INC" 
	
@AdditionalContactNameCreation 
Scenario: Add one Account 
	When I click on "Contact" tab 
	Then create new contact with FirstName "Martin" and LastName "Liner" and email "xyz@comitydesigns.com"
	
		    