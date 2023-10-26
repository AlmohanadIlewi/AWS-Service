import json
import boto3
import datetime

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('myDB')


def lambda_handler(event, context):
    for record in event['Records']:
        body = json.loads(record['body'])
        filename = body['Records'][0]['s3']['object']['key']
        current_time = str(datetime.datetime.now())
        item = {
            'FileName': filename,
            'Timestamp': current_time
        }
        table.put_item(Item=item)















# import json
# import boto3
# import uuid

# def create_profile(event, context):
#     # JSON-Nachricht aus dem Event-Objekt extrahieren
#     body = json.loads(event["Records"][0]["body"])

#     # Neuer Bucket-Name und Dateiname
#     bucket_name = 'my-bucket'
#     file_name = 'hello_from_S3'
    
#     # Initialisiere die AWS-Sitzung mit der Region 'eu-central-1'
#     session = boto3.Session(region_name='eu-central-1')
    
#     # Initialisiere den S3-Client
#     s3_client = session.client('s3')
    
#     # Erzeuge eine UUID für die Zeilen-ID
#     row_id = str(uuid.uuid4())
    
#     # Erstelle das Item für die DynamoDB-Tabelle
#     item = {
#         'RowID': {
#             'S': row_id
#         },
#         'first_name': {
#             'S': body['first_name']
#         },
#         'last_name': {
#             'S': body['last_name']
#         }
#     }

#     # Füge das Item in die DynamoDB-Tabelle 'Persons' ein
#     ddb_client = session.client('dynamodb')
#     ddb_client.put_item(TableName='Persons', Item=item)

#     # Optional: Sende eine Benachrichtigung an SNS
#     sns_client = session.client('sns')
#     sns_topic_arn = 'user_updates'
#     sns_message = 'Ein neues Profil wurde erstellt: ' + row_id
#     sns_client.publish(TopicArn=sns_topic_arn, Message=sns_message)

#     # Optional: Sende eine Nachricht an SQS
#     sqs_client = session.client('sqs')
#     sqs_queue_url = 'Mymessage'
#     sqs_message = 'Ein neues Profil wurde erstellt: ' + row_id
#     sqs_client.send_message(QueueUrl=sqs_queue_url, MessageBody=sqs_message)

#     # Verwende den S3-Client, um eine Datei in den S3-Bucket hochzuladen
#     s3_client.put_object(Bucket=bucket_name, Key=file_name, Body=json.dumps(item))
