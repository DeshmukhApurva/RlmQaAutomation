@PartnerOpportunity @IncumbentPOFeature 
Feature: All features related to Partner user - Opportunities - Incumbent PO 
	This feature file should be executed in the org where two-tier is enabled/checked.

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
@AssetPriceOnAssetIncumbentcheckornot 
Scenario: 
	Rally-ID : TC6121: TC6131: Opportunity Details and Community Partner Link : User should be able to see Asset's price on Asset tab of Account page irrespective of whether Incumbent flag is checked or Not

	When I create Opportunities and add the Product 
	And I change the Stage to Closed won 
	And I clicked on Contributed to 
	And I click on "Add New Partner Opportunity" button 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I navigate to "Partner Contact(s)" section 
	And I select the "Partner Account Contacts" from the contacts lookup list 
	And I select the "To Master Opportunity" option from syncing dropdown 
	And I select the account as "Reseller" or "Distributor" 
	And I click on the "Grant Access" 
	And I Navigated to Renewal Opportunity 
	And I change the Stage to Qualification 
	#And I change the Stage to Closed won
	And I clicked on Contributed to 
	And I click on Asset 
	And I check the Price in Asset 
	# And I verify Partner accounts Details
	# When user logout from "CHANNELMANAGER" application
	#	When I log into "CHANNELPARTNER_EETEST4" details
	#	Then I search an Account Name
	#	And I click on "Assets" tab
	#	And I Verify Price is Present on Assets
	
@AssetPriceandContractPriceOnAssetIncumbentcheckornot 
Scenario: 
	Rally-ID : TC6122: TC6132: Opportunity Details and Community Partner Link : User should be able to see Contract  Total price on Contract tab of Account page irrespective of whether Incumbent flag is checked or not

	When I create Opportunities and add the Product 
	And I change the Stage to Closed won 
	And I clicked on Contributed to 
	And I click on "Add New Partner Opportunity" button 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I navigate to "Partner Contact(s)" section 
	And I select the "Partner Account Contacts" from the contacts lookup list 
	And I select the "To Master Opportunity" option from syncing dropdown 
	And I select the account as "Reseller" or "Distributor" 
	And I click on the "Grant Access" 
	And I Navigated to Renewal Opportunity 
	And I change the Stage to Qualification 
	# And I change the Stage to Closed won
	And I clicked on Contributed to 
	And I click on Service Contracts 
	
	# And I verify Partner accounts Details
	# When user logout from "CHANNELMANAGER" application
	#	When I log into "CHANNELPARTNER_EETEST4" details
	#	Then I search an Account Name
	#	And I click on "Contracts" tab
	#	And I Verify Price is Present on Contracts
	
@IncumbentFlagnotinAssestandService 
Scenario: 
	Rally-ID:TC6123 :TC6133 : Account and Service Contract :User should no longer be able to see the Incumbant checkbox on Asset & Service Contract object

	When I create Opportunities and add the Product 
	And I change the Stage to Closed won 
	And I clicked on Contributed to 
	And I click on "Add New Partner Opportunity" button 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I navigate to "Partner Contact(s)" section 
	And I select the "Partner Account Contacts" from the contacts lookup list 
	And I select the "To Master Opportunity" option from syncing dropdown 
	And I select the account as "Reseller" or "Distributor" 
	And I click on the "Grant Access" 
	And I Navigated to Renewal Opportunity 
	And I change the Stage to Qualification 
	
	#	And I change the Stage to Closed won
	#   And I clicked on Contributed to
	#	And I click on Asset
	#   And I verify partner Accounts in Assets
	#   And I check the Incumbent Checkbox
	
	When I click on Account 
	Then I open Accounts 
	And I click on Any Asset link 
	And I check the Incumbent Checkbox 
	
	
	When I create Opportunities and add the Product 
	And I change the Stage to Closed won 
	And I clicked on Contributed to 
	And I click on "Add New Partner Opportunity" button 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I navigate to "Partner Contact(s)" section 
	And I select the "Partner Account Contacts" from the contacts lookup list 
	And I select the "To Master Opportunity" option from syncing dropdown 
	And I select the account as "Reseller" or "Distributor" 
	And I click on the "Grant Access" 
	And I Navigated to Renewal Opportunity 
	And I change the Stage to Qualification 
	#And I change the Stage to Closed won
	#   And I clicked on Contributed to
	#	And I click on Asset
	#   And I verify partner Accounts in Assets
	#   And I check the Incumbent Checkbox
	When I click on Account 
	Then I open Accounts 
	And I click on Service Contracts link 
	And I check the Incumbent Checkbox 
	
