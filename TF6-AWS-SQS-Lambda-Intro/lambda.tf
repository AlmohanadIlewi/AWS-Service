resource "aws_lambda_function" "my_sqs_function" {
  filename      = "${path.module}/python-lambda.zip"
  function_name = "MySQSlambdaFunction"
  role          = aws_iam_role.my-sqs-role.arn
  handler       = "message.lambda_handler"  # Anpassen Sie dies entsprechend Ihrer Dateistruktur
  runtime       = "python3.11"

  environment {
    variables = {
      SQS_QUEUE_URL = aws_sqs_queue.My_SQS.url
    }
  }

  depends_on = [aws_sqs_queue.My_SQS]
}



resource "aws_lambda_event_source_mapping" "sqs_trigger" {
  event_source_arn = aws_sqs_queue.My_SQS.arn
  function_name    = aws_lambda_function.my_sqs_function.function_name
  batch_size       = 1
  maximum_batching_window_in_seconds = 0
  enabled          = true
}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name = "/aws/lambda/MySQSlambdaFunction"
  retention_in_days = 7 # Anzahl der Tage, für die die Logeinträge aufbewahrt werden sollen
}





