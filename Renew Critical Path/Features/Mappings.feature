@ServiceSourceSetUp
@MappingsFeature
Feature: All features related to Service Source setup - Mappings
	
Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page


@AssetOppMapping
Scenario:Rally Test Case ID: TC3459,TC3460,TC3461,TC3463,TC3464 : Opportunity Mandatory Field,Edit Field, Add and Save all fields verification, Add Custom Formula Opportunity Field, Verify Save Opportunity Fields 
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Asset → Opportunity" link
	Then all required fields should be displayed in Grey
	And I should be able to edit Opportunity Product Line field Quantity
	And I save the Mapping
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Asset → Opportunity" link
	Then the new Quantity Default Value should be displayed
	And I Add Opportunity Product Line Fields
	And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Asset → Opportunity" link
    And I Add Opportunity Fields "Conversion Delta" and "Save"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Asset → Opportunity" link
	Then Opportunity Field "Conversion Delta" should be present
    And I save the Mapping

@OppRenewalOppMapping
Scenario:Rally Test Case ID: TC3465,TC3466,TC3467,TC3468,TC3469,TC3470,TC3471,TC3472,TC3473,TC3475,TC3476,TC3477,TC3483,TC3484 : Opportunity -> Renewal Opportunity Mapping Test Cases
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity → Renewal Opportunity" link
	And I Add Opportunity Fields "Account ID" and "Save"
    And I delete Opportunity Fields "Account ID"
	And I save the Mapping
    When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity → Renewal Opportunity" link
    And I Add Opportunity Fields "Account ID" and "Cancel"
    And I save the Mapping
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity → Renewal Opportunity" link
	And I Add Opportunity Fields "Account ID" to "Account ID"
	And I Edit Opportunity Fields "Account ID" to "Campaign ID"
	And I Verify the Default Value Field is disabled for "Account ID"
    And I delete Opportunity Fields "Account ID"
    And I save the Mapping
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity → Renewal Opportunity" link
	Then Opportunity Field "Account ID" should not be present
	And I Add all Opportunity Fields
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity → Renewal Opportunity" link
	And I Add Related List Field
	Then Related List Field should be present
	And I Delete Related List Field
	Then Related List Field should not be present
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Renewal Opportunity" link
    And I add multiple "Renewal Opportunity Line Item Fields"
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Renewal Opportunity" link
    Then I select default value for the Source Opportunity Line Item Field
    And I save the Mapping


@OppServiceContractsMapping
Scenario:Rally Test Case ID: TC3478,TC3479,TC3480,TC3481,TC3482,TC3485 - Mappings - Opportunity -> Service Contract Add Field
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity → Service Contracts" link
	And I Add Service Contract Fields "Description" and "Save"
    And I Verify the Default Value Field is disabled for "Description"
    Then Service Contract Field "Description" should be present
    When I delete Service Contract Fields "Description"
	And I save the Mapping
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity → Service Contracts" link
    And I Add Service Contract Fields "Description" and Opportunity Field "Description"
    Then Service Contract Field "Description" should be present
    When I delete Service Contract Fields "Description"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Service Contracts" link
    And I Add Service Contract Fields "Description" and "Cancel"
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Service Contracts" link
    And I add multiple Service Contract Fields
    And I save the Mapping


@OppLineItem_AssetMapping
Scenario:Rally Test Case ID: TC3487,TC3488,TC3489,TC3490  : Opportunity Line Item -> Asset Mapping Test Cases 
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity Line Item → Asset" link
	And I Add all Asset Fields
	Then all Asset Fields should be present
    And I save the Mapping


@ServiceContractsToOppMapping
Scenario:Rally Test Case ID: TC3492,TC3493,TC3494,TC3495 : Mappings - Service Contract -> Opportunity Add Field,Opportunity Select Values,Opportunity Add All Field/Add Button Disable,Opportunity Save All Field
  	When I click on "ServiceSource Setup" link
  	And I click on "Mappings" link
  	And I click on "Service Contract → Opportunity" link
    Then all required fields should be displayed in Grey
    And I should be able to edit Opportunity Product Line field Quantity
    And I save the Mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Service Contract → Opportunity" link
    And I Add Opportunity Product Line Fields "Line Description" and "Save"
  	And I Verify the Default Value Field is enabled for "Line Description"
    And I save the Mapping
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Service Contract → Opportunity" link
    And I add multiple "Opportunity Product Line Fields"
	And I save the Mapping

