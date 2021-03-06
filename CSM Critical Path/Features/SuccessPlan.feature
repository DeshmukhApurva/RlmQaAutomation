@SuccessPlan
@SuccessPlanTabFeature
Feature: All features related to Success Plan - Success Plan Tab,Actions Subtab,Contacts Widget,Play Details Widgets,Activity Stream Subtab,Usage Subtab,Details Subtab,Playbooks,Opportunities
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page


@CreateSuccessPlan
Scenario:Rally Test Case ID: TC2895 : Create Success plan
	When I click on "Success Plans" tab
	And I create a "New" SuccessPlan

@CreateSPTask
Scenario:Rally Test Case ID: TC2904 : Create task from Success Plan
	When I click on "Success Plans" tab
	And I select the created SP
	Then create new Task for SP

@CreateMultipleSPTask
Scenario:Create task from Success Plan
	When I click on "Success Plans" tab
	And I select the created SP
	Then create new Task for SP
	When I click on "Success Plans" tab
	And I select the created SP
	Then create new Task for SP

@FilterSPTask
Scenario:Rally Test Case ID: TC2905 : Complete task from Success Plan
	When I click on "Success Plans" tab
	And I select the created SP
	And I filter tasks "Phone Call Tasks"
	And I filter tasks "Has Play"

@EmailSPTask
Scenario:Rally Test Case ID: TC2908 : Complete task from Success Plan
	When I click on "Success Plans" tab
	And I select the created SP
	And I send email for SP Task

@WidgetSPTask
Scenario:Rally Test Case ID: TC2909,TC2910,TC2911,TC2913,TC2914,TC2915,TC2916  : Verify Task Widgets from Success Plan,Verify task icon hover details
	When I click on "Success Plans" tab
	And I select the created SP
	And I verify widgets for SP Task

@SPActivityStream
Scenario:Rally Test Case ID: TC2917 : Verify Activity Stream section from Success Plan
	When I click on "Success Plans" tab
	And I select the created SP
	And I verify activity stream


@SPUsage
Scenario:Rally Test Case ID: TC2918, TC2919 :Verify Usage section from Success Plan
	When I click on "Success Plans" tab
	And I select the created SP
	And I verify usage

@SPDetailsSection
Scenario: Rally Test Case ID: TC2920 : Verify Details Section from Success Plan
	When I click on "Success Plans" tab
	And I select the created SP
	And I verify Details Section

@SPOpportunity
Scenario: Rally Test Case ID: TC2927 : Add Opportunity from Success Plan
	When I click on "Success Plans" tab
	And I select the created SP
	And I add new SP Opportunity
	
@SPEditOpportunity
Scenario:Rally Test Case ID: TC2928 : Edit Opportunity from Success Plan
	When I click on "Success Plans" tab
	And I select the created SP
	And I edit SuccessPlan Opportunity

@SPDeleteOpportunity
Scenario: Rally Test Case ID: TC2929 : Delete Opportunity from Success Plan
	When I click on "Success Plans" tab
	And I select the created SP
	And I delete SuccessPlan Opportunity
	
@EditSuccessPlan
Scenario:Rally Test Case ID :TC2896,TC2901,TC2902,TC2903,TC2912,TC2921 :  Edit Success Plan,Verify indicators on SP
	When I click on "Success Plans" link
	And I select the created SP
	And I edit first SuccessPlan
	
@DeleteSuccessPlan
Scenario: Rally Test Case ID :TC2897 :  Delete Success Plan
	When I click on "Success Plans" tab
	And I delete first SuccessPlan
	
@CreateSPfromAccounts
Scenario:Rally Test Case ID :TC2898 :  Success Plan Creation from Accounts,Create Success plan from account detail page
	When I click on "Accounts" tab
	Then I create new Account
	When I Navigate to Accounts tab
	Then I view Account
	And I create a "New Success Plan" SuccessPlan
	When I click on "Success Plans" tab
	And I select the SP created from Account
	Then I add new Playbook for SP
	Then I verify Play task created for SP

@AddPlayBookForSP
Scenario: Rally Test Case ID : TC2923,TC2924,TC2925,TC2926 : Success Plan add PlayBook
	When I click on "Success Plans" tab
	And I select the SP created from Account
	Then I delete a Playbook for SP
	
@EditSPfromAccounts
Scenario:Rally Test Case ID :TC2899 : Edit Success plan from account detail page
	When I click on "Accounts" tab
	Then I view Account
	And I select an Account SuccessPlan
	And I edit Account SuccessPlan

@DeleteSPfromAccounts
Scenario:Rally Test Case ID :TC2900 :  Delete Success plan from account detail page
	When I click on "Accounts" tab
	Then I view Account
	And I delete an Account SuccessPlan

