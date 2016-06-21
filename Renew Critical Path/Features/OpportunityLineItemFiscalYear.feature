@Opportunity
@OpportunityLineItemFiscalYearFeature
Feature: All features related to Renew User - Opportunity - Opportunity Line Item Fiscal Year

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@WithinFiscalYear
Scenario: Rally -ID: TC4671: Opportunity Line Item - End Date in fiscal year range
  When I Navigate to "Opportunities" tab
  Then I select the opportunity to set the date
  Then I select a RR on Opportunity to set Start and End Dates "WithinFiscalYear"
  When I Navigate to "Opportunities" tab
  Then I select the opportunity to set the date
  And I verify the quarter fields
  Then I select a RR on Opportunity to set Start and End Dates "EmptyFiscalYear"

@BeyondFiscalYear
Scenario: Rally -ID: TC4672,TC4673: Opportunity Line Item - End Date outside fiscal year range - Std Fiscal year set
  When I Navigate to "Opportunities" tab
  Then I select the opportunity to set the date
  Then I select a RR on Opportunity to set Start and End Dates "BeyondFiscalYear"
  When I Navigate to "Opportunities" tab
  Then I select the opportunity to set the date
  And I verify the quarter fields
  Then I select a RR on Opportunity to set Start and End Dates "EmptyFiscalYear"
  #Then I select a Opportunity Line Item with no date to set "BeyondFiscalYear"

