# Redis

Homepage: [https://redis.io/](https://redis.io/).

## Redis commands

See [Commands](https://redis.io/docs/latest/commands/) on the Redis docs.

Node starter project on GitHub - [redis-nodejs-starter](https://github.com/redis-developer/redis-nodejs-starter).

See [Install](https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/) guides. See commands for your OS and then see the OS-specific instructions to start/stop the Redis server and CLI client.


## Basics

As a NoSQL in-memory database with no schema, Redis is faster than SQL databases for IO.

Redis is useful for simple data types and structures, such as a queue or a counter.

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
0
> INCR counter
> DECR counter
> INCRBY counter 4
> DECRBY counter 2
```


### Strings

```console
> STRLEN key
```

```console
> APPEND key " value"
```

### Slicing

```console
> GETRANGE key 0 3
```