@DeleteAccount
Scenario: Success Plan Deletion from Accounts
	When I click on "Accounts" tab
	Then I delete an Account


@complete_sp_task @sanity
Scenario:Rally Test Case ID: TC2906,TC5128,TC5129,TC5132 : Complete task from Success Plan,Complete Task with Status value,Complete Task with Status value and additional Fields (required/non required),Verify the Task Status Value after completing the task
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


@dismiss_sp_task @sanity
Scenario:Rally Test Case ID: TC2907,TC5130,TC5131 : Complete task from Success Plan,Dismiss Task with Status value,Dismiss Task with Status value and additional Fields (required/non required)
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


@cancel_success_plan_creation @sanity
Scenario:Rally Test Case ID: TC4940 : Cancel Success plan creation
    When I click on "Success Plans" tab
    And I click on "New" button
 	And I fill the required details
	And I click on "Cancel" button from success plan creation
	And I click on "Go!" button from "Success Plans" page
	Then I verify the success plan created or not


@cancel_edit_delete_action @sanity ~@wip
Scenario:Rally Test Case ID: TC4941,TC4942 : Cancel Success Plan Edit action,Cancel Success Plan delete action
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
    And I edit the existing success plan
	And I click on "Cancel" button from success plan creation
#	And I delete the existing success plan
#    And I cancel the delete success plan confirmation pop up


@verifying_task_time_line @sanity
Scenario:Rally Test Case ID: TC4943,TC4944,TC4945,TC4946,TC4947,TC4948,TC4949,TC4950,TC4951 - Verify - task on time line,task icon and styling,task icon hover details,Verify that correct number of Phases will appear on the Timeline,Verify that due date is correct for tasks appeared on timeline,Task alignment based on Zoom Level,Availability of < and > button on timeline,Verify "Rolling Quarter" link range,Verify "This Quarter" link range,Verify "Rolling Half Year" link range
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
    Then I verify the task time line
	And I verify the time line buttons
    And I verify "Rolling Quarter" link range
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I verify "This Quarter" link range
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I verify "Rolling Half Year" link range


@verify_tasks_get_created @sanity
Scenario:Rally Test Case ID: TC4952,TC4953 - Verify that tasks get created when play criteria matches,Cancel task creation
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


