
# AWS IAM-Rolle für Lambda
resource "aws_iam_role" "my-sqs-role" {
  name = "sqs_role"
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

resource "aws_iam_policy" "sqs-policy" {
    name = "sqs-policy"

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

resource "aws_iam_role_policy_attachment" "sqs-policy_attachment" {
  policy_arn = aws_iam_policy.sqs-policy.arn
  role       = aws_iam_role.my-sqs-role.name
}













# data "aws_iam_policy_document" "sqs_policy" {

#     statement {
#     sid    = "First"
#     effect = "Allow"

#     principals {

#         type        = "*"
#         identifiers = ["*"]
#     }

#     actions   = ["sqs:SendMessage"]
#     resources = [aws_sqs_queue.q.arn]

#     condition {

#         test     = "ArnEquals"
#         variable = "aws:SourceArn"
#         values   = [aws_sns_topic.example.arn]
#         }
#     }
# }

# resource "aws_sqs_queue_policy" "sqs_policy" {

#     queue_url = aws_sqs_queue.q.id
#     policy    = data.aws_iam_policy_document.sqs_policy.json
# }