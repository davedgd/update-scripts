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
mamba update --all -y
mamba list | grep pypi | cut -d' ' -f1 | xargs pip install --upgrade # update pip packages
mamba clean --all -y

printf "\n### R ###\n\n"
Rscript <(echo $'update.packages(type = "binary", ask = FALSE, repos = "https://cloud.r-project.org")')

printf "\n### App Store ###\n\n"
brew install mas # requires mas-cli: brew install mas

printf "\n### macOS ###\n\n"
softwareupdate -i -a
