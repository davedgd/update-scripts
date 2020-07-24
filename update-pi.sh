#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y 
#sudo SKIP_WARNING=1 rpi-update 
sudo apt-get autoremove -y 
sudo apt-get autoclean -y 
sudo reboot