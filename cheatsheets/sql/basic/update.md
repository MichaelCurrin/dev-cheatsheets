# Update

See [Update](https://sqlite.org/lang_update.html) in the SQLite docs and [SQLite update](https://www.sqlitetutorial.net/sqlite-update/) on SQLite Tutorial site.


## Syntax

```sql
UPDATE table
SET column_1 = new_value_1,
    column_2 = new_value_2
WHERE
    search_condition
ORDER column_or_expression
LIMIT row_count OFFSET offset;
```

You can update just one record - but you probably want to then set the offset so you don't update it twice.


## Examples

### Update a target record

```sql
UPDATE employees
SET lastname = 'Smith'
WHERE employeeid = 3;
```

Update multiple fields.

```sql
UPDATE employees
SET city = 'Toronto',
    state = 'ON',
    postalcode = 'M5P 2N7'
WHERE
    employeeid = 4;
```


### Update all records


```sql
UPDATE my_table
SET foo = "a",
    bar = UPPER(bar);
```

If you are not confident in the update, you can always do a `SELECT` instead.
