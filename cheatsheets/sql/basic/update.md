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


### Update subset of rows

Using `UPDATE`, `FROM` and `WHERE`. Similar to `SELECT`, `FROM` and `WHERE` (which is safer to test with). 

From [PostgreSQL UPDATE Join with Practical Examples](https://www.postgresqltutorial.com/postgresql-update-join/) post.

```sql
UPDATE t1
SET t1.c1 = new_value
FROM t2
WHERE t1.c2 = t2.c2;
```

```sql
UPDATE product
SET net_price = price - price * discount
FROM product_segment
WHERE product.segment_id = product_segment.id;
```

Using `UPDATE` and `WHERE`.

```sql
UPDATE customer
SET registered = TRUE
WHERE id < 5
```

Using `UPDATE`, `FROM` and `WHERE`. Here we update table using a search against the same table with an alias. This works becaues using `FROM` and `WHERE` is like doing `FROM` and `INNER JOIN` - which works for both update or select.

```sql
UPDATE customer
SET registered = FALSE
FROM (
	SELECT 
	    customer.id,
	FROM customer 
	-- INNER JOIN ...
    -- WHERE ...
) AS inactive_customer
WHERE customer.id = inactive_customer.id
```

It doesn't matter that the `customer` name on the inside doesn't have an alias.

Using `UPDATE` and `WHERE` with a column.

```sql
UPDATE customer
SET registered = TRUE
WHERE customer.id IN (
    SELECT id
    FROM customer
)
```

Using `WITH` statement and `WHERE` with a column, which feels more verbose.

```sql
WITH old_customer AS (
	SELECT 
	    customer.id
    FROM customer
    -- INNER JOIN ...
    -- WHERE ...
)

UPDATE customer
SET registered = FALSE
WHERE customer.id IN (
    SELECT id
    FROM old_customer
)
```
