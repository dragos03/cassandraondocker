As mentioned in the main tutorial, an alternative way to create the basic Cassandra image is to use a Dockerfile to automate the process.

Let's start by creating a Dockerfile:
vim Dockerfile

Dockerfiles have a specific syntax and resemble automation tools such as Ansible. I have uploaded the file separately, it should be very easy to understand what every command does. Basically, we automate the instalation and configuration of Cassandra, except the particular IP details in the cassandra.yaml file.

Time to build the new image, let's name it cassandra_template:
sudo docker build -t cassandra_template .

The build process will take some time, you can follow its progress. At the end, if there are no errors, the new imahe should be available. Check by running:
docker images

That was it, you can now start the containers with static IPs, configure the final settings and start the Cassandra service.


