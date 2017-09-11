# Hyperledger Fabric Install Scripts

This repository contains a number of helper scripts to install and start up a Hyperledger Fabric v1.0 network for development purposes. You can use the Hyperledger Fabric network created by these scripts to quickly deploy Blockchain business networks built using Hyperledger Composer, and test applications that depend on a running network.

# Usage

## Pre-Requisites

Oracle Linux 7 VM

## Step 1: Pre-install Hyperledger Fabric

Log in as user root, copy the file "ol7_hyperledger_setupAsRoot.sh" to your VM and execute:

```
$ chmod +x ./ol7_hyperledger_setupAsRoot.sh
$ ./ol7_hyperledger_setupAsRoot.sh
``` 

## Step 2: Install Hyperledger Fabric

After reboot, log in as user oracle, copy the file "ol7_hyperledger_dev_setupAsOracle.sh" to your VM and execute:

```
$ chmod +x ./ol7_hyperledger_dev_setupAsOracle.sh
$ ./ol7_hyperledger_dev_setupAsOracle.sh
``` 

## Step 3: Start Hyperledger Fabric

Hyperledger Fabric is started automatically after installation.
You need to execute this step after start your VM.

Log in as user oracle, copy the file "ol7_hyperledger_dev_start.sh" to your VM and execute:

```
$ chmod +x ./ol7_hyperledger_dev_start.sh
$ ./ol7_hyperledger_dev_start.sh
``` 

## Step 4: Stop Hyperledger Fabric

Hyperledger Fabric is started automatically after installation.
You need to execute this step before stop your VM.

Log in as user oracle, copy the file "ol7_hyperledger_dev_stop.sh" to your VM and execute:

```
$ chmod +x ./ol7_hyperledger_dev_stop.sh
$ ./ol7_hyperledger_dev_stop.sh
``` 