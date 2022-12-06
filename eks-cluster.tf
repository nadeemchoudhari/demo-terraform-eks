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

           instance_type = "t2.micro"
           max_capacity  = 5
           desired_capacity = 3
           min_capacity  = 3
        }

    }
}
