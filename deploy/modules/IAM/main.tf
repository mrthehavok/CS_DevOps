#------------------------------------------------------------------------------------------------
#
#                            Module for role creation
#
#------------------------------------------------------------------------------------------------

#------------------------------------------------------------------------------------------------
#                                         Role
#------------------------------------------------------------------------------------------------

resource "aws_iam_role" "role" {
  name = var.role_name
  path = "/"
  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "SNS" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
}


resource "aws_iam_role_policy_attachment" "SSM_RO" {
  role       = aws_iam_role.role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
}


resource "aws_iam_instance_profile" "web_instance_profile" {
    name = "web_instance_profile"
    role = var.role_name
}