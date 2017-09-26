#!/bin/bash

#This script can be placed inside the containers and executed
#to configure Cassandra automatically with the local IP

#Find the container IP
LOCALIP=`hostname -I`

#Edit the cassandra.yaml file
sed -i "386s/listen_address: */listen_address: ${LOCALIP}/g" /usr/local/cassandra/conf/cassandra.yaml
sed -i "444s/rpc_address: */rpc_address: ${LOCALIP}/g" /usr/local/cassandra/conf/cassandra.yaml
