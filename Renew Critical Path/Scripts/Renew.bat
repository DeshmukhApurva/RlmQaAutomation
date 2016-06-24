<<<<<<< HEAD
rem navigate to the directory where the batch file and scripts exists
cd /d %~dp0


start cmd /k call Renew_Critical_Path firefox ServiceContractsToOppMapping RENEWNETOPS_EETEST4
=======
rem navigate to the directory where the batch file and scripts exists
cd /d %~dp0

start cmd /k call Renew_Critical_Path chrome valid_renewal_relationship RENEWNETOPS_EETEST4
>>>>>>> refs/remotes/origin/612_v1.36.8
