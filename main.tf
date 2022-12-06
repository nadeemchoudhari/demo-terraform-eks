provider "kubernetes" {

    host = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.demo-eks-cluster.token
}

provider "aws" {
    region = var.aws_region
    shared_credentials_files = ["/home/dev/.aws/credentials"]
    profile = "admin"

 }  

 

data "aws_eks_cluster_auth" "demo-eks-cluster" {
  name = module.eks.cluster_id
}

locals {
    cluster_name = "demo-eks-cluster"
}


resource "kubernetes_cluster_role_binding" "example" {
  metadata {
    name = "fabric8-rbac"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "default"
  }
}