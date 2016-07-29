@CSMSuccessTasks
@CSMSuccessTaskFeature
Feature: All features related to Success Tasks - Success Task,Success Plan Details Widget,Contacts Widget,Play Details Widgets
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page


@CSM_CreateNewview
Scenario: Rally Test Case ID: TC2794 : Verify to creation of New FocusCategory,Create new view and select that view. Verify message when selected view does not have any task
   When I click on "Success Tasks" link
   Then click on Create new link   

@CSM_EditFCview
Scenario: Rally Test Case ID: TC2795 : Verify to creation of New FocusCategory,Edit view
   When I click on "Success Tasks" link
   Then edit FC View 
   
@CSM_CreateSuccessTask
Scenario: Rally Test Case ID: TC2799 : Create Task
    When I click on "Success Tasks" link
	Then create new Tasks

@CSM_CreateSuccessTaskinBulk
Scenario: Create Task
    When I click on "Success Tasks" link
	Then create new Tasks
	When I click on "Success Tasks" link
	Then create new Tasks
	When I click on "Success Tasks" link
	Then create new Tasks
	When I click on "Success Tasks" link
	Then create new Tasks

	
@CSM_CompleteTask
Scenario: Rally Test Case ID: TC2796 : Complete task
	When I Navigate to Success Tasks tab
	And I complete Success task

@CSM_DismissTask
Scenario: Rally Test Case ID: TC2797 : Dismiss Success task
	When I Navigate to Success Tasks tab
	And I dismiss Success task

@CSM_EmailTask
Scenario: Rally Test Case ID: TC2798 : Complete Success task
	When I Navigate to Success Tasks tab
	And I email Success task

@CSM_CancelCompleteBulkTask
Scenario: Rally Test Case ID: TC2801: Dismiss Success task
	When I Navigate to Success Tasks tab
	And I cancel complete Success task in bulk
	
@CSM_CompleteBulkTask
Scenario: Rally Test Case ID: TC2800 : Complete Success task
	When I Navigate to Success Tasks tab
	And I complete Success task in bulk

@CSM_DismissBulkTask
Scenario: Rally Test Case ID: TC2802 : Dismiss Success task
	When I Navigate to Success Tasks tab
	And I dismiss Success task in bulk


@CSM_TaskSPDetailsWidget
Scenario: Rally Test Case ID: TC2803 : Verify SP Details Widget on Success task
	When I Navigate to Success Tasks tab
	Then I verify SP Details Widget on Success task 

@CSM_TaskOpenSP
Scenario: Rally Test Case ID: TC2804 : Verify SP Details Widget on Success task
	When I Navigate to Success Tasks tab
	Then I open SP
	
@CSM_VerifyContactsWidget
Scenario: Rally Test Case ID: TC2805,TC2806,TC2807,TC2808,TC2809 : Verify Contact Details Widget on Success task
	When I Navigate to Success Tasks tab
	Then I open Contact

@CSM_VerifyPlayWidget
Scenario: Rally Test Case ID: TC2810,TC2811,TC2812,TC2813 : Verify Contact Details Widget on Success task
	When I Navigate to Success Tasks tab
	Then I verify Play widget



@CSM_cancel_complete_task_action
Scenario: Rally Test Case ID: TC4734,TC4735,TC4737 - Cancel "Complete Task" action,Cancel "Dismiss Task" action,Cancel bulk task completion
	When I click on "Success Tasks" tab
	And I select the tasks
	And I click on "Complete" task button
	And I "CANCEL" the complete success task
	And I click on "Dismiss" task button
	And I "CANCEL" the dismiss success task
	Then I should able to see the "Success Tasks" page

@CSM_cancel_the_new_task_creation
Scenario: Rally Test Case ID: TC4736 - Cancel new task creation
	When I click on "Success Tasks" tab
	And I click on "Create Task" button
	And I "CANCEL" the create new task
	Then I should able to see the "Success Tasks" page


@CSM_verifying_complete_dismiss_buttons
Scenario: Rally Test Case ID: TC4792 - Verify that no actions (complete/dismiss) should get displayed for the tasks, for which user does not have access
	When I click on "Success Tasks" tab
	And I select the task from task list
	Then I verify the "Complete" and "Dismiss" buttons


@CSM_verify_create_task_status_fields
Scenario: Rally Test Case ID: TC4793,TC4744,TC4747,TC4748 - Success Task : Add task with Status Field,Complete/Dismiss Tasks state after new task creation,Related Play value will get populated in Play field of New Task Popup after selecting a Task with an existing play and clicking on Create Task,Play value populated in Play field of New Task Page should persist on Task Edit page and user will able to create task with that play value,Play value populated in Play field of New Task Page should persist on Task Edit page and user will able to create task with that play value
	When I click on "Success Tasks" tab
	And I select the task from task list
	And I click on "Create Task" button
	And I fill the required task details
	


