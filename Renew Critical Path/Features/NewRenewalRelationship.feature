@Opportunity
@NewRenewalRelationshipFeature
Feature: All features related to Renew User - Opportunity - New Renewal Relationship

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@InsideFiscalYear
Scenario:Rally -ID: TC4674: Renewal Relationship - End Date in fiscal year range
  When I Navigate to "Opportunities" tab
  Then I select the opportunity to set the date
  Then I edit the renewal relationship "InsideFiscalYear"
  And I verify the quarter fields
  And I clear the renewal relationship date fields

@OutsideFiscalYear
Scenario:Rally -ID: TC4675,TC4676: Renewal Relationship - End Date outside fiscal year range - Std Fiscal Year is set
  When I Navigate to "Opportunities" tab
  Then I select the opportunity to set the date
  Then I edit the renewal relationship "OutsideFiscalYear"
  And I verify the quarter fields
  And I clear the renewal relationship date fields