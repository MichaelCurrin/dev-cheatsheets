---
title: MongoEngine
description: |
  A beginner's guide to using MongoEngine, a Python Object-Document Mapper for working with MongoDB.
---

MongoEngine is a Python Object-Document Mapper (ODM) that allows you to work with MongoDB in a way similar to Object-Relational Mappers (ORMs) like SQLAlchemy. 

It provides a high-level abstraction layer on top of the [PyMongo][] driver, allowing you to define Python classes that map to MongoDB collections and perform database operations using Python objects.

## Related

- [MongoDB][] cheatsheet in the NoSQL section, covering installation, basic operations, and common use cases.
- [PyMongo][] cheatsheet in the Python libraries section.

[PyMongo]: {% link cheatsheets/python/libraries/database/pymongo/index.md%}
[MongoDB]: {% link cheatsheets/nosql/mongodb/index.md %}

## Resources

- [MongoEngine Documentation](http://mongoengine.org/)
- [MongoEngine Tutorial](https://realpython.com/intropnduction-to-mongodb-and-python/)

## Installation

MongoEngine can be installed using pip:

```sh
$ pip install mongoengine
```

## Defining Models

In MongoEngine, you define Python classes that map to MongoDB collections. Each class attribute represents a field in the document.

```python
import mongoengine


class User(mongoengine.Document):
    email = mongoengine.StringField(required=True)
    first_name = mongoengine.StringField(max_length=50)
    last_name = mongoengine.StringField(max_length=50)
```

This defines a `User` model with three fields: `email` (required string), `first_name` (optional string with max length 50), and `last_name` (optional string with max length 50).

## Connecting to MongoDB

Before you can start using MongoEngine, you need to establish a connection to your MongoDB instance.

```python
import mongoengine


mongoengine.connect('myapp', host='mongodb://localhost:27017')
```

This connects to a MongoDB instance running on `localhost:27017` and creates a database named `myapp` if it doesn't already exist.

## Creating and Saving Documents

Once you've defined your models and established a connection, you can create and save documents.

```python
user = User(email='john@example.com', first_name='John', last_name='Doe')
user.save()  # Saves the document to the 'user' collection
```

## Querying Documents

MongoEngine provides a powerful query API that allows you to filter, sort, and perform various operations on your documents.

```python
# Find all users
users = User.objects()

# Find users with a specific email
user = User.objects(email='john@example.com').first()

# Filter users by first name
users = User.objects(first_name__startswith='J')

# Sort users by last name
users = User.objects().order_by('last_name')
```

## Updating Documents

You can update existing documents using the `save()` method or the `update()` method.

```python
# Update a single document
user = User.objects(email='john@example.com').first()
user.first_name = 'Johnny'
user.save()

# Update multiple documents
User.objects(first_name='John').update(set__first_name='Johnny')
```

## Deleting Documents

Deleting documents is straightforward with MongoEngine.

```python
# Delete a single document
user = User.objects(email='john@example.com').first()
user.delete()

# Delete multiple documents
User.objects(first_name='John').delete()
```

## Embedding and Referencing

MongoEngine supports embedding and referencing documents, which are two different ways of representing relationships between data in MongoDB.

### Embedding

Embedding is the process of nesting one document inside another. This is useful when you have a one-to-one or one-to-many relationship between documents.

```python
class Address(mongoengine.EmbeddedDocument):
    street = mongoengine.StringField()
    city = mongoengine.StringField()

class User(mongoengine.Document):
    email = mongoengine.StringField(required=True)
    addresses = mongoengine.EmbeddedDocumentListField(Address)
```

### Referencing

Referencing is the process of creating a reference from one document to another. This is useful when you have a many-to-many relationship between documents.

```python
class User(mongoengine.Document):
    email = mongoengine.StringField(required=True)
    first_name = mongoengine.StringField(max_length=50)
    last_name = mongoengine.StringField(max_length=50)


class Book(mongoengine.Document):
    title = mongoengine.StringField(required=True)
    authors = mongoengine.ListField(mongoengine.ReferenceField(User))
```

## Advanced Features

MongoEngine provides several advanced features, including:

- **Signals**: Allows you to define functions that are triggered when certain events occur, such as before or after saving a document.
- **Indexes**: Allows you to define indexes on your collections for improved query performance.
- **Validation**: Allows you to define validation rules for your document fields.
- **Caching**: Allows you to cache query results for improved performance.

For more information on these and other advanced features, please refer to the [MongoEngine Documentation](http://mongoengine.org/).

This guide should give you a solid foundation for working with MongoEngine and MongoDB in your Python projects. As you gain more experience, you can explore the advanced features and capabilities of MongoEngine to build more complex and scalable applications.