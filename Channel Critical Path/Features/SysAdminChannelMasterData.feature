@SystemAdminMasterDataCreation 
Feature: All features related to System Admin Master Data 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
@PartnerAccount 
Scenario: Renew: new pricebook 
	When I click on "Account" tab 
	Then I create new Channel Account with value "PES Channel Account" with AccountNumber "QA-0001" and Country "USA"
    And I Manage External Account
    When I click on "Account" tab 
	Then I create new Channel Account with value "Automation Reseller" with AccountNumber "QA-0001" and Country "USA"
    And I Manage External Account
    When I click on "Account" tab 
	Then I create new Channel Account with value "Automation Distributor" with AccountNumber "QA-0001" and Country "USA"
    And I Manage External Account 
    When I click on "Account" tab 
	Then I create new Channel Account with value "TwoTierAutomation" with AccountNumber "QA-0001" and Country "USA"
    And I Manage External Account
   