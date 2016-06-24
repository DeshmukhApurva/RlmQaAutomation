@Opportunities
@QuoteTabFeature
Feature: All features related to Opportunities - Quote Tab

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page

@primary_quote_field
Scenario: Rally Test Case ID: TC4548,TC4549,TC4550,TC4552 : Quotes Tab: Checkbox for Primary Quote field of Quote record,Selecting Primary Quote field checkbox,Selecting Primary Quote field checkbox for other Quote record if Primary Quote field checkbox is already checked for any other Quote record,Updating Amount and Quote fields of Opportunity tab as per Primary Quote field checkbox selected on Quotes tab
    When I click on "Opportunities" tab
   	And I verify the current expiration quarter value in Expiration Quarter filter
   	And I verify the current expiration year value in Expiration Year filter
    And I select the "New Last Week" filter value
    Then I verify the "Quotes" opportunity fields
    And I sort "Latest Quote" in "Ascending" order
    And I navigate to the "Quotes" opportunity sub tab
    And I click on "Quotes" tab
    Then I should able to see the "Quotes" quote fields
    When I select the "Primary Quote" checkbox field
    When I click on "Opportunities" tab
   	And I verify the current expiration quarter value in Expiration Quarter filter
   	And I verify the current expiration year value in Expiration Year filter
    And I select the "New Last Week" filter value
    And I search with the "PES_Add_Partner" opportunities
    And I sort "Latest Quote" in "Ascending" order
    Then I verify the Amount and Quote field value of partner opportunity


@selecting_primary_quote
Scenario: Rally Test Case ID: TC4551,TC4553 : When PO Syncing as "To Master Opportunity",Selecting Primary Quote field checkbox for Quote record,When PO Syncing as "From Master Opportunity" or not Syncing, Selecting Primary Quote field checkbox for Quote record
    When I click on "Opportunities" tab
   	And I verify the current expiration quarter value in Expiration Quarter filter
   	And I verify the current expiration year value in Expiration Year filter
    And I select the "Need Status Updates" filter value
    And I sort "Latest Quote" in "Ascending" order
    And I navigate to the "Quotes" opportunity sub tab
    And I click on "Quotes" tab
    Then I should able to see the "Quotes" quote fields
    When I select the "Primary Quote" checkbox field
    And user logs out from channel partner community
    And user login in to "OEM" application
    Then I should able to see the "OEM" home page
    When I click on "Opportunities" link
    And I open the existing opportunity
    Then I should able to see the partner opportunity list
    And I should able to see the "Primary Quote" selected in quote related list
