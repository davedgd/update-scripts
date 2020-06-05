choco upgrade all -y
powershell -command "Get-CimInstance -Namespace \"Root\cimv2\mdm\dmmap\" -ClassName \"MDM_EnterpriseModernAppManagement_AppManagement01\" | Invoke-CimMethod -MethodName UpdateScanMethod"
pip-review --auto
Rscript -e "update.packages(type = 'binary', ask = FALSE, repos = 'https://cloud.r-project.org')"
UsoClient ScanInstallWait