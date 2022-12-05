variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "ec2keypair" {
  description = "ec2 keypair"
  type        = string
  default     = "my-keypair"
}