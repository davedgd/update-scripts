#!/bin/bash

clear

printf "\n### OS ###\n\n"
sudo apt update
sudo apt upgrade -y --allow-downgrades
sudo apt autoremove -y

printf "\n### Snaps ###\n\n"
sudo snap refresh

printf "\n### LaTeX ###\n\n"
tlmgr update --self
tlmgr update --all

printf "\n### Python ###\n\n"
mamba update --all -y
mamba list | grep pypi | cut -d' ' -f1 | xargs pip install --upgrade # update pip packages
mamba clean --all -y

printf "\n### R ###\n\n"
Rscript <(echo $'update.packages(type = "source", ask = FALSE, repos = "https://cloud.r-project.org")')
