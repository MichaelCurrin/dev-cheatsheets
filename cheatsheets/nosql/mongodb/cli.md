# CLI


## Mongo server

Start the MongoDB server as a "daemon" background process.

```sh
$ mongod
```

Or configure it to run as a background service on your machine.

See the [Installation](https://www.mongodb.com/docs/manual/administration/install-community/) instructions on the Mongo docs for your OS for parameters to use.

The manual commands are also specific to OS and chip, so are not covered here.


## MongoDB shell

See [mongosh docs](https://www.mongodb.com/docs/mongodb-shell/).

The MongoDB shell is an interactive JavaScript interface that allows you to interact with MongoDB databases, collections, and documents. 

If the server above is running, you can start without parameters:

```sh
$ mongosh
```

For a cloud deployment, you can use connection string. Example based on the docs:

```sh
$ mongosh "mongodb+srv://mycluster.abcd1.mongodb.net/myFirstDatabase" --apiVersion 1 --username <username>
```