@Incumbentflagisunchecked 
Scenario: 
	Rally-ID : TC6124 : TC6134 Asset & Service Contract generation - User should be able to generate Asset & Service Contract by Auto Renewal process even if the Incumbent flag is unchecked in the Partner Opportunity created on Source Opportunity

	When I create Opportunities and add the Product 
	And I change the Stage to Closed won 
	And I clicked on Contributed to 
	And I click on "Add New Partner Opportunity" button 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I navigate to "Partner Contact(s)" section 
	And I select the "Partner Account Contacts" from the contacts lookup list 
	And I select the "To Master Opportunity" option from syncing dropdown 
	And I select the account as "Reseller" or "Distributor" 
	And I click on the "Grant Access" 
	And I Navigated to Renewal Opportunity 
	And I change the Stage to Qualification 
	#And I change the Stage to Closed won
	And I clicked on Contributed to 
	And I click on Asset 
	And I check the Incumbent Checkbox 
	
	When I create Opportunities and add the Product 
	And I change the Stage to Closed won 
	And I clicked on Contributed to 
	And I click on "Add New Partner Opportunity" button 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I navigate to "Partner Contact(s)" section 
	And I select the "Partner Account Contacts" from the contacts lookup list 
	And I select the "To Master Opportunity" option from syncing dropdown 
	And I select the account as "Reseller" or "Distributor" 
	And I click on the "Grant Access" 
	And I Navigated to Renewal Opportunity 
	And I change the Stage to Qualification 
	#And I change the Stage to Closed won
	And I clicked on Contributed to 
	And I click on Service Contracts 
	And I check the Incumbent Checkbox 
	
@ParentofPartnerAccountshouldseeAssetServiceContract 
Scenario: 
	Rally-ID :TC6125 :TC6135 Parent of Partner Account should be able to see Asset & Service Contract Price in Partner Community

	When I create Opportunities and add the Product 
	And I change the Stage to Closed won 
	And I clicked on Contributed to 
	And I click on "Add New Partner Opportunity" button 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I navigate to "Partner Contact(s)" section 
	And I select the "Partner Account Contacts" from the contacts lookup list 
	And I select the "To Master Opportunity" option from syncing dropdown 
	And I select the account as "Reseller" or "Distributor" 
	And I click on the "Grant Access" 
	And I Navigated to Renewal Opportunity 
	And I change the Stage to Qualification 
	#And I change the Stage to Closed won
	And I clicked on Contributed to 
	And I click on Asset 
	And I check the Price in Asset 
	#   And I verify Partner accounts Details
	
	#    When user logout from "CHANNELMANAGER" application
	#    When I log into "CHANNELPARTNER_EETEST4" details
	#    Then I search an Account Name
	#    And I click on "Assets" tab
	#    And I Verify Price is Present on Assets
	#    And I click on "Contracts" tab
	#    And I Verify Price is Present on Contracts
	
	#	When user logout from "CHANNELMANAGER" application
	#	When I log into "CHANNELDISTRIBUTOR_EETEST4" details
	#	Then I search an Account Name
	#	And I click on "Assets" tab
	#	And I Verify Price is Present on Assets
	#	And I click on "Contracts" tab
	#	And I Verify Price is Present on Contracts
	#
	
