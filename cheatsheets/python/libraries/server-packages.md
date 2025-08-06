---
title: Server packages
description: Comparison of popular web frameworks
---

## Basic Routing and Endpoints

Both Flask and Django use decorators to define routes, but FastAPI uses them in a way that is tightly coupled with HTTP methods (GET, POST, PUT, etc.). This makes the purpose of each endpoint immediately clear. FastAPI also embraces `async` and `await` for improved performance with I/O-bound tasks, a key difference from Flask's default synchronous model.

**Flask:**

```python
from flask import Flask


app = Flask(__name__)

@app.route("/", methods=["GET"])
def home():
    return {"message": "Hello, Flask!"}
```

**Django:**

```python
# urls.py
from django.urls import path

from . import views

urlpatterns = [
    path("", views.home),
]

# views.py
from django.http import JsonResponse

def home(request):
    return JsonResponse({"message": "Hello, Django!"})
```

**FastAPI:**

```python
from fastapi import FastAPI


app = FastAPI()

@app.get("/")
async def home():
    return {"message": "Hello, FastAPI!"}
```


## Path and Query Parameters

In Flask and Django, you define path parameters using a specific syntax within the route string. In FastAPI, you declare them as function arguments with Python type hints. This is a core part of the "FastAPI way" as it automatically validates the data type and provides detailed error messages if the wrong type is sent. Query parameters are handled in the same manner.

**Flask:**

```python
@app.route("/items/<int:item_id>")
def get_item(item_id):
    return {"item_id": item_id}
```

**Django:**

```python
# urls.py
path("items/<int:item_id>/", views.get_item),
```

```python
# views.py
def get_item(request, item_id):
    return JsonResponse({"item_id": item_id})
```

**FastAPI:**

```python
@app.get("/items/{item_id}")
async def get_item(item_id: int):
    return {"item_id": item_id}
```

## Request Body and Data Validation

One of the most significant differences is how FastAPI handles the request body for `POST`, `PUT`, etc. Instead of manually parsing JSON and validating data types, you define a data model using a Pydantic `BaseModel`. FastAPI then automatically handles the parsing, validation, and serialization. This is a huge time-saver and eliminates a lot of boilerplate code.

**Flask:**

```python
from flask import request


@app.route("/items", methods=["POST"])
def create_item():
    data = request.get_json()
    name = data.get("name")
    price = data.get("price")

    if not name or not isinstance(name, str):
        return "Invalid name", 400

    if not price or not isinstance(price, (int, float)):
        return "Invalid price", 400

    return data
```

**Django:**

```python
# views.py
import json

from django.http import JsonResponse


def create_item(request):
    if request.method == "POST":
        data = json.loads(request.body)
        name = data.get("name")
        price = data.get("price")

        if not name or not isinstance(name, str):
            return JsonResponse({"error": "Invalid name"}, status=400)

        if not price or not isinstance(price, (int, float)):
            return JsonResponse({"error": "Invalid price"}, status=400)
        return JsonResponse(data)
```

**FastAPI:**

```python
from fastapi import FastAPI
from pydantic import BaseModel


class Item(BaseModel):
    name: str
    price: float


app = FastAPI()

@app.post("/items/")
async def create_item(item: Item):
    return item
```

## Dependency Injection

FastAPI's **Dependency Injection** system is a powerful feature for managing reusable components like database connections, authentication, or common services. It's a key intermediate concept. You can define a function (a "dependency") that your path operation functions can "depend" on. FastAPI handles the rest. This is a more elegant and testable approach than Flask or Django's manual handling of such components. 

**Flask:**

```python
from flask import g


def get_db():
    if "db" not in g:
        g.db = connect_to_database()
    return g.db


@app.route("/data")
def get_data():
    db = get_db()
    # use db...
```

**Django:**

```python
from myapp.models import MyModel


def get_data(request):
    data = MyModel.objects.all()
    # use data...
```

**FastAPI:**

```python
from fastapi import Depends
from database import get_db


@app.get("/data")
def get_data(db = Depends(get_db)):
    # db is now the database session returned by get_db
    # use db...
```


## Automatic Documentation

Yes, all three frameworks can do auto-documentation, but they do it in fundamentally different ways. FastAPI has it built-in as a core feature, while Flask and Django rely on extensions and third-party packages to achieve the same result.

**FastAPI:**

FastAPI stands out because **automatic documentation is a first-class feature** of the framework itself. It leverages Python type hints and Pydantic models to automatically generate an **OpenAPI** (formerly Swagger) schema. This schema is the blueprint for your API's documentation. By default, FastAPI serves two interactive documentation UIs:
- **Swagger UI** at the `/docs` endpoint. This is an interactive, browser-based interface where you can view all your endpoints, their parameters, data models, and even make live requests to test them.
- **ReDoc** at the `/redoc` endpoint. This is a more modern, a-la-carte style documentation UI that is better for simple reading.

The magic happens because FastAPI can inspect your code and understand the structure of your data and endpoints without any extra effort on your part. 

**Flask:**

Flask is a minimalist micro-framework, so it does not come with built-in auto-documentation. To get this functionality, you must install and configure an extension. The most popular choice for this is **Flask-RESTX** (a fork of Flask-RESTful), which is designed specifically for building REST APIs.
- You define your API's models, fields, and endpoints using Flask-RESTX's syntax.
- The extension then uses this information to generate an OpenAPI schema and serve interactive documentation.
- The process requires a more manual approach compared to FastAPI. You're not just writing your application logic; you're also explicitly defining the documentation structure with a separate set of tools and decorators.

Other options like **Flask-Autodoc** are also available, which generate documentation from docstrings and route information. However, they are less robust and require more manual work to produce comprehensive documentation.

**Django:**

Django, as a "batteries-included" framework, has a documentation generator built into its admin site called `django.contrib.admindocs`. However, this is primarily for documenting the internal components of your application (models, views, template tags) for developers, not for generating public-facing API documentation.

For API documentation, you would use **Django REST Framework (DRF)**, the most common toolkit for building APIs with Django. DRF, much like FastAPI, can automatically generate a browsable API and an OpenAPI schema.
- DRF's **Browsable API** is a built-in feature that lets you view and interact with your endpoints directly in the browser.
- For more formal documentation like Swagger UI or ReDoc, you need to use a third-party package like **drf-yasg** or **drf-spectacular**. These packages parse your DRF views and serializers to create a full OpenAPI schema, which is then used to serve the interactive documentation pages.

The integration of documentation in Django is a two-step process: you build your API with DRF, then you add a separate package to generate the OpenAPI documentation from your DRF components.
