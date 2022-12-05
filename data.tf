data "aws_ami" "amzlinux2" {
  owners           = ["amazon"]
  most_recent      = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_availability_zones" "available" {}
