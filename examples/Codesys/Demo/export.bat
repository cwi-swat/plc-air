@echo off
echo General Export script for CODESYS projects
echo Simply paste export.bat / batch.cmd into your codesys directory and double tap export.bat
for /r %%x in (*.pro) do set projectname="%%x"
echo Exporting %projectname%`
del /q ".\Export\*.*"
replace yesall
"%dir_codesys%"\Codesys.exe %projectname% /show hide /cmd batch.cmd 
echo removing all library exports
del /q ".\Export\*.LIB*"
