@CSMOverview
@CSMOverviewFeature
Feature: All features related to Overview - Global Filter,Health Donut,Tiles,Focus Category

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page
	
@CSM_FFCBO
Scenario: Rally Test Case ID: TC2728 : Filter Focus Category records by Owner,Apply global filter : Account Owner/Created By ID/Last Modified by ID
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then click on edit view to change the "Account Owner"
	Then select the focus category
	Then select any one account
	When I click on "Overview" link
	Then click on the edit view to change the different "Account Owner"
	Then select the focus category
	Then Verify the Account in Focus category		


@CSM_OverviewShowHideinactive
Scenario: Rally Test Case ID : TC2730, TC2754, TC4781 : Overview Inactive Categories Show and Hide,Apply global filter and show Inactive FC
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	And I Verify hamburger icon
	And I Show_Hide Inactive Categories
	When I click on "Overview" link
	Then select the focus category
	And I Verify Inactive Categories 
	And I Verify hamburger icon
	And I Show_Hide Inactive Categories
	When I click on "Overview" link
	Then select the focus category
    And I Verify Inactive Categories

	
@CSM_FHDCBO
Scenario: Rally Test Case ID : TC2735 : Filter Health Donut Chart by owner,Filter Health Donut Chart by Account Owner/Created By ID/Last Modified By ID
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	And I stored data of Donut Chart
	Then click on edit view to change the "Account Owner"
	Then verify Health Donut Chart 

@CSM_FBSP
Scenario: Rally Test Case ID: TC2740 : Filter Health Donut Chart by Success Plan,Health Donut - SP object filter
    When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	And I click on Hamburger Icon and Filter by Success Plan	


@CSM_SuccessplanTiles
Scenario: Rally Test Case ID: TC2741 : Verify the Tiles for Success plan object,Tiles - SP object filter
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then select the focus category
	Then change the object to Success plan in the edit view to verify the Tiles
	
@CSM_SuccessplanFCR
Scenario: Rally Test Case ID: TC2742 : Verify the FocusCategory for Success plan object,Focus Categories - SP object filter
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then select the focus category
	Then change the object to Success plan in the edit view to verify the Focus Category records

@CSM_Verification
Scenario: Rally Test Case ID: TC2743 : Donut Chart Verification
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then select the focus category
	And verify data on donut chart	
		  
@CSM_HMC
Scenario: Rally Test Case ID: TC2745 : Heat Map Chart Verification
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then select the focus category
	And I navigate to heatMapChart		
	
@CSM_HMC-Tile
Scenario: Rally Test Case ID: TC2746 : HeatMapChart Tile clicking
	When I click on "Overview" link	
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	And I click on first tile
	
@CSM_verify-tiles
Scenario: Rally Test Case ID: TC2747 : Tiles Verification On Overview Tab
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then Verify tiles	

@CSM_verify-tile-content
Scenario: Rally Test Case ID: TC2748, TC2749 :Tile Content Verification On Overview tab
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then Verify tiles
	Then click on tile	
	
@CSM_SPhide
Scenario: Rally Test Case ID: TC2750, TC4762 : Overview Tiles Hide and Show
	When I click on "Overview" link
	And I select Show_Hide Charts and Tiles
	And I Verify Chart and Tiles Visibility
	And I Verify hamburger icon
    And I select Show_Hide Charts and Tiles
	And I Verify Chart and Tiles Visibility	
 
@CSM_SFC
Scenario: Rally Test Case ID: TC2751  : Select focus category
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then select the focus category
	
@CSM_EditFocuscategory
 Scenario: Rally Test Case ID: TC2752  : Verify the edit of FocusCategory
  When I click on "Overview" link
  And I Verify hamburger icon
  And I select Show Charts and Tiles
  Then select the focus category
  Then click on edit link present in the FocusCategory	
	
   
@CSM_HoverFCCard
Scenario: Rally Test Case ID: TC2755 : Verify hover behaviour on FC mains cards - FC title
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	And I hover on FC cards   
	
@CSM_HoverRecordCount
Scenario: Rally Test Case ID: TC2756 : Verify hover behaviour on Record Count - FC title
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then select the focus category
	And I hover on record count on FC cards	
	
@CSM_CreateNewGroup
Scenario: Rally Test Case ID : TC2753 : Verifying the creation of new FocusCategory Group
   When I click on "Overview" link
   And I Verify hamburger icon
   And I select Show Charts and Tiles
   Then select the focus category
   Then click on Create New Group link present in the FocusCategory


