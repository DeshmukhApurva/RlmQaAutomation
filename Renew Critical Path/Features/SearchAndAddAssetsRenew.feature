@RenOpportunityManagement
@RenSearchAndAddAssetsFeature
Feature: All features related to Renew user - Opportunity Management - Search and Add Assets 

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@ren_search_specific_asset_criteria
Scenario: Rally Test Case ID: TC3251,TC3252,TC3255,TC3256,TC3258,TC3264: Search & Add - Search Assets based on a specific criteria, Search & Add - Clear Filter Logic, Search & Add -  Add to Opportunity button to be disabled if no Assets/Contracts are selected, Search & Add - Three blank criteria to be displayed by default, Search & Add - Asset/Account/Product fields available in picklist when searching for Assets,Search & Add - Search Assets
	When I click on "Opportunities" link
	And I go to existing renewal opportunities
	And I click on "Search And Add" button
	And I add asset "Assets" search criteria
	And I add asset search criteria and multiple filters "1 AND 2 OR 3" and "1 OR 2 OR 3"
	Then I verify the "Asset","Account" and "Product" field values
	When I click on "Find Install Base" button
	And I select specific asset from search and asset page
	And I click on "Add To Opportunity" and verify the opportunity

@ren_select_all_asset_criteria
Scenario: Rally Test Case ID: TC3253: Search & Add - Select All Assets
	When I click on "Opportunities" link
	And I go to existing renewal opportunities
	And I click on "Search And Add" button
	And I add asset "Assets" search criteria
	When I click on "Find Install Base" button
	And I select all assets from search and asset page
    And I click on "Add To Opportunity" and verify the opportunity

@ren_search_the_specific_service_contract_line_items
Scenario: Rally Test Case ID: TC3259: Search & Add - Account/Contract Line Item fields available in picklist when searching for Contract Line Item/s
	When I click on "Opportunities" link
	And I go to existing renewal opportunities
	And I click on "Search And Add" button
	And I add asset "Service Contract Line Items" search criteria
	Then I verify the "Service Contract","Service Contract: Account" and "Service Contract: Line Items" field values
	When I click on "Find Install Base" button
	And I select specific service contract line item
    And I click on "Add To Opportunity" and verify the opportunity

@ren_renewal_relationship_criteria_present
Scenario: Rally Test Case ID: TC3260,TC3262,TC3263,TC3265,TC3266,TC3268,TC3269,TC3270,TC3271: Search & Add - Renewal Relationship condition - Present,Search & Add - Renewal Relationship Status - Open, Search & Add - Renewal Relationship Status - Lost, Search & Add - Search Contract Line Item/s, Search & Add - Renewal Relationship condition - Present, Search & Add - Renewal Relationship Status - Won,Search & Add - Renewal Relationship Status - Open,Search & Add - Renewal Relationship Status - Lost, Search & Add - Renewal Relationship condition - Multiple Criteria
	When I click on "Opportunities" link
	And I go to existing renewal opportunities
	And I click on "Search And Add" button
	And I add asset "Service Contract Line Items" search criteria
	And I add renewal relationship criteria and multiple filters "1 AND 2 OR 3" and "1 OR 2 OR 3"
	When I click on "Find Install Base" button
	And I select specific service contract line item
    And I click on "Add To Opportunity" and verify the opportunity

@ren_renewal_relationship_criteria_absent
Scenario: Rally Test Case ID: TC3261,TC3267: Search & Add - Renewal Relationship condition - Absent
	When I click on "Opportunities" link
	And I go to existing renewal opportunities
	And I click on "Search And Add" button
	And I add asset "Assets" search criteria
	When I click on "Find Install Base" button
	And I select asset from search and asset page
    And I click on "Add To Opportunity" and verify the opportunity
	
@ren_no_matching_records_message
Scenario: Rally Test Case ID: TC3254,TC3257 : Search & Add - No matching records found message to be displayed,Search & Add - Search In picklist values
	When I click on "Opportunities" link
	And I go to existing renewal opportunities
	And I click on "Search And Add" button
	And I add asset "Assets" search criteria
	Then I verify the "Assets" and "Service Contract Line Items" field values
	When I click on "Find Install Base" button
	Then I should be able to see the "No matching records found" message


