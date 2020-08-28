choco upgrade all -y
mpm --admin --update
powershell -command "Get-CimInstance -Namespace \"Root\cimv2\mdm\dmmap\" -ClassName \"MDM_EnterpriseModernAppManagement_AppManagement01\" | Invoke-CimMethod -MethodName UpdateScanMethod"
@rem pip-review --auto
Rscript -e "update.packages(type = 'binary', ask = FALSE, repos = 'https://cloud.r-project.org')"
UsoClient ScanInstallWait

@echo off

set packages=pip install --upgrade
for /f "tokens=1" %%i in ('conda list ^| findstr /R /C:"pypi"') do (call :join %%i)
@echo on
%packages%
@echo off
goto :continue

:join
set packages=%packages% %1
goto :eof

:continue
conda update --all -y