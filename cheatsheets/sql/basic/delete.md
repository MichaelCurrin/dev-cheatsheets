# Delete


## Delete select rows

```sql
DELETE FROM my_table
WHERE id IN (1, 2, 3)
;
```

## Cascade

If you get an error from foreign key constraints:

```sql
DELETE FROM my_table CASCADE
-- WHERE ...
;
```

## Delete **all** rows

```sql
DELETE FROM my_table;
```

```sql
TRUNCATE my_table;
```
```sql
TRUNCATE my_table;
CASCADE
```
