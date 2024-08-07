# RabbitMQ

RabbitMQ is a message broker that can be used with Celery or independently.

## Key Features
- Supports multiple messaging protocols
- Clustering for high availability
- Message persistence
- Flexible routing

## Basic Usage with Pika (Python client)

```python
import pika


connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()

channel.queue_declare(queue='hello')

channel.basic_publish(exchange='',
                      routing_key='hello',
                      body='Hello World!')

print(" [x] Sent 'Hello World!'")

connection.close()
```