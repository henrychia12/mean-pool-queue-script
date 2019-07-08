#! /bin/bash

# update system
sudo apt-get update

# install nodejs and npm
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y
sudo apt-get install npm -y

# npm to install mongodb, express, body-parser & angular
sudo apt-get install -y mongodb
sudo npm install express --save
sudo npm install body-parser
sudo npm install @angular/cli


