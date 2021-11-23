# Select


## Subquery

Use `SELECT` and `FROM` with an aliased "subquery" or "window query". From [post](https://www.essentialsql.com/get-ready-to-learn-sql-server-22-using-subqueries-in-the-from-clause/).

```sql
SELECT
  TerritoryID,
  AverageBonus
FROM (
  SELECT
    TerritoryID,
    AVG(Bonus) AS AverageBonus
  FROM Sales.SalesPerson
  GROUP BY TerritoryID
) AS TerritorySummary
ORDER BY AverageBonus
```

## With

The above but using a `WITH` statement. useful if you have a lot of tables to prepare or if you want to reuse them.

[Postgres](https://www.postgresql.org/docs/current/queries-with.html) docs.

```sql
WITH TerritorySummary AS (
  SELECT
    TerritoryID,
    AVG(Bonus) AS AverageBonus
  FROM Sales.SalesPerson
  GROUP BY TerritoryID
)

SELECT
  TerritoryID,
  AverageBonus
FROM TerritorySummary
ORDER BY AverageBonus
```
