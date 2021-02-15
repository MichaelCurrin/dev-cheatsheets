# with

With statements or Common Table Expressions.

[Postgres](https://www.postgresql.org/docs/current/queries-with.html) docs.


## Examples


```sql
WITH major AS (
	SELECT
    id,
	  name
  FROM person
  WHERE age > 18
)

SELECT 
  pet.name,
  major.name
FROM major
INNER JOIN pet ON pet.person_id = person.id
```

```sql
WITH regional_sales AS (
    SELECT region, SUM(amount) AS total_sales
    FROM orders
    GROUP BY region
), top_regions AS (
    SELECT region
    FROM regional_sales
    WHERE total_sales > (SELECT SUM(total_sales)/10 FROM regional_sales)
)
SELECT region,
       product,
       SUM(quantity) AS product_units,
       SUM(amount) AS product_sales
FROM orders
WHERE region IN (SELECT region FROM top_regions)
GROUP BY region, product;
```
