resource "aws_iam_role_policy" "example_policy_lambda" {
  name = "example_policy_lambda"
  role = aws_iam_role.example_role_lambda.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "Stmt1689767502349",
      "Action": "lambda:*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
})
}

resource "aws_iam_role" "example_role_lambda" {
  name = "example_role_lambda"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}