@CSM_task_details_page
Scenario: Rally Test Case ID: TC4797,TC4798 - Task Details Page: Availability of Reason Code field as Picklist field,Verify Reason Code Picklist field values
	When I click on "Accounts" tab
	And I select the existing account
	And I click on success task
	Then I should able to see the success task details page
	And I should able to see the "Reason Code" field


@CSM_edit_task_details_page
Scenario: Rally Test Case ID: TC4799,TC4800,TC4801,TC4802,TC4803 - Task Details Page: Availability of Reason Code field as Picklist field,Verify Reason Code Picklist field values,Add/Select Reason Code for Tasks,Reason Code field should not be available, User should be able to see the saved Reason Code value on navigating to Task Detail page,Update Reason Code field value,Verify the Reason Code field value for Completed/Dismissed tasks with Reason Codes
	When I click on "Accounts" tab
	And I select the existing account
	And I edit the success task
	Then I should able to see the success task details page
	And I should able to see the "Reason Code" field


@CSM_complete_task_status_fields
Scenario: Rally Test Case ID: TC4804,TC4805,TC4743 - Complete Task with Status value and additional Fields (required/non required),Verify the Task Status Value after completing the task,Complete/Dismiss Tasks state after Complete/Dismiss task
 When I click on "Success Tasks" tab
    And I select the tasks
    And I click on success task "Complete" button
    And I "SAVE" the complete success task
    Then I should able to see the "Success Tasks" page
    And I should able to see the "Completed" status
    And I verify the complete icon state
    And I verify the dismiss icons state


@CSM_dismiss_task_status_fields
Scenario: Rally Test Case ID: TC4806,TC4807,TC4808,TC4743 - Success Tasks: Dismiss Task with Status value,Dismiss Task with Status value and additional Fields (required/non required),Verify the Task Status Value after dismissing the task
When I click on "Success Tasks" tab
    And I select the tasks
    And I click on success task "Dismiss" button
    And I "SAVE" the dismiss success task
    Then I should able to see the "Success Tasks" page
    And I should able to see the "Completed" status
    And I verify the complete icon state
    And I verify the dismiss icons state
    
@CSM_verify_success_plan_custom_label
Scenario: Rally Test Case ID: TC4809 - Verify Success Plan Custom Label on SP Widget
	When I click on "Success Tasks" tab
	And I select the task from task list
	And I click on carrot icon
	Then I verify the success plan details widget


@CSM_verify_new_task_popup_field_set
Scenario: Rally Test Case ID: TC4794 - Availability of New Task Popup Field Set
	When I click on "Setup" from "CSM" app
	And I click on "Customize" tab
	And I click on "Activities" tab
	And I click on "Task Field Sets" tab
	Then I should be able to see the "New Task Popup" field


@CSM_st_required_non_required_fields
Scenario: Rally Test Case ID: TC4738,TC4739,TC4740 - Required/Non Required Fields on Complete/Dismiss Tasks popup window of Success Tasks Page,Complete/Dismiss Tasks with value in Required Field on Complete/Dismiss Tasks popup window. Error message if no value is entered,Complete/Dismiss Tasks with value in Non Required Field on Complete/Dismiss Tasks popup window. Error message if no value is entered
	When I click on "Success Tasks" tab
    And I select the task from task list
    And I open the "Complete Task" pop up window
    Then I verify the additional fields
    And I verify the required fields
    When I click on "Success Tasks" tab
    And I select the task from task list
    And I open the "Dismiss" task pop up window
    Then I verify the additional fields
    And I verify the required fields


@CSM_verify_icon_status
Scenario: Rally Test Case ID: TC4741,TC4742 - Complete/Dismiss icon state for Opened/Completed Tasks on Success Tasks page,Email Icon state for all Tasks (Completed/Dismissed/Opened) and should open Send Email page if clicks on it
	When I click on "Success Tasks" tab
	And I select the task from task list
	Then I verify the "Completed" checkbox state
	And I verify the complete icon state
	And I verify the dismiss icons state
	And I verify the email icon state


@CSM_verify_st_new_task_field_set
Scenario: Rally Test Case ID: TC4795,TC4796 - NewTaskPopup Field Set : Add all fields in the Field Set,NewTaskPopup Field Set: Add required/non required custom fields
	When I click on "Success Tasks" tab
	And I select the task from task list
	And I click on "Create Task" button
	And I fill the required task details
	Then I verify the additional fields
	And I verify the required fields


