@Opportunities
@OpportunityQuotesSubTabFeature
Feature: All features related to Opportunities - Opportunity Quotes Sub Tab

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@quote_opportunity_sub_tab
Scenario: Rally Test Case ID: TC4418,TC4419,TC4420,TC4421,TC4422,TC4423,TC4424: Opportunity - Quotes subtab,Quotes subtab - Sorting,Quotes subtab - Export,Quotes subtab - Currency related fields,Quotes subtab -column Show/Hide
    When I click on "Opportunities" tab
    And I clear the filters
    And I select the "New Last Week" filter value
    And I sort "Latest Quote" in "Ascending" order
    And I navigate to the "Quotes" opportunity sub tab
    And I click on "Quotes" tab
    Then I should able to see the "Quotes" quote fields
    When I click on the "Kebab Menu" menu button
    Then I verify the "Kebab Menu" button
    When I click on the "Kebab Menu" menu button
    Then I verify the export a file option
    And I click on "Renewals" tab
    And I click on "Quotes" tab
    And user "Quote Number" in "Ascending" order from "Quotes" page
    Then files should be "Quote Number" in "Ascending" sort order
    When I click on "Quotes" tab
    And user "Quote Number" in "Descending" sort order from "Quotes" page
    Then files should be "Quote Number" in "Descending" order
    When I click on "Quotes" tab
    And I verify the currency fields


