@ServiceSourceSetUp
@IBDRGenerationFeature
Feature: All features related to Service Source setup - Install Base Data Rules Generation
 
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@IBDRverify
Scenario:Rally Test Case ID : TC3422,TC3423,TC3424,TC3425,TC3427,TC3428,TC3430,TC3433,TC3434,TC3440,TC3441,TC3443,TC3446,TC3447 : IBDR - Clear Filter Logic,IBDR - Data Types,IBDR - Default AND Behaviour,IBDR - Select Values,IBDR - Operators,IBDR - Row Limit,IBDR - Add Filter Logic,IBDR - Entitlement is on/off,IBDR - Remove Criteria
	When I Navigate to "ServiceSource Setup" tab
	And I click on "Install Base Data Rules" link
	And I enable "Enable Generation of Assets" checkbox
	And I verify grid display related to Service Contract
	And I enable "Enable Generation of Service Contract" checkbox
	And I "Save"
	And I verify the Data Types and list of Operators for "OppFields"
	Then I add update more than "10" criteria for "ProductFields"
	Then I add update more than "10" criteria for "ServiceContractFields"
	Then I verify filter logic for "OppFields"
	Then I verify filter logic for "ProductFields"
	Then I verify filter logic for "ServiceContractFields"


@IBDRVerifyValidation
Scenario:Rally Test Case ID: TC3448,TC3429 : IBDR - Validation Messages
	When I Navigate to "ServiceSource Setup" tab
	And I click on "Install Base Data Rules" link
	And I enable "Enable Generation of Assets" checkbox
	And I enable "Enable Generation of Service Contract" checkbox
	Then I clicked on "Clear Filter Logic" link "OppFields"
	Then I add update criteria for "OppFields" without values
	Then I clicked on "Add Filter Logic" link "OppFields"
	Then I verify validation message for undefined reference for "OppFields"


	
	
@auto_generation_verification
Scenario:Rally Test Case ID: TC3421,TC3426,TC3432,TC3431,TC3435,TC3436,TC3437,TC3438,TC3439,TC3444,TC3445,TC3449 - Auto Generate Assets on Renewal,Asset present on source opportunity
	When I Navigate to "ServiceSource Setup" tab
	And I click on "Mappings" link
    And I click on "Opportunity → Renewal Opportunity" link
	And I set the "Name" mapping
	And I save the Mapping
	When I Navigate to "ServiceSource Setup" tab
	And I click on "Mappings" link
    And I click on "Opportunity → Service Contracts" link
	And I set the "Contract Name" mapping for Service Contracts
	And I save the Mapping
	When I Navigate to "ServiceSource Setup" tab
	And I click on "Mappings" link
    And I click on "Opportunity Line Item → Asset" link
	And I set the "Asset Name" mapping for Asset
	And I save the Mapping
	When I click on "ServiceSource Setup" link
	And I click on "Install Base Data Rules" link
	And I enable "Enable Generation of Assets" checkbox
	And I enable "Enable Generation of Service Contract" checkbox
	And I add multiple criteria and filter logic "1 OR 2 OR 3"
	When I click on "Opportunities" link
	And I click on "New" button
	And I create a new opportunity
	And I click on "Choose Price Book" button
	Then I Choose the Pricebook for the product
	And I click on "Add Product" button
	And I select the products and covered assets
	Then I verify the created products
	And I resolve the "Opportunity"
	When I click on "Opportunities" link
	And I click on "Go!" button from opportunity page
	And I select the opportunities
	And I open the resolved opportunity
	Then I verify that opportunity products get generated
	And I verify the service contract get generated
	And I verify the covered asset and covered product
    When I click on "Opportunities" link
    And I click on "Go!" button from opportunity page
	When I delete the created opportunity
    When I click on "Opportunities" link
    And I click on "Go!" button from opportunity page
    When I delete the mapping generated opportunity
    When I Navigate to "ServiceSource Setup" tab
    And I click on "Mappings" link
    And I click on "Opportunity → Renewal Opportunity" link
    And I clear the "Name" mapping
    And I save the Mapping
    When I Navigate to "ServiceSource Setup" tab
    And I click on "Mappings" link
    And I click on "Opportunity → Service Contracts" link
    And I clear the "Contract Name" mapping for Service Contracts
    And I save the Mapping
	
	
