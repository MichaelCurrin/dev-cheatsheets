# Copy

Create copes of existing rows.


## Select into

From [tutorial](https://www.w3schools.com/sql/sql_select_into.asp).

Copy data from one table into a new table (or the same table).

```sq;
SELECT
  column1,
  column2,
  column3
INTO table2
FROM table1;
```

Simple back-up of all fields.

```sql
SELECT * INTO CustomersBackup2017
FROM Customers;
```

Copy Germany customers.

```sql
SELECT * 
INTO CustomersGermany
FROM Customers
WHERE Country = 'Germany';
```

Note that the column names must match exactly between the two tables and you don't get to alter the values. See the alternative below which has more control.


## Insert into select

From [tutorial](https://www.w3schools.com/sql/sql_insert_into_select.asp).

Copy data from one table and inserts it into another table (or the same table). Requires that the data types in source and target tables matches.

```sql
INSERT INTO table2
SELECT * 
FROM table1;
```

Select values from a table and insert into named columns.

```sql
INSERT INTO table2 (
  column1, 
  column2, 
  column3
)
SELECT 
  column1,
  column2, 
  column3
FROM table1;
```

Examples

```sql
INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers;
```

```sql
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT SupplierName, ContactName, Address, City, PostalCode, Country FROM Suppliers;
```

```sql
INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country = 'Germany';
```

Here is how you copy rows but also create some new values for the fields.

```sql
INSERT INTO foo (
  fizz,
  buzz,
  bazz
)
SELECT
  fizz,     -- original
  buzz + 1, -- altered
  'abc'     -- constant
FROM foo;
```

Here is more complex example with a CTE, an insert and an update of the old rows only. In this case splitting a long session to mark the old as inactive and make a new session copied from the old, with an incremented counter.

Note you must give the insert section an alias so that you can use it alongside the update.

```sql
WITH long_sessions AS (
	SELECT 
      session.id, 
      session.disposition,
      session.session_id,
      session.counter
	FROM session
	INNER JOIN event ON event.session_id = sessions.id
	WHERE session.disposition = 'active'
	GROUP BY session.id
	HAVING MAX(event.timestamp) - session.started_at > 60 * INTERVAL '1 MINUTE'
),
new_sessions AS (
	INSERT INTO session (
    disposition,
    session_id, 
    counter
	)
  SELECT
		'active' AS disposition,
		session_id, 
    counter + 1
	FROM long_sessions
)
UPDATE session
SET
  disposition = 'long'
FROM long_sessions
WHERE session.id = long_sessions.id
```
