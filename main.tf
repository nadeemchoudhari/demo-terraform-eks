provider "kubernetes" {

    host = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "aws" {
    region = var.aws_region
    shared_credentials_files = ["/home/dev/.aws/credentials"]
    profile = "admin"

 }  


locals {
    cluster_name = "demo-eks-cluster"
}
