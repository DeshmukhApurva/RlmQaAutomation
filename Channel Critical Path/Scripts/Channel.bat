rem navigate to the directory where the batch file and scripts exists
cd /d %~dp0


rem start cmd /k call Channel_Critical_Path chrome syncing_asset_service_contract_fields CHANNELPARTNER_EETEST4
start cmd /k call Channel_Critical_Path chrome quotesync_TC5359_rebuildandconsolidate CHANNELMANAGER_EETEST4
rem start cmd /k call Channel_Critical_Path firefox create_new_request CHANNELPARTNER_EETEST4
rem start cmd /k call Channel_Critical_Path firefox fieldsMapping CHANNELNETOPS_EETEST4