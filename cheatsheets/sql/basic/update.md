# Update

## Resources

- [Update](https://sqlite.org/lang_update.html) in the SQLite docs
- [SQLite update](https://www.sqlitetutorial.net/sqlite-update/) on SQLite Tutorial site.
- [Update](https://www.postgresql.org/docs/current/sql-update.html) in Postgres docs.


## Syntax

SQLite:

```sql
UPDATE table
SET column_1 = new_value_1,
    column_2 = new_value_2
WHERE
    search_condition
ORDER column_or_expression
LIMIT row_count OFFSET offset;
```

You can use LIMIT to update just one record - but you probably want to set the offset, so you don't update it twice accidentally.

Postgres:

```sql
[ WITH [ RECURSIVE ] with_query [, ...] ]
UPDATE [ ONLY ] table_name [ * ] [ [ AS ] alias ]
    SET { column_name = { expression | DEFAULT } |
          ( column_name [, ...] ) = [ ROW ] ( { expression | DEFAULT } [, ...] ) |
          ( column_name [, ...] ) = ( sub-SELECT )
        } [, ...]
    [ FROM from_item [, ...] ]
    [ WHERE condition | WHERE CURRENT OF cursor_name ]
    [ RETURNING * | output_expression [ [ AS ] output_name ] [, ...] ]
```

> There are two ways to modify a table using information contained in other tables in the database: 
>
> using sub-selects, 
> 
> or specifying additional tables in the FROM clause.
>
> Which technique is more appropriate depends on the specific circumstances.

> The syntax of the RETURNING list is identical to that of the output list of SELECT.


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

If you need to do more advanced join on the join, then use a subquery. It's easy to run the self-contained subquery alone has it has its own `SELECT`.

```sql
UPDATE product
SET net_price = price - price * discount
FROM (
    SELECT id
    FROM product_segment
    -- INNER JOIN ...
    -- GROUP BY ...
    -- WHERE >.
) product_segment_b
WHERE product.segment_id = product_segment_b.id;
```

Using `UPDATE` and `WHERE`.

```sql
UPDATE customer
SET registered = TRUE
WHERE id < 5
```

Using `UPDATE`, `FROM` and `WHERE`. Here we update table using a search against the same table with an alias. 

This works becaues using `FROM` and `WHERE` is like doing `FROM` and `INNER JOIN` - which works for both update or select.

It doesn't matter that the `customer` name on the inside doesn't have an alias.

```sql
UPDATE customer
SET registered = FALSE
FROM (
	SELECT 
	    customer.id,
	FROM customer 
	-- INNER JOIN ...
    -- GROUP BY ...
    -- WHERE ...
) AS inactive_customer
WHERE customer.id = inactive_customer.id
```

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


## Return

Add return values.

```sql
UPDATE registered = FALSE
FROM customers
RETURNING id
-- RETURING *
```
