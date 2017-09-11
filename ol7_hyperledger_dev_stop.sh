#!/bin/bash
#### Description: Stop Hyperledger Fabric
#### Written by: Waslley Souza - waslley.souza@oracle.com on sept/2017

if [ "$LOGNAME" != "oracle" ]; then
	echo "ol7_hyperledger_dev_stop.sh must run as oracle!"
	exit
fi

echo "###########################################################################################"
echo "## Hyperledger Fabric                                                                    ##"
echo "###########################################################################################"

echo "Stopping Hyperledger Fabric"
cd ~/fabric-tools
./stopFabric.sh
