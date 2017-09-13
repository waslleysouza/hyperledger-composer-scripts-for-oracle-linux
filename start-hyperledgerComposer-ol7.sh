#!/bin/bash
#### Description: Start Hyperledger Fabric
#### Written by: Waslley Souza - waslley.souza@oracle.com on sept/2017

if [ "$LOGNAME" != "oracle" ]; then
	echo "ol7_hyperledger_dev_start.sh must run as oracle!"
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
