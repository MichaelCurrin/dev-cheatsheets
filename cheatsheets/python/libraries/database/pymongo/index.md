---
title: PyMongo
description: |
  A beginner's guide to using PyMongo, the official Python driver for MongoDB.
---

PyMongo is the official Python driver for MongoDB, a popular NoSQL document database. 

It provides a rich and Pythonic interface for interacting with MongoDB databases, allowing you to perform various operations such as creating, reading, updating, and deleting documents.

## Related

- [MongoDB][] cheatsheet in the NoSQL section, covering installation, basic operations, and common use cases.
- [MongoEngine]({% link cheatsheets/python/libraries/mongoengine/index.md %}) cheatsheet for using the MongoEngine Object-Document Mapper.

[MongoDB]: {% link cheatsheets/nosql/mongodb/index.md %}

## Resources

- [PyMongo Documentation](https://pymongo.readthedocs.io/)
- [MongoDB Python Driver Tutorial](https://www.mongodb.com/docs/drivers/python/)

## Installation

PyMongo can be installed using pip:

```sh
$ pip install pymongo
```

## Connecting to MongoDB

Before you can start using PyMongo, you need to establish a connection to your MongoDB instance.

```python
import pymongo

# Connect to a running MongoDB instance
client = pymongo.MongoClient('mongodb://localhost:27017/')

# Get a reference to a specific database
db = client['myapp']
```

This connects to a MongoDB instance running on `localhost:27017` and creates (or gets a reference to) a database named `myapp`.

## Creating and Inserting Documents

In MongoDB, data is stored as documents, which are similar to JSON objects. PyMongo allows you to work with documents using Python dictionaries.

```python
# Create a new document
document = {
    'name': 'John Doe',
    'email': 'john@example.com',
    'age': 30
}

# Insert the document into a collection
collection = db['users']
result = collection.insert_one(document)
print(result.inserted_id)  # Prints the ID of the inserted document
```

## Querying Documents

PyMongo provides a powerful query API that allows you to filter, sort, and perform various operations on your documents.

```python
# Find all documents in a collection
documents = collection.find()

# Find documents matching a specific criteria
criteria = {'age': {'$gt': 25}}
documents = collection.find(criteria)

# Sort documents
documents = collection.find().sort('name', pymongo.ASCENDING)
```

## Updating Documents

You can update existing documents using the `update_one()` or `update_many()` methods.

```python
# Update a single document
filter = {'email': 'john@example.com'}
update = {'$set': {'age': 31}}
result = collection.update_one(filter, update)
print(result.modified_count)  # Prints the number of documents modified

# Update multiple documents
filter = {'age': {'$lt': 30}}
update = {'$inc': {'age': 1}}
result = collection.update_many(filter, update)
print(result.modified_count)  # Prints the number of documents modified
```

## Deleting Documents

Deleting documents is straightforward with PyMongo.

```python
# Delete a single document
filter = {'email': 'john@example.com'}
result = collection.delete_one(filter)
print(result.deleted_count)  # Prints the number of documents deleted

# Delete multiple documents
filter = {'age': {'$lt': 25}}
result = collection.delete_many(filter)
print(result.deleted_count)  # Prints the number of documents deleted
```

## Advanced Operations

PyMongo provides several advanced features and operations, including:

### Indexing

Indexes can significantly improve query performance by allowing MongoDB to quickly locate relevant documents.

```python
# Create an index on the 'name' field
collection.create_index('name')

# Create a compound index on multiple fields
collection.create_index([('name', pymongo.ASCENDING), ('age', pymongo.DESCENDING)])
```

### Aggregation

MongoDB's aggregation framework allows you to perform complex data processing and analysis operations on your data.

```python
# Count the number of documents grouped by age
pipeline = [
    {'$group': {'_id': '$age', 'count': {'$sum': 1}}}
]
results = collection.aggregate(pipeline)
for result in results:
    print(f"Age: {result['_id']}, Count: {result['count']}")
```

### Transactions

MongoDB supports multi-document transactions, allowing you to perform multiple operations as an all-or-nothing unit of work.

```python
# Start a client session
session = client.start_session()

with session:
    # Start a transaction
    session.start_transaction()

    try:
        # Perform multiple operations within the transaction
        collection.insert_one({'name': 'Alice'}, session=session)
        collection.insert_one({'name': 'Bob'}, session=session)

        # Commit the transaction
        session.commit_transaction()
    except Exception as e:
        # Abort the transaction on error
        session.abort_transaction()
        raise e
```

## Advanced Features

PyMongo provides several advanced features, including:

- **Change Streams**: Allows you to monitor changes to your data in real-time.
- **GridFS**: Allows you to store and retrieve large files (e.g., images, videos) in MongoDB.
- **Replica Set Support**: Allows you to connect to and work with MongoDB replica sets for high availability and failover.
- **Sharded Cluster Support**: Allows you to connect to and work with sharded MongoDB clusters for horizontal scaling.

For more information on these and other advanced features, please refer to the [PyMongo Documentation](https://pymongo.readthedocs.io/).

This guide should give you a solid foundation for working with PyMongo and MongoDB in your Python projects. As you gain more experience, you can explore the advanced features and capabilities of PyMongo to build more complex and scalable applications.