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

[PyMongo]: {% link cheatsheets/python/libraries/database/pymongo/index.md %}
[MongoDB]: {% link cheatsheets/nosql/mongodb/index.md %}

## Resources

- [MongoEngine homepage](http://mongoengine.org/)
- [MongoEngine docs](https://docs.mongoengine.org/)
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

## Connect to MongoDB

Before you can start using MongoEngine, you need to establish a connection to your MongoDB instance.

```python
import mongoengine


mongoengine.connect('myapp')
mongoengine.connect('myapp', host='mongodb://localhost:27017')
```

This connects to a MongoDB instance running on `localhost:27017` and creates a database named `myapp` if it doesn't already exist.

## Create and save documents

Once you've defined your models and established a connection, you can create and save documents.

```python
user = User(email='john@example.com', first_name='John', last_name='Doe')
user.save()  # Saves the document to the 'user' collection
```

## Query documents

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

```python
for person in Person.objects:
    print(person)
```

## Update documents

You can update existing documents using the `save()` method or the `update()` method.

```python
# Update a single document
user = User.objects(email='john@example.com').first()
user.first_name = 'Johnny'
user.save()

# Update multiple documents
User.objects(first_name='John').update(set__first_name='Johnny')
```

## Deleting documents

```python
# Delete a single document
user = User.objects(email='john@example.com').first()
user.delete()

# Delete multiple documents
User.objects(first_name='John').delete()
```

## Embedding and referencing

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


## Use with Pydantic

Since Mongo is schemaless and does not have validation in the same way that a SQL database does, we can add a schema with MongonEngine and validation with Pydantic.

Here's a sample code for using Pydantic with MongoEngine for a basic Python application:

```python
from pydantic import BaseModel, Field

from mongoengine import Document, StringField, IntField, connect


class PersonModel(BaseModel):
    name: str = Field(description="Person's name", min_length=2)
    age: int = Field(
        gt=-1,
        lt=120,
        description="Person's age",
    )


class Person(Document):
    name = StringField(required=True)
    age: int = IntField(0, 120, description="Person's age")


connect("myapp")

# Pydantic
person_data = {"name": "Anne", "age": 13}
person_model = PersonModel(**person_data)

# Mongo
person_doc = Person(**person_model.model_dump())
person_doc.save()
```

### Why use Pydantic

Pydantic and MongoDB's built-in validation serve different purposes and can be used together to provide a more robust validation solution.

MongoDB's built-in validation is primarily focused on enforcing data integrity within the database itself. It allows you to define validation rules and constraints directly in the database schema, ensuring that any data inserted or updated in the database conforms to these rules. This is particularly useful for maintaining data consistency and preventing invalid or malformed data from being stored in the database.

On the other hand, Pydantic is a Python library for data validation and parsing. It operates at the application level, allowing you to define data models and validate input data before it is sent to the database. Pydantic provides a rich set of features for data validation, including type checking, value constraints, nested data structures, and more.

Using Pydantic in conjunction with MongoDB's built-in validation offers several advantages:

1. **Separation of Concerns**: By using Pydantic, you can separate the validation logic from the database layer, making your code more modular and easier to maintain.
2. **Client-side Validation**: Pydantic allows you to validate data on the client-side (in your application code) before sending it to the database. This can help catch errors early and prevent unnecessary database operations with invalid data.
3. **Complex Validation Rules**: While MongoDB's built-in validation is powerful, it may not cover all the validation scenarios you need. Pydantic provides a more flexible and extensible way to define complex validation rules and custom validation logic.
4. **Data Transformation**: Pydantic can be used to parse and transform data from various sources (e.g., HTTP requests, external APIs) into Python data structures that can then be validated before being stored in the database.
5. **Consistency across Layers**: By using Pydantic consistently across different layers of your application (e.g., API, services, data access), you can ensure that data is validated consistently throughout the application lifecycle.
