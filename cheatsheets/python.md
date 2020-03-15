# Python cheatsheet

## Flask

### Make a CSV downloadable


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

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTUxMjk1Nzk4NCw3MzA5OTgxMTZdfQ==
-->