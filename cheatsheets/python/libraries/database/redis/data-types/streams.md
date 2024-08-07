# Stream operations

## Get

```python
# Read from a stream
entries = r.xread({'mystream': '0-0'})
print(entries)  # [[b'mystream', [(b'1628799836599-0', {b'sensor': b'A', b'temperature': b'25.5'})]]]
```

```python
# Get the length of a stream
length = r.xlen('mystream')
print(length)  # 1
```

```python
# Read a range of entries
range_entries = r.xrange('mystream', '-', '+')
print(range_entries)  # [(b'1628799836599-0', {b'sensor': b'A', b'temperature': b'25.5'})]
```


```python
# Get information about the stream
info = r.xinfo_stream('mystream')
print(info)
```


```python
# Read as a consumer in a group
group_entries = r.xreadgroup('mygroup', 'consumer1', {'mystream': '>'})
print(group_entries)
```

## Create/update

```python
# Add an entry to a stream
entry_id = r.xadd('mystream', {'sensor': 'A', 'temperature': '25.5'})
print(entry_id)  # b'1628799836599-0'
```


```python
# Create a consumer group
r.xgroup_create('mystream', 'mygroup', '0')
```

```python
# Acknowledge processing of a message
r.xack('mystream', 'mygroup', '1628799836599-0')
```

## Remove

```python
# Trim the stream to a certain length
r.xtrim('mystream', maxlen=1000)
```

```python
# Delete an entry from the stream
r.xdel('mystream', '1628799836599-0')
```