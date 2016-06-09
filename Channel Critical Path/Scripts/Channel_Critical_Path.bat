rem Set parameters
set _browser=%1
set _role=%3
set _tag=%2

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
