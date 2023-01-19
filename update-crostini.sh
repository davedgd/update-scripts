#!/bin/bash

clear

printf "\n### OS ###\n\n"
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

printf "\n### Flatpak ###\n\n"
flatpak update -y

printf "\n### Python ###\n\n"
mamba update --all -y
mamba list | grep pypi | cut -d' ' -f1 | xargs pip install --upgrade # update pip packages
mamba clean --all -y

printf "\n### R ###\n\n"
Rscript <(echo $'update.packages(type = "source", ask = FALSE, repos = "https://cloud.r-project.org")')
