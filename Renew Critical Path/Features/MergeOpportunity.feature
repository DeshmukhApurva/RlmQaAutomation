@OpportunityManagement
@MergeOpportunityFeature
Feature: All features related to Opportunity Management - Merge Opportunity

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@opportunities_highlights_the_rows
Scenario: Rally Test Case ID: TC3511,TC3514,TC3515,TC3516 - Merge Opportunities - Opportunities,Highlights the rows of conflicting data,Editable fields only,Select All link
    When I click on "Opportunities" link
    And I click on "New" button
    And I create the new opportunity
    And I click on "Choose Price Book" button
    When I choose the "Standard Price Book" Price book for the product
    When I click on "Opportunities" link
    And I click on "New" button
    And I create the new opportunity
    And I click on "Choose Price Book" button
    When I choose the "Standard Price Book" Price book for the product
    When I click on "Opportunities" link
    And I click on "Go!" button from opportunity page
    And I navigate to the merge opportunity section
    And I select the opportunities
	And I select the opportunities those are having same currency and same pricebook
	And I click on "Merge" button
	And I select the master record from "Merge Opportunities" page
	And I click on "Merge" button from "Merge Opportunities" page
	Then I verify the opportunity which is merged with the master opportunity
    When I click on "Opportunities" link
    And I click on "Go!" button from opportunity page
    And I navigate to the merge opportunity section
    When I delete the created different price book opportunity
    When I click on "Opportunities" link
    And I click on "Go!" button from opportunity page
    And I navigate to the merge opportunity section
    And I select the opportunities
    When I delete the created different price book opportunity


@merge_opportunity_consolidate_validation
Scenario: Rally Test Case ID: TC3523 - Merge Opportunities - Validation Message (Consolidate Opportunity)
	When I click on "Opportunities" link
	And I click on "Go!" button from opportunity page
	And I select the opportunities
	And I select the opportunities those are having same currency and same pricebook
	And I click on "Merge" button
	Then I should able to see the opportunity "is already consolidated." consolidated alert message

@merge_opportunity_validation
Scenario: Rally Test Case ID: TC3517 - Merge Opportunities - Validation Message (Select two Opportunities)
	When I click on "Opportunities" link
	And I click on "Go!" button from opportunity page
	And I click on "Merge" button
	Then I should able to see the "Select two opportunities to merge." alert message

@merge_two_or_more_opportunities
Scenario: Rally Test Case ID: TC3518 - Merge Opportunities - Validation Message(More than two Opportunities)
	When I click on "Opportunities" link
	And I click on "Go!" button from opportunity page
	And I select more than two opportunities
	And I click on "Merge" button
	Then I should able to see the "Only two opportunities may be selected." alert message

@merge_two_opportunities
Scenario: Rally Test Case ID: TC3512,TC3513,TC3519,TC3520,TC3521 - Merge Opportunities - Verify Linking a Renewal Relationship Object
    When I click on "Opportunities" link
    And I click on "New" button
    And I create the new opportunity
    And I click on "Choose Price Book" button
    When I choose the "Standard Price Book" Price book for the product
    When I click on "Opportunities" link
    And I click on "New" button
    And I create the new opportunity
    And I click on "Choose Price Book" button
    When I choose the "Standard Price Book" Price book for the product
    When I click on "Opportunities" link
    And I click on "Go!" button from opportunity page
    And I navigate to the merge opportunity section
	And I select two opportunities
	And I click on "Merge" button
	And I select the master record from "Merge Opportunities" page
	And I click on "Merge" button from "Merge Opportunities" page
	Then I user should be able to see the corresponding renewal relationship in master opportunity
    When I click on "Opportunities" link
    And I click on "Go!" button from opportunity page
    And I navigate to the merge opportunity section
    When I delete the created different price book opportunity
    When I click on "Opportunities" link
    And I click on "Go!" button from opportunity page
    And I navigate to the merge opportunity section
    And I select the opportunities
    When I delete the created different price book opportunity

@different_price_books
Scenario: Rally Test Case ID: TC3522 - Merge Opportunities - Validation Message (Different Pricebook)
    When I click on "Opportunities" link
	And I click on "New" button
	And I create the new opportunity with "StndrdPB"
	And I click on "Choose Price Book" button
	When I choose the "Standard Price Book" Price book for the product
	When I click on "Opportunities" link
	And I click on "New" button
	And I create the new opportunity with "TestPB"
	And I click on "Choose Price Book" button
	When I choose the "Test_PriceBook" Price book for the product
	When I click on "Opportunities" link
	#And I click on "Go!" button from opportunity page
	#And I navigate to the merge opportunity section
	#And I select the opportunities
	#And I select two different price book opportunities
	And I select "My Opportunities" view and click on Go
	And I select an Opportunity with "StndrdPB"
	And I select an Opportunity with "TestPB"
	And I click on "Merge" button
	Then I should able to see the different price book "The Selected Opportunities must have matching Pricebooks." alert message
	When I click on "Opportunities" link
	And I click on "Go!" button from opportunity page
	And I navigate to the merge opportunity section
	#When I delete the created different price book opportunity
	When I delete opportunity with "StndrdPB"
	When I click on "Opportunities" link
	And I click on "Go!" button from opportunity page
	And I navigate to the merge opportunity section
	And I select the opportunities
	#When I delete the created different price book opportunity
	When I delete opportunity with "TestPB"

@different_price_bookss
Scenario: Test Merge Oppotunity Diff PB
	When I click on "Opportunities" link
	#And I click on RenewTesting link
	And I go to existing opportunities
	Then I should able to see the different price book "The Selected Opportunities must have matching Pricebooks." alert message
	
