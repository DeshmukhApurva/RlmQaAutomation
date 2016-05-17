@RenOpportunityManagement
@RenMergeOpportunityFeature
Feature: All features related to Opportunity Management - Merge Opportunity

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@ren_opportunities_highlights_the_rows
Scenario: Rally Test Case ID: TC3215,TC3218,TC3219,TC3220 : Merge Opportunities - Opportunities,Merge Opportunities - Select All link, Merge Opportunities - Covered assets and covered product Display, Merge Opportunities - "Renewal" check
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


@ren_merge_opportunity_consolidate_validation
Scenario: Rally Test Case ID: TC3227 : Merge Opportunities - Validation Message (Consolidate Opportunity)
	When I click on "Opportunities" link
	And I click on "Go!" button from opportunity page
	And I select the opportunities
	And I select the opportunities those are having same currency and same pricebook
	And I click on "Merge" button
	Then I should able to see the opportunity "is already consolidated." consolidated alert message

@ren_merge_opportunity_validation
Scenario: Rally Test Case ID: TC3221 : Merge Opportunities - Validation Message (Select two Opportunities)
	When I click on "Opportunities" link
	And I click on "Go!" button from opportunity page
	And I click on "Merge" button
	Then I should able to see the "Select two opportunities to merge." alert message

@ren_merge_two_or_more_opportunities
Scenario: Rally Test Case ID: TC3222 : Merge Opportunities - Validation Message(More than two Opportunities)
	When I click on "Opportunities" link
	And I click on "Go!" button from opportunity page
	And I select more than two opportunities
	And I click on "Merge" button
	Then I should able to see the "Only two opportunities may be selected." alert message

@ren_merge_two_opportunities
Scenario: Rally Test Case ID: TC3216,TC3217,TC3223,TC3224,TC3225 : Merge Opportunities - Highlights the rows of conflicting data, Merge Opportunities - Editable fields only, Merge Opportunities - Verify Linking a Renewal Relationship Object, Merge Opportunities - Header Amount Recalculation, Merge Opportunities - Product Line Items removal from Source Opp
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


@ren_different_price_books
Scenario: Rally Test Case ID: TC3226 - Merge Opportunities - Validation Message (Different Pricebook)
	When I click on "Opportunities" link
	And I click on "New" button
	And I create the new opportunity
	And I click on "Choose Price Book" button
	When I choose the "Standard Price Book" Price book for the product
	When I click on "Opportunities" link
	And I click on "New" button
	And I create the new opportunity
	And I click on "Choose Price Book" button
	When I choose the "Test_PriceBook" Price book for the product
	When I click on "Opportunities" link
	And I click on "Go!" button from opportunity page
	And I navigate to the merge opportunity section
	And I select the opportunities
	And I select two different price book opportunities
	And I click on "Merge" button
	Then I should able to see the different price book "The Selected Opportunities must have matching Pricebooks." alert message
	When I click on "Opportunities" link
	And I click on "Go!" button from opportunity page
	And I navigate to the merge opportunity section
	When I delete the created different price book opportunity
	When I click on "Opportunities" link
	And I click on "Go!" button from opportunity page
	And I navigate to the merge opportunity section
	And I select the opportunities
	When I delete the created different price book opportunity
