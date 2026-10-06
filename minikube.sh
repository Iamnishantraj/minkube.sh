#!/bin/bash

# Clean up broken repositories
rm -f /etc/apt/sources.list.d/kubernetes.list

# Install Docker
apt update && apt upgrade -y
apt install -y docker.io

# Start Docker service
systemctl start docker
systemctl enable docker

# Install kubectl via snap
snap install kubectl --classic

# Install Minikube
curl -LO https://googleapis.com
install minikube-linux-amd64 /usr/local/bin/minikube
rm -f minikube-linux-amd64

# Start Minikube cluster as root
minikube start --driver=docker --force

# Verify cluster status
kubectl get nodes
