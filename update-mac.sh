#!/bin/bash

printf "\n### Homebrew ###\n\n"
brew update
brew upgrade
brew upgrade --cask
brew cleanup -s --prune='all'

printf "\n### LaTeX ###\n\n"
tlmgr update --self
tlmgr update --all

printf "\n### R ###\n\n"
Rscript <(echo $'update.packages(type = "binary", ask = FALSE, repos = "https://cloud.r-project.org")')

printf "\n### Python ###\n\n"
#pip-review --auto
mamba update --all -y
mamba list | grep pypi | cut -d' ' -f1 | xargs pip install --upgrade # update pip packages
conda clean --all -y # swap for conda to fix temporary bug

printf "\n### Mac App Store ###\n\n"
# requires mas-cli: brew install mas
mas outdated
mas upgrade

printf "\n### macOS ###\n\n"
softwareupdate -ia
