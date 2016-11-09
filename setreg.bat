:: Set an environment variable in the current session and the registry.

:: Set, delete, or show value of an environment variable in the local
:: environment *and* the user registry.
:: Combines set, setx, and reg commands.

:: Todo:
:: add -m option to specify machine registry keys instead of user
:: set uvar="HKCU\Environment"
:: set mvar="HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"

:: For more information see 
:: http://stackoverflow.com/a/18899441/243392

@echo off

rem no arguments: show help
rem note: can't use :: comments near the if statements - must use rem
if "%1" == "" (

  echo.
  echo SETREG
  echo Set, delete, or show value of an environment variable in the local
  echo environment *and* the registry. Combines set, setx, and reg commands. 
  echo.
  echo Usage: SETREG [-d] variable [value]
  echo.
  echo SETREG variable             show value
  echo SETREG variable value       set value
  echo SETREG -d variable          delete variable
  echo.
  echo Note: Currently only the user registry is used, not the system registry.
  echo.
  echo To pass a value that includes semicolons or equal signs, e.g. a Java
  echo classpath, enclose the value in double quotes. 
  echo.
  
rem -d option: delete variable
) else if "%1" == "-d" (

  :: delete variable (just clear it - can't actually delete it)
  set %2= 
  :: /f forces the delete without asking for confirmation
  reg delete HKCU\Environment /v %2 /f
  echo.

rem one value: show value
) else if "%~2" == "" (

  :: show value
  set %1
  reg query HKCU\Environment /v %1
  echo.
  
rem two values: set value
) else (

  :: set value
  set %1=%~2
  echo %1 -^> %~2
  setx %1 %~2
  reg query HKCU\Environment /v %1
  echo.
  
)

