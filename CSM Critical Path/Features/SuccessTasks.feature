@SuccessTasks
@SuccessTaskFeature
Feature: All features related to Success Tasks - Success Task,Success Plan Details Widget,Contacts Widget,Play Details Widgets
 
Background: Login to the Application
     Given that I navigate to the CRM application
    Then I should land on CRM home page


@CreateNewview
Scenario: Rally Test Case ID: TC2930 : Verify to creation of New FocusCategory,Create new view and select that view. Verify message when selected view does not have any task
   When I click on "Success Tasks" link
   Then click on Create new link   

@EditFCview
Scenario: Rally Test Case ID: TC2931 : Verify to creation of New FocusCategory,Edit view
   When I click on "Success Tasks" link
   Then edit FC View 
   
@CreateSuccessTask
Scenario: Rally Test Case ID: TC2935 : Create Task
    When I click on "Success Tasks" link
    Then create new Tasks

@CreateSuccessTaskinBulk
Scenario: Create Task
    When I click on "Success Tasks" link
    Then create new Tasks
    When I click on "Success Tasks" link
    Then create new Tasks
    When I click on "Success Tasks" link
    Then create new Tasks
    When I click on "Success Tasks" link
    Then create new Tasks


@CompleteTask
Scenario: Rally Test Case ID: TC2932 : Complete task
    When I Navigate to Success Tasks tab
    And I complete Success task

@DismissTask
Scenario: Rally Test Case ID: TC2933 : Dismiss Success task 
    When I Navigate to Success Tasks tab
    And I dismiss Success task

@EmailTask
Scenario: Rally Test Case ID: TC2934 : Email from Success task 
    When I Navigate to Success Tasks tab
    And I email Success task

@CancelCompleteBulkTask
Scenario: Rally Test Case ID: TC2937, TC2801: Cancel Complete Bulk taskz 
    When I Navigate to Success Tasks tab
    And I cancel complete Success task in bulk
    
@CompleteBulkTask
Scenario: Rally Test Case ID: TC2936 : Complete Success task in Bulk
    When I Navigate to Success Tasks tab
    And I complete Success task in bulk

@DismissBulkTask
Scenario: Rally Test Case ID: TC2938 : Dismiss Success task in Bulk
    When I Navigate to Success Tasks tab
    And I dismiss Success task in bulk


@TaskSPDetailsWidget
Scenario: Rally Test Case ID: TC2939 : Verify SP Details Widget on Success task 
    When I Navigate to Success Tasks tab
    Then I verify SP Details Widget on Success task 

@TaskOpenSP
Scenario: Rally Test Case ID: TC2940 : Verify SP Open from Success task 
    When I Navigate to Success Tasks tab
    Then I open SP
    
@VerifyContactsWidget
Scenario: Rally Test Case ID: TC2942,TC2943,TC2944,TC2945,TC2946 : Verify Contact Details Widget on Success task 
    When I Navigate to Success Tasks tab
    Then I open Contact

@VerifyPlayWidget
Scenario: Rally Test Case ID: TC2947,TC2948,TC2949 : Verify Contact Details Widget on Success task 
    When I Navigate to Success Tasks tab
    Then I verify Play widget



@cancel_complete_task_action
Scenario: Rally Test Case ID: TC4978,TC4979,TC4981 - Cancel "Complete Task" action,Cancel "Dismiss Task" action,Cancel bulk task completion
    When I click on "Success Tasks" tab
    And I select the tasks
    And I click on "Complete" task button
    And I "CANCEL" the complete success task
    And I click on "Dismiss" task button
    And I "CANCEL" the dismiss success task
    Then I should able to see the "Success Tasks" page

@cancel_the_new_task_creation
Scenario: Rally Test Case ID: TC4980 - Cancel new task creation
   When I click on "Success Tasks" tab
   And I click on "Create Task" button
   And I "CANCEL" the create new task
   Then I should able to see the "Success Tasks" page


