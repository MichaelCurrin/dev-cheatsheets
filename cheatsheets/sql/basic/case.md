# Case

See [Case](https://www.w3schools.com/sql/sql_case.asp) on W3 Schools.


## Syntax

```sql
CASE
  WHEN condition1 THEN result1
  WHEN condition2 THEN result2
  WHEN conditionN THEN resultN
  ELSE result
END; 
```

Your condition might be something like

```
quantity = 0
```
```
quantity > 30
```

Or, for a boolean, simply the variable name.

```
enabled
// i.e.
enabled IS TRUE
```


## Example

### Quantities

```sql
SELECT
  order_id, 
  quantity,
  CASE
    WHEN quantity > 30 THEN 'The quantity is greater than 30'
    WHEN quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
  END AS quantity_text
FROM order_details; 
```

### Boolean

Note use of `NOT` to reverse the boolean.

```sql
SELECT
  SUM(CASE WHEN is_supported THEN 1 ELSE 0 END) AS supported_cnt,
  SUM(CASE WHEN NOT is_supported THEN 1 ELSE 0 END) AS not_supported_cnt
FROM my_table
;
```
