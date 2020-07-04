---
title: Flask
---

This section assumes familiarity with the [Flask](https://flask.palletsprojects.com/en/1.1.x/) library.

## Make a CSV downloadable

Setup your application.

```python
from flask import make_response


def to_csv(rows, fields, filename):
    """
    Convert data to downloadable CSV file.
    """
    str_buffer = StringIO()
    writer = csv.writer(str_buffer)
    writer.writerows([fields])
    writer.writerows(rows)

    output = make_response(str_buffer.getvalue())
    output.headers["Content-Disposition"] = f"attachment; filename={filename}"
    output.headers["Content-type"] = "text/csv"

    return output


@app.route("/export.csv")
def request_csv():
    """
    Endpoint to allow a user to download a CSV.
    """
    rows, fields = lib.fetch_data(SQL_SOURCE)

    return to_csv(rows, fields, 'export.csv')
```

Start the server.

Visit the endpoint or add a button which points to it. You will get prompted to download a file.

- http://localhost:5000/export.csv


## Caching

Add caching to your Flask application to reduce load on your server.

For example, if your server does any heavy computing, reading from a database or external API calls, you can improve performance (and therefore reduce request time) by using cache.


- [Flask-Caching](https://flask-caching.readthedocs.io/en/latest/) docs.

Install in your virtual environment.

```sh
$ pip install Flask-Caching
```

Some config options:

- `CACHE_TYPE` Specifies which **type** of caching object to use. See the docs for all the choices such as Reddis. Here we use the `simple` in-memory Python cache which exists only inside the main Python process and is not thread safe and therefore not suitable for production environments.
- `CACHE_DEFAULT_TIMEOUT`. The default **timeout** (expiry time) that is used if no timeout is specified. Unit of time is **seconds**. You can set timeout on individual functions to override this.
- `CACHE_THRESHOLD` - The **maximum number of items** the cache will store before it starts deleting some. Used only for SimpleCache and FileSystemCache.

Setup your application.

```python
import datetime

from flask import Flask
from flask_caching import Cache


CACHE_OPTIONS = dict(
    CACHE_TYPE="simple",
    CACHE_DEFAULT_TIMEOUT=60*60,
)


cache = Cache(config=CACHE_OPTIONS)
app = Flask(__name__)
cache.init_app(app)


@app.route("/cache-test")
@cache.cached()
def test():
    return str(datetime.datetime.now())


if  __name__ == "__main__":
    app.run()
```

Regarding use of the decorator:

- The syntax is `@cache.cached()`.
    - The brackets are required or you will get an error.
    - Optionally specify a timeout in seconds. e.g. `@cache.cached(timeout=50)`
- Apply the decorator on a view (to cache the HTML or JSON API response) or on any non-view function.
- Based on the docs, note that the decorator must be used between the route decorator and the function name, so that the function is cache and not the result of the route..


Start the application.

Open the browser:

- http://localhost:5000/cache-test

You'll see the current time. Because of `@cache.cached` line, the result will be cached on page refreshes. Comment out the line and restart - then you'll caching is disabled and you will get a new value on each page refresh.