@RenewalRelationshipMapping
Scenario:Rally Test Case ID: TC4653,TC4654,TC4655,TC4656 : Mappings - Renewal Relationship -> Opportunity Line Item Set Required Field Value,Mappings - Renewal Relationship -> Opportunity Line Item Set Default Field Value, Mappings - Renewal Relationship -> Opportunity Line Item Add Opportunity Product Line Fields, "Mappings - Renewal Relationship -> Opportunity Line Item view all the Required Fields on Mapping page"
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Renewal Relationship → Opportunity Line Item" link
	Then all required fields should be displayed in Grey
	And I should be able to edit Quantity in Opportunity Product Line fields 
	And I save the Mapping	
	And I should be able to set required field value for Quantity as "Quantity"
	And I save the Mapping
	And I Add Opportunity Product Line fields "New Start Date" to "Date"
	And I save the Mapping
	And I delete all mapping fields
	And I save the Mapping

@AssetToOppMappingValidation
Scenario: Rally Test Case ID: TC3461 : Mappings - Asset -> Opportunity Save All Fields
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Asset → Opportunity" link
	And I delete Opportunity Product Line field "Sales Price"
	And I save the Mapping
	And I delete Opportunity Product Line field "Total Price"
	And I save the Mapping
	And I Add an Opportunity Product Line field "Sales Price" to "Price"
	And I save the Mapping
	And I Add an Opportunity Product Line field "Total Price" to "Price"
	And I verify the validation message
	And I save the Mapping
	
@OppToRenOppMappingValidation
Scenario: Rally Test Case ID: TC3475 : Mappings - Opportunity -> Renewal Opportunity Multi-Currency Behaviour
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity → Renewal Opportunity" link
	And I delete Opportunity Product Line field "Sales Price"
	And I save the Mapping
	And I delete Opportunity Product Line field "Total Price"
	And I save the Mapping
	And I Add an Opportunity Product Line field "Sales Price" to "Sales Price"
	And I save the Mapping
	And I Add an Opportunity Product Line field "Total Price" to "Total Price"
	And I verify the validation message
	And I save the Mapping

@OppToSCMappingValidation
Scenario: Rally Test Case ID: TC3485 : Mappings - Opportunity -> Service Contract Save All Field
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity → Service Contracts" link
	And I delete Opportunity Product Line field "Total Price"
	And I save the Mapping
	And I Add an Opportunity Product Line field "Total Price" to "Total Price"
	And I verify the validation message
	And I save the Mapping

@SCToOppMappingValidation
Scenario: Rally Test Case ID: TC3494 : Mappings - Service Contract -> Opportunity Add All Field/Add Button Disable
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Service Contract → Opportunity" link
	And I delete Opportunity Product Line field "Sales Price"
	And I save the Mapping
	And I delete Opportunity Product Line field "Total Price"
	And I save the Mapping
	And I Add an Opportunity Product Line field "Sales Price" to "Sales Price"
	And I save the Mapping
	And I Add an Opportunity Product Line field "Total Price" to "Total Price"
	And I verify the validation message
	And I save the Mapping

@MappingsDelete
Scenario: Delete all mappings that were created
    When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Asset → Opportunity" link
	And I delete all mapping fields
    When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity → Renewal Opportunity" link
	And I delete all mapping fields
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity → Service Contracts" link
	And I delete all mapping fields
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Opportunity Line Item → Asset" link
	And I delete all mapping fields
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Service Contract → Opportunity" link
	And I delete all mapping fields
	When I click on "ServiceSource Setup" link
	And I click on "Mappings" link
	And I click on "Renewal Relationship → Opportunity Line Item" link
	And I delete all mapping fields

