resource "aws_iam_role" "security_role" {
  name = "SecurityRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        AWS = "*"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "security_policy" {
  name = "SecurityPolicy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "ReadOnlyAll"
        Effect = "Allow"
        Action = [
          "ec2:Describe*",
          "s3:List*",
          "s3:Get*",
          "iam:Get*",
          "iam:List*",
          "cloudtrail:LookupEvents"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "sec_attach" {
  role       = aws_iam_role.security_role.name
  policy_arn = aws_iam_policy.security_policy.arn
}