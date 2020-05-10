# Dotenv

## Example


### Storage

`.env`
```python
FOO=bar
BUZZ=123
```


```sh
export $(< .env | xargs)
```

```sh
export MY_VARIABLE=abc
```


### Use


```python
"""App configuration."""
from os import environ


class Config:
    """Set configuration vars from .env file."""

    # General Config
    SECRET_KEY = environ.get('SECRET_KEY')
    FLASK_APP = environ.get('FLASK_APP')
    FLASK_ENV = environ.get('FLASK_ENV')
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTk5MzY1MjIxOV19
-->