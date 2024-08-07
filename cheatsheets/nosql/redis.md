# Redis

A key-value NoSQL database.

Homepage: [https://redis.io/](https://redis.io/).

## Redis commands

See [Commands](https://redis.io/docs/latest/commands/) on the Redis docs.

Node starter project on GitHub - [redis-nodejs-starter](https://github.com/redis-developer/redis-nodejs-starter).

See [Install](https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/) guides. See commands for your OS and then see the OS-specific instructions to start/stop the Redis server and CLI client.


## Basics

As a NoSQL in-memory database with no schema, Redis is faster than SQL databases for IO.

Redis is useful for simple data types and structures.

- queue
- logged in users
- counter

And where persistance of data is not a priority.

### Data types

- Strings (there are no numbers)
- Lists
- Sets (unique)
- Sorted sets (where order is important such as leaderboard)
- Hashes (such as attributes of a user)
- Streams

More advanced:

- Bitmaps
- HyperLogLogs
- Geospatial indexes

### Start and stop Redis using the shell

Start server:

```sh
$ redis-server
```

Or start as a service using a package manager for your OS.

Start CLI client:

```sh
$ redis-cli
```


## Redis CLI

### Get and set

```console
> SET key value
```

```console
> GET key
```

Add quotes for spaces:

```console
> SET "my key" "my value"
```

### Working with numeric data

```console
> SET counter 0
> GET counter
"0"
> INCR counter
> DECR counter
> INCRBY counter 4
> DECRBY counter 2
```

### Strings

```console
> STRLEN key
(integer) 123
```

```console
> APPEND key " value"
```

```console
> GETRANGE key 0 3
```

### Hashmap

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


### Lists

They are implemented as doubly linked lists. Inserting and removing from either end has $$O(1)$$ time complexity. Retrieving an element in the middle has $$O(N)$$ time complexity since you cannot look up an element by index directly.

#### Length

```console
> LLEN key
```

#### Add at start or end with push

```console
> LPUSH key element [element, ...]
> RPUSH key element [element, ...]
```

#### Add next to element insert

This will add before/after the _first_ instance of an existing string.

```console
> LINSERT key BEFORE|AFTER pivot element 
```

e.g.

```console
> LINSERT key AFTER "existing" "new"
```

#### Remove

```console
> RPOP key [count]
> LPOP key [count]
```

#### View

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


### Sets

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

### Sorted set

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

## Pun sub feature

Under fire and forget principle. Data sent to the bus is sent to all consumers. If not consumed by workers, the data are lost.

Works for realtime data transport and is lightweight and easy to use. But data is not persisted.

```
PUBLISH channel message
```

```
SUBSCRIBE channel [channel ...]
```

## Streams

An append-only data type (not a feature). They **persist** data unless you remove a record. Modelled after log files. You can add complex data as key-value pairs.

### Add

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

### Read

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

#### Reading in realtime

It's similar to pub/sub. Each message is sent to each consumer, except they are not removed from the stream.

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


## Keyspace notifications

Get notified when data enters or leaves Redis. Also timeout and time-based notifications.

### User login timeout example

Here we logout a user after a set time and also send a keyspace notification about it which we can subscribe to.

With EX you can set TTL (time to live).

For example, login a user and set expiration of an hour with 3600 seconds (user will remove the key after this). T=T==

```console
> SET logged_in_user:1234 123456789 EX 3600
```

Then again with the `XX` flag which will update an existing value and return `-1` if they key does not yet exist.

```console
> SET logged_in_user:1234 123456789 EX 3600 XX
```

Subscribe to expiration events:

```sh
$ redis-cli --csv psubscribe '__key*__:expired'
```


## Scaling

Needs:

- Scaling - storage capacity and processing can grow.
- High availability - always available even if some servers have issues.
- Partition tolerance - if the network is partioned, and some are disconnected, Redis must still work.

Solutions:

### Clusters

- To distribute data and load.
- There is time to sync between clusters, so the queried result for two clusters could be different, but it will always be available.

Features:

- No limit to storage and always available.
- The storage capacity can grow outside the limits of the memory of a single node.
- Elastic capacity - can scale up and down with demand.
- Data sharding (information is distributed based on key and algorithm, info is distributed so one server doesn't get overloaded) and data replication (highly available, data replicated on other servers). Just needs configuration.
- Client transparency - client connector works the same with and without a cluster.

#### Example setup

Start some servers using a config file for each and running on a different port.

Then start the cluster using, where info is replicated from each node to 1 other.

```sh
$ redis-cli --cluster create 127.0.0.1:7001 127.0.0.1:7002 127.0.0.1:7003 --cluster-replicas 1
```

## Sentinel

A pattern of master and replicas. So if master goes down, the replica can be promoted.

Provides monitoring and failover for your Redis instances.

1. Start your instances, each with a config.
    ```sh
    $ redis-cli ./redis.conf
    ```
1. Start your sentinels, each with a config.
    ```sh
    $ redis-sentinel ./sentinel.conf
    ```

    
