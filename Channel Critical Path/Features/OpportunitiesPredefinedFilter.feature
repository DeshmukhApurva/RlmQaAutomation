@Opportunities
@OpportunitiesPredefinedFilterFeature
Feature: All features related to Opportunities - Opportunities Predefined Filter

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@opportunity_filters
#TC4361,TC4362,TC4363,TC4364,TC4365,TC4366 - invalid test cases after latest changes.
Scenario: Rally Test Case ID: TC5838,TC5839,TC5841,TC5842,TC5844,TC5845,TC5847,TC5848,TC5850,TC5851,TC5853,TC5854  : Opportunity - Open opportunities,Closed opportunities,Won opportunities,Lost opportunities,Needs Status Update,Expiration Quarter and opportunity filter these two filters should work together 
   When I click on "Opportunities" tab
   And I verify the current expiration quarter value in Expiration Quarter filter
   And I verify the current expiration year value in Expiration Year filter
   And I select the "Open Opportunities with Quotes" filter value
   Then I should able to see the all the renewal partner opportunities associated to the account
   And I select the "Open Opportunities" filter value
   Then I should able to see the all the renewal partner opportunities associated to the account
   And I select the "Closed Opportunities" filter value
   Then I should able to see the all the renewal partner opportunities associated to the account
   And I should able to see the closed opportunities
   And I select the "Won Opportunities" filter value
   Then I should able to see the all the renewal partner opportunities associated to the account
   And I should able to see the "Closed Won" won opportunities
   And I select the "Lost Opportunities" filter value
   Then I should able to see the all the renewal partner opportunities associated to the account
   And I should able to see the "Closed Lost" lost opportunities
   And I select the "Need Status Updates" filter value
   Then I should able to see the all the renewal partner opportunities associated to the account
   And I update the "Sales Stage" sales field
   Then I verify the updated "Sales Stage" sales field
   And I verify the last status update "Current Date" field
   
@opportunity_filters_with_multiple_quarter_year_selection
Scenario: Rally Test Case ID: TC5840,TC5846,TC5849,TC5852,TC5855 : Opportunity - Open opportunities,Closed opportunities,Won opportunities,Lost opportunities,Needs Status Update,Expiration Quarter and opportunity filter these two filters should work together 
   When I click on "Opportunities" tab
   And I select all quarter values in Expiration Quarter filter
   And I select all expiration year value in Expiration Year filter
   And I select the "Open Opportunities with Quotes" filter value
   Then I should able to see the all the renewal partner opportunities associated to the account
   And I select the "Open Opportunities" filter value
   Then I should able to see the all the renewal partner opportunities associated to the account
   And I select the "Closed Opportunities" filter value
   Then I should able to see the all the renewal partner opportunities associated to the account
   And I should able to see the closed opportunities
   And I select the "Won Opportunities" filter value
   Then I should able to see the all the renewal partner opportunities associated to the account
   And I should able to see the "Closed Won" won opportunities
   And I select the "Lost Opportunities" filter value
   Then I should able to see the all the renewal partner opportunities associated to the account
   And I should able to see the "Closed Lost" lost opportunities
   And I select the "Need Status Updates" filter value
   Then I should able to see the all the renewal partner opportunities associated to the account
   And I update the "Sales Stage" sales field
   Then I verify the updated "Sales Stage" sales field
   And I verify the last status update "Current Date" field