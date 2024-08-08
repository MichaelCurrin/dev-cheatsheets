---
title: Redis
description: |
  A comprehensive guide for beginners on using Redis with Python, including setup, basic operations, and common use cases.
---

This cheatsheet provides a quick reference for beginners on how to use Redis with Python. It covers installation, basic operations, and common scenarios you might encounter when working with Redis in your Python projects.

Using Redis through a Python application means seamless access to rich data structures for asynchronous programming while managing large datasets efficiently.

## Related

- [Redis][] cheatsheet in the NoSQL section, including installing and running Redis.
- [Python Redis](https://realpython.com/python-redis/) guide on the RealPython website.

[Redis]: {% link cheatsheets/nosql/redis/index.md %}

## Resources

- [Redis Python Client Documentation](https://redis-py.readthedocs.io/)

## Use cases

- Integrate Redis with Flask for enhanced sesion management and caching.
- Use Redis as a cache backend or session store in Django to streamline data access and improve app load times.
- For async web frameworks like FastAPI or Tornado, use Redis for tasks like backgorund job processing and message queing for responsive apps that can handle concurent requests gracefully.

## Install the Python Redis client

```sh
$ pip install redis
```

## Basic Redis operations in Python

### Connect to Redis

```python
import redis


# Connect to default localhost:6379
r = redis.Redis()

# Or specify host and port
r = redis.Redis(host='localhost', port=6379, db=0)
```

### Basic operations

```python
# Set a key.
r.set('mykey', 'Hello, Redis!')
```

```python
# Get a key.
value = r.get('mykey')
# b'Hello, Redis!'
```

```python
# Delete a key.
r.delete('mykey')
```

```python
# Check if a key exists.
exists = r.exists('mykey')
```

```python
# Set expiration in seconds.
r.setex('mykey', 10, 'This will expire in 10 seconds')
```

## Batching with the pipeline method

How you can insert a list of 3 items (dictionaries) with random IDs into a Redis database using a batch request in Python. Using `r.pipeline()`, we can queue multiple commands and execute them as a batch, which is more efficient than executing them individually.

```python
with r.pipeline() as pipe:
    pipe.set('key1', 'value1')
    pipe.rpush('list1', 'item1', 'item2')
    pipe.sadd('set1', 'member1', 'member2')

    pipe.execute()
```

A more realistic example. When you run this code, it will insert the 3 items into Redis with random IDs and print the inserted items with their respective IDs.

```python
import redis
import uuid

r = redis.Redis(host='localhost', port=6379, db=0)

items = [
    {'name': 'Item 1', 'price': 10.99, 'category': 'Electronics'},
    {'name': 'Item 2', 'price': 5.75, 'category': 'Books'},
    {'name': 'Item 3', 'price': 22.50, 'category': 'Clothing'}
]

# Use a pipeline to execute a batch of commands
pipe = r.pipeline()

# Insert each item with a random ID
for item in items:
    item_id = str(uuid.uuid4())
    pipe.hmset(f'item:{item_id}', item)

# Execute the batch of commands
pipe.execute()

# Print the inserted items
for item in items:
    item_id = str(uuid.uuid4())
    inserted_item = r.hgetall(f'item:{item_id}')
    print(f'Item ID: {item_id}, Item: {inserted_item}')
```


## Code for common use cases

### Queue

```python
import time


def enqueue_task(task_id: str, task_data: dict) -> None:
    r.lpush('task_queue', task_id)
    r.hmset(f'task:{task_id}', task_data)


def process_queue():
    while True:
        # Wait for available task
        task = r.brpop('task_queue', timeout=0)

        if task:
            task_id = task[1].decode('utf-8')
            task_data = r.hgetall(f'task:{task_id}')
            
            # Process the task (simulated)
            print(f"Processing task {task_id}: {task_data}")
            time.sleep(1)  # Simulate processing time
            
            # Clean up
            r.delete(f'task:{task_id}')
        else:
            print("No tasks available. Waiting...")


# Usage
enqueue_task('task1', {'type': 'email', 'recipient': 'user@example.com'})
enqueue_task('task2', {'type': 'report', 'format': 'pdf'})

# In a separate process or thread
process_queue()
```

### Logged-in users

```python
import time

def log_user_in(user_id: str, session_id: str):
    # Store session info
    r.hset(f'session:{session_id}', 'user_id', user_id)
    r.hset(f'session:{session_id}', 'login_time', int(time.time()))
    
    # Add to set of logged-in users
    r.sadd('logged_in_users', user_id)

def log_user_out(session_id: str):
    user_id = r.hget(f'session:{session_id}', 'user_id')
    if user_id:
        r.srem('logged_in_users', user_id)
        r.delete(f'session:{session_id}')

def get_logged_in_users():
    return r.smembers('logged_in_users')

def is_user_logged_in(user_id: str):
    return r.sismember('logged_in_users', user_id)

# Usage
log_user_in('user123', 'session_abc123')
log_user_in('user456', 'session_def456')

print(get_logged_in_users())  # Set of logged-in user IDs
print(is_user_logged_in('user123'))  # True

log_user_out('session_abc123')
print(is_user_logged_in('user123'))  # False
```

### Counter

```python
def increment_page_views(page_url: str):
    return r.incr(f'pageviews:{page_url}')


def get_page_views(page_url: str):
    views = r.get(f'pageviews:{page_url}')
    return int(views) if views else 0


def increment_daily_active_users(date: str):
    return r.pfadd(f'daily_active_users:{date}', *get_logged_in_users())


def get_daily_active_users(date: str):
    return r.pfcount(f'daily_active_users:{date}')


# Usage
print(increment_page_views('/home'))  # 1
print(increment_page_views('/home'))  # 2
print(get_page_views('/home'))  # 2

# Assuming some users are logged in
increment_daily_active_users('2024-08-07')
print(get_daily_active_users('2024-08-07'))  # Number of unique active users
```

### Caching

```python
def get_user(user_id: str) -> dict:
    """
    Check cache first, otherwise get user from the cache and cache the data for an hour.
    """
    cached_user = r.get(f'user:{user_id}')
    if cached_user:
        return json.loads(cached_user)
    
    user = get_user_from_db(user_id)
    # {'id': user_id, 'name': 'John Doe', 'email': 'john@example.com'}
    
    r.setex(f'user:{user_id}', 3600, json.dumps(user))
    
    return user
```

### Rate limiting

```python
def rate_limit(user_id: str, limit: int = 5, period: int = 60) -> bool:
    key = f'rate:{user_id}'
    current = r.get(key)
    
    if current and int(current) >= limit:
        return False
    
    pipe = r.pipeline()
    pipe.incr(key)
    pipe.expire(key, period)
    pipe.execute()
    
    return True
```

### Pub/Sub messaging

```python
# Publisher
def publish_message(channel: str, message: str) -> None:
    r.publish(channel, message)


# Subscriber
pubsub = r.pubsub()
pubsub.subscribe('mychannel')

for message in pubsub.listen():
    if message['type'] == 'message':
        print(f"Received: {message['data']}")
```
