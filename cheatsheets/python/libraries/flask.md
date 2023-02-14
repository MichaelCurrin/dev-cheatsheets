# Flask

## Start

Use `hello` here for `hello.py`.

```sh
$ flask --app hello run
 * Serving Flask app 'hello'
 * Running on http://127.0.0.1:5000 (Press CTRL+C to quit)
```

Or

```console
$ export FLASK_APP=hello
$ flask run
 * Running on http://127.0.0.1:5000/
```

Or

```console
$ export FLASK_APP=hello
$ python -m flask run
 * Running on http://127.0.0.1:5000/
```


### Debug mode

```sh
$ FLASK_DEBUG=1
```

Or

```sh
$ flask run --debug
```

### Host

Make visible on your network not just localhost:

```sh
$ flask run --host=0.0.0.0
```

### Development 

```sh
$ export FLASK_ENV=development
```


## Basic Flask app

```python
from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello, World!'
```

## Demonstrate endpoints

The script:

```python
from flask import Flask, abort, request
from flask_restful import Api

app = Flask(__name__)
api = Api(app)


@app.route("/")
def root():
    """
    Handle the app root.
    """
    return """
        <h1>Flask demo app</h1>

        <h2>API test links</h2>

        <ul>
            <li>
                <a href="/api/greet">Greet basic</a>
            </li>
            <li>
                <a href="/api/greet?name=Dev">Greet with query params</a>
            </li>
            <li>
                <a href="/api/greet?name=">Greet error</a>
            </li>
            <li>
                <a href="/api/message/abc/def">Position params</a>
            </li>
        </ul>
    """


@app.route("/api/greet")
def greet():
    """
    Handle the greet endpoint to demonstrate query params, defaults, and errors.
    """
    args = request.args

    name = args.get("name", default="World", type=str)

    if name == "":
        abort(400, "`name` must be non-empty string or not supplied")

    msg = f"Hello, {name}"

    return {"greeting": msg}


@app.route("/api/message/<foo>/<bar>")
def message(foo, bar):
    """
    Demonstrate using positional params.
    """
    return {"foo": foo, "bar": bar}


@app.route("/api/send/", methods=["POST"])
def send():
    json = request.json

    return {"json": json}
```
  
