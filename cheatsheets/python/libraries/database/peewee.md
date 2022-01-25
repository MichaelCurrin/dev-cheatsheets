# Peewee

- [Homepage](https://docs.peewee-orm.com/en/latest/index.html)

A small, expressive ORM, with built-in support for SQLite, MySQL and PostgresQL and special extensions like HStore.

Features:

> Peewee is a simple and small ORM. It has few (but expressive) concepts, making it easy to learn and intuitive to use.

> - a small, expressive ORM
> - supports sqlite, mysql, postgresql and cockroachdb
> - tons of extensions


## Quickstart

```python
from peewee import *


db = SqliteDatabase('people.db')


class Person(Model):
    name = CharField()
    birthday = DateField()

    class Meta:
        database = db
```


## Example app

From [example](https://docs.peewee-orm.com/en/latest/peewee/example.html) in the docs.

```python
database = SqliteDatabase(DATABASE)


# This makes setting Meta easy across all other subclasses.
class BaseModel(Model):
    class Meta:
        database = database

# Basic
class User(BaseModel):
    username = CharField(unique=True)
    password = CharField()
    email = CharField()
    join_date = DateTimeField()


# Many to many.
class Relationship(BaseModel):
    from_user = ForeignKeyField(User, backref='relationships')
    to_user = ForeignKeyField(User, backref='related_to')

    class Meta:
        indexes = (
            (('from_user', 'to_user'), True),
        )


# One to many. Also, user's messages will be accessible as User.messages
class Message(BaseModel):
    user = ForeignKeyField(User, backref='messages')
    content = TextField()
    pub_date = DateTimeField()
```


## Raw SQL

```python
cursor = db.execute_sql('SELECT * FROM tweets;')

for row in cursor.fetchall():
    print(row)
```

```python
cursor = db.execute_sql('SELECT COUNT(*) FROM tweets;')

result = cursor.fetchone()
print('Total: ', result[0])
```
