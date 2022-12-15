

resource "aws_instance" "myjenkins" {
  ami = data.aws_ami.amzlinux2.id
  depends_on = [ module.eks.cluster_endpoint ]
  instance_type = "t2.micro"
  key_name = var.ec2keypair
  subnet_id = "subnet-1daead75"
  vpc_security_group_ids = [data.aws_security_group.ec2sg.id]
  tags = {
    "Name" = "jenkins-demo"
  }

  provisioner "file" {
    source      = "install.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh ",
    ]
  
  }

  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("./my-keypair.pem")
      timeout     = "4m"
   }
}


