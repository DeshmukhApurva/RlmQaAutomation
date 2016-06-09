@Overview
@ExpiredOpportunityFeature
Feature: All features related to Overview - Expired Opportunity

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page


@oppDisplay
Scenario: Rally Test Case ID: TC4429,TC4430,TC4431,TC4432,TC4468,TC4469,TC4526,TC4527,TC4528,TC4531,TC4532 : Expired Opportunities - Segmentation and Renewal amount, Expired Opportunities - Total Opportunity Count,Expired Opportunities - Verify the summation of Renewal target of Opportunities having different currencies, Expired Opportunities - Navigate to opportunity grid from expired opportunities link,Opportunity - Visibility of selected "Available to Partner" sales stages in Expired Opportunity section,Opportunity - Click on link and verify visibility of selected "Available to Partner" sales stages in Expired Opportunity section,Portal Overview Page: Sales Stages not to display in Expired Opportunity list,Portal Overview Page: Sales Stages to display in in Expired Opportunity list,Expired Opportunity: Click on Expired Opportunity count link when Sales Stage is available to partner and Display in Pipeline, Expired Opportunity: Click on Expired Opportunity count link when Sales Stage is available not available to partner but available to Display in Pipeline
	When I Navigate to "Overview" tab
	And I verify the "Expired Opportunity" display


@verifyExpiredOpp
Scenario: Rally Test Case ID: TC4428,TC4528,TC4533 : Expired Opportunities - Opportunity displayed,Portal Overview Page: Display of Opportunities count and Total Amount of Opportunities for Sales Stages in Expired Opportunity section,Expired Opportunity: Click on Expired Opportunity Total count link
	When I Navigate to "Overview" tab
	And I validate the "Expired Opportunity" section



