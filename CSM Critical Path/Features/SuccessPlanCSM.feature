@CSMSuccessPlan
@CSMSuccessPlanTabFeature
Feature: All features related to Success Plan - Success Plan Tab,Actions Subtab,Contacts Widget,Play Details Widgets,Activity Stream Subtab,Usage Subtab,Details Subtab,Playbooks,Opportunities
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@CSM_CreateSuccessPlan
Scenario: Rally Test Case ID: TC2759 : Create Success plan
	When I click on "Success Plans" link
	And I create a "New" SuccessPlan

@CSM_CreateSPTask
Scenario: Rally Test Case ID: TC2768 : Create task from Success Plan
	When I Navigate to Success Plans tab
	Then I select the created SP
	Then create new Task for SP

@CSM_CreateMultipleSPTask
Scenario: Create task from Success Plan
	When I Navigate to Success Plans tab
	Then I select the created SP
	Then create new Task for SP
	Then create new Task for SP
	Then create new Task for SP
	Then create new Task for SP
	Then create new Task for SP

	
@CSM_FilterSPTask
Scenario: Rally Test Case ID: TC2769 : Complete task from Success Plan
	When I Navigate to Success Plans tab
	Then I select the created SP
	And I filter tasks "Phone Call Tasks"
	And I filter tasks "Has Play"

@CSM_EmailSPTask
Scenario: Rally Test Case ID: TC2772 : Complete task from Success Plan
	When I Navigate to Success Plans tab
	Then I select the created SP
	And I send email for SP Task

@CSM_WidgetSPTask
Scenario: Rally Test Case ID: TC2766,TC2767,TC2773,TC2774,TC2775,TC2776,TC2777,TC2778,TC2779,TC2780 : Verify Task Widgets from Success Plan,Verify task icon hover details
	When I Navigate to Success Plans tab
	Then I select the created SP
	And I verify widgets for SP Task

@CSM_SPActivityStream
Scenario: Rally Test Case ID: TC2781 : Verify Activity Stream section from Success Plan
	When I Navigate to Success Plans tab
	Then I select the created SP
	And I verify activity stream


@CSM_SPDetailsSection
Scenario:  Rally Test Case ID: TC2784 : Verify Details Section from Success Plan
	When I Navigate to Success Plans tab
	Then I select the created SP
	And I verify Details Section
	

				
@CSM_SPOpportunity
Scenario:  Rally Test Case ID: TC2791 : Add Opportunity from Success Plan
	When I Navigate to Success Plans tab
	Then I select the created SP
	And I add new SP Opportunity
	
@CSM_SPEditOpportunity
Scenario: Rally Test Case ID: TC2792 : Edit Opportunity from Success Plan
	When I Navigate to Success Plans tab
	Then I select the created SP
	And I edit SuccessPlan Opportunity

@CSM_SPDeleteOpportunity
Scenario:  Rally Test Case ID: TC2792 : Delete Opportunity from Success Plan
	When I Navigate to Success Plans tab
	Then I select the created SP
	And I delete SuccessPlan Opportunity
	
@CSM_EditSuccessPlan @updated
Scenario: Rally Test Case ID : TC2760,TC2765,TC2785 :  Edit Success Plan,Verify indicators on SP
	When I click on "Success Plans" link
	Then I select the created SP
	And I edit first SuccessPlan
	
@CSM_DeleteSuccessPlan
Scenario:  Rally Test Case ID : TC2761 :  Delete Success Plan
	When I Navigate to Success Plans tab
	And I delete first SuccessPlan
	
@CSM_CreateSPfromAccounts @updated
Scenario: Rally Test Case ID : TC2762 :  Success Plan Creation from Accounts,Create Success plan from account detail page
    When I Navigate to Accounts tab
	Then I create new Account
	When I Navigate to Accounts tab
	Then I view Account
	And I create a "New Success Plan" SuccessPlan	
	When I Navigate to Success Plans tab
	And I select the SP created from Account
	Then I add new Playbook for SP
	Then I verify Play task created for SP

@CSM_AddPlayBookForSP
Scenario: Rally Test Case ID : TC2787,TC2788,TC2789,TC2790 : Success Plan add PlayBook
	When I click on "Success Plans" link
	And I select the SP created from Account
	Then I delete a Playbook for SP
	
