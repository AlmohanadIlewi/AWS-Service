# AWS IAM-Rolle für Lambda
resource "aws_iam_role" "sqs-role" {
  name = "lm-sqs_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# AWS IAM-Richtlinie für Lambda
resource "aws_iam_policy" "sqs-lambda-policy" {
  name = "lambda-sqs-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sqs:*",
        Effect = "Allow",
        Resource = aws_sqs_queue.Mymessage.arn
      }
    ]
  })
}

# AWS IAM-Richtlinie für CloudWatch-Logs
resource "aws_iam_policy" "cloudwatch_policy" {
  name        = "cloudwatch_policy"
  description = "AWS IAM Policy for managing aws lambda role"
  path        = "/"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:*:*:*",
        Effect   = "Allow"
      }
    ]
  })
}

# Anhängen der IAM-Richtlinien an die IAM-Rolle
resource "aws_iam_role_policy_attachment" "sqs-policy-attachment" {
  policy_arn = aws_iam_policy.sqs-lambda-policy.arn
  role       = aws_iam_role.sqs-role.name
}

