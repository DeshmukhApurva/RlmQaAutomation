@Requests
@RelatedToFeature
Feature: All features related to Requests - Related To

Background: Login to the Application
	Given that I navigate to the CRM application
	Then I should land on CRM home page


@request_related_to
Scenario: Rally Test Case ID: TC4494,TC4495,TC4496,TC4497,TC4498 : Sales Request Page- Link for Related To field,Related To field has value as Opportunity,Related To field has value as Quote,Related To field has value as Asset,Related To field has value as Service Contract
    When I click on "Requests" tab
    And I filter the "Related To" record
    And I click on the "Request Number" link
    And I verify the "Related To" link
    When I click on the "Related To" opportunity link
    Then I verify the "Related To" opportunity details
