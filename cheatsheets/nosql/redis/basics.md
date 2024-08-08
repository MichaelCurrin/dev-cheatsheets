
# Basics

As a NoSQL in-memory database with no schema, Redis is faster than SQL databases for IO.

## What is Redis?

Redis stands for: Remote Dictionary Service.

- A Redis DB holds `key:value` pairs.
- It supports commands such as `GET`, `SET`, and `DEL`.
- Redis keys are always strings.
- See Data Types below for what values you can store.


## Use cases

Redis is useful for simple data types and structures where persistance of data is not a priority. Such as:

- cache (store frequently-accessed data to reduce response time)
- queue
- session storage for authenticated users
- message brokering for realtime applications
- counter

### Install

See [Install](https://redis.io/docs/latest/operate/oss_and_stack/install/install-redis/) guides. See commands for your OS and then see the OS-specific instructions to start/stop the Redis server and CLI client.

## Data types

- Strings (there are no numbers) - can store text or binary data. Useful for caching info or counters.
- Lists - good for queues or leaderboards where duplicates are allowed.
- Sets - efficient storage for unique items.
- Sorted sets - set but with order. For where order is important such as leaderboard.
- Hashes - represent objects. Attributes can be accessed without retrieving the etire object.
- Streams

More advanced:

- Bitmaps
- HyperLogLogs
- Geospatial indexes

## Start and stop Redis using the shell

Add `.exe` for Windows.

### Start server

```sh
$ redis-server
```

Or start as a service using a package manager for your OS.

Start with a config:

```sh
$ redis-server /etc/redis/6379.conf
```

## Start CLI client

```sh
$ redis-cli
```

Test connectivity:

```console
> PING
PONG
```
