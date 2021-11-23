# SQLite


## Set up cursor

```python
import sqlite3


conn = sqlite3.connect('trends.db')
cur = conn.cursor()
```

## Create table

```python
drop_query = 'DROP TABLE IF EXISTS foo;'
cur.execute(drop_query)

create_query = """\
CREATE TABLE IF NOT EXISTS foo (
    id INTEGER PRIMARY KEY,
    bar VARCHAR(50)
    baz INTEGER
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
"""
cur.execute(create_query)
```


## Insert

```python
insert_sql = """
    INSERT INTO foo (bar, baz, updated_at)
             VALUES (?, ?, CURRENT_TIMESTAMP);
"""
cur.execute(insert_sql, "Fizz", 123)
```


## Select

```python

select_sql = """
    SELECT *
    FROM foo;
"""

cur.execute(select_sql)
for row in cur:
    print(row)
```
