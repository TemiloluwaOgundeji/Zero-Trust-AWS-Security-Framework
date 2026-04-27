resource "aws_iam_role" "devops_role" {
  name = "DevOpsRole"

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

resource "aws_iam_policy" "devops_policy" {
  name = "DevOpsPolicy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "EC2FullAccess"
        Effect = "Allow"
        Action = [
          "ec2:RunInstances",
          "ec2:TerminateInstances",
          "ec2:Describe*",
          "ec2:StartInstances",
          "ec2:StopInstances"
        ]
        Resource = "*"
      },
      {
        Sid    = "S3Deployment"
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ]
        Resource = "arn:aws:s3:::app-deploy-bucket/*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "devops_attach" {
  role       = aws_iam_role.devops_role.name
  policy_arn = aws_iam_policy.devops_policy.arn
}