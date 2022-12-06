

# TERROM CODE TO PROVISION AWS EKS CLUSTER AND EC2 INSTANCE FOR JENKINS 

This code will deploy EKS cluster with one node groups node-group-1 having one ec2 instance (t2 micro). It will use s3 backend for tfstate files. 

It will also create an ec2 instance in differet VPC having installed jenkins ( configured for building and pushing docker image for crp2-challenge-app adamgolang/hello-world ). It will install jenkins and docker on the ec2 instance.



## Installing terraform on wsl ubuntu: 



https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

Add the official HashiCorp repository to your system. 


echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform

```

## Running terraform code. 



Terraform code is at https://github.com/nadeemchoudhari/demo-terraform-eks.git

clone repo on ubuntu.

```

terraform init.

terraform plan

terraform apply

```
