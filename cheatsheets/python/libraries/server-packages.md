---
title: Server packages
description: Comparison of popular web frameworks
---

## Basic Routing and Endpoints

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

-----

## Request Body and Data Validation

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
from django.http import JsonResponse
import json

# views.py
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

-----

## Dependency Injection

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
