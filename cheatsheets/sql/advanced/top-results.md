# Top results

Get the top X results within each category.

While a plain row number just adds a number for each row, here we assign a row number with a category. 

Set up a rank value:

```
ROW_NUMBER() OVER (
    PARTITION BY my_category
    ORDER BY my_metric DESC
) AS rank
```

So within each value for `my_category`, you'd have numbering from 1 to the last item.

Then filter to only the top items in that category.

```
WHERE rank <= X
```

Here `my_category` is the grouping variable.

Note that you will get an error if using `ROW_NUMBER` outside of a window function, so use a _window function_ as below. i.e. Do a select on the inner select and apply the `WHERE` clause on the outside.

```sql
SELECT
    my_category, 
    my_label,
    my_metric
FROM (
    SELECT
        my_category,
        my_label,
        my_metric,
        ROW_NUMBER() OVER (
            PARTITION BY
                my_category
            ORDER BY my_metric DESC
        ) AS rank
    FROM my_table
)
WHERE rank <= 10
```


## Examples

### Geo

If you wanted the top 5 biggest cities in each country, you'd get output like:

Country | City | Population | Rank
--- | --- | --- | ---
ABC | abc | 1.6M | 1
ABC | xyz | 1.3M | 2
ABC | def | 1.1M | 3
DEF | ghi | 2M   | 1
DEF | mno | 0.5M | 2
DEF | def | 0.2M | 3

### Departments

Here we add up the spending by each department per year and then get the top 10 values (and names) in each year.

Using `*` here means that the rank column is in the output, but you can remove that if you want.

Note the partition is just on `year`, so we get the top 10 values for each year and their corresponding name.

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

