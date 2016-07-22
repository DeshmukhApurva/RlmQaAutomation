@QuoteSyncingFeature 
Feature: All features related to Quote Syncing 

Background: Login to the Application 
	Given that I navigate to the CRM application 
	Then I should land on CRM home page 
#-----------------------------------------------------------------------------------------------------------------------
#                                                 QuoteSync_Mappings
#-----------------------------------------------------------------------------------------------------------------------
@quotesync_Delete_opportunity_to_quote_mappings 
Scenario: Rally Test Case ID:  : Channel - Delete opportunity to quote mapping
  When user logout from "OEM" application
  When I log into "CHANNELNETOPS_EETEST4" details
	When I click on "ServiceSource Setup" link 
	And I click on "Mappings" link 
	And I click on "Opportunity → Quote" link 
	And I delete all mapping fields
	
@quotesync_Delete__quote_to_opportunity_mappings 
Scenario: Rally Test Case ID:  : Channel - Delete quote to opportunity mapping 
	When user logout from "OEM" application
  When I log into "CHANNELNETOPS_EETEST4" details
	When I click on "ServiceSource Setup" link 
	And I click on "Mappings" link 
	And I click on "Quote → Opportunity" link 
	And I delete all mapping fields
		
@quotesync_opportunity_to_quote_mappings 
Scenario: Rally Test Case ID:  : Channel - Save opportunity to quote mapping 
	When user logout from "OEM" application
  When I log into "CHANNELNETOPS_EETEST4" details
	When I click on "ServiceSource Setup" link 
	And I click on "Mappings" link 
	And I click on "Opportunity → Quote" link 
	And I add quote sync "Quote Fields" in opportunity to quote mapping 
	And I save the Mapping
		
@quotesync_quote_to_opportunity_mappings 
Scenario: Rally Test Case ID:  : Channel - Save quote to opportunity mapping 
	When user logout from "OEM" application
  When I log into "CHANNELNETOPS_EETEST4" details
	When I click on "ServiceSource Setup" link 
	And I click on "Mappings" link 
	And I click on "Quote → Opportunity" link 
	And I add quote sync "Quote Fields" in quote to opportunity mapping 
	And I save the Mapping

	
@quotesync_QtoO_opportunity_line_item_fields 
Scenario:
Rally Test Case ID:  : Channel - Save QtoO_opportunity_line_item_fields 
	When user logout from "OEM" application
  When I log into "CHANNELNETOPS_EETEST4" details
	When I click on "ServiceSource Setup" link 
	And I click on "Mappings" link 
	And I click on "Quote → Opportunity" link 
	And I add quote sync custom fields to "Opportunity Line Item Fields" 
	And I save the Mapping
	
@quotesync_OtoQ_quote_product_line_fields 
Scenario: Rally Test Case ID:  : Channel - Save OtoQ_quote_product_line_fields 
	When user logout from "OEM" application
  When I log into "CHANNELNETOPS_EETEST4" details
	When I click on "ServiceSource Setup" link 
	And I click on "Mappings" link 
	And I click on "Opportunity → Quote" link 
	And I add quote sync custom fields to "Quote Product Line Item Fields" 
	And I save the Mapping 


#@quotesync_QtoO_Delete_opportunity_line_item_fields 
#Scenario:
#Rally Test Case ID:  : Channel - Delete QtoO_opportunity_line_item_fields 
#	When I click on "ServiceSource Setup" link 
#	And I click on "Mappings" link 
#	And I click on "Quote → Opportunity" link 
#	And I delete all mapping fields
#	
#@quotesync_OtoQ_Delete_quote_product_line_fields 
#Scenario: Rally Test Case ID:  : Channel - Delete OtoQ_quote_product_line_fields 
#	When I click on "ServiceSource Setup" link 
#	And I click on "Mappings" link 
#	And I click on "Opportunity → Quote" link 
#	And I delete all mapping fields
	
#-----------------------------------------------------------------------------------------------------------------------
	
@QuoteSyncing_CreateStandardQuote 
Scenario: Rally-ID:  : Quote Sync - Create quote from standard salesforce 
  When I log into "CHANNELNETOPS_EETEST4" details
	When I click on the "Opportunities" grid tab 
	Then I select the "RenewalOpportunity" 
	And I create new quote by OOB 


