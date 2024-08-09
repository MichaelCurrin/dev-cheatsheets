---
title: MongoDB
description: |
  A beginner's guide to MongoDB, a popular NoSQL document database.
---

MongoDB is a popular NoSQL document database that stores data in flexible, JSON-like documents with dynamic schemas. It is designed to be scalable, high-performance, and suitable for a wide range of applications, from small-scale projects to large web-scale applications.

## Related

- [PyMongo]({% link cheatsheets/python/libaries/pymongo/index.md %}) cheatsheet for using the official Python driver for MongoDB.
- [MongoEngine]({% link cheatsheets/python/libaries/mongoengine/index.md %}) cheatsheet for using the MongoEngine Object-Document Mapper.

## Resources

- [MongoDB Documentation](https://docs.mongodb.com/)
- [MongoDB University](https://learn.mongodb.com/) (free online courses)

## Installation

MongoDB can be installed on various platforms, including Windows, macOS, and Linux. You can download the appropriate installation package from the [MongoDB Download Center](https://www.mongodb.com/try/download/community).

Once installed, you can start the MongoDB server by running the `mongod` command.

## MongoDB Shell

The MongoDB shell (`mongo`) is an interactive JavaScript interface that allows you to interact with MongoDB databases, collections, and documents. You can launch the shell by running the `mongo` command in your terminal or command prompt.

```
$ mongo
MongoDB shell version: 5.0.14
...
>
```

## Basic Operations

### Creating a Database

In MongoDB, databases are created implicitly when you create your first collection or document. You can switch to a specific database using the `use` command:

```console
> use myapp
switched to db myapp
```

### Creating a Collection

Collections are analogous to tables in relational databases. You can create a collection by inserting your first document into it:

```console
> db.users.insert({ name: 'John Doe', email: 'john@example.com' })
WriteResult({ "nInserted" : 1 })
```

This command creates a new collection named `users` and inserts a document into it.

### Querying Documents

You can query documents using the `find` method:

```console
> db.users.find()
{ "_id" : ObjectId("6436e9c8d9f6b3c8e7f9d9e3"), "name" : "John Doe", "email" : "john@example.com" }
```

You can also filter documents using query operators:

```console
> db.users.find({ age: { $gt: 30 } })
```

### Updating Documents

You can update documents using the `update` method:

```console
> db.users.update({ name: 'John Doe' }, { $set: { email: 'john.doe@example.com' } })
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
```

### Deleting Documents

You can delete documents using the `remove` method:

```console
> db.users.remove({ name: 'John Doe' })
WriteResult({ "nRemoved" : 1 })
```

## Advanced Features

MongoDB provides several advanced features, including:

### Indexing

Indexes can significantly improve query performance by allowing MongoDB to quickly locate relevant documents.

```console
> db.users.createIndex({ name: 1 })
```

### Aggregation

MongoDB's aggregation framework allows you to perform complex data processing and analysis operations on your data.

```console
> db.users.aggregate([
    { $match: { age: { $gt: 30 } } },
    { $group: { _id: '$city', count: { $sum: 1 } } }
])
```

### Replication

Replication allows you to create redundant copies of your data across multiple servers, providing high availability and fault tolerance.

### Sharding

Sharding is a horizontal scaling technique that allows you to distribute data across multiple servers, enabling your database to scale out as your data grows.

### Transactions

MongoDB supports multi-document transactions, allowing you to perform multiple operations as an all-or-nothing unit of work.

## Use Cases

MongoDB is a versatile database that can be used in a wide range of applications, including:

- Content Management Systems (CMS)
- Mobile and Web Applications
- Internet of Things (IoT)
- Real-time Analytics
- Caching

Its flexible schema, scalability, and performance make it a popular choice for modern applications that require handling large amounts of unstructured or semi-structured data.

This guide should give you a solid foundation for working with MongoDB. As you gain more experience, you can explore the advanced features and capabilities of MongoDB to build more complex and scalable applications.