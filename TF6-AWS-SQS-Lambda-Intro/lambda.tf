resource "aws_lambda_function" "my_sqs_function" {
  filename      = "${path.module}/python-lambda.zip"
  function_name = "MySQSlambdaFunction"
  role          = aws_iam_role.lambda-sqs-role.arn
  handler       = "message.lambda_handler"
  runtime       = "python3.11"

  environment {
    variables = {
      SQS_QUEUE_URL = aws_sqs_queue.My_SQS.url
    }
  }

  depends_on = [aws_sqs_queue.My_SQS]
}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name = "/aws/lambda/MySQSlambdaFunction"
  retention_in_days = 1  # Aufbewahrungsdauer in Tagen
}





