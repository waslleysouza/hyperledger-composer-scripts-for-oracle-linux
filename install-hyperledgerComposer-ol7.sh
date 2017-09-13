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

echo "Installing Fabric Composer Dev Tools"
npm install -g composer-cli generator-hyperledger-composer composer-rest-server yo composer-playground

echo "Removing all previously created Hyperledger Fabric chaincode images"
docker kill $(docker ps -q)
docker rm $(docker ps -aq)
docker rmi $(docker images dev-* -q)

echo "Installing Hyperledger Composer"
mkdir ~/fabric-tools && cd ~/fabric-tools
curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.tar.gz
tar xzf fabric-dev-servers.tar.gz

echo "Starting Hyperledger Composer"
export FABRIC_VERSION=hlfv1
./downloadFabric.sh
./startFabric.sh
./createComposerProfile.sh

echo "Installing Composer Sample Networks"
git clone https://github.com/hyperledger/composer-sample-networks.git
cd basic-sample-network
npm install

echo "Starting Composer-Playground"
composer-playground &

wait 10

echo "Hyperledger was installed successfully!"
echo "*************************************************************"
echo "* These are good tutorials to getting started: "
echo "* - https://hyperledger.github.io/composer/tutorials/developer-guide.html"
echo "* - https://blog.imaginea.com/hyperledger-chennai-meetup%E2%80%8A-%E2%80%8Ajuly%E2%80%8A-%E2%80%8Aworkshop-on-hyperledger-composer-with-wavemaker/"
echo "*************************************************************"