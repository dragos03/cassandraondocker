#!/bin/bash

#when run on the host, this script will autoconfigure
#the cassandra.yaml file in every container with the correct IP

#make a list of Cassandra containers
CONTAINERS=$(docker ps | grep cassandra | cut -f1 -d ' ')

#download the configuration file from one of the Cassandra containers
CONT=$(echo $CONTAINERS | cut -f1 -d ' ')
docker cp $CONT:/usr/local/cassandra/conf/cassandra.yaml cassandra.yaml

#extract the private IP of every container
#then edit the two lines of the configuration file and copy it into the container
for i in $CONTAINERS; do
  IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $i)
  sed -i "386s/listen_address:.*/listen_address: ${IP}/g" cassandra.yaml
  sed -i "444s/rpc_address:.*/rpc_address: ${IP}/g" cassandra.yaml
  docker cp cassandra.yaml $i:/usr/local/cassandra/conf/cassandra.yaml
done

