@Opportunities
@OpportunityDetailsSubTabFeature
Feature: All features related to Opportunities - Opportunity Details Sub Tab

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page



@details_opportunity_sub_tab
Scenario: Rally Test Case ID: TC4402,TC4403,TC4404,TC4405 : Opportunity - Details subtab fields,currency related field value should be displayed in logged in user's currency
   When I click on "Opportunities" tab
   And I navigate to the "Details" opportunity sub tab
   And I click on "Details" tab
   Then I should able to see the "Details" field list
   And I verify the renewal target and amount currency type