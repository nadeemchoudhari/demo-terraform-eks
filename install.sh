#!/bin/bash

sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
#sudo yum upgrade
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo yum search docker
sudo yum info docker
sudo yum install docker -y
sudo yum install unzip -y
sudo yum install wget -y
sudo yum install git -y
sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker jenkins
sudo systemctl enable docker.service
sudo systemctl start docker.service
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.24.7/2022-10-31/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/bin/
aws eks update-kubeconfig --region ap-south-1 --name demo-eks-cluster
git clone https://github.com/nadeemchoudhari/demo-argocd-helm.git  ~/demo-argocd-helm
cd ~/demo-argocd-helm
git checkout master
kubectl create namespace argocd
kubectl -n argocd apply -f ~/demo-argocd-helm/install.yaml
kubectl -n argocd port-forward svc/argocd-server 8000:443
kubectl label namespace interview istio-injection=enabled

