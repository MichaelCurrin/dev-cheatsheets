# Dotenv

## Basic

Store values in a shell file.

- `.env`
    ```sh
    FOO=bar
    BUZZ=123
    ```

Then load it:

```sh
$ export $(< .env | xargs)
```

Run a script that uses the variables.

```python
from os import environ


class Config:

    FOO = environ.get('FOO')
    BUZZ = environ.get('BUZZ')
```


## Using python-dotenv package


How to load a dotenv file, then use the values in your Python application.

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
import os
from dotenv import load_dotenv


load_dotenv()

# OR, the same with increased verbosity
load_dotenv(verbose=True)

# OR, explicitly providing path to '.env'
from pathlib import Path  # python3 only
env_path = Path('.') / '.env'
load_dotenv(dotenv_path=env_path)

# Variables are now accessible through the OS environment variables, as if set with `export` command.
SECRET_KEY = os.getenv("EMAIL")
DATABASE_PASSWORD = os.getenv("DATABASE_PASSWORD")
```
