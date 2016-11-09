:: View and modify .gitignore file - pass -e to edit in editor, -h for help

@echo off

rem -h option: show help
if "%1" == "-h" (

  echo.
  echo GITI
  echo View and modify contents of .gitignore
  echo.
  echo giti       show contents of .gitignore
  echo giti foo   add foo to .gitignore
  echo giti -e    edit .gitignore in editor
  echo giti -h    show help
  echo.

rem no arguments: show file
) else if "%1" == "" (

  cat .gitignore
  echo.

rem -e option: edit file in editor
) else if "%1" == "-e" (

  rem . create file if not there? 
  echo Editing .gitignore...
  %EDITOR% .gitignore
  :: cat .gitignore
  echo.

rem otherwise: add filespec to editor
) else (

  echo Adding %1 to .gitignore...
  echo %1>>.gitignore
  :: cat .gitignore
  echo.

)

