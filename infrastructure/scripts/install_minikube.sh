#!/bin/bash

#update binary package
apt-update 

#download minikube binary file
cd /opt/ && curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

#install minikube binary file
sudo install minikube-linux-amd64 /usr/local/bin/minikube

#create minikube cluster
if [[ $? -eq 0 ]];
then
    minikube start
else
    echo "minikube binary installation failed"
fi 

#Download kubectl binary files
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

#Download kubectl checksum file
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

#move kubectl executable to local bin directory
chmod +x kubectl
mv kubectl /usr/local/bin

#validate kubectl command
kubectl get pod -A 

if [[ $? -eq 0 ]]
then 
    echo "kubectl installed"
else
    echo "kubectl not working"
    exit 1


#install manifest files 

kubectl apply -f /tmp/manifest/
