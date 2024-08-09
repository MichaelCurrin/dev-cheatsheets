# Basic Operations


## Creating a Database

Databases are created implicitly when you create your first collection or document. 

You can switch to a specific database using the `use` command:

```javascript
use myapp
```

## Create a collection

Collections are analogous to tables in relational databases. 

```javascript
db.createCollection("users")
```

## Insert document

The collection will be created if it does not yet exist.

Use `insertOne` for inserting a single document.
```javascript
db.products.insertOne( { _id: 10, item: "box", qty: 20 } );
```

Use `insertMany` for inserting multiple documents with atomicity guarantees

```javascript
db.users.insertMany(
    [
        { name: 'John Doe', email: 'john@example.com' },
        { name: 'Jane Doe', email: 'jane@example.com' }
    ]
)
```

Use `insert` only if you need to insert multiple documents and can handle partial failures.

```javascript
// One
db.users.insert({ name: 'John Doe', email: 'john@example.com' })
// Multiple
db.users.insert(
    [
        { name: 'John Doe', email: 'john@example.com' },
        { name: 'Jane Doe', email: 'jane@example.com' }
    ]
)
```

## Query documents

You can query documents using the `find` method for a list or `findOne` for one record.

Without a filter:

```javascript
db.users.find()
[
  {
    _id: ObjectId('66b5d739dd67dbed4f2e4df7'),
    name: 'John Doe',
    email: 'john@example.com'
  }
]
```

With a filter:

```javascript
db.users.find({ age: { $gt: 30 } })
```

Assign to a variable:

```javascript
var user = db.users.findOne(...)
```

Iterate over results:

```javascript
var users = db.users.find();
while (users.hasNext()) {
   print(users.next());
}
```

## Update documents

You can update documents using the `update` method. If the field does not exist, it will be added.

```javascript
db.users.update(
    { name: 'John Doe' }, 
    { 
        $set: { 
            email: 'john.doe@example.com',
            age: 31
        } 
    }
)
```

## Delete documents

```javascript
db.users.deleteOne({ name: 'John Doe' })
```

Delete all:

```javascript
db.users.deleteMany({})
```

## Indexing

Indexes can significantly improve query performance by allowing MongoDB to quickly locate relevant documents.

Create an index on `name` field of the users collection, using ascending order with `1`.

```javascript
> db.users.createIndex({ name: 1 })
```

See the [createIndex docs](https://www.mongodb.com/docs/manual/reference/method/db.collection.createIndex/) for syntax.

## Aggregation

MongoDB's aggregation framework allows you to perform complex data processing and analysis operations on your data.

```javascript
db.users.aggregate([
    { $group: { _id: '$city', count: { $sum: 1 } } }
])
// [ { _id: null, count: 3 } ]
```

With a filter:

```javascript
db.users.aggregate([
    { $match: { age: { $gt: 30 } } },
    { $group: { _id: '$city', count: { $sum: 1 } } }
])
```
