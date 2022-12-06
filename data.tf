data "aws_ami" "amzlinux2" {
  most_recent      = true
  owners           = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


data "aws_security_group" "ec2sg" {
  id = "sg-0f91349e4da2d5f1a"
}
data "aws_availability_zones" "available" {}

data "aws_eks_cluster_auth" "mycluster" {
  name = module.eks.cluster_id
}
