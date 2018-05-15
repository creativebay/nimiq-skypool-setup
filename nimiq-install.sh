#!/bin/bash

echo "------------------------------------"
echo "  NIMIQ Skypool installation script "
echo "------------------------------------"

printf "Enter machine name: "

read -r name

printf "Enter wallet address: "

read -r address

## Update and upgrade packages
echo "Upgrading packages..."
sudo apt-get update > /dev/null 2>&1
sudo apt-get -y upgrade > /dev/null 2>&1

## Install dependecies
echo "Installing dependencies..."
sudo apt-get install -y git build-essential nodejs npm unzip > /dev/null 2>&1

## Install yarn/gulp
npm install -g yarn > /dev/null 2>&1
yarn global add gulp > /dev/null 2>&1

## Install latest node version
npm install n > /dev/null 2>&1
cd ~/node_modules/n/bin
sudo ./n stable  > /dev/null 2>&1
cd

## Checkout NIMIQ core
echo "Cloning NIMIQ network core..."

git clone https://github.com/nimiq-network/core > /dev/null 2>&1

## Get Skypool
echo "Downloading Skypool..."

wget https://github.com/skypool-org/skypool-nimiq-miner/releases/download/v1.2.0/skypool-nimiq-v1.2.0-linux-x64-fast.zip > /dev/null 2>&1

## Extract Skypool source files
echo "Extracting Skypool..."

unzip skypool-nimiq-v1.2.0-linux-x64-fast.zip > /dev/null 2>&1
mv skypool-nimiq-v1.2.0-linux-x64-fast skypool-nimiq

## Update config file
echo "Updating config file..."
cd skypool-nimiq

sed -i 's/"name": ".*"/"name": "'"$name"'"/g' config.txt > /dev/null 2>&1
sed -i 's/"address": ".*"/"address": "'"$address"'"/g' config.txt > /dev/null 2>&1

echo 'Installation completed.'

echo '-------------------------------'
echo 'To start mining enter the command below'
echo './skypool-nimiq/skypool-node-client &>> skypool.log &'
