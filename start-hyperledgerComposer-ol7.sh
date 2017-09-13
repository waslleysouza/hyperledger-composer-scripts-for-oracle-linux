#!/bin/bash
#### Description: Start Hyperledger Composer
#### Written by: Waslley Souza - waslley.souza@oracle.com on sept/2017

if [ "$LOGNAME" != "oracle" ]; then
	echo "Please re-run as user oracle!"
	exit
fi

echo "###########################################################################################"
echo "## Hyperledger Composer                                                                  ##"
echo "###########################################################################################"

echo "Starting Hyperledger Composer"
cd ~/fabric-tools
./startFabric.sh

echo "Starting Composer-Playground"
composer-playground &
