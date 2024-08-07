# Amazon SQS / boto3

Amazon Simple Queue Service (SQS) is a fully managed message queuing service.

## Key Features

- Scalable and fully managed by AWS
- Supports standard and FIFO queues
- Integrates well with other AWS services

## Basic Usage with boto3

```python
import boto3


sqs = boto3.client('sqs')

queue_url = 'https://sqs.us-east-1.amazonaws.com/123456789012/MyQueue'

response = sqs.send_message(
    QueueUrl=queue_url,
    MessageBody='Hello, SQS!'
)

print(f"Message sent. ID: {response['MessageId']}")
```