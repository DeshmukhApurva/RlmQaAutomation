@MasterDetail 
@MasterDetailFeature 
Feature: All features related to MasterDetail Creation for Admin 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
	#@AccountCreation 
	#Scenario: Rally Test Case ID :TC2898 :  Creation Of Account 
	#	When I click on "Accounts" tab 
	#	Then I create new Account with value "Action Machinery Co" 
	
@FCCreation 
Scenario: Rally Test Case ID : TC2814,TC2818,TC2822 : Creation of Focus Category 
#	When I click on "All Tabs" tab 
	When I click on "ServiceSource Setup" link 
	And create a new FC with value "PES FC Task" with "Task"
	
@FCCreationOverwiew 
Scenario: Rally Test Case ID : TC2814,TC2818,TC2822 : Creation of Focus Category 
#	When I click on "All Tabs" tab 
	When I click on "ServiceSource Setup" link 
	And create a new FC with value "PES FC Task-Overview" with "Task" 

@FCWidgetViewCreation 
Scenario: 
	Rally Test Case ID : TC2814,TC2818,TC2822 : Creation of Focus Category for Widget 
#	When I click on "All Tabs" tab 
	When I click on "ServiceSource Setup" link 
	And create a new FC with value "PES FC for Widgets" with "Account" 
	
@FCGroupCreation 
Scenario: Rally Test Case ID: TC2827 : Creation of Focus Category Group 
#	When I click on "All Tabs" tab 
	When I click on "ServiceSource Setup" link 
	And create a new FC group with value "PES Indicator Group" 
	
@FCCategoryCreation 
Scenario: Rally Test Case ID: TC2827 : Creation of Focus Category Group 
#	When I click on "All Tabs" tab 
	When I click on "ServiceSource Setup" link 
	And create a new FC group with value "PES FCG Overview" 
	
@PlayCreation 
Scenario: Rally Test Case ID : TC2839,TC2840,TC2841 : Creation of Play 
#		When I click on "All Tabs" tab
	When I click on "ServiceSource Setup" link 
	And create a new Play with value "testPlay for Account" and "Account" object and "High Risk Description" 
	And I Add Criteria on Play with field "Annual Revenue"
	And I Add its TaskName "PES Play Task" and its task type "Call" and AssignTo "CSM Manager" and Description "Enquiry of Play" and days "10" 
	
	
@PlaybookCreation 
Scenario: Rally Test Case ID : TC2847,TC2848 : Creation of Playbook 
#   	When I click on "All Tabs" tab
	When I click on "ServiceSource Setup" link 
	And create a new Playbook with value "PES PlayBook" with play "Play for Account" and its Short Description "High Risk Description" and Object "Account" 
	And I Add its TaskName "PES Play Task" and its task type "Call" and AssignTo "CSM Manager" and Description "Enquiry of Play" and days "10" 
	
#@CreateIndicatorGroupCreation 
#Scenario:
#Rally Test Case ID : TC2836,TC2837,TC2838 : Create Indicator Group and Add Indicators 
##   When I click on "All Tabs" tab
#	When I click on "ServiceSource Setup" link 
#	Then I create a new Indicator Group with name "CSM Indicator Group" 
#	Then I add indicator 
	
@CreateSPTCreation 
Scenario: 
	Rally Test Case ID : TC2852,TC2856,TC2857,TC2859,TC2862 : Create Success Plan Template 
	#   	When I click on "All Tabs" tab
	When I click on "ServiceSource Setup" link 
	Then I create a new Success Plan Template with Template Name "PES New SPlan Template" PhaseName "PES SP Template Phase" Days "20" Indicator "Health Status" with PlayBook "PES PlayBook" Criteria1 Type: "Success" Criteria2 Type: "Meet" Criteria3 Type: "Fail" Criteria1: "Healthy" Criteria2: "Low Adoption" Criteria3: "Pending Churn" 
	
	#@SuccessPlanCreation 
	#Scenario: Rally Test Case ID: TC2895 : Create Success plan 
	#	When I click on "Success Plans" tab 
	#	Then I create a SuccessPlan with template "APT-000025" with Account "Action Machinery Co" 
	#		
	#@EmailSPTaskCreation 
	#Scenario: Rally Test Case ID: TC2908 : Complete task from Success Plan 
	#	When I click on "Contact" tab 
	#	Then create new contact with FirstName "Kevin" and LastName "Danials" and email "xyz@comitydesigns.com"
	#	 	
	#@AdditionalAccountCreation 
	#Scenario: Add one Account To Existing Account 
	#	When I click on "Accounts" tab 
	#	Then I create new Account with value "DATACOMM INC" 
	#	
	#@AdditionalContactNameCreation 
	#Scenario: Add one Account 
	#	When I click on "Contact" tab 
	#	Then create new contact with FirstName "Martin" and LastName "Liner" and email "xyz@comitydesigns.com"
	#	
@OverviewTaskCreation
Scenario: Add one Task to PEC FCG Overview
	When I click on "All Tabs" tab 
	When I click on "Overview" link 
	And I select FCG 
	And I click on Edit Button 
	And I fill the Details in the FC 
	And I click on Edit Button 
	And I Select FC Task

