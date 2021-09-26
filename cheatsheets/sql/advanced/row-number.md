# Row number

From [SQLite Tutorial](https://www.sqlitetutorial.net/sqlite-window-functions/sqlite-row_number/).

```sql
ROW_NUMBER() OVER (
    [PARTITION BY expression1, expression2,...]
    ORDER BY expression1 [ASC | DESC], expression2,...
)
```

Partition is optional. If skipped, the whole result will be treated as one partition.

The ordering inside the `OVER` part is required.


## Examples

### Customers basic

Here we order by country within the `OVER` clause. Note that `country` doesn't have to be used in outer part of the `SELECT`.

```sql
SELECT
    ROW_NUMBER () OVER ( 
        ORDER BY country 
    ) row_number,
    first_name,
    last_name,
    country 
FROM customers;
```

A country name might be repeated.

The row number is unique and starts at 1.

row_number | first_name | last_name | country
--- | --- | --- | ---
1 | John | Smith | America
2 | Jane | Doe | America
3 | James | Green | Ireland

### Customers paginated

Show a max number of items on each page results.

Add a condition:

```sql
WHERE row_num > 20 
  AND row_num <= 30
```

### Customers partioned

Here we reset the count to 1 at each change in country.

```sql
SELECT
    ROW_NUMBER () OVER ( 
        PARTITION BY country
        ORDER BY first_name 
    ) row_number,
    first_name,
    last_name,
    country 
FROM customers;
```

row_number | first_name | last_name | country
--- | --- | --- | ---
1 | John | Smith | America
2 | Jane | Doe | America
1 | James | Green | Ireland

### Aggregate

Order results and then give them each a row number _after_ ordering.

```sql
SELECT
  ROW_NUMBER() OVER(ORDER BY COUNT(*) DESC) AS `Row number`,
  name,
  COUNT(*) AS `count`
FROM records
GROUP BY name
ORDER BY COUNT(*) DESC
```

