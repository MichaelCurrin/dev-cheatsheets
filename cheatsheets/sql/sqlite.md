# SQLite


## Create

```sql
CREATE TABLE IF NOT EXISTS foo (
    /* ... */
);
```


## ID

```
id INTEGER PRIMARY KEY
```


## Text

```
location VARCHAR(50)
```

## Number

```
foo INTEGER
bar INTEGER(8)
```

## Timestamp

Use current time if value is not set.

```
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
```


## Drop

```
DROP TABLE IF EXISTS foo
```
