@Requests 
@RelatedToAndRequestsPageFeature 
Feature: All features related to Requests - Requests Page 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
	
@requests_page 
Scenario: Rally Test Case ID: TC4499 : Sales Request List: Link for Request Number 
	When I click on "Requests" tab 
	Then I verify the "Request Number" links 
	And I click on the "Request Number" link 
	Then I verify the "Request Number" fields 
