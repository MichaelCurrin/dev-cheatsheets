
---
description: How to use the interactive Redis CLI
---
# Redis CLI

See [Commands](https://redis.io/docs/latest/commands/) on the Redis docs.

Start with:

```sh
$ redis-cli
```

## String operations

```console
> GET key
```

```console
> MGET key1 key2
```

```console
> GETRANGE key 0 3
```

```console
> STRLEN key
(integer) 123
```

```console
> SET key value
# Add quotes for spaces:
> SET "my key" "my value"
```

```console
> MSET key1 value1 key2 value2
```

```console
> APPEND key " value"
```




## Working with numeric data

```console
> SET counter 0
> GET counter
"0"
> INCR counter
> DECR counter
> INCRBY counter 4
> DECRBY counter 2
```

## Hashmap

```console
> HSET key field value [field value...]
> HSET loggedInUser:123 name "Foo Bar" url "https://example.com"
```

```console
> HGET loggedInUser:123 name
"Foo Bar"
```

```console
> HMGET loggedInUser:123 name url
1) "Foo Bar"
2) "https://example.com"
```

A shopping cart of data for users. The cart is 123 and items are 1 and 2 here.

```console
> HSET cart:123 dev:1:name "Oranges" dev:1:price "1.23"
```

```console
> HSET cart:123 dev:1:name "Oranges" dev:1:price "1.23" dev:2:name "Bananas"
> HGETALL cart:123
1) "dev:1:name"
2) "Oranges"
3) "dev:1:price"
4) "1.23"
5) "dev:2:name"
6) "Bananas"
> HLEN cart:123
6
```

## Lists

They are implemented as doubly linked lists. Inserting and removing from either end has $$O(1)$$ time complexity. Retrieving an element in the middle has $$O(N)$$ time complexity since you cannot look up an element by index directly.

### Length

```console
> LLEN key
```

### Add at start or end with push

```console
> LPUSH key element [element, ...]
> RPUSH key element [element, ...]
```

### Add next to element insert

This will add before/after the _first_ instance of an existing string.

```console
> LINSERT key BEFORE|AFTER pivot element 
```

e.g.

```console
> LINSERT key AFTER "existing" "new"
```

### Remove

```console
> RPOP key [count]
> LPOP key [count]
```

### View

The indexes are inclusive.

```console
> LRANGE key start stop
```

Head element:

```console
> LRANGE queue 0 0
```

Tail element:

```console
> LRANGE queue -1 -1
```

Get first 3 elements (at `0`, `1`, and `2`):

```console
> LRANGE queue 0 2
1) "a"
2) "b"
3) "c"
```

All elements:

```console
> LRANGE queue 0 -1
```


## Sets

Sets are useful for data generated externally where the order doesn't matter and you don't want to have duplicates.

```console
> SADD key member [member ...]
```

```console
> SREM key member
```

Remove a random number of members from the set.

```console
> SPOP key [count]
```

Retrieve elements

```console
> SMEMBERS queue
1) abc
2) def
```

## Sorted set

Unique elements with order. Give the value and sort index. Change the index and the set will be reordered.

Use-cases:

- priority queue
- leaderboard
- task scheduling

```
ZADD key score member [score member ...]
```
e.g.

```console
> ZADD users 123 "foo bar"
> ZADD users 1000 "fizz buzz"
```

Get with ascending order.

```console
> # Ascending
> ZRANGE key start stop
> # Descending
> ZREVRANGE key start stop
```

e.g.

```console
> ZRANGE users 0 1 
1) "foo bar"
2) "fizz buzz"
```

Update a member by incrementing their value:
```console
> ZINCRBY key increment member
```

## Pub/sub feature

Follows the fire and forget principle. Data sent to the bus is sent to all consumers. If not consumed by workers, the data are lost.

Works for realtime data transport and is lightweight and easy to use. But data is not persisted.

```
PUBLISH channel message
```

```
SUBSCRIBE channel [channel ...]
```

## Streams

An append-only data type (not a feature). They **persist** data unless you remove a record. Modelled after log files. You can add complex data as key-value pairs.

### Add to a stream

```
XADD key id field value
```

The `id` is usually `*`.

The IDs are unix timestamps.

e.g.

```console
> XADD events * user "joe" event_type "left-click" coord_x 31 coord_y 50
"1722958057606-0"
> XADD events * user "joe" event_type "scroll"
"1722958065294-0"
```

### Read from a stream

```console
> XRANGE key start end [COUNT count]
> XREVRANGE key start end [COUNT count]
```

e.g. All events.

```console
> XRANGE events - +
1) 1) "1722958057606-0"
   2) 1) "user"
      2) "joe"
      3) "event_type"
      4) "left-click"
      5) "coord_x"
      6) "32"
      7) "coord_y"
      8) "50"
2) 1) "1722958065294-0"
   2) 1) "user"
      2) "joe"
      3) "event_type"
      4) "scroll"
```

You can query a window of time. e.g. The 1st event, using the timestamp of the first event as the max (inclusive).

```console
> XRANGE events - 1722958057606
1) 1) "1722958057606-0"
   2) 1) "user"
      2) "joe"
      3) "event_type"
      4) "left-click"
      5) "coord_x"
      6) "32"
      7) "coord_y"
      8) "50"
```

Get a fixed number of events at the start or end.

```console
> XRANGE events - + COUNT 1
> XREVRANGE events + - COUNT 1
```

### Read from a stream in realtime

This is similar to pub/sub. Each message is sent to each consumer, except they are not removed from the stream.

Basic:

```console
> XREAD STREAMS key id
```

Full:

```console
> XREAD [COUNT count] [BLOCK milliseconds] STREAMS key [key ...] id [id ...]
```

e.g.

```console
> XREAD BLOCK 0 STREAMS events $
```

```console
> XADD events * user "bob" event_type "scroll"
```
