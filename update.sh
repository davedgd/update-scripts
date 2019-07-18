#!/bin/bash

clear

printf "\n### TeX ###\n\n"
tlmgr update --self
tlmgr update --all

clear

printf "\n### Homebrew ###\n\n"
brew update
brew upgrade
brew cask upgrade
brew cleanup -s -prune=0

clear

printf "\n### Python ###\n\n"
pip-review --auto

clear

printf "\n### R ###\n\n"
Rscript <(echo $'update.packages(type = "binary", ask = FALSE, repos = "https://cloud.r-project.org")')

clear

printf "\n### macOS ###\n\n"
softwareupdate -i -a

clear