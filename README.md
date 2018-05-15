# Nimiq Skypool installation script

## Installation
In terminal type the following command:
```
wget https://raw.githubusercontent.com/creativebay/nimiq-skypool-setup/master/nimiq-install.sh && sh nimiq-install.sh
```

## Run
```
./skypool-nimiq/skypool-node-client &>> skypool.log &
```

Mining process will run in a background so you can close the terminal anytime. In order to see output of the script type the following command:
```
tail -f skypool.log
```