@verifying_complete_dismiss_buttons
Scenario: Rally Test Case ID: TC5105 - Verify that no actions (complete/dismiss) should get displayed for the tasks, for which user does not have access
    When I click on "Success Tasks" tab
    And I select the task from task list
    Then I verify the "Complete" and "Dismiss" buttons


@verify_create_task_status_fields
Scenario: Rally Test Case ID: TC5106,TC4988,TC4991,TC4992 - Success Task : Add task with Status Field,Complete/Dismiss Tasks state after new task creation,Related Play value will get populated in Play field of New Task Popup after selecting a Task with an existing play and clicking on Create Task,Play value populated in Play field of New Task Page should persist on Task Edit page and user will able to create task with that play value,Success Tasks: Play value populated in Play field of New Task Page should persist on Task Edit page and user will able to create task with that play value
    When I click on "Success Tasks" tab
    And I select the task from task list
    And I click on "Create Task" button
    And I fill the required task details
    


@verify_task_details_page
Scenario: Rally Test Case ID: TC5110,TC5111 - Task Details Page: Availability of Reason Code field as Picklist field,Verify Reason Code Picklist field values
    When I click on "Accounts" tab
    And I select the existing account
    And I click on success task
    Then I should able to see the success task details page
    And I should able to see the "Reason Code" field


@edit_task_details_page
Scenario: Rally Test Case ID: TC5112,TC5113,TC5114,TC5115 - Task Details Page: Availability of Reason Code field as Picklist field,Verify Reason Code Picklist field values,Add/Select Reason Code for Tasks,Reason Code field should not be available, User should be able to see the saved Reason Code value on navigating to Task Detail page,Update Reason Code field value
    When I click on "Accounts" tab
    And I select the existing account
    And I edit the success task
    Then I should able to see the success task details page
    And I should able to see the "Reason Code" field


@complete_task_status_fields
Scenario: Rally Test Case ID: TC5117,TC5118,TC4987 - Complete Task with Status value and additional Fields (required/non required),Verify the Task Status Value after completing the task,Complete/Dismiss Tasks state after Complete/Dismiss task
    When I click on "Success Tasks" tab
    And I select the tasks
    And I click on success task "Complete" button
    And I "SAVE" the complete success task
    Then I should able to see the "Success Tasks" page
    And I should able to see the "Completed" status
    And I verify the complete icon state
    And I verify the dismiss icons state


@dismiss_task_status_fields
Scenario: Rally Test Case ID: TC5119,TC5120,TC5121,TC4987 - Success Tasks: Dismiss Task with Status value,Dismiss Task with Status value and additional Fields (required/non required),Verify the Task Status Value after dismissing the task,Complete/Dismiss Tasks state after Complete/Dismiss task
    When I click on "Success Tasks" tab
    And I select the tasks
    And I click on success task "Dismiss" button
    And I "SAVE" the dismiss success task
    Then I should able to see the "Success Tasks" page
    And I should able to see the "Completed" status
    And I verify the complete icon state
    And I verify the dismiss icons state


@verify_success_plan_custom_label
Scenario: Rally Test Case ID: TC5122 - Verify Success Plan Custom Label on SP Widget
    When I click on "Success Tasks" tab
    And I select the task from task list
    And I click on carrot icon
    Then I verify the success plan details widget


@verify_new_task_popup_field_set
Scenario: Rally Test Case ID: TC5107 - Availability of New Task Popup Field Set
    When I click on "Setup" from "CSM" app
    And I click on "Customize" tab
    And I click on "Activities" tab
    And I click on "Task Field Sets" tab
    Then I should be able to see the "New Task Popup" field


@st_required_non_required_fields
Scenario: Rally Test Case ID: TC4982,TC4983,TC4984 - Required/Non Required Fields on Complete/Dismiss Tasks popup window of Success Tasks Page,Complete/Dismiss Tasks with value in Required Field on Complete/Dismiss Tasks popup window. Error message if no value is entered,Complete/Dismiss Tasks with value in Non Required Field on Complete/Dismiss Tasks popup window. Error message if no value is entered
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


