# String operations

```python
# Set a string value
r.set('user:name', 'Alice')
```

```python
# Get a string value
name = r.get('user:name')
print(name)  # b'Alice'
```

```python
# Set multiple strings at once
r.mset({'user:name': 'Bob', 'user:age': '30'})
```

```python
# Get multiple strings at once
values = r.mget(['user:name', 'user:age'])
print(values)  # [b'Bob', b'30']
```

```python
# Increment a string value (treated as integer)
r.set('counter', '5')
r.incr('counter')
print(r.get('counter'))  # b'6'
```

```python
# Append to a string
r.append('user:name', ' Smith')
print(r.get('user:name'))  # b'Bob Smith'
```

```python
# Get substring (0-based indexing)
r.setrange('user:name', 0, 'Robert')
print(r.getrange('user:name', 0, 5))  # b'Robert'
```

```python
# Set with expiration (in seconds)
r.setex('session:token', 3600, 'abc123')
```

Note: In Redis, there are no separate number types. Numbers are stored as strings and can be manipulated with special commands like `INCR`, `DECR`, etc.