# Dotenv

How to load values from a dotenv file.

## Basic

Store values in a shell file.

- `.env`
    ```sh
    FOO=bar
    BUZZ=123
    ```

Then set the values as export variable.s

```sh
$ export $(< .env | xargs)
```

Run a script that uses the variables.

- `main.py`
    ```python
    import from os import environ


    class Config:
        """
        """

        FOO = environ.get('FOO')
        BUZZ = environ.get('BUZZ')
    ```


## Using Dotenv package

How to load a dotenv file, then use the values in your Python application, without using the `export` command.

Install [python-dotenv](https://pypi.org/project/python-dotenv/). Use the `-U` flag if installing globally to restrict to your user, or omit if in a virtual environment (recommended).

```sh
$ pip install python-dotenv
```

Create a `.env` file which follows Bash Shell syntax, with content such as:

- `.env`
    ```sh
    # A comment that will be ignored.
    REDIS_ADDRESS=localhost:6379
    MEANING_OF_LIFE=42
    MULTILINE_VAR="hello\nworld"
    ```

Load the file in Python.

- `settings.py`
    ```python
    from os import environ

    from dotenv import load_dotenv


    load_dotenv()
    # OR
    load_dotenv(verbose=True)

    # OR
    from pathlib import Path 
    env_path = Path('.') / '.env'
    load_dotenv(dotenv_path=env_path)

    SECRET_KEY = environ("EMAIL")
    DATABASE_PASSWORD = environ("DATABASE_PASSWORD")
    ```
