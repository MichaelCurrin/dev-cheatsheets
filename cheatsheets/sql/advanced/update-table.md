# Update table

Recommended - do this in a **transaction**.

Here we change the type of a column such as `VARCHAR(8)` to `VARCHAR(1024)`. We have to create an new column, copy the data to it and then get rid of the old column and rename the new one.

- `query.sql`
    ```sql
    LOCK table_name;
    ALTER TABLE table_name ADD COLUMN column_new column_type;
    UPDATE table_name SET column_new = column_name;
    ALTER TABLE table_name DROP column_name;
    ALTER TABLE table_name RENAME column_new TO column_name;
    ```
