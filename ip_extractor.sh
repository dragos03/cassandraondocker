#!/bin/bash

#make a list of Cassandra containers
CONTAINERS=$(docker ps | grep cassandra | cut -f1 -d ' ')

#extract the private IP of every container
for i in $CONTAINERS; do
  docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $i
done
