#! /bin/bash

# update system
sudo apt-get update

# install python, curl, nodejs and npm
sudo apt-get install python -y
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# creating meanadm admin with a home directory and setting default shell
sudo useradd --create-home meanadm
sudo usermod --shell /bin/bash meanadm

# briefly carries a task on user - meanadm to git clone front & back end repo
sudo su - meanadm -c "git clone -b Developer https://github.com/Nboaram/TeamAPoolProjectBackend.git && git clone -b Developer https://github.com/Nboaram/TeamAPoolProjectUI.git"

# install npm dependencies as meanadm in front/back end repo
sudo su - meanadm -c "cd TeamAPoolProjectBackend && npm install"
sudo su - meanadm -c "cd TeamAPoolProjectUI && npm install"

# installing angular globally
yes | sudo npm -g install @angular/cli

# delete mongodb and angular service file if already exists
sudo rm -f /etc/systemd/system/mongodb.service
sudo rm -f /etc/systemd/system/angular.service

# copy mongodb and angular service file to systemd
sudo cp ../mongodb.service /etc/systemd/system
sudo cp ../angular.service /etc/systemd/system

# new service files added. systemd reload required to start angular and mongodb
sudo systemctl daemon-reload
sudo systemctl restart angular
sudo systemctl restart mongodb
