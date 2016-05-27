@ServiceSourceSetup
@ChannelPortalConfigurationFeature
Feature: All features related to ServiceSource Setup - Channel Portal Configuration

Background: Login to the Application
 	Given that I navigate to the CRM application
	Then I should land on CRM home page

@verifyChannelLinks
Scenario: Rally Test Case ID: TC4286 : Channel Management links - SS License
	When I Navigate to "ServiceSource Setup" tab
	And I verify the "Channel Management"	

@portalOverview
Scenario: Rally Test Case ID: TC4289 : Channel Portal Configuration Page: Available Sales Stages section for Portal Overview page Pipeline Chart
	When I Navigate to "ServiceSource Setup" tab
	And I click on "Channel Portal Configuration" link
	Then I verify Portal Overview page Pipeline Chart section
	
	
@verifyportalOverview
Scenario: Rally Test Case ID: TC4290,TC4291,TC4292 : Channel Portal Configuration Page: Default Available Sales Stages in "Hidden from Pipeline"/"Display in Pipeline" selection field,Channel Portal Configuration Page: Add/Remove Sales Stages to/from "Hidden from Pipeline"/"Display in Pipeline" selection field,Channel Portal Configuration page: "Show Opportunities with Unavailable Stages" checkbox
	When I Navigate to "ServiceSource Setup" tab
	And I click on "Channel Portal Configuration" link
	Then I add or remove Sales stages from "Hidden from Pipeline" to "Display in Pipeline"
	Then I add or remove Sales stages again from "Display in Pipeline" to "Hidden from Pipeline"
	And I verify "Show Opportunities for Unavailable Stage" checkbox

@verify2TierPricing
Scenario: Rally Test Case ID: TS5457,TS5458 : Channel Portal Config - Check the "Enable 2 Tier Pricing" checkbox.
	When I Navigate to "ServiceSource Setup" tab 
	And I click on "Channel Portal Configuration" link
	And I verify "Enable 2 Tier Pricing" checkbox