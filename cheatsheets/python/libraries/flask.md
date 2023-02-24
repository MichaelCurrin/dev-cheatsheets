# Flask

For help see [2.2.x](https://flask.palletsprojects.com/en/2.2.x/quickstart/) quickstart docs or later.

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

## Sample apps

### Basic Flask app

```python
from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello, World!'
```

### GET and POST

Based on the docs.

```python
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        return do_the_login()
    else:
        return show_the_login_form()
```

### Basic API endpoints

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
  

## Static files

Serve the contents of the `static` directory as `/assets`:

```python
app = Flask(__name__, static_folder='static', static_url_path="/assets")
```

Serve a specific file:

```python
@app.route('/')
def my_home(path):
    return app.send_static_file("index.html")
```

See also [Single-Page Applications](https://flask.palletsprojects.com/en/2.2.x/patterns/singlepageapplications/) in the Flask docs.
