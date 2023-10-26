import json
import boto3
import uuid

def lambda_handler(event, context):
    result = "Hello from my Post"
    
    s3 = boto3.client('s3')
    bucket_name = 'hallo-from-s3-bucket'
    file_name   = str(uuid.uuid4()) + '.txt'
    # Ihr ursprünglicher Code hatte keine Variable "message", daher habe ich sie hier ergänzt.
    message = event["body"]

    # Dateiinhalt sollte in bytes oder als String bereitgestellt werden, z. B. als JSON-String
    file_content = message
    
    response = s3.put_object(
        Body=file_content,
        Bucket=bucket_name,
        Key=file_name  # Verwenden Sie .json als Erweiterung, wenn Sie JSON-Daten speichern.
    )

    return {
        'statusCode': 200,
        'body': json.dumps(file_name)  # Ergebnis sollte als JSON-String zurückgegeben werden.
    }