@CSM_verify_sk_complete_reason_code
Scenario: Rally Test Case ID: TC4745 - View and Select value (value entered in Complete Reason Codes and/or Complete Reason Codes (Cont'd) field of CSM Admin custom) from Complete Reason Code drop down of Complete Tasks Popup of the Success Tasks page
	When I click on "Success Tasks" tab
    Then create new Tasks
    And I click on "Success Tasks" tab
    And I select the task from task list
    And I open the "Complete Task" pop up window
    And I select the "Reason Code" value from complete task
    And I click on "Success Tasks" tab
    And I select the task from task list
    Then I verify the "Complete" task reason code

@CSM_verify_sk_dismiss_reason_code
Scenario: Rally Test Case ID: TC4746 - View and Select value (value entered in Dismiss Reason Codes and/or Dismiss Reason Codes (Cont'd) field of CSM Admin custom) from Dismiss Reason Code drop down of Dismiss Tasks Popup of the Success Tasks page
	When I click on "Success Tasks" tab
    Then create new Tasks
    And I click on "Success Tasks" tab  
    And I select the task from task list
    And I open the "Dismiss" task pop up window
    And I select the "Reason Code" value from dismiss task
    And I click on "Success Tasks" tab
    And I select the task from task list
    Then I verify the "Dismiss" task reason code
	
@CSM_st_save_user_preferences
Scenario: Rally Test Case ID: TC4773,TC4774 - Success Task - Save user preferences for FC View (login/logout/Navigate away),Save user preferences for Task Grid Column Selection (login/logout/Navigate away)
	When I click on "Success Tasks" tab
    And I select the task from task list
    Then I verify the grid details
    When I user logout from "CSM" application
    And that I navigate to the CRM application
    Then I should land on CRM home page
    When I click on "Success Tasks" tab
    Then I verify the grid details based on user preference
    When I click on "Success Plans" tab
    And I click on "Success Tasks" tab
    Then I verify the grid details based on user preference


@CSM_save_the_page_size_user_preferences
Scenario: Rally Test Case ID: TC4789,TC4790,TC4791 - Success Task - Save user preferences for Page Size Selection (login/logout/Navigate away),Verify that User Prefernece for FC View , grid Columns should remain saved if user changes the Page Size,Verify that user prefernece for Page Size should remain saved if user changes the FC View and grid columns
When I click on "Success Tasks" tab
   And I select All task from task list
   And I select the pagination size
   And I user logout from "CSM" application
   And that I navigate to the CRM application
   Then I should land on CRM home page
   When I click on "Success Tasks" tab
   And I change the "Success Tasks" filter
   Then I verify that user preference is saved
   When I select All task from task list
   Then I verify that user preference is saved

@CSM_verify_success_tasks_columns
Scenario: Rally Test Case ID: TC5454,TC5455,TC5456 - Success Tasks: Availability of Task Record Type Column,Ability of the user to select Record Type and Task Type columns,Verify Record Type columns saved in User Preference
	When I click on "Success Tasks" tab
	And I select the task from task list
	And I click on "Columns" picker
	Then I verify the task "Record Type" field
	When I select the task "Record Type" field
	Then I verify the task "Record Type" field selection is saved or not
	When I user logout from "CSM" application
	And that I navigate to the CRM application
	Then I should land on CRM home page
	When I click on "Success Tasks" tab
	And I select the task from task list
	And I click on "Columns" picker
	Then I verify the task "Record Type" user preference is saved
	When I click on "Success Plans" tab
	When I click on "Success Tasks" tab
	And I select the task from task list
	And I click on "Columns" picker
	Then I verify the task "Record Type" user preference is saved


@CSM_TaskStateSuccessTask
Scenario: Rally Test Case ID: TC5213: Verifying Task State for Task from Success Tasks page
  When I Navigate to Success Tasks tab
  And I select Task based FC from dropdown
  And I click on Subject of any Task displayed
  And I check Task detail page to edit status to Completed
  Then I verify Task State


@CSM_SuccessTaskUserPreferences
Scenario: Rally Test Case ID: TC5222, TC5223, TC5224, TC5225, TC5226 : Verify User Preference for Search text on grid, Verify when user changes FC view, Verify when user selects/deselects grid columns, Verify when user changes page size, verify when user gets from Overview page
  When I Navigate to Success Tasks tab
  And I select Task based FC from dropdown
  And I record the default grid output
  And Enter some text in Search field
  Then Verify grid details as per search
  And I click logout
  Given that I navigate to the CRM application
  Then I should land on CRM home page
  And I Navigate to Success Tasks tab
  Then I Verify the text present in the Search field
  And I click on Success Plan tab link
  And I Navigate to Success Tasks tab
  Then I Verify the text present in the Search field
  And I select any grid column
  Then I Verify the text present in the Search field
  And I deselect grid columns
  Then I Verify the text present in the Search field
  
@CSM_Completed_Status_Verify
Scenario: Rally Test Case ID: TC5597 : Verify to creation of New FocusCategory,Create new view and select that view. Verify message when selected view does not have any task
   When I click on "Success Tasks" link
   And I select All task from task list with Selected Task
   
@CSM_Verify_Complete_Dismiss_Status 
Scenario: Rally Test Case ID: TC5598: Complete Status Manually 
	When I click on "Success Plans" tab 
	Then I select the SP 
	#And I select task  
  