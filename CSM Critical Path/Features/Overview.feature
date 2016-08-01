@Overview
@OverviewFeature
Feature: All features related to Overview - Global Filter,Overview Filter,Health Donut,Heatmap chart,Tiles,Focus Category

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page
	
@FFCBO
Scenario: Rally Test Case ID: TC2864 : Filter Focus Category records by Owner,Apply global filter : Account Owner/Created By ID/Last Modified by ID
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


@OverviewShowHideinactive
Scenario: Rally Test Case ID : TC2866, TC2890, TC5094 : Overview Inactive Categories Show and Hide,Apply global filter and show Inactive FC
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

	
@FHDCBO
Scenario: Rally Test Case ID : TC2871 : Filter Health Donut Chart by owner,Filter Health Donut Chart by Account Owner/Created By ID/Last Modified By ID
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	And I stored data of Donut Chart
	Then click on edit view to change the "Account Owner"
	Then verify Health Donut Chart 

@FBSP
	Scenario: Rally Test Case ID: TC2876 : Filter Health Donut Chart by Success Plan,Health Donut - SP object filter
  When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	And I click on Hamburger Icon and Filter by Success Plan	


@SuccessplanTiles
Scenario: Rally Test Case ID: TC287 : Verify the Tiles for Success plan object,Tiles - SP object filter
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then select the focus category
	Then change the object to Success plan in the edit view to verify the Tiles
	
@SuccessplanFCR
Scenario: Rally Test Case ID: TC2878 : Verify the FocusCategory for Success plan object,Focus Categories - SP object filter
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then select the focus category
	Then change the object to Success plan in the edit view to verify the Focus Category records

@Verification
Scenario: Rally Test Case ID: TC2879 : Donut Chart Verification
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then select the focus category
	And verify data on donut chart	
		  
@HMC
Scenario: Rally Test Case ID: TC2881 : Heat Map Chart Verification
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then select the focus category
	And I navigate to heatMapChart		
	
@HMC-Tile 
Scenario: Rally Test Case ID: TC2882 : HeatMapChart Tile clicking
	When I click on "Overview" link	
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	And I click on first tile
	
@verify-tiles
Scenario: Rally Test Case ID: TC2883 : Tiles Verification On Overview Tab
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then Verify tiles	

@verify-tile-content
Scenario: Rally Test Case ID: TC2884, TC2885  :Tile Content Verification On Overview tab
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then Verify tiles
	Then click on tile	
	
@SPhide
Scenario: Rally Test Case ID: TC2886, TC5039 : Overview Tiles Hide and Show
	When I click on "Overview" link
	And I select Show_Hide Charts and Tiles
	And I Verify Chart and Tiles Visibility
	And I Verify hamburger icon
    And I select Show_Hide Charts and Tiles
	And I Verify Chart and Tiles Visibility	
 
@SFC
Scenario: Rally Test Case ID: TC2887: Select focus category
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then select the focus category
	
@EditFocuscategory
 Scenario: Rally Test Case ID: TC2888  : Verify the edit of FocusCategory
  When I click on "Overview" link
  And I Verify hamburger icon
  And I select Show Charts and Tiles
  Then select the focus category
  Then click on edit link present in the FocusCategory	
	
   
@HoverFCCard
Scenario: Rally Test Case ID: TC2891 : Verify hover behaviour on FC mains cards - FC title
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	And I hover on FC cards   
	
@HoverRecordCount
Scenario: Rally Test Case ID: TC2892 : Verify hover behaviour on Record Count - FC title
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then select the focus category
	And I hover on record count on FC cards	
	
@CreateNewGroup
Scenario: Rally Test Case ID :TC2889 : Verifying the creation of new FocusCategory Group
   When I click on "Overview" link
   And I Verify hamburger icon
   And I select Show Charts and Tiles
   Then select the focus category
   Then click on Create New Group link present in the FocusCategory	
   

