@Opportunities
@OpportunityRenewalsSubTabFeature
Feature: All features related to Opportunities - Opportunity Renewals Sub Tab

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@renewal_opportunity_sub_tab
Scenario: Rally Test Case ID: TC4410,TC4411,TC4412,TC4413,TC4414,TC4415,TC4416,TC4417 : Opportunity - Renewals tab fields,Renewals tab - Sorting,Renewals subtab -column Show/Hide, Renewals tab - Export
   When I click on "Opportunities" tab
   And I clear the filters
   And I select the "New Last Week" filter value
   And I navigate to the "Renewal" opportunity sub tab
   And I click on "Renewals" tab
   Then I should able to see the "Renewal" opportunity fields
   When I click on the "Kebab Menu" menu button
   Then I verify the "Kebab Menu" button
   When I click on the "Kebab Menu" menu button
   When I click on the "Export all data as CSV" field
   And I click on "Renewals" tab
   And user sorts by "Existing End Date" in "Ascending" order from "Renewals" page
   Then files should be sorted by "Existing End Date" in "Ascending" order from "Renewals" page
   When I click on "Renewals" tab
   And user sorts by "Existing End Date" in "Descending" sort order from "Renewals" page
   Then files should be sorted by "Existing End Date" in "Descending" sort order from "Renewals" page
   When I click on "Renewals" tab
   And I verify the currency related fields