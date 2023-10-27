import boto3

# Create SQS client
sqs = boto3.client('sqs')

queue_name = 'My_SQS'

# Get the queue URL
response = sqs.get_queue_url(QueueName=queue_name)
queue_url = response['QueueUrl']

# Receive message from SQS queue
response = sqs.receive_message(
    QueueUrl=queue_url,
    AttributeNames=['SentTimestamp'],
    MaxNumberOfMessages=1,
    MessageAttributeNames=['All'],
    VisibilityTimeout=0,
    WaitTimeSeconds=0
)

if 'Messages' in response:
    message = response['Messages'][0]
    receipt_handle = message['ReceiptHandle']

    # Process the message as needed
    print('Received message: %s' % message)

    # Delete received message from queue
    sqs.delete_message(
        QueueUrl=queue_url,
        ReceiptHandle=receipt_handle
    )
    print('Deleted message: %s' % message)
else:
    print('No messages in the queue.')
