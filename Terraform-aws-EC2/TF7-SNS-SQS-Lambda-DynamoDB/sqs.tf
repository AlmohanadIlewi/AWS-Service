
# Erstellen Sie die Haupt-SQS-Warteschlange und verweisen Sie auf die DLQ
resource "aws_sqs_queue" "Mymessage" {
  name = "MySQS123"
  delay_seconds             = 20
  max_message_size          = 2048
  message_retention_seconds = 256
  receive_wait_time_seconds = 10
}



