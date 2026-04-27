resource "aws_iam_role" "finance_role" {
  name = "FinanceRole"

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

resource "aws_iam_policy" "finance_policy" {
  name = "FinancePolicy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "BillingAccess"
        Effect = "Allow"
        Action = [
          "aws-portal:ViewBilling",
          "ce:GetCostAndUsage",
          "budgets:DescribeBudgets"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "fin_attach" {
  role       = aws_iam_role.finance_role.name
  policy_arn = aws_iam_policy.finance_policy.arn
}