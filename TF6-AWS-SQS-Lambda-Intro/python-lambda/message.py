# import boto3 
# # setup the SQS Service
# sqs = boto3.resource('sqs')

# # Create the queue
# queue = sqs.create_queue(QueueName='My_SQS')

# # Print the queue url
# print(queue.url)


import json
import boto3

def lambda_handler(event, context):
    # Verbinden Sie sich mit AWS SQS
    sqs = boto3.client('sqs')
    queue_url = 'My_SQS'  # Ersetzen Sie dies durch die tatsächliche URL Ihrer SQS-Warteschlange

    # Empfangen Sie Nachrichten aus der SQS-Warteschlange
    response = sqs.receive_message(
    QueueUrl=queue_url,
    AttributeNames=['All'],
    MessageAttributeNames=['All'],
    MaxNumberOfMessages=1,
    VisibilityTimeout=0,
    WaitTimeSeconds=1
)



    if 'Messages' in response:
        message = response['Messages'][0]
        receipt_handle = message['ReceiptHandle']

        # Schreiben Sie die Nachricht in die CloudWatch-Logs
        print(f"Received message: {message['Body']}")
        
        # Löschen Sie die Nachricht aus der Warteschlange
        sqs.delete_message(
            QueueUrl=queue_url,
            ReceiptHandle=receipt_handle
        )
    else:
        print('No messages in the queue.')

    return {
        'statusCode': 200,
        'body': json.dumps('Lambda function executed successfully.')
    }
