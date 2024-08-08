---
title: Pydantic
description: |
  A beginner's guide to Pydantic, a Python library for data validation and settings management.
---

Pydantic is a Python library that provides data validation and settings management using Python type annotations. It helps you define data models, validate data, and handle settings in a concise and type-safe manner. Pydantic is particularly useful in web applications, APIs, and command-line tools.

## Resources

- [Pydantic Documentation](https://pydantic-docs.helpmanual.io/)
- [Pydantic GitHub Repository](https://github.com/samuelcolvin/pydantic)

## Installation

Pydantic can be installed using pip:

```sh
$ pip install pydantic
```

## Defining Data Models

Pydantic allows you to define data models using Python classes and type annotations. These models can be used to validate and parse data from various sources, such as JSON, form data, or environment variables.

```python
from pydantic import BaseModel


class User(BaseModel):
    name: str
    email: str
    age: int
```

In this example, we define a `User` model with three fields: `name` (a string), `email` (a string), and `age` (an integer).

## Validating Data

Pydantic automatically validates data based on the defined models. You can create instances of your models and pass in data to be validated.

```python
user_data = {
    'name': 'John Doe',
    'email': 'john@example.com',
    'age': 30
}

user = User(**user_data)
# User(name='John Doe', email='john@example.com', age=30)
```

If the data is invalid, Pydantic will raise a `ValidationError` with detailed information about the validation errors.

```python
invalid_data = {
    'name': 'John Doe',
    'email': 'invalid-email',
    'age': 'not-an-integer'
}

try:
    user = User(**invalid_data)
except ValidationError as e:
    print(e.json())
```

## Advanced Features

Pydantic provides several advanced features for data validation and management, including:

### Field Validation

Pydantic supports various validation constraints for fields, such as `min_length`, `max_length`, `regex`, `gt` (greater than), `lt` (less than), and more.

```python
from pydantic import BaseModel, EmailStr


class User(BaseModel):
    name: str
    email: EmailStr
    age: int = None
    password: str = Field(..., min_length=8)
```

### Recursive Models

Pydantic supports recursive models, allowing you to define nested data structures.

```python
from typing import List

from pydantic import BaseModel


class Address(BaseModel):
    street: str
    city: str


class User(BaseModel):
    name: str
    email: str
    addresses: List[Address]
```

### Data Conversion

Pydantic automatically converts data to the appropriate types based on the defined models.

```python
from datetime import datetime
from pydantic import BaseModel

class Event(BaseModel):
    name: str
    start_time: datetime
```

### Settings Management

Pydantic can be used to manage application settings by parsing environment variables, configuration files, or command-line arguments.

```python
from pydantic import BaseSettings


class Settings(BaseSettings):
    app_name: str = "My App"
    database_url: str

    class Config:
        env_file = ".env"


settings = Settings()
settings.app_name
# "My App"
settings.database_url
# Value from the .env file
```

## Use Cases

Pydantic is widely used in various Python projects, including:

- Web frameworks like FastAPI and Starlette
- Command-line tools and scripts
- Data processing pipelines
- API clients and servers
- Configuration management

Its type-safe approach and powerful validation capabilities make it a valuable tool for ensuring data integrity and consistency in Python applications.

This guide should give you a solid foundation for working with Pydantic. As you gain more experience, you can explore the advanced features and capabilities of Pydantic to build more robust and maintainable Python applications.