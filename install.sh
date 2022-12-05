sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo yum search docker
sudo yum info docker
sudo yum install docker

sudo usermod -a -G docker ec2-user
sudo usermod -a -G docker jenkins
sudo systemctl enable docker.service
sudo systemctl start docker.service