#-----------------------------------------------------------------------------------------------------------------------
#                                          Quote Sync Field update and verification
#-----------------------------------------------------------------------------------------------------------------------
	
	
@quotesync_TC5332_Copy_OppFieldstoQuoteFields 
Scenario:
Rally Test Case ID: TC5332 - Quote Sync - Copy Opportunity fields to quote fields.
 
	When I click on the "Opportunities" grid tab 
	Then I create Source Opportunity with Line Items and resolve it 
	And I create new quote by OOB 
	And I navigate to opportunity from quote page 
	And I sync the quotes from Quote 
	And I update the fields on opportunity 
	And I navigate to synced quote details page from opportunity 
	Then I verify opportunity fields copied to quote fields on quote page 
	
@quotesync_TC5331_Copy_QuoteFieldstoOppFields 
Scenario: Rally Test Case ID:TC5331  - Quote Sync - Copy Quote fields to Opp fields. 

	When I click on the "Opportunities" grid tab 
	Then I create Source Opportunity with Line Items and resolve it 
	And I create new quote by OOB 
	And I navigate to opportunity from quote page 
	And I sync the quotes from Quote 
	And I navigate to synced quote details page from opportunity 
	And I update the fields on quote page 
	And I navigate to opportunity from quote page 
	Then I verify quote fields copied to opportunity fields on opportunity page 
	
@quotesync_TC5332_Copy_OLItoQLI 
Scenario:
Rally Test Case ID: TC5332 - Quote Sync - Copy Opportunity line item fields to quote line item fields. 

	When I click on the "Opportunities" grid tab 
	Then I create Source Opportunity with Line Items and resolve it 
	And I create new quote by OOB 
	And I navigate to opportunity from quote page 
	And I sync the quotes from Quote 
	And I update the fields on opportunity line item 
	Then I navigate to opportunity from product detail page 
	And I navigate to synced quote details page from opportunity 
	Then I verify OLI fields copied to QLI 
	
@quotesyncTC5331_Copy_QLItoOLI 
Scenario:
Rally Test Case ID:  - Quote Sync - Copy Quote line item fields to Opp line item fields. 

	When I click on the "Opportunities" grid tab 
	Then I create Source Opportunity with Line Items and resolve it 
	And I create new quote by OOB 
	And I navigate to opportunity from quote page 
	And I sync the quotes from Quote 
	And I navigate to synced quote details page from opportunity 
	And I update the fields on quote line item 
	And I navigate to Quote detail page from QLI details page 
	And I navigate to opportunity from quote page 
	Then I verify QLI fields copied to OLI 
	
@quotesync_TC5330 
Scenario:
Rally Test Case ID:TC5330  - Quote: Create new quote from sales force standard UI, change the Quote and QLI fields those are mentioned on the Quote to Opportunity and QLI to OLI mapping page and sync it. 

	When I click on the "Opportunities" grid tab 
	Then I create Source Opportunity with Line Items and resolve it 
	And I create new quote by OOB 
	And I update the fields on quote page 
	And I update the fields on quote line item 
	And I navigate to Quote detail page from QLI details page 
	And I navigate to opportunity from quote page 
	And I sync the quotes from Quote 
	Then I verify quote fields copied to opportunity fields on opportunity page 
	Then I verify QLI fields copied to OLI 
	
	
@quotesync_TC5331 
Scenario:
Rally Test Case ID:TC5331  - Opportunity: Copy of Quote and Quote line item fields to Opportunity and Opportunity line item fields respectively if quote is created and synced from sales force standard UI. 

	When I click on the "Opportunities" grid tab 
	Then I create Source Opportunity with Line Items and resolve it 
	And I verify the quote is synced and update the custom fields on quote 
	Then I verify the Opportunity fields on opportunity page 
	And I verify the quote is synced and update the custom fields on quote line item 
	Then I verify the Opportunity line item fields on opportunity page 
	
	
@quotesync_TC5335 
Scenario:
Rally Test Case ID:TC5335 - Quote : Opportunity: Stop syncing of the quote from standard UI and update the Opportunity and opportunity line item. 

	When I click on the "Opportunities" grid tab 
	Then I create Source Opportunity with Line Items and resolve it 
	And I create new quote by OOB 
	And I navigate to opportunity from quote page 
	And I sync the quotes from Quote 
	And I stop the syncing of the quote 
	And I navigate to opportunity from quote page 
	And I update the fields on opportunity 
	And I update the fields on opportunity line item 
	Then I navigate to opportunity from product detail page 
	And I navigate to available quote 
	Then I verify opportunity fields copied to quote fields on quote page 
	Then I verify OLI fields copied to QLI 
	
