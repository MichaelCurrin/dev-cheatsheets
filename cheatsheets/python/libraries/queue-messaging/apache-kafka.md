# Apache Kafka

Kafka is a distributed streaming platform that can be used for building real-time data pipelines and streaming apps.

## Key Features
- High-throughput, fault-tolerant, publish-subscribe messaging system
- Scalable and durable storage
- Stream processing

## Basic Usage with kafka-python

```python
from kafka import KafkaProducer

producer = KafkaProducer(bootstrap_servers=['localhost:9092'])

producer.send('my-topic', b'Hello, Kafka!')
producer.flush()
```