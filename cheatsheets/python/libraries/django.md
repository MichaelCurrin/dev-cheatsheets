---
title: Django

---

See Django [Documentation](https://docs.djangoproject.com/).

See [django-quickstart](https://github.com/MichaelCurrin/django-quickstart) repo.


## Install

```sh
$ pip install django
```


## Django Admin usage

### Create project

```sh
$ django-admin startproject NEW_PROJECT
```

### Create app in project

Recommended to first navigate:

```sh
$ cd NEW_PROJECT
```

```sh
$ django-admin startapp NEW_APP
```

Or

```sh
$ python manage.py startapp NEW_APP
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


## Filter syntax

These are just some examples of the many filter lookups available in Django. For more information, you can refer to the Django documentation on QuerySet API reference.

1. `exact`: Performs an exact match lookup. For example: 
    ```python
    Model.objects.filter(name__exact='John')
    ```
2. `iexact`: Performs a case-insensitive exact match lookup. For example:
    ```python
    Model.objects.filter(name__iexact='john')
    ```
3. `contains`: Performs a case-sensitive substring match lookup. For example:
    ```python
    Model.objects.filter(name__contains='oh')
    ```
4. `icontains`: Performs a case-insensitive substring match lookup. For example:
    ```python
    Model.objects.filter(name__icontains='OH')
    ```
5. `in`: Matches any of the given values. For example:
    ```python
    Model.objects.filter(id__in=[1, 2, 3])
    ```
6. `gt`: Matches values greater than the given value. For example:
    ```python
    Model.objects.filter(age__gt=18)
    ```
7. `lt`: Matches values less than the given value. For example:
    ```python
    Model.objects.filter(age__lt=30)
    ```
8. `gte`: Matches values greater than or equal to the given value. For example:
    ```python
    Model.objects.filter(age__gte=18)
    ```
9. `lte`: Matches values less than or equal to the given value. For example:
    ```python
    Model.objects.filter(age__lte=30)
    ```
10. `startswith`: Matches values that start with the given substring. For example:
    ```python
    Model.objects.filter(name__startswith='Joh')
    ```
11. `endswith`: Matches values that end with the given substring. For example:
    ```python
    Model.objects.filter(name__endswith='n')
    ```
12. `range`: Matches values within a range. For example:
    ```python
    Model.objects.filter(age__range=(18, 30))
    ```
13. `year`: Matches the year of a `DateTimeField`. For example:
    ```python
    Model.objects.filter(pub_date__year=2022)
    ```
14. `month`: Matches the month of a `DateTimeField`. For example:
    ```python
    Model.objects.filter(pub_date__month=6)
    ```
15. `day`: Matches the day of a `DateTimeField`. For example:
    ```python
    Model.objects.filter(pub_date__day=24)
    ```
16. `week_day`: Matches the day of the week of a `DateTimeField`, where `Sunday=1` and `Saturday=7`. For example:
    ```python
    Model.objects.filter(pub_date__week_day=2)  # Matches all records with a pub_date on a Tuesday
    ```
17. `isnull`: Matches records where a field is null or not null. For example:
    ```python
    Model.objects.filter(some_field__isnull=True)  # Matches all records where some_field is null
    ```
18. `regex`: Matches records where a field matches a regular expression. For example:
    ```python
    Model.objects.filter(name__regex=r'^[A-Za-z]+$')  # Matches all records where name contains only letters
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
