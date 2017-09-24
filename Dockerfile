############################################################
#Dockerfile to build Cassandra container images
# Based on Ubuntu 17
############################################################

#Choose the base image
FROM docker.io/dongjoon/ubuntu17.04-jdk8

# File Author / Maintainer
MAINTAINER dragos03

#Install sudo
RUN apt install -y sudo

#Configure Cassandra user and group
RUN addgroup cassandra
RUN adduser --ingroup cassandra cassandra
RUN adduser cassandra sudo
RUN su cassandra
WORKDIR /home/cassandra

#Download, unpack and install Cassandra
RUN wget http://mirrors.ae-online.de/apache/cassandra/2.1.18/apache-cassandra-2.1.18-bin.tar.gz
RUN sudo tar -xvf /home/cassandra/apache-cassandra-2.1.18-bin.tar.gz -C /usr/local
WORKDIR /usr/local
RUN sudo mv apache-cassandra-2.1.18/ cassandra-2.1.18
RUN sudo ln -s /usr/local/cassandra-2.1.18/ /usr/local/Cassandra
RUN sudo chown -R cassandra:cassandra /usr/local/cassandra-2.1.18

#Configure environment variables
ENV "JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")"
ENV "CASSANDRA_INSTALL=/usr/local/cassandra"
ENV "CASSANDRA_HOME=$CASSANDRA_INSTALL"
