#!/bin/bash

printf "\n"; clear

printf "### TeX ###\n\n"
tlmgr update --self
tlmgr update --all

printf "\n"; clear

printf "### Homebrew ###\n\n"
brew update
brew upgrade
brew cask upgrade
brew cleanup -s -prune=0

printf "\n"; clear

printf "### Python ###\n\n"
pip-review --auto

printf "\n"; clear

printf "### R ###\n\n"
Rscript <(echo $'update.packages(type = "binary", ask = FALSE, repos = "https://cloud.r-project.org")')

printf "\n"; clear

printf "### macOS ###\n\n"
softwareupdate -i -a

printf "\n"; clear