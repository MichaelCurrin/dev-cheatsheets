# Advanced Features

MongoDB provides several advanced features, including:

## Indexing

Indexes can significantly improve query performance by allowing MongoDB to quickly locate relevant documents.

```console
> db.users.createIndex({ name: 1 })
```

## Aggregation

MongoDB's aggregation framework allows you to perform complex data processing and analysis operations on your data.

```console
> db.users.aggregate([
    { $match: { age: { $gt: 30 } } },
    { $group: { _id: '$city', count: { $sum: 1 } } }
])
```

## Replication

Replication allows you to create redundant copies of your data across multiple servers, providing high availability and fault tolerance.

## Sharding

Sharding is a horizontal scaling technique that allows you to distribute data across multiple servers, enabling your database to scale out as your data grows.

## Transactions

MongoDB supports multi-document transactions, allowing you to perform multiple operations as an all-or-nothing unit of work.

Sure, here's a short section on how to create related collections in MongoDB, using the example of Users and Posts:
