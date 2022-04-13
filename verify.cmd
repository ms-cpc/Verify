@echo off
:: This was a batch I included with my reports. I would MD5 hash all my files on the disclosure disk/usb to checksum.md5
:: The recipient would run "verify.cmd" which would go and verify the files.
::===================================================================================================
:: ######################################################
:: VERSION 0.1.150108z - Jan 2015
:: SCRIPT: Verify
:: CREATION DATE: 2015-01-08
:: LAST MODIFIED: 2015-01-08
:: AUTHOR: Mark SOUTHBY
:: ######################################################
title REPORT VERIFICATION
color 02
echo REPORT VERIFICATION
:: HASH AND VERIFY TOOLS
DELIVERABLES\VERIFY\md5sum.exe -c checksums.md5 > %tmp%\verify.txt
find /c /i "FAILED" %tmp%\verify.txt > NUL
if %ERRORLEVEL% == 0 goto FAILED
color 0a
ECHO ALL FILES VERIFIED, NO ERRORS FOUND.
pause
del %tmp%\verify.txt
exit

:FAILED
COLOR 0c
ECHO MD5 CHECKSUM FAILED. PLEASE NOTE THE ERROR MESSAGE AND 
ECHO CONTACT SENDER IMMEDIATELY!
ECHO.
ECHO.
ECHO Save the open text file and send it to email@org.org
notepad %tmp%\verify.txt
pause
exit