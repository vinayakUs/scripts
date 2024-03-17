#!/bin/bash

# Update the package index
sudo apt-get update

# Install Java JDK
sudo apt-get install default-jdk -y

# Download and extract Kafka
wget https://downloads.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz -O /tmp/kafka.tgz
sudo mkdir /opt/kafka
sudo tar -xvf /tmp/kafka.tgz --strip 1 -C /opt/kafka

# Configure environment variables
echo "export KAFKA_HOME=/opt/kafka" >> ~/.bashrc
echo "export PATH=\$PATH:\$KAFKA_HOME/bin" >> ~/.bashrc
source ~/.bashrc

# Start Zookeeper (required for Kafka)
sudo systemctl start zookeeper

# Start Kafka server
sudo systemctl start kafka
