choco upgrade all -y
pip-review --auto
Rscript -e "update.packages(type = 'binary', ask = FALSE, repos = 'https://cloud.r-project.org')"
UsoClient ScanInstallWait