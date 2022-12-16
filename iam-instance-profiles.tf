resource "aws_iam_instance_profile" "aws-eks-profile" {
  name = "eks-profile"
  role = data.aws_iam_role.aws-eks-role.name
}

