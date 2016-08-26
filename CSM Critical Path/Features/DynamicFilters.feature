Feature: All features related to Success Plan - Success Plan Tab,Actions Subtab,Contacts Widget,Play Details Widgets,Activity Stream Subtab,Usage Subtab,Details Subtab,Playbooks,Opportunities
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@Dynamic_Filters_US1143
Scenario: TC6077,TC6078,TC6079,TC6080,TC6081,TC6082,TC6083
    When I click on "Success Plans" tab
	And I select the QA Test SP
	And I print Action tab first filter value for all columns
	And I check Record Type checkbox is checked or not
	And I check the Action tab Record Type checkbox if not checked
	And I verify Record Type picklist presence on the page
	And I select the Record Type values and clear the filter
	And I uncheck Record Type checkbox
	
@Dynamic_Filters_US1170
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