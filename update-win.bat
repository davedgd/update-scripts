@echo off
echo.
echo ### Chocolatey ###
@echo on

choco upgrade all -y

@echo off
echo.
echo ### TinyTeX ###
@echo on

call tlmgr update --self
call tlmgr update --all

@rem @echo off
@rem echo.
@rem echo ### MiKTeX ###
@rem @echo on

@rem miktex packages update
@rem miktex --admin packages update

@echo off
echo.
echo ### Microsoft Store ###
@echo on

powershell -command "Get-CimInstance -Namespace \"Root\cimv2\mdm\dmmap\" -ClassName \"MDM_EnterpriseModernAppManagement_AppManagement01\" | Invoke-CimMethod -MethodName UpdateScanMethod"

@echo off
echo.
echo ### R ###
@echo on

Rscript -e "update.packages(type = 'binary', ask = FALSE, repos = 'https://cloud.r-project.org')"

@echo off
echo.
echo ### Windows Update ###
@echo on

UsoClient ScanInstallWait

@echo off
echo.
echo ### Python ###
@echo on

@rem pip-review --auto

@rem goto skip

@echo off

set packages=pip install --upgrade
for /f "tokens=1" %%i in ('mamba list ^| findstr /R /C:"pypi"') do (call :join %%i)
@echo on
%packages%
@echo off
goto :continue

:join
set packages=%packages% %1
goto :eof

:continue
call mamba update --all -y
call mamba clean --all -y

:skip
