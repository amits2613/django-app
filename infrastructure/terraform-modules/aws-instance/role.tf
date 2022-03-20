
resource "aws_iam_role" "role" {
  name = "${var.environment}-instance-role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy" "policy" {
  name        = "${var.environment}-instance-policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "ec2:Search*",
          "ec2:Get*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "policy-attach" {
  name       = "${var.environment}-instance-policy-attach"
  roles      = [aws_iam_role.role.name]
  policy_arn = aws_iam_policy.policy.arn
}