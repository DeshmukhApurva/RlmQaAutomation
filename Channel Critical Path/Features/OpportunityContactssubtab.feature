@Opportunities
@OpportunityContactsSubTabFeature
Feature: All features related to Opportunities - Opportunity Contacts Sub Tab

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page



@contacts_opportunity_sub_tab
Scenario: Rally Test Case ID: TC4406,TC4407,TC4408,TC4409 : Opportunity - Contact subtab,Contact subtab - grid sorting,Contact subtab - Export,Contacts subtab -Column Show/Hide
   When I click on "Opportunities" tab
   And I clear the filters
   And I select the "New Last Week" filter value
   And I navigate to the "Contacts" opportunity sub tab
   And I click on "Contacts" tab
   Then I should able to see the opportunity "Contacts" fields
   When I click on the "Kebab Menu" menu button
   Then I verify the "Kebab Menu" button
   When I click on the "Kebab Menu" menu button
   Then I verify the export a file option
   When I click on "Details" tab
   And I click on "Contacts" tab
   And user "Email" in "Ascending" sort order
   Then files should be "Email" in "Ascending" sort order
   When I click on "Contacts" tab
   And user "Email" in "Descending" order
   Then files should be "Email" in "Descending" order


