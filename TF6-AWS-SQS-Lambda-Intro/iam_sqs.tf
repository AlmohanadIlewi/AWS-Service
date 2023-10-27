
# AWS IAM-Rolle für Lambda
resource "aws_iam_role" "lambda-sqs-role" {
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

resource "aws_iam_policy" "lambda-sqs-policy" {
    name = "lambda-sqs-policy"

    policy = jsonencode({
    Version = "2012-10-17",
    Statement = [

        {
        Action = "sqs:*",
        Effect = "Allow",
        Resource = aws_sqs_queue.My_SQS.arn

        }
        ]
    })
}

resource "aws_iam_policy" "cloudwatch_policy" {


  name         = "cloudwatch_policy"
  path         = "/"
  description  = "AWS IAM Policy for managing aws lambda role"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "sqs-policy_attachment" {
  policy_arn = aws_iam_policy.cloudwatch_policy.arn
  role       = aws_iam_role.lambda-sqs-role.name
}
resource "aws_iam_role_policy_attachment" "cloudwatch_policy-attachment" {
  policy_arn = aws_iam_policy.lambda-sqs-policy.arn
  role       = aws_iam_role.lambda-sqs-role.name
}




