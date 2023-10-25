resource "aws_apigatewayv2_api" "api-post" {
    name          = "hallo-api"
    protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "hallo-interg" {
    api_id           = aws_apigatewayv2_api.api-post.id
    integration_type = "AWS_PROXY"             # Verwenden Sie AWS_PROXY für Lambda-Integrationen

    integration_method = "POST"
    integration_uri    = aws_lambda_function.lambda-fun.invoke_arn  # Stellen Sie sicher, dass dies auf die ARN Ihrer Lambda-Funktion verweist.
}

resource "aws_apigatewayv2_route" "hallo-route" {

    api_id    = aws_apigatewayv2_api.api-post.id
    route_key = "POST /post"

    target = "integrations/${aws_apigatewayv2_integration.hallo-interg.id}"
}

resource "aws_apigatewayv2_stage" "hallo-stage" {
    api_id = aws_apigatewayv2_api.api-post.id
    name   = "hallo-api-stage"
    auto_deploy = true
}