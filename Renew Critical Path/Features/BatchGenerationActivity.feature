@BatchGenerationActivityFeature
Feature: All features related to Opportunity Generation - Batch Generation Activity
	
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page


@AssetFilter
Scenario: Rally Test Case ID: TC3651,TC3652,TC3653,TC3654,TC3655,TC3656,TC3694,TC3712,TC3713 : Create Asset Filter, Edit Asset Filter, Add Additional Criteria, Verify Display Details, Verify Result, Delete AssetFilter
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on "Create New" button
	And I create a new Asset Filter
	And I verify record count of Asset Filter
	And I edit an Asset Filter
	And I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on "Create New" button
	And I view result of Asset Filter
	And I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on "Create New" button
	Then I delete an Asset Filter
	
@GroupingLogic
Scenario: Rally Test Case ID: TC3657,TC3658,TC3659 : Create GroupingLogic, Verify Display Details, Delete GroupingLogic
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on "Create New" button
	And I create a new GroupingLogic
	And I verify record count of GroupingLogic
	Then I delete a GroupingLogic	

@RunLogic
Scenario: Rally Test Case ID: TC3660,TC3666,TC3668: Generate the batch activity through scheduled process or current time
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on "Create New" button
	Then I select the Asset filter and Grouping Filter logic
    And I set the schedule date
	And I "Schedule" the batch file
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on "Create New" button
	Then I select the Asset filter and Grouping Filter logic
	And I "Run" the batch file


@WorkingCriteria
Scenario: Rally Test Case ID: TC3661,TC3662,TC3663,TC3664,TC3674,TC3675,TC3676,TC3677,TC3678,TC3679,TC3680,TC3681,TC3682,TC3683,TC3689,TC3693,TC3716
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on "Create New" button
	Then I select the Asset filter and Grouping Filter logic
	And I "Run" the batch file
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	Then I click on BatchLink and verify the "Completed" batch generation


@FailedActivity
Scenario: Rally Test Case ID: TC3688,TC3714,TC3715 - Batch Generation Activity - Job Status - Failed,Partial Success,Main page content
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on "Create New" button
	Then I select the Asset filter and Grouping Filter logic
	And I "Run" the batch file
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	Then I should able to see the "Failed" batch generation


@scheduleJob
Scenario: Rally Test Case ID: TC3684,TC3685,TC3690,TC3691,TC3692,TC3698,TC3699 - Create,Edit,Cancel and Delete Scheduled batch values
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on "Create New" button
	And I select the Asset filter and Grouping Filter logic
    And I set the schedule date
	And I "Schedule" the batch file
    When I click on "ServiceSource Setup" link
    And I click on "Batch Generation Activity" link
    And I "Edit" the "Scheduled" batch generation file
    And I delete the "Scheduled" batch generation file


@asset_date_logic
Scenario: Rally Test Case ID: TC3697,TC3700,TC3701,TC3702 - Batch Generation Activity - Asset Purchase Date as Close Date Earliest(Minimum) of Asset Dat
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on "Create New" button
	And I select the Asset filter and Grouping Filter logic
	And I select the "Earliest Date" and "Install Date" close date and asset date field
	And I "Run" the batch file
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
#	Then I should able to see the "Earliest Date" and "Install Date"


@asset_date_close_date
Scenario: Rally Test Case ID: TC3703,TC3704,TC3705- Batch Generation Activity - Asset Purchase Date as Close Date Latest (Maximum) of Asset Date
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on "Create New" button
	And I select the Asset filter and Grouping Filter logic
	And I select the "Latest Date" and "Purchase Date" close date and asset date field
	And I "Run" the batch file
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
#	Then I should able to see the "Latest Date" and "Purchase Date"

@asset_date_close_date
Scenario: Rally Test Case ID: TC3706,TC3707,TC3708,TC3711 - Batch Generation Activity - Asset Purchase Date as Close Date Most Common(Mode) of Asset Date
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on "Create New" button
	And I select the Asset filter and Grouping Filter logic
	And I select the "Most common Date" and "End Date" close date and asset date field
	And I "Run" the batch file
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
#	Then I should able to see the "Most common Date" and "End Date"

@asset_date_close_date
Scenario: Rally Test Case ID: TC3699,TC3709,TC3710 - Batch Generation Activity - Asset Usage End Date as Close Date Earliest(Minimum) of Asset Date
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on "Create New" button
	And I select the Asset filter and Grouping Filter logic
	And I select the "Most valuable Date" and "Start Date" close date and asset date field
	And I "Run" the batch file
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
#	Then I should able to see the "Most valuable Date" and "Start Date"

@ErrorMessage
Scenario: Rally Test Case ID: TC3667,TC3669,TC3670,TC3671,TC3672: Check for the validation messages while running the batch activity
	When I click on "ServiceSource Setup" link
	And I click on "Batch Generation Activity" link
	And I click on "Create New" button	
	Then I check for validation error message
	

