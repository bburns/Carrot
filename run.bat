:: run a python program - remembers last program - no .py needed

@echo off

rem no arguments: run previous program
rem note: can't use :: comments near the if statements - must use rem
if "%1" == "" (

  @python %LastPythonProgram%.py 
 
) else (

  set LastPythonProgram=%1
  @python %1.py
  
)


