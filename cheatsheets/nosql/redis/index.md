# Redis

A in-memory data structure store, known for high performance as a database, cache, and message broker. It can handel complex data types and large volumes at a speed and with reliability.


## Related

- [redis.io](https://redis.io/)
- [Redis][] cheatsheet in the Python libraries section.
- [redis-nodejs-starter](https://github.com/redis-developer/redis-nodejs-starter) as a  Node starter project on GitHub.


[Redis]: {% link cheatsheets/python/libraries/database/redis/index.md %}


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

    

## Security tips

Protect unauthorized data access and manipulation.

- Authentication - use strong authentication mechanims so only autherized applications and user have access.
- Use TLS for data transfer between Redis and client apps.
- Network security - Apply firewalls to limit IP access and monitor network traffic.
