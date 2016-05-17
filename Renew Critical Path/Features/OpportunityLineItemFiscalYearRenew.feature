@RenOpportunity
@RenOpportunityLineItemFiscalYearFeature
Feature: All features related to Renew User - Opportunity - Opportunity Line Item Fiscal Year

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@RenWithinFiscalYear
Scenario:Rally -ID: TC4635: Opportunity Line Item - End Date in fiscal year range
  When I Navigate to "Opportunities" tab
  Then I select the opportunity to set the date
  Then I select a Opportunity Line Item with no date to set "WithinFiscalYear"
  And I verify the quarter fields
  And I clear the date fields for FiscalOpp

@RenBeyondFiscalYear
Scenario:Rally -ID: TC4636,TC4637: Opportunity Line Item - End Date outside fiscal year range - Std Fiscal year set
  When I Navigate to "Opportunities" tab
  Then I select the opportunity to set the date
  Then I select a Opportunity Line Item with no date to set "BeyondFiscalYear"
  And I verify the quarter fields
  And I clear the date fields for FiscalOpp

