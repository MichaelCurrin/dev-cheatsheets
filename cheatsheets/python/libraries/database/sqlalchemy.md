# SQLAlchemy

- [Homepage](https://www.sqlalchemy.org/)
- [Docs](https://docs.sqlalchemy.org/en/20/) for V2


## Features

[Features](https://www.sqlalchemy.org/features.html) in docs

### DB types

- PostgreSQL
- MySQL
- SQLite
- Oracle
- Microsoft SQL Server

### Both raw SQL and ORM support

Use raw SQL queries or use it as an ORM.

To help with the raw SQL, you can use SQL Expression Language which allows expression of the SQL language via generative Python expressions. There's also support to work with existing schemas and use DB types.


## Examples

### Create instance

```python
engine = create_engine('sqlite:///bookstore.db')
```

Or

```python
db_path = "bookstore.db"
engine = create_engine(f"sqlite:///{db_path}")
```

### Raw SQL

```python
query = "SELECT * FROM tweets"

with get_connection() as conn:
    query = conn.execute(query)
    rows = query.cursor.fetchall()
    fields = [col[0] for col in query.cursor.description]

print(fields)
for r in rows:
    print(r)
```

### ORM

```python
metadata = MetaData()

books = Table('book', metadata,
    Column('id', Integer, primary_key=True),
    Column('title', String),
    Column('primary_author', String),
)

engine = create_engine('sqlite:///bookstore.db')
metadata.create_all(engine)
```


### SQL Expression language

```python
from sqlalchemy.sql import table, column, select

t = table('t', column('x'))
s = select(t).where(t.c.x == 5)

print(s.compile(compile_kwargs={"literal_binds": True}))
```

### Stringify query

From FAQs in the docs.

```python
from sqlalchemy import table, column, select


t = table('my_table', column('x'))
statement = select(t)

str(statement)
# SELECT my_table.x
# FROM my_table
```


### Set up and fetch

This is my own logic to put low-level logic in functions for easy reuse.

Here we get row data and field names (on the `.description` attribute) from a SQLite database, using the SQLAlchemy library.

Note use of `with` block to automatically close the connection after the query is done, or even if it fails.

```python
from sqlalchemy import create_engine


def get_connection():
    """
    Create and return a connection to the configured SQLite database.`
    """
    assert os.access(config.DB_PATH, os.R_OK), (
        "Create the database or symlink then restart the application."
        " Expected path: {}".format(config.DB_PATH)
    )
    sql_engine = create_engine("sqlite:///{}".format(config.DB_PATH))

    return sql_engine.connect()


def fetch_data(query):
    """
    Expect a SQL query, execute it and return rows and field names.
    """
    with get_connection() as conn:
        query = conn.execute(query)
        rows = query.cursor.fetchall()
        fields = [col[0] for col in query.cursor.description]

    return rows, fields
```
