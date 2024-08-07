# Redis Queue (RQ)

RQ is a simple Python library for queueing jobs and processing them in the background with workers.

## Key Features
- Simple to use and deploy
- Uses Redis as its backend
- Supports job prioritization

## Basic Usage

```python
from redis import Redis
from rq import Queue

q = Queue(connection=Redis())


def my_job(param1, param2):
    return param1 + param2


job = q.enqueue(my_job, 1, 2)
```