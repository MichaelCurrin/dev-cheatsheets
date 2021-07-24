# Top results

While a plain row number just adds a number for each row, here we assign a row number with a category. 

Set up a rank value.

```
ROW_NUMBER() OVER (
      PARTITION BY my_category
      ORDER BY my_metric DESC
    ) AS rank
```


And then use that in a condition.

```
WHERE rank <= 10
```

Note that you'll get an error about using `ROW_NUMBER` outside of a window function, so use a window as below.

```
SELECT
  my_category, 
  my_category_2,
  my_metric
FROM (
  SELECT
    my_category,
    my_category_2,
    my_metric,
    ROW_NUMBER() OVER (
      PARTITION BY
        my_category
      ORDER BY my_metric DESC
    ) AS rank
  FROM aggregated
)
WHERE rank <= 10
```


## Examples

### Geo

If you wanted the top 5 biggest cities in each country, you'd get output like:

Country, City, Population, Rank
--- | --- | --- | ---
ABC | abc | 1.6M | 1
ABC | xyz | 1.3M | 2
ABC | def | 1.1M | 3
DEF | ghi | 2M | 1
DEF | mno | 0.5M | 2
DEF | def | 0.2M | 3

### Departments

Here we add up the spending by each department per year and then get the top 10 values (and names) in each year.

Using `*` here means that the rank column is in the output, but you can remove that if you want.

```sql
WITH by_dept_year AS (
  SELECT
    STRFTIME('%Y', `date) AS year,
    `Department` AS name,
    CAST(
      REPLACE(`Spending`, ",", "")
      AS INT
    ) AS value
  FROM records
),

aggregated AS (
  SELECT
    year,
    name,
    SUM(value) AS value
  FROM by_dept_year
  GROUP BY
    year,
    name
  ORDER BY
    year ASC,
    value DESC
)

SELECT *
FROM (
  SELECT
    year,
    name,
    value,
    ROW_NUMBER() OVER (
      PARTITION BY year
      ORDER BY value DESC
    ) AS rank
  FROM aggregated
)
WHERE rank <= 10
```
