@Opportunities @IncumbentPOFeature 
Feature: All features related to Partner user - Opportunities - Incumbent PO 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
@AssetPriceOnAssetIncumbentcheckornot 
Scenario: 
	Rally-ID : TC6121: TC6131: Opportunity Details and Community Partner Link : User should be able to see Asset's price on Asset tab of Account page irrespective of whether Incumbent flag is checked or Not
   
	When I create Opportunities and add the Product 
	And I change the Stage into Closed won 
	And I clicked on Contributed to
	And I click on "Add New Partner Opportunity" button 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I navigate to "Partner Contact(s)" section 
	And I select the "Partner Account Contacts" from the contacts lookup list 
	And I select the "To Master Opportunity" option from syncing dropdown 
	And I select the account as "Reseller" or "Distributor" 
    And I click on the "Grant Access" 
	Then I should see partner opportunity account details 
	And I Navigated to Opportunity 
	And I change the Stage into Closed won 
    And I check the Incumbent Checkbox 
	And I verify contacts Accounts in Assets 
	When user logout from "CHANNELMANAGER" application 
	When I log into "CHANNELPARTNER_DEV25" details 
	Then I search an Account Name and verify Price is present in Assest 
	And I click on "Assets" tab 
	And I Verify Price is Present on Assests 
	
@AssetPriceandContractPriceOnAssetIncumbentcheckornot 
Scenario: 
	Rally-ID : TC6122: TC6132: Opportunity Details and Community Partner Link : User should be able to see Asset's price on Asset tab of Account page irrespective of whether Incumbent flag is checked or Not
   
	When I create Opportunities and add the Product 
	And I change the Stage into Closed won 
	And I clicked on Contributed to
	And I click on "Add New Partner Opportunity" button 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I navigate to "Partner Contact(s)" section 
	And I select the "Partner Account Contacts" from the contacts lookup list 
	And I select the "To Master Opportunity" option from syncing dropdown 
	And I select the account as "Reseller" or "Distributor" 
    And I click on the "Grant Access" 
	Then I should see partner opportunity account details 
	And I Navigated to Opportunity 
	And I change the Stage into Closed won 
    And I check the Incumbent Checkbox 
	And I verify contacts Accounts in Service Contract 
	When user logout from "CHANNELMANAGER" application 
	When I log into "CHANNELPARTNER_DEV25" details 
	And I click on "Contracts" tab 
	And I Verify Price is Present on Contracts 
	
@IncumbentFlagnotinAssestandService 
Scenario: 
	Rally-ID:TC6123 :TC6133 : Account and Service Contract :User should no longer be able to see the Incumbant checkbox on Asset & Service Contract object
	When I create Opportunities and add the Product 
	And I change the Stage into Closed won 
	And I click on "Add New Partner Opportunity" button 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I navigate to "Partner Contact(s)" section 
	And I select the "Partner Account Contacts" from the contacts lookup list 
	And I select the "To Master Opportunity" option from syncing dropdown 
	And I select the account as "Reseller" or "Distributor" 
	And I click on the "Grant Access" 
	Then I should see partner opportunity account details 
	And I Navigated to Opportunity 
	And I change the Stage into Closed won 
	When I click on Account 
	Then I open Accounts 
	And I click on Service Contracts and Verified Accounts and Contacts 
	#	When I create Opportunities and add the Product 
	#	And I change the Stage into Closed won 
	#	And I click on "Add New Partner Opportunity" button 
	#	And I select the "Partner Accounts" from the accounts lookup list 
	#	And I select the "Partner Accounts" from the accounts lookup list 
	#	And I navigate to "Partner Contact(s)" section 
	#	And I select the "Partner Account Contacts" from the contacts lookup list 
	#	And I select the "To Master Opportunity" option from syncing dropdown 
	#	And I select the account as "Reseller" or "Distributor" 
	#	And I click on the "Grant Access" 
	#	Then I should see partner opportunity account details 
	#	And I Navigated to Opportunity 
	#	And I change the Stage into Closed won 
	#	Then I click on Assests and Verified Accounts and Contacts 
	#	
	
	
@Incumbentflagisunchecked 
Scenario: 
	Rally-ID : TC6124 : TC6134 Asset & Service Contract generation - Without Incumbant flag set
  
	When I create Opportunities and add the Product 
	And I change the Stage into Closed won 
	And I click on "Add New Partner Opportunity" button 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I navigate to "Partner Contact(s)" section 
	And I select the "Partner Account Contacts" from the contacts lookup list 
	And I select the "To Master Opportunity" option from syncing dropdown 
	And I select the account as "Reseller" or "Distributor" 
	And I click on the "Grant Access" 
	Then I should see partner opportunity account details 
	And I Navigated to Opportunity 
	And I change the Stage into Closed won 
	And I verify contacts Accounts in Service Contract 
	And I verify contacts Accounts in Assets 
	
@ParentofPartnerAccountshouldseeAsset&ServiceContract 
Scenario: 
	Rally-ID :TC6125 :TC6135 Parent of Partner Account should be able to see Asset & Service Contract Price in Partner Community
	When I create Opportunities and add the Product 
	And I change the Stage into Closed won 
	And I click on "Add New Partner Opportunity" button 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I navigate to "Partner Contact(s)" section 
	And I select the "Partner Account Contacts" from the contacts lookup list 
	And I select the "To Master Opportunity" option from syncing dropdown 
	And I select the account as "Reseller" or "Distributor" 
	And I check the Incumbent Checkbox 
	And I click on the "Grant Access" 
	Then I should see partner opportunity account details 
	And I Navigated to Opportunity 
	And I change the Stage into Closed won 
	And I verify contacts Accounts in Service Contract 
	And I verify contacts Accounts in Assets 
	When user logout from "CHANNELMANAGER" application 
	When I log into "CHANNELPARTNER_DEV25" details 
	Then I search an Account Name and verify Price is present in Assest 
	And I click on "Assets" tab 
	
@ParentofPartnerAccountshouldseeAsset&ServiceContract
Scenario:
    Rally-ID :TC6125 :TC6135 Parent of Partner Account should be able to see Asset & Service Contract Price in Partner Community
	When I create Opportunities and add the Product 
	And I change the Stage into Closed won 
	And I click on "Add New Partner Opportunity" button 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I select the "Partner Accounts" from the accounts lookup list 
	And I navigate to "Partner Contact(s)" section 
	And I select the "Partner Account Contacts" from the contacts lookup list 
	And I select the "To Master Opportunity" option from syncing dropdown 
	And I select the account as "Reseller" or "Distributor" 
	And I check the Incumbent Checkbox 
	And I click on the "Grant Access" 
	Then I should see partner opportunity account details 
	And I Navigated to Opportunity 
	And I change the Stage into Closed won 
	And I verify contacts Accounts in Assets
	
	#@Incumbent 
	#Scenario:
	#Rally-ID : TC4520 : Opportunity Details and Renewal Tab: Value of Renewal Target field/Renewal Target column/Previous Price column when Incumbent flag is checked for PO 
	#	When I click on "Opportunities" link 
	#	And I verify the current expiration quarter value in Expiration Quarter filter 
	#	And I verify the current expiration year value in Expiration Year filter 
	#	Then I Select the "Incumbent" Partner Opportunity 
	#	When I Navigate to "Details" tab 
	#	And I verify the "Renewal Target" field value 	