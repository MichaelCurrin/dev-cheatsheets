# Python cheatsheet

Some useful commands, boilerplate code from my existing projects or things to use in new development.

## Python

- [Command line and environment](https://docs.python.org/3/using/cmdline.html) on Python 3 docs - how to use the `python` command.

Run in unbuffered mode (printing is printed immediately rather than when the buffer reaches a certain size).

```sh
$ python -U
```

## Pip

### Commands

- `install LIBRARY`
- `install LIBRARY==VERSION`
- `install LIBRARY --user|-U`
- `install LIBRARY -u|--upgrade`
- `install -r REQUIREMENTS_PATH`
- `install pip --upgrade`
- `uninstall LIBRARY`

### Ways to access pip

#### Outside virtual environment

Run global pip - probably uses Python 2.

```sh
$ pip
```

Run global pip for Python 3.

```sh
$ pip3
```

```sh
$ python3 -m pip
```

#### Within a virtual environment

Run the pip which is in the scope of the environment.

This requires the environment to be activated.

```sh
$ source venv/bin/activate
$ pip
```

This does **not** require the activate step.

```sh
$ venv/bin/pip
```

## Libaries

Links are all for Python 3.

- [Python standard library](https://docs.python.org/3/library/index.html)
- [argparse](https://docs.python.org/3/library/argparse.html)
- [os](https://docs.python.org/3/library/os.html)
- [logging](https://docs.python.org/3/library/logging.html)
- [File and directory access](https://docs.python.org/3/library/filesys.html)

## Flask

This section assumes familiarity with the [Flask](https://flask.palletsprojects.com/en/1.1.x/) library.

### Make a CSV downloadable

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


### Caching

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

## Formatting

Some VS Code choices - this is a free text field for provider, plug configurations for each.

- autopep8
- black (PY 3 only)
- yapf

## Linting

Some VS Code choices - there are flags for each (so multiple can be used), plus a linting enabled switch.

- [pylint](#pylint)
- [flake8](#flake8)
- [mypy](#mypy)


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

## MyPy

Optional static typing for Python.

- [mypy-lang.org](https://mypy-lang.org/) homepage.
- [Read the docs](https://mypy.readthedocs.io/en/stable/) page.


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

## Pitfalls

Don't define data structures in function parameters. Only constants.

```python
def foo(x=[]):
    x.append('test')
    print(x)

foo()
# => ['test']
foo()
# => ['test', 'test']
```

Best practice way:

```python
def foo(x=None):
    if x is None:
        x = []
    x.append('test')
    print(x)

foo()
# => ['test']
foo()
# => ['test']
```

## Copy

- [lib.copy](https://docs.python.org/3/library/copy.html) builtin docs
	> Shallow and deep copy operations
- [copy in Python (Deep Copy and Shallow Copy)](https://www.geeksforgeeks.org/copy-python-deep-copy-shallow-copy/) tutorial

### Shallow copies

> Shallow copies of dictionaries can be made using dict.copy(), and of lists by assigning a slice of the entire list, for example, copied_list = original_list[:].

```python
copied_list = original_list[:]

copied_dict = original_dict.copy()
```

Where `original_obj` is a `dict` or `list`:

```python
import copy
copied_obj = copy.copy(original_obj)
```


### Deep copies

Where `original_obj` is a `dict` or `list`:

```python
copied_obj = copy.deepcopy(original_obj)
```



```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTI4Njc4NTE4NCwxNDgwNzUyOTI5XX0=
-->