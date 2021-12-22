---
title: Django

---

[Documentation](https://docs.djangoproject.com/)


## Install

```sh
$ pip install django
```


## Django Admin usage

### Create

```sh
$ django-admin startproject NEW_PROJECT
```

```sh
$ django-admin startappt NEW_APP
```

### Shell

```sh
$ django-admin shell
```

### Tests

```sh
$ django-admin test
```


## Manage usage

Port 8000:

```sh
$ python manage.py runserver
```

Override:

```sh
$ python manage.py runserver 9000
```

Make migrations based on model changes:

```sh
$ python manage.py makemigrations
```

Migrate:

```sh
$ python manage.py migrate
```


Collect static files:

```sh
$ python manage.py collectstatic 
```

### Users

Create admin user.

```sh
$ python manage.py createsuperuser 
```

Change user's password.

```sh
$ python manage.py changepassword USERNAME
```


## Django MVT

Django follows MVT (Model, View, Template) architecture.

### Model

The model represents the schema of the database.

```python
from django.db import models 


class Product(models.Model):
    product_id = models.AutoField
```

### View

View decide what data gets delivered to the template.

```python
from django.http import HttpResponse

def index(request):
    return HttpResponse("My content")
```

Using a class:

```python
from django.views import View
  

class MyClass(View):
    def get(self, request):
```

### Template

A sample `.html` file that contains HTML, CSS and Javascript.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
  
    <title>My title</title>
</head>
<body>
    <h1>My heading</h1>
</body>
</html>
```

### URLs

```python
from django.contrib import admin
from django.urls import path


from . import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name='index'),
    path('about/', views.about, name='about'),
]
```

### Settings

```python
INSTALLED_APPS = [ 
    'django.contrib.admin', 
    'django.contrib.auth', 
    'django.contrib.contenttypes', 
    'django.contrib.sessions', 
    'django.contrib.messages', 
    'django.contrib.staticfiles', 
    'AppName' 
]

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ["templates"],
        'APP_DIRS': True,
        'OPTIONS': {
            # ..
        },
    },
]
```
