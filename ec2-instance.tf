
resource "aws_security_group" "jenkins-access" {
  name        = "launch-wizard-4"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-f3b85d98"
}
resource "aws_instance" "myjenkins" {
  ami = "data.aws_ami"
  instance_type = "t2.micro"
  key_name = var.ec2keypair
  subnet_id = "subnet-1daead75"
  vpc_security_group_ids = [aws_security_group.jenkins-access.id]
  user_data = file("${path.module}/install.sh")
  tags = {
    "Name" = "jenkins-demo"
  }
}