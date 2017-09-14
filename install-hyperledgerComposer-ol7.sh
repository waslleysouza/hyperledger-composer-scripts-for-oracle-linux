#!/bin/bash
#### Description: Install Hyperledger Composer
#### Written by: Waslley Souza - waslley.souza@oracle.com on sept/2017

if [ "$LOGNAME" != "oracle" ]; then
	echo "Please re-run as user oracle!"
	exit
fi

# Source: https://hyperledger.github.io/composer/installing/development-tools.html

echo "###########################################################################################"
echo "## Hyperledger Composer                                                                  ##"
echo "###########################################################################################"

echo "Removing all previously created Hyperledger Fabric chaincode images"
docker kill $(docker ps -q)
#docker rm $(docker ps -aq)
#docker rmi $(docker images dev-* -q)

echo "Installing Hyperledger Composer"
mkdir -p ~/hyperledger/composer/fabric-tools && cd ~/hyperledger/composer/fabric-tools
curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.tar.gz
tar xzf fabric-dev-servers.tar.gz
rm -f fabric-dev-servers.tar.gz

echo "Starting Hyperledger Composer"
export FABRIC_VERSION=hlfv1
./downloadFabric.sh
./startFabric.sh
./createComposerProfile.sh

echo "Installing Composer Sample Networks"
cd ~/hyperledger/composer
git clone https://github.com/hyperledger/composer-sample-networks.git

echo "Starting Composer-Playground"
composer-playground &

sleep 10

echo "Hyperledger was installed successfully!"
echo "*************************************************************"
echo "* These are good tutorials to getting started: "
echo "* - https://hyperledger.github.io/composer/tutorials/developer-guide.html"
echo "* - https://blog.imaginea.com/hyperledger-chennai-meetup%E2%80%8A-%E2%80%8Ajuly%E2%80%8A-%E2%80%8Aworkshop-on-hyperledger-composer-with-wavemaker/"
echo "*************************************************************"