@PartnerOpportunity
@OpportunitySplitFeature
Feature: All features related to Partner Opportunity - Split Opportunity

Background: Login to the Application
  Given that I navigate to the CRM application
  Then I should land on CRM home page


@new_target_opportunity
Scenario: Rally Test Case ID: TC4337 : Split Opportunity Page: Split Opportunity with "New Opportunity" option
  #When I click on the "Opportunities" grid tab
  And I open existing opportunity
  And I click on button "Add Product"
  And I select one or more product from the grid
  And I select the products
  And I click on button "Split Opportunity"
  And I select the "New Opportunity" option from the "Select target Opportunity Type" list
  And I fill the required fields
  And I clicked button "Split Selected"
  Then I verify the renewal relationship & Metrics fields values are recalculated on the opportunity

@verify_validation_message
Scenario: Rally Test Case ID: TC4337 :Split Opportunity Page: Split Opportunity with "New Opportunity" option,Validation Message
  #When I click on the "Opportunities" grid tab
  And I open existing opportunity
  And I click on button "Add Product"
  And I select one or more product from the grid
  And I select the products
  And I click on button "Split Opportunity"
  And I select the "New Opportunity" option from the "Select target Opportunity Type" list
  And I clicked button "Split Selected"
  Then I should able to see the validation error messages

@new_cloned_target_opportunity
Scenario: Rally Test Case ID: TC4338 : Split Opportunity Page: Split Opportunity with "New Cloned Opportunity" option
  #When I click on the "Opportunities" grid tab
  And I open existing opportunity
  And I click on button "Add Product"
  And I select one or more product from the grid
  And I select the products
  And I click on button "Split Opportunity"
  And I select the "New Cloned Opportunity" option from the "Select target Opportunity Type" list
  Then I should able to see the "Target Opportunity" and "Opportunity Product(s)" section
  And I clicked button "Split Selected"
  Then I should able to see the opportunity details

@product_validation_opp
Scenario: Rally Test Case ID: TC4340 : Split Opportunity - Product Validation Message
  #When I click on the "Opportunities" grid tab
  And I open existing opportunity
  And I click on button "Split Opportunity"
  Then I should able to see the "Please select at least one Opportunity Line to proceed." alert message

@cancel_existing_opportunity
Scenario: Rally Test Case ID: TC4340 : Split Opportunity Page: Clicking on Cancel button
  #When I click on the "Opportunities" grid tab
  And I open existing opportunity
  And I click on button "Add Product"
  And I select one or more product from the grid
  And I select the products
  And I click on button "Split Opportunity"
  And I select the "Existing Opportunity" option from the "Select target Opportunity Type" list
  And I clicked button "Cancel"
  Then I should able to cancel the split opportunity


@existing_opportunity
Scenario: Rally Test Case ID: TC4339 : Split Opportunity Page: Split Opportunity with "Existing Opportunity" option 
  #When I click on the "Opportunities" grid tab
  And I open existing opportunity
  And I click on button "Add Product"
  And I select one or more product from the grid
  And I select the products
  And I click on button "Split Opportunity"
  And I select the "Existing Opportunity" option from the "Select target Opportunity Type" list
  And I fill the required fields from "Existing Opportunity" page
  Then I should able to see the "Target Opportunity" and "Opportunity Product(s)" section
  And I clicked button "Split Selected"
  Then I should able to see the opportunity details