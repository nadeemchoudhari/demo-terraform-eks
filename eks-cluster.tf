module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "~> 18.0"


    cluster_name = local.cluster_name
    cluster_version = "1.24"
    cluster_endpoint_private_access = true
    cluster_endpoint_public_access = true

    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets

    eks_managed_node_groups = {
        one = {
            name = "node-group-1"

            instance_types = ["t2.micro"]
            ami_id = "ami-074dc0a6f6c764218"
            min_size     = 1
            desired_size = 2
            
        }

    }
}