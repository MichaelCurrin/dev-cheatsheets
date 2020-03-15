# Python cheatsheet

Boilerplate from my existing projects.

## Flask

### Make a CSV downloadable

```python
from flask import make_response


def to_csv(rows, fields):
    """
    Convert data to downloadable CSV file.
    """
    str_buffer = StringIO()
    writer = csv.writer(str_buffer)
    writer.writerows([fields])
    writer.writerows(rows)

    output = make_response(str_buffer.getvalue())
    output.headers["Content-Disposition"] = "attachment; filename=export.csv"
    output.headers["Content-type"] = "text/csv"

    return output


@app.route("/download.csv")
def request_csv():
    """
    Endpoint to allow a user to download a CSV.
    """
    results, fields = lib.fetch_data(SQL_SOURCE)

    return to_csv(results, fields)
```

### Query SQLite database

This includes getting row data and field names (on the `.description` attribute.

Note use of `with` block to automatically close the connection after the query is done, or even if it fails.

```python
def get_connection():
    """
    Create and return a connection to the configured SQLite database.`
    """
    assert os.access(config.DB_PATH, os.R_OK), (
        "Create the database or symlink then restart the application."
        " Expected path: {}".format(config.DB_PATH)
    )
    sql_engine = create_engine("sqlite:///{}".format(config.DB_PATH))

    return sql_engine.connect()


def fetch_data(query):
    """
    Expect a SQL query, execute it and return rows and field names.
    """
    with get_connection() as conn:
        query = conn.execute(query)
        rows = query.cursor.fetchall()
        fields = [col[0] for col in query.cursor.description]

    return rows, fields
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbOTI2OTQzMTc2LDczMDk5ODExNl19
-->