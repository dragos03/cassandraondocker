#!/bin/bash

#this simple script can be executed on the host OS
#to find the IP adresses of every active Cassandra container

#make a list of Cassandra containers
CONTAINERS=$(docker ps | grep cassandra | cut -f1 -d ' ')

#extract the private IP of every container
for i in $CONTAINERS; do
  docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $i
done
