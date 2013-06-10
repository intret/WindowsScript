
@call:lable
@echo ERROR LEVEL : %ERRORLEVEL%
@if %ERRORLEVEL% GTR 999 echo Great!
@pause

@goto END:

:lable

@echo callee...
@exit /B 1000

:END
@pause