#!/bin/bash
#### Description: Install Hyperledger Fabric
#### Written by: Waslley Souza - waslley.souza@oracle.com on sept/2017

if [ "$LOGNAME" != "root" ]; then
	echo "prereqs-oraclelinux7.sh must run as root!"
	exit
fi

## Variables
declare NEW_USER="oracle"
declare NEW_USER_PASS="welcome1"

echo "###########################################################################################"
echo "## Oracle Linux 7                                                                        ##"
echo "###########################################################################################"

echo "Adding user $NEW_USER"
adduser $NEW_USER
echo $NEW_USER_PASS | passwd $NEW_USER --stdin

if ! grep -q "$NEW_USER  ALL=(ALL)  ALL" /etc/sudoers; then
  echo "Adding user $NEW_USER as sudoer"
  sed -i "/root.*ALL/ a $NEW_USER  ALL=(ALL)  ALL" /etc/sudoers
fi

echo "Disabling SELINUX"
sed -i 's/SELINUX=[A-Z].*/SELINUX=disabled/i' /etc/selinux/config

echo "Disabling Firewall"
systemctl stop firewalld
systemctl disable firewalld
systemctl status firewalld

echo "Downloading the latest EPEL"
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm
rm -f epel-release-latest-7.noarch.rpm

echo "Updating Oracle Linux"
yum -y groupinstall 'Development Tools'
yum -y install wget yum-utils sshpass
yum -y update

echo "Enabling YUM addons repo"
yum-config-manager --disable ol7_UEKR3
yum-config-manager --enable ol7_UEKR4
yum-config-manager --enable ol7_addons

echo "###########################################################################################"
echo "## Docker                                                                                ##"
echo "###########################################################################################"

echo "Installing docker-engine"
yum -y install docker-engine

echo "Starting docker service and configuration at boot time"
systemctl start docker
systemctl enable docker
systemctl status docker

echo "Checking docker is runing"
docker info
docker version

echo "Configuring user $NEW_USER to use docker group"
groupadd docker
usermod -aG docker $NEW_USER

echo "Installing Docker-Compose"
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo "###########################################################################################"
echo "## GoLang                                                                                ##"
echo "###########################################################################################"

echo "Installing GoLang"
wget https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz
tar -xzf go1.8.3.linux-amd64.tar.gz
rm -f go1.8.3.linux-amd64.tar.gz
mv go /usr/local
if ! grep -q "export GOPATH=*" ~/.bashrc; then
	sudo -u $NEW_USER mkdir /home/$NEW_USER/go
	sed -i "$ a export GOROOT=/usr/local/go" /home/$NEW_USER/.bashrc
	sed -i "$ a export GOPATH=/home/$NEW_USER/go" /home/$NEW_USER/.bashrc
	sed -i '$ a export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' /home/$NEW_USER/.bashrc
fi
source /home/$NEW_USER/.bashrc
go version

echo "###########################################################################################"
echo "## Git                                                                                   ##"
echo "###########################################################################################"

echo "Installing Git"
yum -y install git
git --version

echo "###########################################################################################"
echo "## NodeJS                                                                                ##"
echo "###########################################################################################"

echo "Installing NVM"
sudo -u $NEW_USER wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc
nvm --version

echo "Installing NodeJS"
sudo -u $NEW_USER nvm install --lts
sudo -u $NEW_USER nvm use --lts
sudo -u $NEW_USER nvm alias default 'lts/*'

echo "Installing NPM"
sudo -u $NEW_USER npm install npm@latest -g
source ~/.bashrc

echo "*** Please, reboot and log in as user oracle. ***"