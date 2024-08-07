# List operations

## Get

```python
# Get list length
length = r.llen('fruits')
print(length)  # 4
```

```python
# Get range of items (0-based indexing)
items = r.lrange('fruits', 0, -1)
print(items)  # [b'date', b'apple', b'banana', b'cherry']
```

## Create/update

```python
# Push items to the right of a list
r.rpush('fruits', 'apple', 'banana', 'cherry')
```

```python
# Push items to the left of a list
r.lpush('fruits', 'date')
```

```python
# Insert item before or after specific value
r.linsert('fruits', 'BEFORE', 'banana', 'kiwi')
```

```python
# Set item at specific index
r.lset('fruits', 0, 'grape')
```

## Remove

```python
# Remove and return an item from the right
item = r.rpop('fruits')
print(item)  # b'cherry'
```

```python
# Remove and return an item from the left
item = r.lpop('fruits')
print(item)  # b'date'
```

```python
# Trim a list to specified range
r.ltrim('fruits', 0, 1)  # Keep only first two items
```

## Block

```python
# Block and wait for item to be pushed to a list
item = r.brpop('fruits', timeout=5)  # Wait up to 5 seconds
```