@Opportunities
@OpportunitiesPredefinedFilterFeature
Feature: All features related to Opportunities - Opportunities Predefined Filter

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@opportunity_filters
Scenario: Rally Test Case ID: TC4361,TC4362,TC4363,TC4364,TC4365,TC4366 : Opportunity - Open opportunities,Closed opportunities,Won opportunities,Lost opportunities,Needs Status Update,Expiration Quarter and opportunity filter these two filters should work together 
   When I click on "Opportunities" tab
   And I select the "All Quarters" filter
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
   And I should able to see the "CLosed Lost" lost opportunities
   And I select the "Q2 2016" filter
   And I select the "Need Status Updates" filter value
   Then I should able to see the all the renewal partner opportunities associated to the account
   And I update the "Sales Stage" sales field
   Then I verify the updated "Sales Stage" sales field
   And I verify the last status update "Current Date" field