@verify_complete_reason_code @sanity
Scenario:Rally Test Case ID: TC4954 - View and Select value (value entered in Complete Reason Codes and/or Complete Reason Codes (Cont'd) field of CSM Admin custom) from Complete Reason Code drop down of Complete Tasks Popup of the Overview/Success Tasks/Success Plan page
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
	And I click on "Activity Stream" tab
	And I verify the "Complete" task "Reason Code" field


@verify_dismiss_reason_code @sanity
Scenario:Rally Test Case ID: TC4955 - View and Select value (value entered in Dismiss Reason Codes and/or Dismiss Reason Codes (Cont'd) field of CSM Admin custom) from Dismiss Reason Code drop down of Dismiss Tasks Popup of the Overview/Success Tasks/Success Plan page
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
	And I click on "Activity Stream" tab
	And I verify the "Dismiss" task "Reason Code" field


@sp_required_non_required_fields @sanity
Scenario:Rally Test Case ID: TC4956,TC4957,TC4958 - Required/Non Required Fields on Complete/Dismiss Tasks popup window of Overview/Success Plan/Success Plan Page,Complete/Dismisse Tasks with value in Required Field on Complete/Dismiss Tasks popup window. Error messge if no value is entered,Complete/Dismisse Tasks with value in Non Required Field on Complete/Dismiss Tasks popup window. Error messge if no value is entered
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


@sp_save_user_preferences @sanity
Scenario:Rally Test Case ID: TC4995,TC4996 - Success Plan Actions Tab: Save user preferences for Filter Selection (login/logout/Navigate away from tab/subtab),Save user preferences for Task grid column selection (login/logout/Navigate away from tab/subtab)
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
	When I select the default filter from "Actions" filter pick list


@cancel_complete_dismiss_task @sanity
Scenario:Rally Test Case ID: TC4959,TC4960,TC5127 - Cancel Complete task action,Cancel dismiss task action,Verify that no actions (complete/dismiss) should get displayed for the tasks, for which user does not have access
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
    And I cancel the complete task
    And I cancel the dismiss task


@verify_status_fields @sanity
Scenario:Rally Test Case ID: TC5123,TC5124 - Create task with Status Field,Related Play value will get populated in Play field of New Task Page after selecting a Task with an existing play and clicking on Create Task
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Actions" tab
	And I click on "Create Task" button
	And I fill the required task details
	Then I verify the "Create Task" "Status" fields
	And I "SAVE" the "Create Task"


@verify_contact_widget_details @sanity
Scenario:Rally Test Case ID: TC4961,TC4962,TC4963,TC4964,TC4965 - Verify Contact Widget display contacts on navigating to Success Plan,Verify Contact Widget is static on Success Plan page,Verify CSM and Non- CSM contact icon,Verify contacts display order,Navigate to contact details through contact link
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	Then I verify the contact widget details


@verify_opportunities_grid @sanity
Scenario:Rally Test Case ID: TC5138 - Opportunities Grid - Verify Currency field values display record currency with each opportunity
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Details" tab
	Then I verify the opportunities grid details


@verify_custom_settings @sanity
Scenario:Rally Test Case ID: TC4966,TC4967 - Availability of "Use Revenue Link v2 Canvas App" field in Custom Setting,"Use Revenue Link v2 Canvas App" field is by default checked
	When I click on "Setup" from "CSM" app
	And I click on "Develop" tab
	And I click on "Custom Settings" tab
	And I click on "CSM Admin" link from "Custom Settings" page
    Then I should be able to see the "Use Revenue Link v2 Canvas App" field
	When I click on "Use Revenue Link v2 Canvas App" field
    Then I should be able to see the "Default Value" is "Checked"


@verify_the_usage_tab @sanity
Scenario:Rally Test Case ID: TC4968,TC4969,TC4970,TC4971,TC4972,TC4973,TC4974,TC4975,TC4976,TC4977 - Verify the Usage Tab when custom setting is checked, and neither RevLink v2 nor v1 installed in the org,Verify the Usage Tab when custom setting is unchecked, and neither RevLink v2 nor v1 installed in the org,Verify that Usage Tab display Scout Canvas App, when only Rev Link v2 installed and the custom setting is checked/TRUE,Verify that Usage Tab display error message,when only Rev Link v2 installed and the custom setting is unchecked/False,Verify that Usage Tab display error message when only Rev Link v2 installed and the custom setting is checked, but the parameters needed are empty,Verify that Usage Tab display error message when only Rev Link v2 installed and the custom setting is checked but needed parameters are not accessible
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


@verify_csm_admin_custom_fields @sanity
Scenario:Rally Test Case ID: TC5133,TC5134,TC5135,TC5136 - Availability of 8 Custom Fields CSM Admin Custom Setting to replace the Success Plan User Lookup's label, Verify the custom field's size to replace the Success Plan user lookup's label,Verify the Success Plan user lookup's label when no value provided in the custom fields, Verify the Success Plan user lookup's label replacement on Success Plan > Details Subtab
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


@verify_custom_layout @sanity
Scenario:Rally Test Case ID: TC5017,TC5018,TC5019,TC5023,TC5025 - CSMSuccessPlanDetails VF page component should get display as read only on Account record,CSMSuccessPlanDetails VF page component should display as blank if no Success Plan present for Account record,CSMSuccessPlanDetails VF page component should display values for Account record which has Success Plan present,CSMSuccessPlanDetails VF page component should display value of Success Plan which is added/created first for Account,"Has Success Plan" field should get unchecked if user deletes Success Plan created for the Account
	When I click on "Accounts" tab
	And I select the existing account
	Then I verify the "CSMSuccessPlanDetails" vf page component
	When I click on "Success Plans" tab
	And I click on "Go!" button from "Success Plans" page
	And I select the existing success plan
	And I click on "Details" tab
	And I navigate to the account page
	And I should able to see the "Has Success Plan" field value


@verify_custom_field_under_sp_account @sanity
Scenario:Rally Test Case ID: TC5020,TC5021,TC5022,TC5024 - Value in "CSMSuccessPlanDetails" VF page component should be same as displayed under Success Plan Details section of Details tab of Success Plan page,CSMSuccessPlanDetails VF page component should display as blank if user deletes Success Plan from Success Plan tab or Account record,CSMSuccessPlanDetails VF page component should display as blank for Account1 and values for Account2 if user updates Success Plan with value from Account1 to Account2,"Has Success Plan" field should display as unchecked if there is no Success Plan present for the Account
	When I click on "Accounts" tab
	And I click on "New" button
	And I fill the account data
	And I create the account
	Then I verify the "CSMSuccessPlanDetails" vf page component
	And I verify the "Has Success Plan" field
	When I click on "New Success Plan" button
	And I fill the required details
	And I click on "Save" button from success plan creation
	And I click on "Accounts" tab
	And I open the created account
	Then I verify the success plan details in "CSMSuccessPlanDetails" vf page
	When I edit the success plan from account
	And I click on "Accounts" tab
	And I open the created account
	Then I verify the success plan details in "CSMSuccessPlanDetails" vf page
	When I delete the created account
