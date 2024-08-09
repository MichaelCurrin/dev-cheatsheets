---
title: MongoDB
description: |
  A beginner's guide to MongoDB, a popular NoSQL document database.
---

MongoDB is a popular NoSQL document database that stores data in flexible, JSON-like documents with dynamic schemas. It is designed to be scalable, high-performance, and suitable for a wide range of applications, from small-scale projects to large web-scale applications.

## Related

- [PyMongo]({% link cheatsheets/python/libraries/pymongo/index.md %}) cheatsheet for using the official Python driver for MongoDB.
- [MongoEngine]({% link cheatsheets/python/libraries/mongoengine/index.md %}) cheatsheet for using the MongoEngine Object-Document Mapper for Python.

## Resources

- [MongoDB Documentation](https://docs.mongodb.com/)
- [MongoDB University](https://learn.mongodb.com/) - free online courses.


## Use Cases

MongoDB is a versatile database that can be used in a wide range of applications, including:

- Content Management Systems (CMS)
- Mobile and Web Applications
- Internet of Things (IoT)
- Real-time Analytics
- Caching

Its flexible schema, scalability, and performance make it a popular choice for modern applications that require handling large amounts of unstructured or semi-structured data.

This guide should give you a solid foundation for working with MongoDB. As you gain more experience, you can explore the advanced features and capabilities of MongoDB to build more complex and scalable applications.


## Installation

MongoDB can be installed on various platforms, including Windows, macOS, and Linux. You can download the appropriate installation package from the [MongoDB Download Center](https://www.mongodb.com/try/download/community).

Once installed, you can start the MongoDB server by running the `mongod` command for the "daemon" background process.

## MongoDB Shell

The MongoDB shell is an interactive JavaScript interface that allows you to interact with MongoDB databases, collections, and documents. You can launch the shell by running the `mongo` command in your terminal or command prompt.

```sh
$ mongo
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

Sure, here's a short section on how to create related collections in MongoDB, using the example of Users and Posts:

## Related Collections

MongoDB's flexible schema allows you to represent relationships between data in different ways. One common approach is to use separate collections for related entities and establish relationships using references or embedded documents.

### Users and Posts

Let's consider an example where we have a `users` collection and a `posts` collection, representing user profiles and blog posts, respectively.

#### Sample of related data

```javascript
// users collection
{
  "_id": ObjectId("6436e9c8d9f6b3c8e7f9d9e3"),
  "name": "John Doe",
  "email": "john@example.com"
}

// posts collection
{
  "_id": ObjectId("6436e9c8d9f6b3c8e7f9d9e4"),
  "title": "My First Post",
  "content": "This is the content of my first blog post.",
  "author": ObjectId("6436e9c8d9f6b3c8e7f9d9e3"),
  "comments": [
    {
      "author": ObjectId("6436e9c8d9f6b3c8e7f9d9e5"),
      "content": "Great post!",
      "timestamp": ISODate("2023-04-11T10:30:00Z")
    }
  ]
}
```

In this example, we have separate collections for `users` and `posts`. The `posts` collection contains an `author` field that references the `_id` of the corresponding user document in the `users` collection. Additionally, the `comments` field in the `posts` collection is an array of embedded documents, where each comment references the `_id` of the user who posted the comment.

This approach allows you to query and update users and posts independently while maintaining the relationship between them. You can use MongoDB's query operators and aggregation framework to perform complex operations involving related data.

#### Create collections

To create these related collections, you can use the `db.createCollection()` method in the MongoDB shell or the appropriate driver method in your programming language of choice.

```javascript
// Create the users collection
db.createCollection("users")

// Create the posts collection
db.createCollection("posts")
```

Once the collections are created, you can insert documents and establish relationships between them using references or embedded documents, as shown in the example above.

This is just one way to represent relationships in MongoDB. Depending on your data model and requirements, you may choose to use different approaches, such as embedding documents within other documents or using more advanced techniques like application-level joins or data denormalization.

#### Get all posts for a user

To get all posts for a specific user, you can use the `find` method and filter the `posts` collection based on the `author` field, which references the user's `_id`.

```javascript
// Get the user's _id
var userId = ObjectId("6436e9c8d9f6b3c8e7f9d9e3");

// Find all posts where the author field matches the user's _id
db.posts.find({ author: userId });
```

This query will return all documents in the `posts` collection where the `author` field matches the provided `userId`.

#### Get a user given a comment

To get the user who posted a specific comment, you can use the `$unwind` operator to deconstruct the `comments` array in the `posts` collection, and then perform a lookup to the `users` collection based on the `author` field in the comment document.

```javascript
// Get the comment's author _id
var commentAuthorId = ObjectId("6436e9c8d9f6b3c8e7f9d9e5");

// Find the user document based on the comment author _id
db.posts.aggregate([
  { $unwind: "$comments" },
  { $match: { "comments.author": commentAuthorId } },
  {
    $lookup: {
      from: "users",
      localField: "comments.author",
      foreignField: "_id",
      as: "commentAuthor"
    }
  },
  { $unwind: "$commentAuthor" },
  { $project: { _id: 0, commentAuthor: 1 } }
]);
```

Here's what this query does:

1. `$unwind`: Deconstructs the `comments` array, creating a separate document for each comment.
2. `$match`: Filters the documents to only include those where the `author` field in the comment matches the provided `commentAuthorId`.
3. `$lookup`: Performs a left outer join with the `users` collection, matching the `author` field in the comment with the `_id` field in the `users` collection. The matched user documents are stored in the `commentAuthor` field.
4. `$unwind`: Deconstructs the `commentAuthor` array, which should contain at most one document.
5. `$project`: Excludes the `_id` field and includes only the `commentAuthor` field, which contains the user document for the comment author.

This query will return the user document for the author of the specified comment.

Note that these queries assume that you have properly set up the relationships between the `users` and `posts` collections using references or embedded documents, as shown in the previous example.
