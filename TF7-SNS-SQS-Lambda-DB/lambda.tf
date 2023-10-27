# AWS Lambda-Funktion
resource "aws_lambda_function" "sqs_fun" {

  filename      = "${path.module}/python/lambda-code.zip"
  function_name = "MySQSlambda"
  role          = aws_iam_role.sqs-role.arn
  handler       = "lambda-code.lambda_handler"

  runtime       = "python3.11"
  environment {
    variables = {
      SQS_QUEUE_URL = aws_sqs_queue.Mymessage.url
    }
  }

  depends_on = [aws_sqs_queue.Mymessage]
}


data "archive_file" "zip_the_python_code" {
  type        = "zip"
  source_dir  = "${path.module}/python/"
  output_path = "${path.module}/python/lambda-code.zip"
}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name = "/aws/lambda-code/MySQSlambda"
  retention_in_days = 1  # Aufbewahrungsdauer in Tagen
}

# Event source from SQS
resource "aws_lambda_event_source_mapping" "event-source_mapping" {
  event_source_arn = aws_sqs_queue.Mymessage.arn
  enabled          = true
  function_name    = aws_lambda_function.sqs_fun.arn
  batch_size       = 1
}

