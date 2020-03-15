# Python cheatsheet

## Flask

### Make a CSV downloadable

```python
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
<!--stackedit_data:
eyJoaXN0b3J5IjpbODYyNzA1OTY0LDczMDk5ODExNl19
-->