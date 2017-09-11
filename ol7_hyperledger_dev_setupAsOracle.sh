#!/bin/bash
#### Description: Install Hyperledger Fabric
#### Written by: Waslley Souza - waslley.souza@oracle.com on sept/2017

if [ "$LOGNAME" != "oracle" ]; then
	echo "ol7_hyperledger_dev_setupAsOracle.sh must run as oracle!"
	exit
fi

# Source: https://hyperledger.github.io/composer/installing/development-tools.html

## Variables
#declare CHANNEL_ID="mychannel"

echo "###########################################################################################"
echo "## Dependencies                                                                          ##"
echo "###########################################################################################"

echo "Installing NVM"
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc
nvm --version

echo "Installing nodeJS"
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

echo "Installing NPM"
npm install npm@latest -g
source ~/.bashrc

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
cd ~
composer-playground &

wait 5

echo "These are good tutorials to getting started:"
echo "** https://hyperledger.github.io/composer/tutorials/developer-guide.html"
echo "** https://blog.imaginea.com/hyperledger-chennai-meetup%E2%80%8A-%E2%80%8Ajuly%E2%80%8A-%E2%80%8Aworkshop-on-hyperledger-composer-with-wavemaker/"
echo "Hyperledger was installed successfully!"