@quotesync_TC5336 
Scenario:
Rally Test Case ID:TC5336 - Opportunity: syncing of the quote from standard UI and update the Quote and Quote line item. 

	When I click on the "Opportunities" grid tab 
	Then I create Source Opportunity with Line Items and resolve it 
	And I create new quote by OOB 
	And I navigate to opportunity from quote page 
	And I sync the quotes from Quote 
	And I update the fields on opportunity 
	And I update the fields on opportunity line item 
	Then I navigate to opportunity from product detail page 
	And I navigate to synced quote details page from opportunity 
	Then I verify opportunity fields copied to quote fields on quote page 
	Then I verify OLI fields copied to QLI 
	And I navigate to Quote detail page from QLI details page 
	And I navigate to opportunity from quote page 
	And I create new quote by OOB 
	And I navigate to opportunity from quote page 
	And I sync the quotes from Quote 
	And I navigate to synced quote details page from opportunity 
	And I update the fields on quote page 
	And I update the fields on quote line item 
	And I navigate to Quote detail page from QLI details page 
	And I navigate to opportunity from quote page 
	Then I verify quote fields copied to opportunity fields on opportunity page 
	Then I verify QLI fields copied to OLI 
	
@quotesync_TC5328 
Scenario:
Rally Test Case ID:TC5328 - Opportunity : Create new Quote from sales force standard UI 
	When I click on the "Opportunities" grid tab 
	Then I create Source Opportunity with Line Items and resolve it 
	And I update the fields on opportunity 
	And I update the fields on opportunity line item 
	Then I navigate to opportunity from product detail page 
	And I create new quote by OOB 
	And I navigate to opportunity from quote page 
	And I sync the quotes from Quote 
	And I navigate to synced quote details page from opportunity 
	Then I verify opportunity fields copied to quote fields on quote page 
	Then I verify OLI fields copied to QLI 
	
@quotesync_TC5329 
Scenario:
Rally Test Case ID:TC5329 - 	Opportunity : Sync a Quote from sales force standard UI and check manage renewals. 
	When I click on the "Opportunities" grid tab 
	Then I create Source Opportunity with Line Items and resolve it 
	And I create new quote by OOB 
	And I navigate to opportunity from quote page 
	And I sync the quotes from Quote 
	When I click on "Manage Renewals" button 
	And I select the "Renewal Relationship" product field 
	And I click on "Consolidate Opportunity" button from renewal relationship page 
	Then I should able to see the sync error message 
	Then I should click on back to navigate to opportunity from manage renewals page
	When I click on "Manage Renewals" button 
	And I select the "Renewal Relationship" product field 
	And I click on "Split Opportunity" button from renewal relationship page 
	Then I should able to see the sync error message 
	Then I should click on back to navigate to opportunity from manage renewals page
	And I delete the opportunity product
	When I click on "Manage Renewals" button 
	And I select the "Renewal Relationship" product field 
	And I click on "Rebuild Opportunity" button from renewal relationship page 
	Then I should able to see the sync error message
    
@quotesync_TC5338
Scenario: Rally Test Case ID:TC5338 - Create new quote from Add Partner Renewals page (Not yet synced), Now change the Quote and QLI fields those are mentioned on the quote to Opportunity and QLI to OLI mapping page and sync it by sales force standard UI.
  When I click on the "Opportunities" grid tab	
  Then I create Source Opportunity with Line Items and resolve it
  And I click on "Add New Partner Opportunity" button
  And I select the partner account
  And I click on the "Grant Access"
  And I navigate to Opportunity from partner Opportunity page
  And I navigate to available quote
  And I update the fields on quote page
  And I update the fields on quote line item
  And I navigate to Quote detail page from QLI details page
  And I navigate to opportunity from quote page
  And I sync the quotes from Quote
  Then I verify quote fields copied to opportunity fields on opportunity page
  Then I verify QLI fields copied to OLI
  Then I navigate to opportunity from product detail page
  When I click on "Manage Renewals" button 
  And I select the "Renewal Relationship" product field 
  And I click on "Consolidate Opportunity" button from renewal relationship page 
  Then I should able to see the sync error message 
  Then I should click on back to navigate to opportunity from manage renewals page
  When I click on "Manage Renewals" button 
  And I select the "Renewal Relationship" product field 
  And I click on "Split Opportunity" button from renewal relationship page 
  Then I should able to see the sync error message 
  Then I should click on back to navigate to opportunity from manage renewals page
  And I delete the opportunity product
  When I click on "Manage Renewals" button 
  And I select the "Renewal Relationship" product field 
  And I click on "Rebuild Opportunity" button from renewal relationship page 
  Then I should able to see the sync error message
	
	  
