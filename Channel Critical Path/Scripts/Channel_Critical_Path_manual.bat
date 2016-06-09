rem Set parameters
set _browser=ie
set _role=CHANNELNETOPS_EETEST2
set _tag=ServiceSourceSetup

rem Get date time to set in filename
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%

rem Set filename for results file
set _filename=../Results/%_role%_%_browser%_%_tag%_%_my_datetime%.html

rem Navigate to the directory with the batch file and scripts
cd /d %~dp0

rem Run cucumber
cucumber ../Features -r ../Features --format html --out %_filename% --tags @%_tag% UserRole='%_role%' Browser='%_browser%' --guess
