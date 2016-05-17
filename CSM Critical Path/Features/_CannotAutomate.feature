@FailureFeatures
Feature: All features that cannot be verified since the Manual Test Cases are not valid and features that might be used later
	
@LastHealthStatusTiles 
Scenario:Filter Tile records by Last Health Status
	When I click on "Overview" link
	Then click on edit view to change the Last Health Status
	Then count the number of tiles
	When I click on "Overview" link
	Then click on the edit view to change the different Account Owner 
	Then count the number of tiles after changing the user
	Then Verify the Tile Records 

@LastHealthStatusFCR 
Scenario:Filter Focus Category records by Last Health Status
	When I click on "Overview" link
	Then click on edit view to change the Last Health Status
	Then select the focus category
	Then select any one account
	When I click on "Overview" link
	Then click on the edit view to change the different Account Owner
	Then select the focus category
	Then Verify the Account in Focus category	

@FFCBARR 
Scenario:Filter Focus Category records by ARR
	When I click on "Overview" link
	Then click on edit view to change the ARR
	Then select the focus category
	Then select any one account
	When I click on "Overview" link
	Then click on the edit view to change the different Account Owner
	Then select the focus category
	Then Verify the Account in Focus category	
	
@FTBARR 
Scenario:Verify the Tile records filtered by ARR
	When I click on "Overview" link
	Then click on edit view to change the ARR
	Then count the number of tiles
	When I click on "Overview" link
	Then click on the edit view to change the different Account Owner 
	Then count the number of tiles after changing the user
	Then Verify the Tile Records 

@FHMCBHS
Scenario:Filter Health Donut Chart by Last Health Status
	When I click on "Overview" link
	And I stored data of Donut Chart
	Then click on edit view to change the Last Health Status
	Then verify Health Donut Chart 
	
@FBARR
Scenario: Filter Health Donut Chart by ARR
	When I click on "Overview" link
	And I stored data of Donut Chart
	Then click on edit view to change the ARR
	Then verify Health Donut Chart 

@FHMCBLHS
Scenario: Filter Heatmap Chart by Last Health Status
		When I click on "Overview" link
		And I Verify hamburger icon
		And I select Show Charts and Tiles
		Then click on edit view to change the Account Owner
		And I navigate to heatMapChart for details
		Then click on the edit view to change the different Account Owner
		And navigate to heatMapChart to verify records	
@FC	
Scenario: Focus Category Test Cases
	When I click on "Overview" link
	And I Verify hamburger icon
	And I select Show Charts and Tiles
	Then select the focus category
	And I verify edit link of focus category

@AdminPage
Scenario: CSM
	Then I access Account and create a new Account
	Then I view Account
	Then I access contacts and create a new contact
	Then I view Contact
	Then I view Opportunities
	Given that I click on overview tab
	And comparing overview data
	Given that I click on Renewals Insights
    Then I should be able to view Opportunity Stage Details
	Then I access Success Plans
	Then I View a Success Plan
	Then I access ServiceSource Setup and create a new Playbook
	Then I view the created Playbook
	Then I access ServiceSource Setup and create a new Play
	Then I view the created Play
	Then I access Success Tasks
	Then I view Success Tasks

@CSMTab
Scenario: CSM Test Cases
	When I Navigate to Overview tab
	And I click on "Help for this Page" link
	Then I should be able to see help page
	And I Verify hamburger icon
	Then I should see the hamburger icon
    And I select Edit View
	
@SuccessTasksTab
Scenario: Success Tasks
	When I Navigate to Success Tasks tab
	And I click choose icon
	And I switch to new tab
	And I click on "Details" link

@overviewTab
Scenario: CSM
	When I click on "Overview" link
	And I choose Healthy chart

@SPT
Scenario: Create Success Plan Template
	Then I access ServiceSource Setup and create a new Success Plan Template
	
@Help
Scenario: Verify Help link
	When I click on "Overview" link
	And I click on "Help for this Page" link
	And I switch to new tab
	Then I should be able to see help page
	And  I switch back to first tab

@CSM1	
Scenario: CSM Test Cases
	When I Navigate to Overview tab
	And I Verify hamburger icon
	Then I should see the hamburger icon

@FBARR
	Scenario: Verify Filter Health Donut Chart by ARR
	When I Navigate to Overview tab
	Then click on the Hamburger icon Account and ARR

@SPhideinactive
Scenario: Overview Inactive Categories Show and Hide
	When I click on "Overview" link
	And I Verify hamburger icon
	And I Verify Inactive Categories 
	And I Verify hamburger icon
    And I Verify Inactive Categories