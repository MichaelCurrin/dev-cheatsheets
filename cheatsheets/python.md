# Python cheatsheet

Some boilerplate from my existing projects or things to use in new development.


## Flask

### Make a CSV downloadable

Setup your application.


```python
from flask import make_response


def to_csv(rows, fields, filename="export.csv"):
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


@app.route("/download.csv")
def request_csv():
    """
    Endpoint to allow a user to download a CSV.
    """
    results, fields = lib.fetch_data(SQL_SOURCE)

    return to_csv(results, fields)
```

Start the server.

Visit the download endpoint or add a button which points to it. You will get prompted to download a file. In this case, this is the endpoint:

- http://localhost:5000/download.csv


### Cache

Add caching to your Flask application to reduce load on your server. For example, if your server does any heavy computing, reading from a database or external API calls, you can choose to cache the result of a function call or the cache the view (HTML response).

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
    CACHE_DEFAULT_TIMEOUT=60 * 60
)


cache = Cache(config=CACHE_OPTIONS)
app = Flask(__name__, static_url_path="/static")
cache.init_app(app)


@app.route("/cache-test")
@cache.cached()
def test():
    return str(datetime.datetime.now())


if  __name__ == "__main__":
    app.run()
```

Start the application.

Visit 

- http://localhost:5000/cache-test

You'll see the current time. Because of `@cache.cached` line, the result will be cached on page refreshes. Comment out the line and restart - then you'll caching is disabled and you will get a new value on each page refresh.


## Query a database

Here we get row data and field names (on the `.description` attribute) from a SQLite database, using the SQLAlchemy library.

Note use of `with` block to automatically close the connection after the query is done, or even if it fails.

```python
from sqlalchemy import create_engine


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

## Linting

### Pylint

- [docs.pylint.org](https://docs.pylint.org/en/latest/index.html)
- [Pylint messages](http://pylint-messages.wikidot.com/all-codes)
- [Pylint message-control](https://pylint.readthedocs.io/en/latest/user_guide/message-control.html)

#### Rules

Formats that Pytlint accepts - copied from message-control doc.

> For all of these controls, `pylint` accepts the following values:
> -   a symbolic message: `no-member`, `undefined-variable` etc.
> -   a numerical ID: `E1101`, `E1102` etc.
> -   The name of the group of checks. You can grab those with `pylint --list-groups`. For example, you can disable / enable all the checks related to type checking, with `typecheck` or all the checks related
> to variables with `variables`
> -   Corresponding category of the checks
>     -   `C` convention related checks
>     -   `R` refactoring related checks
>     -   `W` various warnings
>     -   `E` errors, for probable bugs in the code
>     -   `F` fatal, if an error occurred which prevented `pylint` from doing further processing.
> -   All the checks with `all`

#### How to disable

Approaches to disabling a *pylint* rule.

Disable for scope. Either at the top of a file or scope like a function.

```
def test():
    # pylint: disable=no-member
    ...
```

Disable for line.

```
a, b = ... # pylint: disable=unbalanced-tuple-unpacking
```

Using [symbolic names](https://docs.pylint.org/en/latest/faq.html#do-i-have-to-remember-all-these-numbers)

```
# pylint: disable=locally-disabled, multiple-statements, fixme, line-too-long
```

Using config file:

```
disable= wildcard-import,
 method-hidden,
 too-many-lines
 ```
 
 
### Flake8

#### Disable

Disable for file:

`# flake8: noqa`

Disable inline - all.

```
... #noqa
```

Disable inline - comma-separated codes.

```
... # noqa: E234
```

## Dotenv files

How to load a dotenv file, then use the values in your application.

Install [python-dotenv](https://pypi.org/project/python-dotenv/). Use the `-U` flag if installing globally to restrict to your user, or omit if in a virtual environment (recommended).

```sh
$ pip install python-dotenv
```

Create a `.env` file which follows Bash Shell syntax, with content such as: 

```sh
# a comment that will be ignored.
REDIS_ADDRESS=localhost:6379
MEANING_OF_LIFE=42
MULTILINE_VAR="hello\nworld"
```

Load the file in Python such as in `settings.py` file.

```python
# settings.py
from dotenv import load_dotenv


load_dotenv()

# OR, the same with increased verbosity
load_dotenv(verbose=True)

# OR, explicitly providing path to '.env'
from pathlib import Path  # python3 only
env_path = Path('.') / '.env'
load_dotenv(dotenv_path=env_path)
```

Variables are now accessible through the OS environment variables, as if set with `export` command.

```python
import os


SECRET_KEY = os.getenv("EMAIL")
DATABASE_PASSWORD = os.getenv("DATABASE_PASSWORD")
```