@CSM_EditSPfromAccounts	 @updated
Scenario: Rally Test Case ID : TC2763 : Edit Success plan from account detail page
    When I Navigate to Accounts tab
	Then I view Account
	And I select an Account SuccessPlan
	And I edit Account SuccessPlan

@CSM_DeleteSPfromAccounts  @updated
Scenario: Rally Test Case ID : TC2764 :  Delete Success plan from account detail page
    When I Navigate to Accounts tab
	Then I view Account
	And I delete an Account SuccessPlan

@CSM_DeleteAccount
Scenario:  Success Plan Deletion from Accounts 
    When I Navigate to Accounts tab
	Then I delete an Account




@CSM_complete_sp_task
Scenario: Rally Test Case ID: TC2770,TC4815,TC4816,TC4819 : Complete task from Success Plan,Complete Task with Status value,Complete Task with Status value and additional Fields (required/non required),Verify the Task Status Value after completing the task
	When I click on "Success Plans" tab
	And I select the created SP
	And create new Task for SP
	And I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	Then I verify the "Success Plans" details
	When I click on "Actions" tab
	And I complete the first task
	Then I verify the completed the task


@CSM_dismiss_sp_task
Scenario: Rally Test Case ID: TC2771,TC4817,TC4818 : Complete task from Success Plan,Dismiss Task with Status value,Dismiss Task with Status value and additional Fields (required/non required)
	When I click on "Success Plans" tab
	And I select the created SP
	And create new Task for SP
	And I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	Then I verify the "Success Plans" dismiss details
	And I click on "Actions" tab
	And I dismiss the first task
	Then I verify the dismiss the task


@CSM_cancel_success_plan_creation
Scenario: Rally Test Case ID: TC4694 : Cancel Success plan creation
	When I click on "Success Plans" tab
	And I click on "New" button
	And I fill the required details
	And I click on "Cancel" button from success plan creation
	And I click on "Go!" button from "Success Plans" page
	Then I verify the success plan created or not


@CSM_cancel_edit_delete_action
Scenario: Rally Test Case ID: TC4695,TC4696 : Cancel Success Plan Edit action,Cancel Success Plan delete action
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I edit the existing success plan
	And I click on "Cancel" button from success plan creation
	



@CSM_verifying_task_time_line
Scenario: Rally Test Case ID: TC4697,TC4698,TC4699,TC4700,TC4701,TC4702,TC4703,TC4704,TC4705 - Verify - task on time line,task icon and styling,task icon hover details,Verify that correct number of Phases will appear on the Timeline,Verify that due date is correct for tasks appeared on timeline,Task alignment based on Zoom Level,Availability of < and > button on timeline,Verify "Rolling Quarter" link range,Verify "This Quarter" link range,Verify "Rolling Half Year" link range
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I verify the task time line
	Then I verify the time line buttons
	And I verify "Rolling Quarter" link range
	And I verify "This Quarter" link range
	And I verify "Rolling Half Year" link range


@CSM_verify_tasks_get_created
Scenario: Rally Test Case ID: TC4706,TC4707 - Verify that tasks get created when play criteria matches,Cancel task creation
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I edit the existing success plan
	And I add the account details
	And I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	Then I should be able to see the play task
	When I click on "Create Task" button
	And I fill the required task details
	And I "CANCEL" the "Create Task"


@CSM_cancel_complete_dismiss_task
Scenario: Rally Test Case ID: TC4713,TC4714,TC4814 - Cancel Complete task action,Cancel dismiss task action,Verify that no actions (complete/dismiss) should get displayed for the tasks, for which user does not have access
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	And I cancel the complete task
	And I cancel the dismiss task


@CSM_verify_status_fields @note
Scenario: Rally Test Case ID: TC4715,TC4716,TC4810,TC4811,TC4812,TC4813 - Create task with Status Field,Related Play value will get populated in Play field of New Task Page after selecting a Task with an existing play and clicking on Create Task,Play value populated in Play field of New Task Page should persist on Task Edit page and user will able to create task with that play value,NewTaskPopup Field Set : Add all fields in the Field Set,Add required/non required custom fields
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	And I click on "Create Task" button
	And I fill the required task details
	Then I verify the "Create Task" "Status" fields
	And I verify the additional fields
	And I verify the required fields
	And I "SAVE" the "Create Task"



