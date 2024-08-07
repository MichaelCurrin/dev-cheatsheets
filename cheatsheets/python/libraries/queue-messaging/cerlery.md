# Celery

Celery is a distributed task queue system for Python.

## Key Features

- Asynchronous task execution
- Distributed architecture
- Multiple broker support (RabbitMQ, Redis, etc.)
- Periodic task scheduling

## Basic Usage

```python
from celery import Celery

app = Celery('tasks', broker='pyamqp://guest@localhost//')


@app.task
def add(x, y):
    return x + y


# To call the task
result = add.delay(4, 4)
```