import os
import json
import boto3
import uuid
from datetime import datetime

def lambda_handler(event, context):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table('myDB')
    random_id = os.environ.get("RANDOM_ID")
    random_file_name = os.environ.get("RANDOM_FILE_NAME")
    
    
    # Generate a unique ID and file name
    unique_id = str(uuid.uuid4())
    file_name = str(uuid.uuid4())  # Generate a random file name
    
    # Generate the current timestamp
    current_time = datetime.now().isoformat()
    
    item = {
        'ID': unique_id,
        'FileName': file_name,
        'Timestamp': current_time
    }
    
    # Add more data to the 'item' dictionary as needed
    item['Size'] = 1024
    item['Tags'] = ["tag1", "tag2", "tag3"]
    item['IsProcessed'] = True
    
    # Write the 'item' dictionary to the DynamoDB table
    table.put_item(Item=item)

    return {
        'statusCode': 200,
        'body': json.dumps('Item successfully written to DynamoDB.')
    }





# import json
# import boto3
# import uuid

# def create_profile(event, context):
#     # JSON-Nachricht aus dem Event-Objekt extrahieren
#     body = json.loads(event["Records"][0]["body"])

#     # Neuer Bucket-Name und Dateiname
#     bucket_name = 'my-bucket'
#     file_name = 'mein-s3-bucket'
    
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
