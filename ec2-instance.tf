

resource "aws_instance" "myjenkins" {
  ami = data.aws_ami.amzlinux2.id
  instance_type = "t2.micro"
  key_name = var.ec2keypair
  subnet_id = "subnet-1daead75"
  vpc_security_group_ids = [data.aws_security_group.ec2sg.id]
  user_data = file("${path.module}/install.sh")
  tags = {
    "Name" = "jenkins-demo"
  }
}