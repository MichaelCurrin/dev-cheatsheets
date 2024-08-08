# Hash operations

## Get

```python
# Get all fields and values of a hash
user = r.hgetall('user:1000')
print(user)  # {b'name': b'John Doe', b'email': b'john@example.com', b'age': b'30'}
```

```python
# Get the number of fields in a hash
count = r.hlen('user:1000')
print(count)  # 3

# Get all field names
fields = r.hkeys('user:1000')
print(fields)  # [b'name', b'email', b'visits']
```

```python
# Get the value of a specific field
name = r.hget('user:1000', 'name')
print(name)  # b'John Doe'
# Get values of multiple fields
values = r.hmget('user:1000', ['name', 'age'])
print(values)  # [b'John Doe', b'30']
```

```python
# Check if a field exists
exists = r.hexists('user:1000', 'email')
print(exists)  # True
```

## Create/update

```python
# Set a field.
r.hset('user:1000', 'visits', '10')

# Set a field only if it doesn't exist
r.hsetnx('user:1000', 'visits', '10')

# Set multiple fields as a dict.
mapping = {'name': 'John Doe', 'email': 'john@example.com', 'age': '30'}
r.hset('user:1000', mapping=mapping)

# Set multiple fields as list.
items = [
    ['name', 'John Doe'],
    ['email', 'john@example.com'],
    ['age', '30']
]
r.hset('user:1000', items=items)

# Mixed is also possible.
r.hset('user:1000', 'name', 'John Doe', mapping={'email': 'john@example.com', 'age': '30'})
r.hgetall('user:1000')
# => {b'name': b'John Doe', b'email': b'john@example.com', b'age': b'30'}
```

```python
# Increment the integer value of a field
r.hincrby('user:1000', 'visits', 1)
```


## Remove

```python
# Delete one or more fields
r.hdel('user:1000', 'age')
```
