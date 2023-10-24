
# SQS Queue mit
# Queue Policy
# Remote Trigger für Lambda
# Terraform Output für Queue URL

# Erstellen Sie die Haupt-SQS-Warteschlange und verweisen Sie auf die DLQ
resource "aws_sqs_queue" "My_SQS" {
  name = "MySQSQueue122"
  delay_seconds             = 2
  max_message_size          = 2048
  message_retention_seconds = 256
  receive_wait_time_seconds = 1
}



