# Set operations

## Get

```python
# Get the number of members in a set
count = r.scard('fruits')
print(count)  # 2
```

```python
# Get all members of a set
members = r.smembers('fruits')
print(members)  # {b'apple', b'banana', b'cherry'}
```

```python
# Check if a member exists in a set
exists = r.sismember('fruits', 'apple')
print(exists)  # True
```

## Create/update

```python
# Add members to a set
r.sadd('fruits', 'apple', 'banana', 'cherry')
```

```python
# Move a member from one set to another
r.smove('tropical', 'fruits', 'banana')
```

## Remove

```python
# Remove a member from a set
r.srem('fruits', 'banana')
```


## Comparisons

```python
# Get the difference between sets
r.sadd('tropical', 'banana', 'mango')
diff = r.sdiff('fruits', 'tropical')
print(diff)  # {b'apple', b'cherry'}
```

```python
# Get the intersection of sets
inter = r.sinter('fruits', 'tropical')
print(inter)  # set()
```

```python
# Get the union of sets
union = r.sunion('fruits', 'tropical')
print(union)  # {b'apple', b'cherry', b'banana', b'mango'}
```
