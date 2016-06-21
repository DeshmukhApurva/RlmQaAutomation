cd /d %~dp0

rem Run cucumber
rem cucumber ../Features -r ../Features --format html --out %_filename% --tags @%_tag% UserRole='%_role%' Browser='%_browser%' --guess

start cmd /k call Renew_Critical_Path chrome RenWithinFiscalYear RENEW_EETEST4
