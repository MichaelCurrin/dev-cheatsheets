# Sorted set operations

## Get

```python
# Get the score of a member
score = r.zscore('leaderboard', 'Bob')
print(score)  # 80.0
```

```python
# Get the rank of a member (0-based)
rank = r.zrank('leaderboard', 'Charlie')
print(rank)  # 1
```

```python
# Get range of members by rank (0-based)
members = r.zrange('leaderboard', 0, -1, withscores=True)
print(members)  # [(b'Bob', 80.0), (b'Charlie', 95.0), (b'Alice', 100.0)]
```

```python
# Get range of members by score
members = r.zrangebyscore('leaderboard', 90, 100, withscores=True)
print(members)  # [(b'Charlie', 95.0), (b'Alice', 100.0)]
```

```python
# Get the number of members in a sorted set
count = r.zcard('leaderboard')
print(count)  # 2
```

```python
# Count members with scores within a range
count = r.zcount('leaderboard', 90, 100)
print(count)  # 2
```


## Create/update

```python
# Add members with scores to a sorted set
r.zadd('leaderboard', {'Alice': 100, 'Bob': 80, 'Charlie': 95})
```

```python
# Increment the score of a member
r.zincrby('leaderboard', 5, 'Bob')
```

## Remove

```python
# Remove members from a sorted set
r.zrem('leaderboard', 'Charlie')
```

