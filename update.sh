#!/bin/bash

printf "\n### Homebrew ###\n\n"
brew update
brew upgrade
brew upgrade --cask
brew cleanup -s --prune='all'

printf "\n### TeX ###\n\n"
tlmgr update --self
tlmgr update --all

printf "\n### Python ###\n\n"
#pip-review --auto
conda update --all -y
conda list | grep pypi | cut -d' ' -f1 | xargs pip install --upgrade # update pip packages

printf "\n### R ###\n\n"
Rscript <(echo $'update.packages(type = "binary", ask = FALSE, repos = "https://cloud.r-project.org")')

printf "\n### macOS ###\n\n"
softwareupdate -i -a