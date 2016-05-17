rem navigate to the directory where the batch file and scripts exists
cd /d %~dp0


start cmd /k call CSM_Critical_Path chrome SuccessPlan CSMNetOps_EETEST4 
start cmd /k call CSM_Critical_Path chrome SuccessTasks CSMNetOps_EETEST4
start cmd /k call CSM_Critical_Path chrome ServiceSourceSetup CSMNetOps_EETEST4
start cmd /k call CSM_Critical_Path chrome Overview CSMNetOps_EETEST4


rem start cmd /k call CSM_Critical_Path chrome CSMSuccessPlan CSM_EETEST4
rem start cmd /k call CSM_Critical_Path chrome CSMSuccessTasks CSM_EETEST4
rem start cmd /k call CSM_Critical_Path chrome CSMOverview CSM_EETEST4