@quotesync_TC5356
Scenario: Rally Test Case ID:TC5356 - Stop the quote syncing which was created by add partner page and update the quote and quote line fields and sync the quote again.
  When I click on the "Opportunities" grid tab	
  Then I create Source Opportunity with Line Items and resolve it
  And I click on "Add New Partner Opportunity" button
  And I select the "To Master Opportunity" option from syncing dropdown
  And I select the partner account
  And I click on the "Grant Access"
  And I navigate to Opportunity from partner Opportunity page
  And I stop the syncing of the quote
  And I update the fields on quote page
  And I update the fields on quote line item
  And I navigate to Quote detail page from QLI details page
  And I navigate to opportunity from quote page
  Then I verify quote fields copied to opportunity fields on opportunity page
  Then I verify QLI fields copied to OLI
  Then I navigate to opportunity from product detail page
  And I sync the quotes from Quote
  And I update the fields on opportunity
  And I update the fields on opportunity line item
  Then I navigate to opportunity from product detail page
  And I navigate to synced quote details page from opportunity
  Then I verify opportunity fields copied to quote fields on quote page
  Then I verify OLI fields copied to QLI
  And I navigate to Quote detail page from QLI details page
  And I navigate to opportunity from quote page
  When I click on "Manage Renewals" button 
  And I select the "Renewal Relationship" product field 
  And I click on "Consolidate Opportunity" button from renewal relationship page 
  Then I should able to see the sync error message 
  Then I should click on back to navigate to opportunity from manage renewals page
  When I click on "Manage Renewals" button 
  And I select the "Renewal Relationship" product field 
  And I click on "Split Opportunity" button from renewal relationship page 
  Then I should able to see the sync error message 
  Then I should click on back to navigate to opportunity from manage renewals page
  And I delete the opportunity product
  When I click on "Manage Renewals" button 
  And I select the "Renewal Relationship" product field 
  And I click on "Rebuild Opportunity" button from renewal relationship page 
  Then I should able to see the sync error message
  
  
@quotesync_TC5342
Scenario: Rally Test Case ID:TC5342 - Opportunity : Copy of Quote and Quote line item fields to Opportunity and Opportunity line item fields respectively if quote is created and synced from add renewals partner page.
  When I click on the "Opportunities" grid tab	
  Then I create Source Opportunity with Line Items and resolve it
  And I click on "Add New Partner Opportunity" button
  And I select the "To Master Opportunity" option from syncing dropdown
  And I select the partner account
  And I click on the "Grant Access"
  And I navigate to Opportunity from partner Opportunity page
  And I navigate to synced quote details page from opportunity
  And I update the fields on quote page
  And I update the fields on quote line item
  And I navigate to Quote detail page from QLI details page
  And I navigate to opportunity from quote page
  Then I verify quote fields copied to opportunity fields on opportunity page
  Then I verify QLI fields copied to OLI

@quotesync_TC5343
Scenario: Rally Test Case ID:TC5343 - Quote : Copy of Opportunity and Opportunity line items fields to Quote and Quote line items respectively if quote is created and synced from Add Renewals Partner screen.
    When I click on the "Opportunities" grid tab	
	Then I select the "RenewalOpportunity"
	And I click on "Add New Partner Opportunity" button
    And I select the "To Master Opportunity" option from syncing dropdown
    And I select the partner account
    And I click on the "Grant Access"
    And I navigate to Opportunity from partner Opportunity page
    And I update the fields on opportunity
    And I update the fields on opportunity line item
	Then I navigate to opportunity from product detail page
	And I navigate to synced quote details page from opportunity
	Then I verify opportunity fields copied to quote fields on quote page
	Then I verify OLI fields copied to QLI
	
@quotesync_TC5359_rebuildandconsolidate
Scenario: Rally Test Case ID:TC5359 part I - Original line item check on OLI and RR after adding new quote from standard sales force UI
  When I click on the "Opportunities" grid tab	
  Then I create Source Opportunity with Line Items and resolve it
  And I create new quote by OOB
  And I navigate to opportunity from quote page
  And I delete the opportunity product
  When I click on "Manage Renewals" button
  And I select the "Renewal Relationship" product field
  And I click on "Rebuild Opportunity" button from renewal relationship page
  When I click on "Manage Renewals" button
  When I click on "Consolidate Opportunity" button
  And I select the "New Opportunity" opportunity option and fill the required fields
  And I click on "Consolidate" button from renewal relationship page
	
@quotesync_TC5359_rsplit
Scenario: Rally Test Case ID:TC5359 part II - Original line item check on OLI and RR after adding new quote from standard sales force UI
  When I click on the "Opportunities" grid tab	
  Then I create Source Opportunity with Line Items and resolve it
  And I create new quote by OOB
  And I navigate to opportunity from quote page
  When I click on "Manage Renewals" button
  And I select the multiple "Renewal Relationship" product fields
  And I click on "Split Opportunity" button from renewal relationship page
  And I select the "New Opportunity" opportunity option and fill the required fields
  And I click on "Split Selected" button from renewal relationship page
  
