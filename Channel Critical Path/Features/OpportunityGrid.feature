@Opportunities
@OpportunityGridFeature
Feature: All features related to Opportunities - Opportunity Grid

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page



@opportunity_grid
Scenario: Rally Test Case ID: TC4367,TC4368,TC4369,TC4370,TC4371,TC4372: Opportunity - Data grid columns,Adding/Removing Columns,Grid Sorting,Export,Search
   When I click on "Opportunities" tab
   Then I should able to see the "Opportunity Grid" columns
   When I click on the "Kebab Menu" menu button
   And I uncheck the "Opportunity Grid" fields from "Opportunities" page
   Then I should not able to see the "Opportunity Grid" fields from "Opportunities" page
   When I click on "Requests" tab
   And I click on "Opportunities" tab
   Then I should able to see the "Opportunity Grid" columns
   When I click on the "Kebab Menu" menu button
   And I click on the "Export all data as CSV" field
   And I click on "Opportunities" tab
   And user sorts by "Name" in "Ascending" order from "Opportunities" page
   Then files should be sorted by "Name" in "Ascending" order from "Opportunities" page
   When I click on "Opportunities" tab
   And user sorts by "Name" in "Descending" sort order from "Opportunities" page
   Then files should be sorted by "Name" in "Descending" sort order from "Opportunities" page
   When I click on "Opportunities" tab
   And I search with account "PES Channel Account" name from "Opportunities" page
   Then I verify the grid scroll up and scroll down the page and default pagination value


@editing_field_opportunity
Scenario: Rally Test Case ID: TC4373,TC4374,TC4375,TC4376,TC4377 : Opportunity - Inline field editing
   When I click on "Opportunities" tab
   And I verify the current expiration quarter value in Expiration Quarter filter
   And I verify the current expiration year value in Expiration Year filter
   And I select the "Open Opportunities" filter value
   And I update the "PES_Add_Partner" column values
   Then I verify the "Reseller Rep" and "Distributor Rep" column where Rep is not yet selected
   When I select the "Reseller Rep" and "Distributor Rep" and verify the selected rip value


@update_the_status_fields
Scenario: Rally Test Case ID: TC4378,TC4379,TC4380 : Update the status (True to False),Change the field which is not defined on admin screen and check the needs update flag,Update Status date display(flag is False)
   When I click on "Opportunities" tab
   And I verify the current expiration quarter value in Expiration Quarter filter
   And I verify the current expiration year value in Expiration Year filter
   And I select the "Need Status Updates" filter value
   And I update the "Sales Stage" sales field
   Then I verify the updated "Sales Stage" sales field
   And I verify the last status update "Current Date" field
   When I update the "Probability" field
   Then I verify the updated "Probability" field


@update_dialogue_box
Scenario: Rally Test Case ID: TC4381,TC4382,TC4383,TC4384,TC4385 : Opportunity - Toggle the field from TRUE to FALSE or vice versa,Update dialogue box,Update dialogue box - No Change button,Update dialogue box - Update status,Close the Dialogue box
   When I click on "Opportunities" tab
   And I click on "Update" icon
   Then I should be able to see the "No Change" and "Update" buttons
   When I enter status is "FALSE" and click on the "No Change" button
   And I click on "Opportunities" tab
   And I enter status is "FALSE" and click on "Update" button
   And I click on "Opportunities" tab
   And I enter status is "TRUE" and click on the "No Change" button
   And I click on "Opportunities" tab
   And I enter status is "TRUE" and click on "Update" button
   And I click on "Opportunities" tab
   And I click close the "Status Update" dialogue box
   Then I should not able to see the "Status Update" dialogue box



@download_quote_attachment
Scenario: Rally Test Case ID: TC4461,TC4462,TC4463 : Opportunity grid - Download attachment - Sales Force Quotes pdf
    When I click on "Opportunities" tab
    And I verify the current expiration quarter value in Expiration Quarter filter
    And I verify the current expiration year value in Expiration Year filter
    Then I should able to see the "Opportunity Grid" columns
    When I search with the "PES_Add_Partner_Attachment" opportunities
    Then I should able to see the "Opportunity Grid" columns
    When I click on "PES_Add_Partner_Attachment" link from "Opportunities" page