@verify_icon_status
Scenario: Rally Test Case ID: TC4985,TC4986 - Complete/Dismiss icon state for Opened/Completed Tasks on Success Tasks page,Email Icon state for all Tasks (Completed/Dismissed/Opened) and should open Send Email page if clicks on it
    When I click on "Success Tasks" tab
    And I select the task from task list
    Then I verify the "Completed" checkbox state
    And I verify the complete icon state
    And I verify the dismiss icons state
    And I verify the email icon state


@verify_st_new_task_field_set
Scenario: Rally Test Case ID: TC5108,TC5109 - NewTaskPopup Field Set : Add all fields in the Field Set,NewTaskPopup Field Set: Add required/non required custom fields
    When I click on "Success Tasks" tab
    And I select the task from task list
    And I click on "Create Task" button
    And I fill the required task details
    Then I verify the additional fields
    And I verify the required fields


@verify_sk_complete_reason_code
Scenario: Rally Test Case ID: TC4989,TC5116 - View and Select value (value entered in Complete Reason Codes and/or Complete Reason Codes (Cont'd) field of CSM Admin custom) from Complete Reason Code drop down of Complete Tasks Popup of the Success Tasks page,Verify the Reason Code field value for Completed/Dismissed tasks with Reason Codes
    When I click on "Success Tasks" tab
    And I select the task from task list
    And I open the "Complete Task" pop up window
    And I select the "Reason Code" value from complete task
    #And I "Complete" the task
    Then I verify the "Complete" task reason code


@verify_sk_dismiss_reason_code
Scenario: Rally Test Case ID: TC4990,TC5116 - View and Select value (value entered in Dismiss Reason Codes and/or Dismiss Reason Codes (Cont'd) field of CSM Admin custom) from Dismiss Reason Code drop down of Dismiss Tasks Popup of the Success Tasks page,Verify the Reason Code field value for Completed/Dismissed tasks with Reason Codes
    When I click on "Success Tasks" tab
    And I select the task from task list
    And I open the "Dismiss" task pop up window
    And I select the "Reason Code" value from dismiss task
    #And I "Dismiss" the task
    Then I verify the "Dismiss" task reason code


@st_save_user_preferences
Scenario: Rally Test Case ID: TC4993,TC4994 - Success Task - Save user preferences for FC View (login/logout/Navigate away),Save user preferences for Task Grid Column Selection (login/logout/Navigate away)
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


@save_the_page_size_user_preferences
Scenario: Rally Test Case ID: TC5102,TC5103,TC5104 - Success Task - Save user preferences for Page Size Selection (login/logout/Navigate away),Verify that User Prefernece for FC View , grid Columns should remain saved if user changes the Page Size,Verify that user prefernece for Page Size should remain saved if user changes the FC View and grid columns
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


@verify_success_tasks_columns
Scenario: Rally Test Case ID: TC5445,TC5446,TC5447 - Success Tasks: Availability of Task Record Type Column,Ability of the user to select Record Type and Task Type columns,Verify Record Type columns saved in User Preference
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


@TaskStateSuccessTask
Scenario: Rally Test Case ID: TC5196: Verifying Task State for Task from Success Tasks page
  When I Navigate to Success Tasks tab
  And I select Task based FC from dropdown
  And I click on Subject of any Task displayed
  And I check Task detail page to edit status to Completed
  Then I verify Task State


@SuccessTaskUserPreferences
Scenario: Rally Test Case ID: TC5205, TC5206, TC5207, TC5208, TC5209 : Verify User Preference for Search text on grid, Verify when user changes FC view, Verify when user selects/deselects grid columns, Verify when user changes page size, verify when user gets from Overview page
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