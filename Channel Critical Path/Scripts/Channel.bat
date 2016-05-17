rem navigate to the directory where the batch file and scripts exists
cd /d %~dp0

start cmd /k call Channel_Critical_Path chrome ServiceSourceSetupModule CHANNELNETOPS_DEV19

start cmd /k call Channel_Critical_Path chrome GrantAccessModule ADMIN_DEV19
start cmd /k call Channel_Critical_Path chrome PartnerOpportunityModule CHANNELMANAGER_EETEST4

start cmd /k call Channel_Critical_Path chrome CommunityModule CHANNELPARTNER_DEV19
start cmd /k call Channel_Critical_Path chrome AccountsModule CHANNELPARTNER_DEV19
start cmd /k call Channel_Critical_Path chrome OpportunitiesModule CHANNELPARTNER_DEV19
start cmd /k call Channel_Critical_Path chrome OverviewModule CHANNELPARTNER_DEV19
start cmd /k call Channel_Critical_Path chrome RequestsModule CHANNELPARTNER_DEV19