@quotesync_TC5354
Scenario: Rally Test Case ID:TC5354 - Delete the existing quote line items of the synced quote and add new quote line items with the same products .
  When I click on the "Opportunities" grid tab	
  Then I create Source Opportunity with Line Items and resolve it
  And I create new quote by OOB
  And I navigate to opportunity from quote page
  And I sync the quotes from Quote
  And I navigate to synced quote details page from opportunity
  And I delete the product from "Quote" LineItem
  And I add the product to "Quote" object
  And I navigate to opportunity from quote page
  When I click on "Manage Renewals" button
  And I select the "Renewal Relationship" product field
  And I click on "Consolidate Opportunity" button from renewal relationship page
  Then I should able to see the sync error message
  Then I should click on back to navigate to opportunity from manage renewals page
  When I click on "Manage Renewals" button
  And I select the "Renewal Relationship" product field
  And I click on "Split Opportunity" button from renewal relationship page
  Then I should able to see the sync error message
  Then I should click on back to navigate to opportunity from manage renewals page
  And I delete the opportunity product
  When I click on "Manage Renewals" button
  And I select the "Renewal Relationship" product field
  And I click on "Rebuild Opportunity" button from renewal relationship page
  Then I should able to see the sync error message 
  Then I should click on back to navigate to opportunity from manage renewals page
  
@quotesync_TC5355
Scenario: Rally Test Case ID:TC5355 -Delete the opportunity line items and sync the quote which is having same product line items as deleted from opportunity.
  When I click on the "Opportunities" grid tab	
  Then I create Source Opportunity with Line Items and resolve it
  And I delete the product from "Opportunity" LineItem
  And I create new quote by OOB
  And I add the product to "Quote" object
  And I navigate to opportunity from quote page
  And I sync the quotes from Quote
  And I navigate to synced quote details page from opportunity
  And I update the fields on quote page
  And I update the fields on quote line item
  And I navigate to Quote detail page from QLI details page
  And I navigate to opportunity from quote page
  Then I verify quote fields copied to opportunity fields on opportunity page
  Then I verify QLI fields copied to OLI
  Then I navigate to opportunity from product detail page
  When I click on "Manage Renewals" button
  And I select the "Renewal Relationship" product field
  And I click on "Consolidate Opportunity" button from renewal relationship page
  Then I should able to see the sync error message
  Then I should click on back to navigate to opportunity from manage renewals page
  When I click on "Manage Renewals" button
  And I select the "Renewal Relationship" product field
  And I click on "Split Opportunity" button from renewal relationship page
  Then I should able to see the sync error message
  Then I should click on back to navigate to opportunity from manage renewals page
  And I delete the opportunity product
  When I click on "Manage Renewals" button
  And I select the "Renewal Relationship" product field
  And I click on "Rebuild Opportunity" button from renewal relationship page
  Then I should able to see the sync error message
  
@quotesync_TC5349
  Scenario: Rally Test Case ID:TC5349 -	Quotes Tab: When PO Syncing is as "To Master Opportunity", Select primary Quote checkbox for Quote
    Tags:
    When I click on the "Opportunities" grid tab
    Then I create Source Opportunity with Line Items and resolve it
    #Then I update the earliest expiration date
    And I click on "Add New Partner Opportunity" button
    #Then I verify the "Opportunity" name and corresponding "Account" name
    And I select the "Partner Accounts" from the accounts lookup list
    #And I navigate to "Partner Contact(s)" section
    #And I select the "Partner Account Contacts" from the contacts lookup list
    And I select the account as "Reseller" or "Distributor"
    And I select the "Incumbent" checkbox
    And I select the "To Master Opportunity" option from syncing dropdown
    And I click on the "Grant Access"
    Then I should be able to see the partner opportunity account details
    And I navigate to Opportunity from partner Opportunity page
    And I create new quote for newly created PO
    When user logout from "OEM" application
    When I log into "CHANNELPARTNER_EETEST4" details
    When I click on "Opportunities" tab
    And I search for the partner opportunity on Community
    And I click on "Quotes" tab
    And I Set new Quote as primary 
    
@quotesync_Test
  Scenario: Rally Te
    When user logout from "OEM" application
    When I log into "CHANNELPARTNER_EETEST4" details
    When I click on "Opportunities" tab
    And I search for the partner opportunity on Community