@CSM_verify_contact_widget_details
Scenario: Rally Test Case ID: TC4717,TC4718,TC4719,TC4720,TC4721 - Verify Contact Widget display contacts on navigating to Success Plan,Verify Contact Widget is static on Success Plan page,Verify CSM and Non- CSM contact icon,Verify contacts display order,Navigate to contact details through contact link
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	Then I verify the contact widget details


@CSM_verify_complete_reason_code
Scenario: Rally Test Case ID: TC4708 - View and Select value (value entered in Complete Reason Codes and/or Complete Reason Codes (Cont'd) field of CSM Admin custom) from Complete Reason Code drop down of Complete Tasks Popup of the Overview/Success Tasks/Success Plan page
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	And I click on "Create Task" button
	And I fill the required task details
	And I "SAVE" the "Create Task"
	And I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	And I select the "Reason Code" value from pick list in "Completed" task
	And I "Complete" the task
	And I verify the "Complete" task "Reason Code" field


@CSM_verify_dismiss_reason_code
Scenario: Rally Test Case ID: TC4709 - View and Select value (value entered in Dismiss Reason Codes and/or Dismiss Reason Codes (Cont'd) field of CSM Admin custom) from Dismiss Reason Code drop down of Dismiss Tasks Popup of the Overview/Success Tasks/Success Plan page
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	And I click on "Create Task" button
	And I fill the required task details
	And I "SAVE" the "Create Task"
	And I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	And I select the "Reason Code" value from pick list in dismiss task
	And I "Dismiss" the task
	And I verify the "Dismiss" task "Reason Code" field


@CSM_sp_required_non_required_fields
Scenario: Rally Test Case ID: TC4710,TC4711,TC4712 - Required/Non Required Fields on Complete/Dismiss Tasks popup window of Overview/Success Plan/Success Plan Page,Complete/Dismisse Tasks with value in Required Field on Complete/Dismiss Tasks popup window. Error messge if no value is entered,Complete/Dismisse Tasks with value in Non Required Field on Complete/Dismiss Tasks popup window. Error messge if no value is entered
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	And I click on complete task
	Then I verify the additional fields
	And I verify the required fields
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	And I click on dismiss task
	Then I verify the additional fields
	And I verify the required fields



@CSM_verify_custom_settings
Scenario: Rally Test Case ID: TC4722,TC4723 - Availability of "Use Revenue Link v2 Canvas App" field in Custom Setting,"Use Revenue Link v2 Canvas App" field is by default checked
	When I click on "Setup" from "CSM" app
	And I click on "Develop" tab
	And I click on "Custom Settings" tab
	And I click on "CSM Admin" link from "Custom Settings" page
	Then I should be able to see the "Use Revenue Link v2 Canvas App" field
	When I click on "Use Revenue Link v2 Canvas App" field
	Then I should be able to see the "Default Value" is "Checked"


@CSM_verify_the_usage_tab
Scenario: Rally Test Case ID: TC4724,TC4725,TC4726,TC4727,TC4728,TC4729,TC4730,TC4731,TC4732,TC4733 - Verify the Usage Tab when custom setting is checked, and neither RevLink v2 nor v1 installed in the org,Verify the Usage Tab when custom setting is unchecked, and neither RevLink v2 nor v1 installed in the org,Verify that Usage Tab display Scout Canvas App, when only Rev Link v2 installed and the custom setting is checked/TRUE,Verify that Usage Tab display error message,when only Rev Link v2 installed and the custom setting is unchecked/False,Verify that Usage Tab display error message when only Rev Link v2 installed and the custom setting is checked, but the parameters needed are empty,Verify that Usage Tab display error message when only Rev Link v2 installed and the custom setting is checked but needed parameters are not accessible
	When I click on "Setup" from "CSM" app
	And I click on "Develop" tab
	And I click on "Custom Settings" tab
	And I click on "CSM Admin" link from "Custom Settings" page
	Then I should be able to see the "Use Revenue Link v2 Canvas App" field
	When I click on "Use Revenue Link v2 Canvas App" field
	Then I should be able to see the "Default Value" is "Checked"
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Usage" tab
	Then I verify the banner is displayed
	And I verify the "Scout Canvas"



@CSM_sp_save_user_preferences
Scenario: Rally Test Case ID: TC4775,TC4776,TC4777 - Success Plan Actions Tab: Save user preferences for Filter Selection (login/logout/Navigate away from tab/subtab),Save user preferences for Task grid column selection (login/logout/Navigate away from tab/subtab),Success Plan Activity Stream Tab: Save user preferences for Task grid column selection (login/logout/Navigate away from tab/subtab)
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	And I select any filter from "Actions" filter pick list
	Then I verify the grid details are according to your filter selection
	When I user logout from "CSM" application
	And that I navigate to the CRM application
	Then I should land on CRM home page
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	Then I verify that user preference is saved as per last selection
    When I click on "Activity Stream" tab
	And I click on "Actions" tab
	Then I verify that user preference is saved as per last selection
	When I select the default filter from "Actions" filter pick list



@CSM_verify_csm_admin_custom_fields
Scenario: Rally Test Case ID: TC4820,TC4821,TC4822,TC4823 - Availability of 8 Custom Fields CSM Admin Custom Setting to replace the Success Plan User Lookup's label, Verify the custom field's size to replace the Success Plan user lookup's label,Verify the Success Plan user lookup's label when no value provided in the custom fields, Verify the Success Plan user lookup's label replacement on Success Plan > Details Subtab
	When I click on "Setup" from "CSM" app
	And I click on "Develop" tab
	And I click on "Custom Settings" tab
	And I click on "CSM Admin" link from "Custom Settings" page
	Then I should be able to see the custom fields
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Details" tab
	Then I verify "Details" tab default labels


@CSM_verify_opportunities_grid
Scenario: Rally Test Case ID: TC4825 - Opportunities Grid - Verify Currency field values display record currency with each opportunity
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Details" tab
	Then I verify the opportunities grid details


@CSM_cancel_complete_dismiss_task
Scenario: Rally Test Case ID: TC4959,TC4960,TC5127 - Cancel Complete task action,Cancel dismiss task action,Verify that no actions (complete/dismiss) should get displayed for the tasks, for which user does not have access
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	And I cancel the complete task
	And I cancel the dismiss task


@CSM_verify_action_tab_columns
Scenario: Rally Test Case ID: TC5448,TC5449,TC5450 - Success Plan - Actions Tab: Availability of Task Record Type Column,Ability of the user to select Record Type and Task Type columns,Verify Record Type and Task Type columns saved in User Preference
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	And I click on "Columns" picker
	Then I verify the "Record Type" and "Task Type" fields
	When I select the "Record Type" and "Task Type" fields
	Then I verify the "Record Type" and "Task Type" fields selection is saved or not
	And I click on "Activity Stream" tab
	And I click on "Actions" tab
	Then I verify the "Record Type" and "Task Type" fields
	When I user logout from "CSM" application
	And that I navigate to the CRM application
	Then I should land on CRM home page
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	And I click on "Columns" picker
	Then I verify the "Record Type" and "Task Type" user preference is saved
	When I click on "Success Tasks" tab
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	And I click on "Columns" picker
	Then I verify the "Record Type" and "Task Type" user preference is saved


@CSM_verify_activity_stream_tab_columns
Scenario: Rally Test Case ID: TC5451,TC5452,TC5453 - Success Plan - Activity Stream Tab: Availability of Task Record Type Column,Ability of the user to select Record Type and Task Type columns,Verify Record Type and Task Type columns saved in User Preference
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Activity Stream" tab
	And I click on "Columns" picker
	Then I verify the "Record Type" and "Task Type" fields
	When I select the "Record Type" and "Task Type" fields
	Then I verify the "Record Type" and "Task Type" fields selection is saved or not
	And I click on "Actions" tab
	And I click on "Activity Stream" tab
	Then I verify the "Record Type" and "Task Type" fields
	When I user logout from "CSM" application
	And that I navigate to the CRM application
	Then I should land on CRM home page
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Activity Stream" tab
	And I click on "Columns" picker
	Then I verify the "Record Type" and "Task Type" user preference is saved
	When I click on "Success Tasks" tab
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Activity Stream" tab
	And I click on "Columns" picker
	Then I verify the "Record Type" and "Task Type" user preference is saved


@CSM_TaskStateSuccessPlan
Scenario:  Rally Test Case ID: TC5214: Verifying Task State for Task from Success Plan page
  When I click on "Success Plans" link
  And I click on any Success Plan Name to navigate to Action Tab to verify tasks
  And I click on Subject of any task on the Action Tab
  And I check Task detail page to edit status to Completed
  Then I verify Task State
  
  
@CSM_PlayBookColumnHidden
Scenario: Rally Test Case ID: TC5197,TC6001: Playbook column should be hidden in Action sub tab of Success Plan by default Users should be allowed to see Playbook column if user checkes it from column picker.
  When I click on "Success Plans" tab
  And I click on "Go!" button from "Success Plans" page
  And I select the existing success plan
  And I click on "Actions" tab 
  And I click on "Columns" picker
  Then I verify "Playbook" is default unchecked in the column picker
  And I click on "Activity Stream" tab
  And I click on "Columns" picker
  Then I verify "Playbook" is default unchecked in the column picker
  
@CSM_PlayBookColumnOrder
Scenario: Rally Test Case ID: TC5198,TC6002 Users should be allowed to see Playbook after play and before Assigned To columns
  When I click on "Success Plans" tab
  And I click on "Go!" button from "Success Plans" page
  And I select the existing success plan
  And I click on "Actions" tab 
  And I select Playbook from Column picker for Actions
  And I verify for Playbook column order 
  And I click on "Activity Stream" tab
  And I select Playbook from Column picker for Activity Stream 
  And I verify for Playbook column order for Activity Stream
 
 
@CSM_PlaybookcolumnvisibleAction 
  Scenario: Rally Test Case ID: TC5199 Users should be allowed to see Playbook column visible in Action subtab on navigating from other tab or login/out
 
   When I click on "Success Plans" tab
   And I click on "Go!" button from "Success Plans" page
   And I select the existing success plan
   And I click on "Actions" tab 
   And I select Playbook from Column picker for Actions
   And I verify for Playbook column order 
   When I user logout from "CSM" application
   And that I navigate to the CRM application
   Then I should land on CRM home page
   When I click on "Success Plans" tab
   And I click on "Go!" button from "Success Plans" page
   And I select the existing success plan
   And I click on "Actions" tab 
   And I select Playbook from Column picker for Actions
   And I verify for Playbook column order 
  
  
 @CSM_PlaybookcolumnvisibleActivityStream
   Scenario: Rally Test Case ID: TC6003 Users should be allowed to see Playbook column visible in Activity Stream subtab on navigating from other tab or login/out
   
   When I click on "Success Plans" tab
   And I click on "Go!" button from "Success Plans" page
   And I select the existing success plan
   And I click on "Activity Stream" tab
   And I select Playbook from Column picker for Activity Stream 
   And I verify for Playbook column order for Activity Stream
   When I user logout from "CSM" application
   And that I navigate to the CRM application
   Then I should land on CRM home page
   When I click on "Success Plans" tab
   And I click on "Go!" button from "Success Plans" page
   And I select the existing success plan
   And I click on "Activity Stream" tab
   And I select Playbook from Column picker for Activity Stream 
   And I verify for Playbook column order for Activity Stream
   
  @CSM_PlaybookColumnDisplayedandNavigated
   Scenario: Rally Test Case ID: TC6000,TC6004 Users should be allowed to see Playbook as Hyperlinks which navigate to a playbook detail page on Clicking
   When I click on "Success Plans" tab
   And I click on "Go!" button from "Success Plans" page
   And I select the existing success plan
   And I click on "Actions" tab 
   And I select Playbook from Column picker for Actions
   And I click on Playbook link and navigate to Playbook Detail page for Action Tab
   
   When I click on "Success Plans" tab
   And I click on "Go!" button from "Success Plans" page
   And I select the existing success plan
   And I click on "Activity Stream" tab
   And I select Playbook from Column picker for Activity Stream 
   And I click on Playbook link and navigate to Playbook Detail page for Activity Stream
   
  @CSM_CreateTaskwithSuccessPlanPlay
   Scenario: Rally Test Case ID: TC5947 User should be able Create Task with Success Plan Play and Value should be displayed on Task detail page
   
   When I click on "Success Plans" tab
   And I click on "Go!" button from "Success Plans" page
   And I select the existing success plan
   And I click on "Create Task" button
   And I fill the required task details
   And I click on the Subject for Success Plan
   And I verify value in Task Detail Page
   
   
   When I click on "Success Tasks" link
   And I select Task based FC from dropdown
   And I click on "Create Task" button
   And I fill the required task details
   And I save the Task
   And I click on the Subject for Success Task
   And I verify value in Task Detail Page
     