@CSM_VAVHMC
Scenario: Rally Test Case ID: TC4749,TC4750,TC4751,TC4752,TC4753,TC4754: Verify "Account" object is selected by default, Verify "Heat map Chart" gets filtered by account, Verify Removal of Global filter, Verify filter as per User, Verify Field label Lookups
	When I click on "Overview" link
	And I Verify hamburger icon
	And I click on Edit View link
	Then I verify Account object as default selection
	And I change the filter attribute to Account Owner
	And I select the Default checkbox and Save
	Then I Verify Heat map chart records
	And I Verify hamburger icon
	And I click on Edit View link
	And I click Clear button
	And I select the Default checkbox and Save
	Then I Verify result displayed on "Overview" page
	And I Verify hamburger icon
	And I click on Edit View link
	Then I verify Account object as default selection
	And I change the filter attribute to Account Owner
	And I change value to "Customer Portal User"
	And I select the Default checkbox and Save
	Then I Verify filter result displayed on "Overview" page
	And I Verify hamburger icon
	And I click on Edit View link
	Then I verify Account object as default selection
	And I change the filter attribute to Account Owner
	And I search for Lookup values
	Then I verify the lookup values


@CSM_FASP
Scenario: Rally test Case ID: TC4784: Verify Filter attribute values for Success Plan object
	When I click on "Overview" link
	And I Verify hamburger icon
	And I click on Edit View link
	And I change the object to Success Plan
	And I click on filter attribute
	Then I verify the values for Success Plan

@CSM_VADSPHD
Scenario: Rally Test Case ID: TC4755,TC4756: Verify user navigates to Account Details from Health Donut,Verify user navigates to Success Plan from Health Donut
	When I click on "Overview" link
	And I Verify hamburger icon
	And I click on Edit View link
	And I click Clear button
	And I select the Default checkbox and Save
	And I Navigate to Health Donut chart
	And I click on Donut
	And I verify user navigates to Account Health Status to click on Account Name
	Then I Verify user navigates to Account Details page
	And I click on "Overview" link
	And I Verify hamburger icon
	And I click on Edit View link
	And I click Clear button
	And I select the Default checkbox and Save
	And I Navigate to Health Donut chart
	And I click on Donut
	And I verify user navigates to Account Health Status to click on Success Plan
	Then I Verify user navigates to Success Plan page


@CSM_SHDC
Scenario: Rally Test Case ID: TC4757: Verify User preferences are saved for Health Donut Chart
	When I click on "Overview" link
	And I Navigate to Health Donut chart
	Then verify Health Donut Chart
	And I click logout
	Given that I navigate to the CRM application
	Then I should land on CRM home page
	And I click on "Overview" link
	Then I Verify User Preferences
	And I click on Success Plan tab link
	And I click on "Overview" link
	Then I Verify User Preferences
	And I Verify hamburger icon
	And I click on Edit View link
	And I click Clear button
	And I select the Default checkbox and Save
	Then verify Health Donut Chart
	And I click logout
	Given that I navigate to the CRM application
	Then I should land on CRM home page
	And I click on "Overview" link
	Then I Verify User Preferences
	And I click on Success Plan tab link
	And I click on "Overview" link
	Then I Verify User Preferences


@CSM_SHMC
Scenario: Rally Test Case ID: TC4760: Verify User preferences are saved for Heat Map Chart
	When I click on "Overview" link
	And I navigate to Heat Map Chart
	Then I Verify Heat map chart records
	And I click logout
	Given that I navigate to the CRM application
	Then I should land on CRM home page
	And I click on "Overview" link
	Then I verify User Preferences as per HeatMap
	And I click on Success Plan tab link
	And I click on "Overview" link
	Then I verify User Preferences as per HeatMap
	And I Verify hamburger icon
	And I click on Edit View link
	And I click Clear button
	And I select the Default checkbox and Save
	Then I Verify Heat map chart records
	And I click logout
	Given that I navigate to the CRM application
	Then I should land on CRM home page
	And I click on "Overview" link
	Then I verify User Preferences as per HeatMap
	And I click on Success Plan tab link
	And I click on "Overview" link
	Then I verify User Preferences as per HeatMap


@CSM_TiletoAccountDetails
Scenario: Rally Test Case ID: TC4761,TC4782: Navigate to Account Details page through Account link on Tile click from Overview page,Verify Active tiles with no Records
	When I click on "Overview" link
	And I Verify tiles
	And I click on tile to navigate to Account name link to click it
	Then I Verify user navigates to Account Name Details page
	And I click on "Overview" link
	Then I verify Active Tiles with No Records


