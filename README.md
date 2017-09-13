# Hyperledger Composer Install Scripts

This repository contains a number of helper scripts to install and start up a Hyperledger Fabric v1.0 network for development purposes. You can use the Hyperledger Fabric network created by these scripts to quickly deploy Blockchain business networks built using Hyperledger Composer, and test applications that depend on a running network.

# Usage

## Pre-Requisites

VM with Oracle Linux 7

## Step 1: Pre-install Hyperledger Composer

Log in as user root, copy the file "install-prereqs-ol7.sh" to your VM and execute:

```
$ chmod +x ./install-prereqs-ol7.sh
$ ./install-prereqs-ol7.sh
$ reboot
``` 

## Step 2: Install Hyperledger Composer

After reboot, log in as user oracle, copy the file "install-hyperledgerComposer-ol7.sh" to your VM and execute:

```
$ chmod +x ./install-hyperledgerComposer-ol7.sh
$ ./install-hyperledgerComposer-ol7.sh
``` 

## Step 3: Start Hyperledger Composer

Hyperledger Composer is started automatically after installation, but you need to execute this step after start/restart your VM.

Log in as user oracle, copy the file "start-hyperledgerComposer-ol7.sh" to your VM and execute:

```
$ chmod +x ./start-hyperledgerComposer-ol7.sh
$ ./start-hyperledgerComposer-ol7.sh
``` 

## Step 4: Stop Hyperledger Composer

You need to execute this step before stop your VM.

Log in as user oracle, copy the file "stop-hyperledgerComposer-ol7.sh" to your VM and execute:

```
$ chmod +x ./stop-hyperledgerComposer-ol7.sh
$ ./stop-hyperledgerComposer-ol7.sh
``` 