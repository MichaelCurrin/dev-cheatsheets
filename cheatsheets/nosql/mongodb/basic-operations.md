# Basic Operations


## Creating a Database

In MongoDB, databases are created implicitly when you create your first collection or document. You can switch to a specific database using the `use` command:

```console
> use myapp
switched to db myapp
```

## Creating a Collection

Collections are analogous to tables in relational databases. You can create a collection by inserting your first document into it:

```console
> db.users.insert({ name: 'John Doe', email: 'john@example.com' })
WriteResult({ "nInserted" : 1 })
```

This command creates a new collection named `users` and inserts a document into it.

## Querying Documents

You can query documents using the `find` method:

```console
> db.users.find()
{ "_id" : ObjectId("6436e9c8d9f6b3c8e7f9d9e3"), "name" : "John Doe", "email" : "john@example.com" }
```

You can also filter documents using query operators:

```console
> db.users.find({ age: { $gt: 30 } })
```

## Updating Documents

You can update documents using the `update` method:

```console
> db.users.update({ name: 'John Doe' }, { $set: { email: 'john.doe@example.com' } })
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
```

## Deleting Documents

You can delete documents using the `remove` method:

```console
> db.users.remove({ name: 'John Doe' })
WriteResult({ "nRemoved" : 1 })
```
