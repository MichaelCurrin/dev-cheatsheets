# What is MongoDB?

**NoSQL**:

- MongoDB is a NoSQL (Non-relational) database
- It stores data in **flexible, JSON-like documents**
- Documents are organized into **collections** (similar to tables in SQL databases)
- Suitable for unstructured data and situations where needs will change over time since it is schemaless.

Comparison with SQL databases:

| Aspect | SQL Databases | MongoDB |
|--------|----------------|----------|
| Schema | Rigid schema | Schemaless |
| Data Structure | Tables and rows | Documents and collections |
| Data Integrity | Strict data integrity rules | More flexible |
| Strengths | Complex transactions and joins | Hierarchical data and horizontal scaling |
| Consistency Model | ACID-compliant | Eventual consistency |

**Load**:

- Designed to handle high write loads and real-time analytics
- Sharding allows for horizontal scaling across multiple servers
- Replica sets provide automatic failover and data redundancy
- Load balancing and read preferences can distribute read traffic across replicas

**Performance**:

- Indexing and query optimization features for efficient data retrieval
- Aggregation framework for data processing and analytics
- In-memory storage engine (WiredTiger) for low-latency operations
- Horizontal scaling through sharding for increased throughput and capacity

**Comparison with Redis**:

- Redis is an in-memory data store, while MongoDB is a general-purpose database
- Redis excels at caching, pub/sub messaging, and simple data structures
- MongoDB is better suited for storing complex, structured data and running queries
- Redis is faster for **simple** operations, but MongoDB offers richer **querying capabilities**

**Cost**:

- MongoDB is open-source and free to use
- Hosting and support services from MongoDB Inc. have various pricing plans
- On-premises deployment has infrastructure and maintenance costs
- Cloud-hosted solutions like MongoDB Atlas have pay-as-you-go pricing models

**Hosting**:

- Can be self-hosted on-premises or in the cloud
- MongoDB Atlas is a fully-managed cloud hosting service by MongoDB Inc.
- Supported on major cloud platforms like AWS, Azure, and Google Cloud
- Can be deployed as a replica set or sharded cluster for high availability and scalability

## Getting functionality of a SQL DB

- Document Validation: MongoDB allows you to define validation rules and apply them to a collection. These rules can enforce constraints on document structure, field data types, and field values. Document validation is enabled by default in MongoDB versions 3.2 and later.
- Query Operators: MongoDB provides query operators like `$exists`, `$type`, `$regex`, and others that can be used to validate data during read and write operations.
- Schema Validation: While MongoDB is schemaless, you can define a schema for your data using tools like MongoDB Compass or third-party libraries like Mongoose (for Node.js) or MongoEngine (for Python). These tools allow you to define schemas and perform validation on the application level.

## Denormalizing and modelling data

In MongoDB, data is typically denormalized and duplicated to some extent, which can affect performance and storage in the following ways:

**Performance**:

- **Read Performance**: Denormalized data in MongoDB can improve read performance because related data is embedded within a single document. This reduces the need for expensive joins or multiple queries to retrieve related data, which is a common bottleneck in relational databases.
- **Write Performance**: Denormalization can also improve write performance because updates to related data can be done in a single atomic operation on a document, rather than requiring multiple updates across different tables or collections.
- **Query Efficiency**: By denormalizing data and embedding related information within documents, MongoDB can often satisfy queries more efficiently by retrieving a single document, rather than performing complex joins or multiple lookups.

**Storage**:

- **Increased Storage Usage**: Denormalization and data duplication can lead to increased storage usage because related data is duplicated across multiple documents. This can be a trade-off for improved read and write performance.
- **Data Redundancy**: When data is duplicated across multiple documents, it can lead to data redundancy. This means that updates to the same data may need to be applied to multiple documents, which can increase the complexity of maintaining data consistency.
- **Storage Optimization**: MongoDB provides features like compression and data lifecycle management to help optimize storage usage, even with denormalized and duplicated data.

It's important to note that the impact of denormalization and data duplication on performance and storage can vary depending on the specific use case, data access patterns, and the volume of data involved.

In general, denormalization and data duplication can improve read and write performance by reducing the need for complex joins and multiple queries. However, this comes at the cost of increased storage usage and potential data redundancy.

MongoDB's flexible data model and features like embedded documents and arrays make it easier to denormalize data and optimize for specific access patterns. However, it's essential to strike a balance between denormalization for performance and minimizing excessive data duplication to control storage usage and maintain data consistency.

Proper data modeling, indexing strategies, and leveraging MongoDB's storage optimization features can help mitigate the potential drawbacks of denormalization and data duplication while reaping the performance benefits.
