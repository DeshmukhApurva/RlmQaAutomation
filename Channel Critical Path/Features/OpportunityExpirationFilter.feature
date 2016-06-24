@Opportunities
@OpportunityExpirationFilterFeature
Feature: All features related to Partner user - Opportunities - Opportunity Expiration Filter

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page
	
@VerifyExpirationQuarter
Scenario: Rally-ID: TC5829, TC5830, TC5831, TC5832, TC5833, TC5857 : Opportunity - Expiration filter
	When I click on "Opportunities" link
	Then I check the current expiration quarter and expiration year results
	And I verify after the expiration quarter and expiration year results