# Subquery


## Window

```sql
SELECT *
FROM (
  SELECT *
  FROM bar
  WHERE name != ''
) AS foo
;

SELECT COUNT(*)
FROM (
  SELECT *
  FROM bar
  WHERE name != ''
) AS foo
;
```


## CTE

This makes it easy to reuse an expression. It also just flows neatly from top to bottom and without nesting queries, as in the the window section above.

```sql
with foo (
  SELECT *
  FROM bar
  WHERE name != ''
)

SELECT *
FROM foo

SELECT COUNT(*)
FROM foo
;
```


## Inline

Use a query within a column instead of as a separate window query.

This example is not useful but it valid. Note use of brackets.

```sql
SELECT
  foo,
  (SELECT COUNT(*) FROM bazz) AS cnt
FROM bar
```

Here creating a basic count.


Then converting that to percentage value.

```sql
SELECT
  name,
  100.0 * COUNT(*) / (SELECT COUNT(*) FROM bar) AS cnt,
FROM bar
WHERE name != ''
GROUP BY name
