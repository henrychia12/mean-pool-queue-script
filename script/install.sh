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

# briefly carries a task on user - meanadm to git clone backend repo
sudo su - meanadm -c "git clone -b Developer https://github.com/Nboaram/TeamAPoolProjectBackend.git && git clone -b Developer https://github.com/Nboaram/TeamAPoolProjectUI.git"

# install  npm dependencies as meanadm
sudo su - meanadm -c "cd TeamAPoolProjectBackend && npm install"

# delete mongodb service file if already exists
sudo rm -f /etc/systemd/system/mongodb.service

# copy mongodb service file to systemd
sudo cp ../mongodb.service /etc/systemd/system

# mongodb service file added. systemd reload required and start mongodb
sudo systemctl daemon-reload
sudo systemctl restart mongodb

# install angular
# cd /home/meanadm/TeamAPoolProjectUI
# yes | sudo npm install @angular/cli

# deploy front end using angular
# ng serve --host 0.0.0.0
