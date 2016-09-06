@ServiceSourceSetUp 
@OpportunityGenerationFeature 
Feature: All features related to Service Source setup - Opportunity Generation 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
	
@OppGenVerify 
Scenario:
Rally Test Case ID : TC3390,TC3391,TC3393,TC3397,TC3398,TC3399,TC3400,TC3402 :  Opportunity Generation - Select Values,Opportunity Generation - Operators,Opportunity Generation - Default AND Criteria,Opportunity Generation - Add Filter Logic,Opportunity Generation - Remove Criteria 
	When I Navigate to "ServiceSource Setup" tab 
	And I click on "Opportunity Generation" link 
	And I select the "Enable Generation of Opportunities" checkbox on opp generation 
	And I verify the Data Types and list of Operators for "OppFields" 
	And I verify the Data Types and list of Operators for "ProductFields" 
	Then I add update more than "10" criteria for "ProductFields" 
	Then I verify filter logic for "OppFields" 
	Then I verify filter logic for "ProductFields" 
	
	
@OppGenVerifyValidation 
Scenario:
Rally Test Case ID: TC3389,TC3392,TC3394,TC3403 : Opportunity Generation - Error Messages,Opportunity Generation - Validation Messages 
	When I Navigate to "ServiceSource Setup" tab 
	And I click on "Opportunity Generation" link 
	And I select the "Enable Generation of Opportunities" checkbox on opp generation 
	Then I clicked on "Clear Filter Logic" link "OppFields" 
	Then I add update criteria for "OppFields" without values 
	Then I clicked on "Add Filter Logic" link "OppFields" 
	Then I verify validation message for undefined reference for "OppFields" 
	Then I clicked on "Clear Filter Logic" link "ProductFields" 
	Then I add update criteria for "ProductFields" without values 
	Then I clicked on "Add Filter Logic" link "ProductFields" 
	Then I verify validation message for undefined reference for "ProductFields" 
	And I delete Product Criteria
	
	
	
@generate_renewal_opportunity 
Scenario:
Rally Test Case ID: TC3388,TC3396,TC3401,TC3404,TC3405,TC3406 - Opportunity Generation - Generate Renewal Opportunity,Multiple Criteria 
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
	And I click on "Opportunity Generation" link 
	And I select the "Enable Generation of Opportunities" checkbox on opp generation 
	And I add multiple criteria and filter logic "1 AND 2 OR 3" and "1 OR 2 OR 3" on opp generation 
	When I click on "Opportunities" link 
	And I click on "New" button 
	And I create a new opportunity 
	And I click on "Choose Price Book" button 
	Then I Choose the Pricebook for the product 
	And I click on "Add Product" button 
	And I select the products and covered assets 
	Then I verify the created products 
	And I resolve the "Opportunity" 
	And I go to first row where column name is "Contributed To" 
	Then I verify that opportunity products get generated 
	And I verify the service contract get generated 
	And I verify the covered asset and covered product 
#	When I click on "Opportunities" link 
#	And I click on "Go!" button from opportunity page 
#	#When I delete the created opportunity 
#	When I click on "Opportunities" link 
#	And I click on "Go!" button from opportunity page 
#	#When I delete the mapping generated opportunity 
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
	
	
@generate_renewable_line_item 
Scenario:
Rally Test Case ID: TC6141,TC6266,TC6265,TC6267 - Opportunity Generation - Generate Renewal Opportunity with line Item 
	When I click on "Opportunities" link 
	And I click on "New" button 
	And I create new Opportunity 
	And I click on "New Renewable Line Item" button 
	And I verify RR All FieldSet 
	And I fill data in RR fields 
	And I verify all data after saving 

	