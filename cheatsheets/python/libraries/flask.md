# Flask

## Basic Flask app

Start command:

```sh
$ flask --app myapp/app.py --debug run
```

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


@app.route("/api/send/", methods=["GET", "POST"])
def send():
    json = request.json

    return {"json": json}
```
  
