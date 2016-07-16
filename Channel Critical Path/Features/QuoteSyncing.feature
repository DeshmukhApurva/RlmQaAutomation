@QuoteSyncingFeature
Feature: All features related to Quote Syncing

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page
#---------------------------------------------------------------	
# QuoteSync_Mappings
#---------------------------------------------------------------
@quotesync_Delete_opportunity_to_quote_mappings
Scenario: Rally Test Case ID:  : Channel - Delete opportunity to quote mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I delete all mapping fields
    
@quotesync_opportunity_to_quote_mappings 
Scenario: Rally Test Case ID:  : Channel - Save opportunity to quote mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I add quote sync "Quote Fields" in opportunity to quote mapping
    And I save the Mapping
    
@quotesync_Delete__quote_to_opportunity_mappings
Scenario: Rally Test Case ID:  : Channel - Delete quote to opportunity mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I delete all mapping fields
    
@quotesync_quote_to_opportunity_mappings
Scenario: Rally Test Case ID:  : Channel - Save quote to opportunity mapping
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I add quote sync "Quote Fields" in quote to opportunity mapping 
    And I save the Mapping
    
@quotesync_QtoO_Delete_opportunity_line_item_fields
Scenario: Rally Test Case ID:  : Channel - Delete QtoO_opportunity_line_item_fields
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I delete all mapping fields
    
@quotesync_QtoO_opportunity_line_item_fields
Scenario: Rally Test Case ID:  : Channel - Save QtoO_opportunity_line_item_fields
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Quote → Opportunity" link
    And I add quote sync custom fields to "Opportunity Line Item Fields"
    And I save the Mapping

@quotesync_OtoQ_Delete_quote_product_line_fields
Scenario: Rally Test Case ID:  : Channel - Delete OtoQ_quote_product_line_fields
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I delete all mapping fields
    
@quotesync_OtoQ_quote_product_line_fields
Scenario: Rally Test Case ID:  : Channel - Save OtoQ_quote_product_line_fields
    When I click on "ServiceSource Setup" link
    And I click on "Mappings" link
    And I click on "Opportunity → Quote" link
    And I add quote sync custom fields to "Quote Product Line Item Fields"
    And I save the Mapping
    
#---------------------------------------------------------------
   
@QuoteSyncing_CreateStandardQuote
Scenario: Rally-ID:  : Quote Sync - Create quote from standard salesforce 
	When I click on the "Opportunities" grid tab	
	Then I select the "RenewalOpportunity"
	And I create new quote by OOB
#---------------------------------------------------------------
# Quote Sync Field update and verification
#---------------------------------------------------------------

   
@quotesync_Copy_OppFieldstoQuoteFields
Scenario: Rally Test Case ID:  - Quote Sync - Copy Opportunity fields to quote fields.
    When I click on the "Opportunities" grid tab
    Then I create Source Opportunity with Line Items and resolve it	
    And I create new quote by OOB
	And I navigate to opportunity from quote page
	And I sync the quotes from Quote
	And I update the fields on opportunity
	And I navigate to synced quote details page from opportunity
	Then I verify opportunity fields copied to quote fields on quote page
	
@quotesync_Copy_QuoteFieldstoOppFields
Scenario: Rally Test Case ID:  - Quote Sync - Copy Quote fields to Opp fields.
    When I click on the "Opportunities" grid tab	
	Then I create Source Opportunity with Line Items and resolve it
	And I create new quote by OOB
	And I navigate to opportunity from quote page
	And I sync the quotes from Quote
	And I navigate to synced quote details page from opportunity 
	And I update the fields on quote page
	And I navigate to opportunity from quote page
	Then I verify quote fields copied to opportunity fields on opportunity page
	
@quotesync_Copy_OLItoQLI
Scenario: Rally Test Case ID:  - Quote Sync - Copy Opportunity line item fields to quote line item fields.
    When I click on the "Opportunities" grid tab	
	Then I create Source Opportunity with Line Items and resolve it
	And I create new quote by OOB
	And I navigate to opportunity from quote page
	And I sync the quotes from Quote
	And I update the fields on opportunity line item
	Then I navigate to opportunity from product detail page
	And I navigate to synced quote details page from opportunity
	Then I verify OLI fields copied to QLI
	
@quotesync_Copy_QLItoOLI
Scenario: Rally Test Case ID:  - Quote Sync - Copy Quote line item fields to Opp line item fields.
    When I click on the "Opportunities" grid tab	
	Then I create Source Opportunity with Line Items and resolve it
	And I create new quote by OOB
	And I navigate to opportunity from quote page
	And I sync the quotes from Quote
	And I navigate to synced quote details page from opportunity
	And I update the fields on quote line item
	And I navigate to opportunity from quote page
	Then I verify QLI fields copied to OLI
	
	
	

    
    
    
	
	 

	
	
	


