#@SuccessPlan
#@SuccessPlanTabFeature
Feature: All features related to Success Plan - Success Plan Tab,Actions Subtab,Contacts Widget,Play Details Widgets,Activity Stream Subtab,Usage Subtab,Details Subtab,Playbooks,Opportunities
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@Dynamic_Filters_US1143_1329
Scenario: TC6077,TC6078,TC6079,TC6080,TC6081,TC6082,TC6083
    When I click on "Success Plans" tab
	And I select the QA Test SP
	And I print Action tab first filter value for all columns
	And I check Record Type checkbox is checked or not
	And I check the Action tab Record Type checkbox if not checked
	And I verify Record Type picklist presence on the page
	And I select the Record Type values and clear the filter
	And I uncheck Record Type checkbox
	
@Dynamic_Filters_US1170_1329
Scenario: TC6085,TC6086,TC6087,TC6088,TC6089,TC6090,TC6091
    When I click on "Success Plans" tab
	And I select the QA Test SP
	And I click on "Activity Stream" link
	And I print Activity Stream tab first filter value for all columns
	And I check Record Type checkbox is checked or not
	And I check Activity Stream Record Type checkbox if not checked
	And I verify Activity Stream Record Type picklist presence on the page
	And I select the Record Type values and clear the filter
	And I click on "Activity Stream" link
	And I uncheck Activity Stream Record Type checkbox
	
@DynamicFilterForActionTab
  Scenario: Rally Test Case ID: TC6057,TC6059,TC6060,TC6061,TC6062,TC6063,TC6064,TC6065: Verifying Clear Filters Button is available on Actions Subtab grid 
   When I click on "Success Plans" tab
   And I select the created SP for Dynamic Filter
   And I click on "Actions" tab
   And I verify all filters Present on Action tab page 
   And I verify Play values Present in filter as "Account Play" and "Opportunity Play"
   And I verify Playbook values Present in filter as "Account Playbook" and "Opportunity Playbook"
   And I verify Assigned To values Present in filter as "PES CSM NetOps User"
   And I verify Releated To values Present in filter as "Account" 
   And I verify Task Type values Present in filter as "Call" and "Meeting"
   And I verify Has Play values Present in filter as "Yes" and "No"
   And I click on "Activity Stream" tab
   And I click on "Actions" tab
   And I count records after switching another tab
   And I click on "Clear Filters" button
   And I verify records After clearing all filters
   And I verify that Subject Has Picklist
   And I verify that Due Date Has Picklist
   And I verify that Detail Has Picklist
   
@DynamicFilterForActivityStreamTab
  Scenario: Rally Test Case ID: TC6067,TC6069,TC6070,TC6071,TC6072,TC6073,TC6074,TC6075: Verifying Clear Filters Button is available on Actions Subtab grid 
   When I click on "Success Plans" tab
   And I select the created SP for Dynamic Filter
   And I click on "Activity Stream" tab
   And I verify all filters Present on Activity Stream tab page 
   And I verify Play values Present in filter as "Account Play" and "Opportunity Play" on Activity Stream
   And I verify Playbook values Present in filter as "Account Playbook" and "Opportunity Playbook" on Activity Stream
   And I verify Assigned To values Present in filter as "PES CSM NetOps User" on Activity Stream
   And I verify Task state values Present in filter as "Manual Completion" on Activity Stream
   And I verify Has Play values Present in filter as "Yes" and "No" on Activity Stream
   And I click on "Actions" tab
   And I click on "Activity Stream" tab
   And I count records after switching another tab from Activity Stream
   And I click on "Clear Filters" button
   And I verify records After clearing all filters from Activity Stream
   And I verify that Subject Has Picklist from Activity Stream
   And I verify that Due Date Has Picklist from Activity Stream
   And I verify that Completion Date Has Picklist from Activity Stream
   
	