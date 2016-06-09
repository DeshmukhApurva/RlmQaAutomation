@Overview
@OpportunityPipelineFeature
Feature: All features related to Overview - Opportunity Pipeline, Pipeline Chart

Background: Login to the Application
    Given that I navigate to the CRM application
    Then I should land on CRM home page

#@verifyFilters	
#Scenario: Rally Test Case ID: TC4433,TC4434,TC4435,TC4436,TC4444,TC4445,TC4446,TC4447,TC4448,TC4449,TC4450,TC4452, TC5858, TC5859, TC5860, TC5861, TC5862, TC5863 : Opportunity Pipeline - Expiration Quarter, Opportunity Pipeline - Country, Opportunity Pipeline - Reseller Rep, Opportunity Pipeline - Distributor Rep, Opportunity Pipeline - Clear all the filters, Opportunity Pipeline - Expiration Quarter Filter,Opportunity Pipeline - Country Filter,Opportunity Pipeline - Reseller Rep Filter:Account OWD is Public,Opportunity Pipeline - Reseller Rep Filter:Account OWD is Private,Opportunity Pipeline - Distributor Rep Filter:Account OWD is Public,Opportunity Pipeline - Distributor Rep Filter:Account OWD is Private,Opportunity Pipeline - Try various filter combinations
#	When I Navigate to "Overview" tab
#	And I check the default filter for "Expiration Quarter"
#	And I verify "Expiration Quarter" filter on Opportunity Pipeline chart
#	And I verify "Expiration Year" filter on Opportunity Pipeline chart
#	And I verify "Country" filter on Opportunity Pipeline chart
#	And I verify "Reseller Rep" filter on Opportunity Pipeline chart
#	And I verify "Distributor Rep" filter on Opportunity Pipeline chart
#	When I Navigate to "Opportunity" tab
#	When I Navigate to "Overview" tab
#	Then I clear all the filters



@verifyCharts
Scenario: Rally Test Case ID: TC4437,TC4438,TC4439,TC4440,TC4441,TC4442,TC4443,TC4470,TC4471,TC4523,TC4524,TC4525,TC4529,TC4530 : Opportunity Pipeline - Orange color portion,Opportunity Pipeline - Blue color portion,Opportunity Pipeline - Click on Chart (Orange color),Opportunity Pipeline - Click on Chart (Blue color),Opportunity Pipeline - Hover over chart,Opportunity Pipeline - Hover over chart in multi currency org,Opportunity Pipeline - Data display definition,Opportunity - Visibility of selected "Available to Partner" sales stages in Opportunity Pipeline,Opportunity - Click on chart and check visibility of selected "Available to Partner" sales stages in Opportunity Pipeline,Portal Overview Page: Sales Stages not to display in Pipeline Chart,Portal Overview Page: Sales Stages to display in Pipeline Chart,Portal Overview Page: Bar(Orange and Blue) and its value for Sales Stages display in Pipeline Chart,Pipeline Chart: Click on pipeline chart when Sales Stage is available to partner and Display in Pipeline,Pipeline Chart: Click on pipeline chart when Sales Stage is available not available to partner but available to Display in Pipeline
  When I Navigate to "Overview" tab
  	Then I clear all the filters
  	And I verify "Expiration Quarter" filter on Opportunity Pipeline chart
  	And I verify "Expiration Year" filter on Opportunity Pipeline chart
    And I verify data display on charts
  	
  	When I log into "CHANNELNETOPS_EETEST2" details
  	When I Navigate to "ServiceSource Setup" tab
	And I click on "Channel Portal Configuration" link
	And Set Enable Two Tier Pricing check box to "true" value
	And I click on "Save"
	When I Navigate to "Accounts" tab
 	And I set Partner Account Type on Account ID "0011a00000KahZM" to "Reseller" type
 	When I log into "CHANNELPARTNER_EETEST2" details
  	When I Navigate to "Overview" tab
	And I verify the blue chart when Account is "Reseller" and Enable Two Tier Pricing is "true" set

  	When I log into "CHANNELNETOPS_EETEST2" details
  	When I Navigate to "ServiceSource Setup" tab
	And I click on "Channel Portal Configuration" link
	And Set Enable Two Tier Pricing check box to "false" value
	And I click on "Save"
 	When I log into "CHANNELPARTNER_EETEST2" details
  	When I Navigate to "Overview" tab
	And I verify the blue chart when Account is "Reseller" and Enable Two Tier Pricing is "false" set
#
  	When I log into "CHANNELNETOPS_EETEST2" details
  	When I Navigate to "ServiceSource Setup" tab
	And I click on "Channel Portal Configuration" link
	And Set Enable Two Tier Pricing check box to "true" value
	And I click on "Save"
	When I Navigate to "Accounts" tab
 	And I set Partner Account Type on Account ID "0011a00000KahZM" to "Distributor" type
 	When I log into "CHANNELPARTNER_EETEST2" details
  	When I Navigate to "Overview" tab
	And I verify the blue chart when Account is "Distributor" and Enable Two Tier Pricing is "true" set
#
  	When I log into "CHANNELNETOPS_EETEST2" details
  	When I Navigate to "ServiceSource Setup" tab
	And I click on "Channel Portal Configuration" link
	And Set Enable Two Tier Pricing check box to "false" value
	And I click on "Save"
 	When I log into "CHANNELPARTNER_EETEST2" details
  	When I Navigate to "Overview" tab
	And I verify the blue chart when Account is "Distributor" and Enable Two Tier Pricing is "false" set
 
  	When I Navigate to "Overview" tab
	And I verify the orange chart

	
	
#@filterPreservation
#Scenario: Rally Test Case ID: TC4451 : Opportunity Pipeline - Preserving Filters
#	When I Navigate to "Overview" tab
#	And I select all the filters
#	When I Navigate to "Opportunities" tab
#	When I Navigate to "Overview" tab
#	And I verify that filters Preserved or not