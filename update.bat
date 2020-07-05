choco upgrade all -y
powershell -command "Get-CimInstance -Namespace \"Root\cimv2\mdm\dmmap\" -ClassName \"MDM_EnterpriseModernAppManagement_AppManagement01\" | Invoke-CimMethod -MethodName UpdateScanMethod"
@rem pip-review --auto
conda update --all -y
Rscript -e "update.packages(type = 'binary', ask = FALSE, repos = 'https://cloud.r-project.org')"
UsoClient ScanInstallWait