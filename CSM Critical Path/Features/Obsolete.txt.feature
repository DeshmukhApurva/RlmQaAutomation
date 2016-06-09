@ObsoleteFeature
Feature: All Obsolete Scenarios

  Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@CSMNetOps
Scenario:Rally Test Case ID : TC2822 : Creation of Focus Category
    When I click on "ServiceSource Setup" link
    And create a new FC
    Then I view the created FC


@CSMNetOps @CSM
Scenario: Rally Test Case ID: TC2729,TC2865 : Filter Tile records by owner
    When I click on "Overview" link
    And I Verify hamburger icon
    And I select Show Charts and Tiles
    Then click on edit view to change the Account Owner
    Then count the number of tiles
    When I click on "Overview" link
    Then click on the edit view to change the different Account Owner
    Then count the number of tiles after changing the user
    Then Verify the Tile Records


@CSMNetOps @CSM
Scenario:Rally Test Case ID: TC2739,TC2875 : Filter attribute overview - for SP object
    When I click on "Overview" link
    And I Verify hamburger icon
    And I select Show Charts and Tiles
    Then change the object to Success plan in the edit view to verify the LOV present in Success plan


@CSMNetOps
Scenario: Rally Test Case ID : TC2858 : SPT - define Success Plan Time line Fields for Opportunity
    When I click on "ServiceSource Setup" link
    Then I create a new Success Plan Template


@CSMNetOps @CSM
Scenario:Rally Test Case ID: TC2782,TC2783,TC2918, TC2919 : Verify ServiceSource banner, Navigate to service source link through banner
    When I Navigate to Success Plans tab
    Then I select the created SP
    And I verify usage



