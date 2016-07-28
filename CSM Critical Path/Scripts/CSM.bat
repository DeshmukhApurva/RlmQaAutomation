rem navigate to the directory where the batch file and scripts exists
cd /d %~dp0


start cmd /k call CSM_Critical_Path chrome CSM_CreateSuccessPlan CSM_EETEST4