@VAVHMC
Scenario: Rally Test Case ID: TC5026,TC5027,TC5029,TC5030,TC5028,TC5031: Verify "Account" object is selected by default, Verify "Heat map Chart" gets filtered by account, Verify Removal of Global filter, Verify filter as per User, Verify Field label Lookups
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


@FASP
Scenario: Rally test Case ID: TC5097: Verify Filter attribute values for Success Plan object
	When I click on "Overview" link
	And I Verify hamburger icon
	And I click on Edit View link
	And I change the object to Success Plan
	And I click on filter attribute
    Then I verify the values for Success Plan


@VADSPHD
Scenario: Rally Test Case ID: TC5032,TC5033: Verify user navigates to Account Details from Health Donut,Verify user navigates to Success Plan from Health Donut
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


@SHDC
Scenario: Rally Test Case ID: TC5034: Verify User preferences are saved for Health Donut Chart
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


@SHMC
Scenario: Rally Test Case ID: TC5037: Verify User preferences are saved for Heat Map Chart
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



@TiletoAccountDetails
Scenario: Rally Test Case ID: TC5038,TC5095: Navigate to Account Details page through Account link on Tile click from Overview page,Verify Active tiles with no Records
	When I click on "Overview" link
	And I Verify tiles
	And I click on tile to navigate to Account name link to click it
	Then I Verify user navigates to Account Name Details page
	And I click on "Overview" link
	Then I verify Active Tiles with No Records


@EditFCTilePort
Scenario: Rally Test Case ID: TC5040: Edit Focus Category on Tile Portfolio Summary page
	When I click on "Overview" link
	And I click on tile to navigate to Account name link
	And I click on Edit link
	Then I verify FC page and click Save to save changes


@FocusCategoryPreference
Scenario: Rally Test Case ID: TC5045: Save Focus Category Preference
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


@ActionLinkVerification
Scenario: Rally Test Case ID: TC5044
	When I click on "Overview" link
	And I Verify Focus Category records
	And I click on Subject link value of FC Task
	And I click on "Overview" link
	Then I Verify Action link for the chosen FC Task

@FocusCategoryViewEdit
Scenario: Rally Test Case ID: TC5046,TC5047,TC5048,TC5049: Navigate to Focus Category View, Create new FC, Edit FC,Navigate to Record Details page
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


@VerifyCDpopupAddDetails
Scenario: Rally Test Case ID: TC5041,TC5042,TC5043: Verify Required/Non-Required Fields on Complete/Dismiss Task's popup window, Verify task complete/dismiss with Required fields input, Verify task complete/dismiss with Non-Required fields input, Error Messages
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


@ALDisabledTask
Scenario: Rally Test Case ID: TC5096: Verify the Action links for task created by other user
  When I click on "Overview" link
  And I select FCG
  And I click on Subject link for Active Action link
  And I verify Task page
  And I click on "Overview" link
  Then I verify the User Access


@TaskObj
Scenario: Rally Test Case ID: TC5183: Availability of Task Object on Global filter
  When I click on "Overview" link
  And I Verify hamburger icon
  And I click on Edit View link
  Then I verify Task object present


@TaskObjFilterValues
Scenario: Rally Test Case ID: TC5184: Verify records gets filtered on applying Task filter
  When I click on "Overview" link
  And I Verify hamburger icon
  And I click on Edit View link
  And I select Task object
  And I change the filter attribute for Task
  And I select the Default checkbox and Save
  Then I Verify result for Task as object


@ClearTaskFilter
Scenario:  Clear the filter
  When I click on "Overview" link
  And I Verify hamburger icon
  Then I Clear the filter and Save
  

@TaskStateOverview
Scenario: Rally Test Case ID: TC5195: Verifying Task State for Task from Overview page
  When I click on "Overview" link
  And I select Task FCG
  And I click on Subject of any Task
  And I check Task detail page to edit status to Completed
  Then I verify Task State
	