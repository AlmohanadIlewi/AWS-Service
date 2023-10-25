# Create a lambda function

resource "aws_lambda_function" "lambda-fun" {
        function_name = "lambda-function"
        filename      = "${path.module}/python-post/hi-py.zip"
        role          = aws_iam_role.lambda_role.arn
        runtime       = "python3.11"
        handler       = "lambda-function.lambda_handler"
        timeout       = 10
}

# Generates an archive from content, a file, or a directory of files.

data "archive_file" "zip_the_python_code" {
 type        = "zip"
 source_dir  = "${path.module}/python-post/"
 output_path = "${path.module}/python-post/hi-py.zip"
}

resource "aws_lambda_permission" "api_gw" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda-fun.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.api-post.execution_arn}/*/*/post"
}