@CSM_EditFCTilePort
Scenario: Rally Test Case ID: TC4763: Edit Focus Category on Tile Portfolio Summary page
	When I click on "Overview" link
	And I click on tile to navigate to Account name link
	And I click on Edit link
	Then I verify FC page and click Save to save changes

@CSM_VerifyCDpopupAddDetails
Scenario: Rally Test Case ID: TC4764,TC4765,TC4766: Verify Required/Non-Required Fields on Complete/Dismiss Task's popup window, Verify task complete/dismiss with Required fields input, Verify task complete/dismiss with Non-Required fields input, Error Messages
	And I click on "Overview" link
	And I select FCG
	And I mark the task as Not Started
	And I click on "Overview" link
	And I select FCG
	And I click on Complete Action
	Then I verify Additional Fields Section
	And I provide Required additional details
	And I click on Save
	And I click on "Overview" link
	Then I verify the required details of the task
	And I click on "Overview" link
	And I click on Complete Action
	And I provide Non-Required additional details
	And I click on Save
	And I click on "Overview" link
	Then I verify the non-required details of the task
	And I click on "Overview" link
	And I click on Dismiss Action
	Then I verify Additional Fields Section
	And I provide Required additional details
	And I click on Save
	And I click on "Overview" link
	Then I verify the required details of the task
	And I click on "Overview" link
	And I click on Dismiss Action
	And I provide Non-Required additional details
	And I click on Save
	And I click on "Overview" link
	Then I verify the non-required details of the task


@CSM_ActionLinkVerification
Scenario: Rally Test Case ID: TC4767
	When I click on "Overview" link
	And I Verify Focus Category records
	And I click on Subject link value of FC Task
	And I click on "Overview" link
	Then I Verify Action link for the chosen FC Task


@CSM_FocusCategoryPreference
Scenario: Rally Test Case ID: TC4768: Save Focus Category Preference
	When I click on "Overview" link
	Then I Verify Focus Category records
	And I click logout
	Given that I navigate to the CRM application
	Then I should land on CRM home page
	And I click on "Overview" link
	Then I verify User Preferences as per FC
	And I click on Success Plan tab link
	And I click on "Overview" link
	Then I verify User Preferences as per FC
	And I Verify hamburger icon
	And I click on Edit View link
	And I click Clear button
	And I select the Default checkbox and Save
	Then I Verify Focus Category records
	And I click logout
	Given that I navigate to the CRM application
	Then I should land on CRM home page
	And I click on "Overview" link
	Then I verify User Preferences as per FC
	And I click on Success Plan tab link
	And I click on "Overview" link
	Then I verify User Preferences as per FC



@CSM_FocusCategoryViewEdit
Scenario: Rally Test Case ID: TC4769,TC4770,TC4771,TC4772: Navigate to Focus Category View, Create new FC, Edit FC,Navigate to Record Details page
	When I click on "Overview" link
	And I Verify Focus Category records
	And I click on FC Header
	Then I verify FC view details page
	And I click Create New link
	Then I save the new FC
	And I click Edit link
	Then I Save the changes
	And I click Record Name link
	Then I verify Record Name details page






@CSM_ALDisabledTask
Scenario: Rally Test Case ID: TC4783: Verify the Action links for task created by other user
  When I click on "Overview" link
  And I select FCG
  And I click on Subject link for Active Action link
  And I verify Task page
  And I click on "Overview" link
  Then I verify the User Access

@CSM_TaskObj
Scenario: Rally Test Case ID: TC5210: Availability of Task Object on Global filter
  When I click on "Overview" link
  And I Verify hamburger icon
  And I click on Edit View link
  Then I verify Task object present


@CSM_TaskObjFilterValues
Scenario: Rally Test Case ID: TC5211: Verify records gets filtered on applying Task filter
  When I click on "Overview" link
  And I Verify hamburger icon
  And I click on Edit View link
  And I select Task object
  And I change the filter attribute for Task
  And I select the Default checkbox and Save
  Then I Verify result for Task as object


@CSM_TaskStateOverview
Scenario: Rally Test Case ID: TC5212: Verifying Task State for Task from Overview page
  When I click on "Overview" link
  And I select Task FCG
  And I click on Subject of any Task
  And I check Task detail page to edit status to Completed
  Then I verify Task State