#!/bin/bash

clear

printf "\n### OS ###\n\n"
sudo apt update
sudo apt upgrade -y

clear

printf "\n### Python ###\n\n"
pip-review --auto

clear

printf "\n### R ###\n\n"
Rscript <(echo $'update.packages(type = "source", ask = FALSE, repos = "https://cloud.r-project.org")')

clear
