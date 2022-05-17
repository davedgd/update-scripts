choco upgrade all -y
call tlmgr update --self
call tlmgr update --all

@rem call miktex packages update
@rem call miktex --admin packages update

powershell -command "Get-CimInstance -Namespace \"Root\cimv2\mdm\dmmap\" -ClassName \"MDM_EnterpriseModernAppManagement_AppManagement01\" | Invoke-CimMethod -MethodName UpdateScanMethod"
@rem pip-review --auto
Rscript -e "update.packages(type = 'binary', ask = FALSE, repos = 'https://cloud.r-project.org')"
UsoClient ScanInstallWait

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
