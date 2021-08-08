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

```sql
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails; 
```
