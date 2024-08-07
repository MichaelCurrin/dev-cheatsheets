# NoSQL


### Types of DBs

The NoSQL database types, from most to least common:

| Type | Description | Examples |
|------|--------------|----------|
| Key-Value Store | Stores data as key-value pairs, with keys acting as unique identifiers and values containing the associated data. | Redis, DynamoDB, Riak |
| Document Store | Stores data as semi-structured documents, typically in JSON or XML format. Documents can have nested structures and are schema-less. | MongoDB, Couchbase, DocumentDB |
| Column-Family Store | Stores data in column families, which are containers for rows of data. Columns can be added dynamically, and data is stored and retrieved by column family. | Apache Cassandra, HBase, Bigtable |
| Graph Database | Stores data as nodes and relationships (edges) between nodes, optimized for traversing and querying highly connected data. | Neo4j, JanusGraph, Amazon Neptune |
| Time-Series Database | Optimized for storing and analyzing time-series data, such as sensor data, application metrics, and financial data. | InfluxDB, Prometheus, Timescale |
| Search Engine Database | Designed for full-text search and indexing large amounts of data. | Solr, Sphinx, Elasticsearch |
| Multi-Model Database | Supports multiple data models (e.g., key-value, document, graph) within a single database. | ArangoDB, OrientDB, MarkLogic |
| Object Store | Stores data as objects, with each object having a unique identifier and associated metadata. | Amazon S3, Azure Blob Storage, OpenStack Swift |
| Event Store | Designed to store and process event data, often used in event-driven architectures and event sourcing. | Event Store, Kafka Streams |


### Comparison of DBs

Redis, MongoDB, and other popular NoSQL databases, focusing on their differences relevant for cloud engineers:

| Database | Type | Performance | Storage | Persistence | Support | Cost |
|-----------|------|--------------|---------|--------------|----------|------|
| Redis | Key-Value | Extremely fast, in-memory | RAM, disk (optional) | Configurable, snapshots | Excellent, widely used | Open-source (free), paid enterprise support |
| AWS DynamoDB | Key-Value | High, fully managed | Cloud storage | Automatic, durable | Excellent, fully managed | Pay-per-use, can be expensive at scale |
| MongoDB | Document | High, with indexing | Disk | Automatic, journaling | Excellent, widely used | Open-source (free), paid enterprise support |
| Elasticsearch | Document | High, distributed | Disk | Automatic, replication | Excellent, widely used | Open-source (free), paid enterprise support |
| Couchbase | Document | High, with indexing | Disk, RAM (optional) | Automatic, replication | Good, widely used | Open-source (free), paid enterprise support |
| Cassandra | Wide Column | High, distributed | Disk | Automatic, replication | Good, widely used | Open-source (free), paid enterprise support |
| Neo4j | Graph | High for graph queries | Disk | Automatic, snapshots | Good, widely used | Open-source (free), paid enterprise support |

Key differences:

- **Type**: Redis is a key-value store, MongoDB and Couchbase are document stores, Cassandra is a wide column store, and Neo4j is a graph database.
- **Performance**: Redis is extremely fast due to its in-memory nature, while others trade some speed for durability by storing data on disk.
- **Storage**: Redis can use RAM or disk, while others primarily use disk storage.
- **Persistence**: Redis requires configuration for persistence, while others automatically handle it.
- **Support**: Most have excellent community support, with paid enterprise options available.
- **Cost**: Redis, MongoDB, Cassandra, Couchbase, and Elasticsearch have open-source versions, while DynamoDB is a fully managed service with pay-per-use pricing.
