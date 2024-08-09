---
title: MongoDB
description: |
  A beginner's guide to MongoDB, a popular NoSQL document database.
---

MongoDB is a popular NoSQL document database that stores data in flexible, JSON-like documents with dynamic schemas. It is designed to be scalable, high-performance, and suitable for a wide range of applications, from small-scale projects to large web-scale applications.

## Related

- [PyMongo]({% link cheatsheets/python/libraries/database/pymongo/index.md %}) cheatsheet for using the official Python driver for MongoDB.
- [MongoEngine]({% link cheatsheets/python/libraries/database/mongoengine/index.md %}) cheatsheet for using the MongoEngine Object-Document Mapper for Python.

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

MongoDB can be accessed as a hosted solution on MongoAtlas, on a free tier or paid Enterprise version.

MongoDB can be installed locally or on a selfhosted system, for various operating systems and with Docker. See the [Community Installation docs](https://www.mongodb.com/docs/manual/administration/install-community/).

The installation includes the following binaries:

- The `mongod` server
- The `mongos` sharded cluster query router
- The MongoDB Shell, `mongosh`