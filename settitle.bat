:: set console titlebar to current directory
:: source: http://windowsitpro.com/windows/jsi-tip-5316-how-do-i-get-batch-file-display-current-directory-title-bar
:: can't access cd/pwd easily as in linux
:: basically does CurDir = `cd`
@for /f "Tokens=*" %%i in ('CD') do @set CurDir=%%i 
@title %CurDir%

