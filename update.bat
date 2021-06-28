choco upgrade all -y
call tlmgr update --self
call tlmgr update --all
powershell -command "Get-CimInstance -Namespace \"Root\cimv2\mdm\dmmap\" -ClassName \"MDM_EnterpriseModernAppManagement_AppManagement01\" | Invoke-CimMethod -MethodName UpdateScanMethod"
pip-review --auto
Rscript -e "update.packages(type = 'binary', ask = FALSE, repos = 'https://cloud.r-project.org')"
UsoClient ScanInstallWait

goto skip

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
call conda update --all -y
call conda clean --all -y

:skip
