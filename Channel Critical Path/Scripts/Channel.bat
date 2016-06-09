rem navigate to the directory where the batch file and scripts exists
cd /d %~dp0


start cmd /k call Channel_Critical_Path chrome ChannelPortalConfigurationFeature CHANNELNETOPS_EETEST4
