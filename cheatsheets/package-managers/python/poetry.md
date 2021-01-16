---
---
# Poetry

[Homepage](https://python-poetry.org/)


## Basic usage

### New project

```sh
$ poetry new poetry-demo
```

- `pyproject.yml`
    ```yaml
    [tool.poetry]
    name = "poetry-demo"
    version = "0.1.0"
    description = ""
    authors = ["Sébastien Eustace <sebastien@eustace.io>"]

    [tool.poetry.dependencies]
    python = "*"

    [tool.poetry.dev-dependencies]
    pytest = "^3.4"
    ```


### Existing project

```sh
$ poetry init
```

### Add dependency

Add to this section:

- `pyproject.yml`
    ```yaml
    [tool.poetry.dependencies]
    pendulum = "^1.4"
    ```


Or run

```sh
$ poetry add pendulum
```


## Virtual environments

By default, Poetry creates an environment here:

- `{cache-dir}/virtualenvs`

That uses the [Cache directory](https://python-poetry.org/docs/configuration/#cache-dir).

- macOS - `~/Library/Application Support/pypoetry`
- Windows - `C:\Users\<username>\AppData\Roaming\pypoetry`

### Run commands

```sh
$ poetry run python your_script.py

$ poetry run pytest
```

### Activate environment

This creates a subshell, so when you exit the subshell no changes are persisted.

```sh
$ poetry shell
```

Or

```sh
$ source {path_to_venv}/bin/activate
```
```console
> source {path_to_venv}\Scripts\activate.bat
```

And deactivate with:

```sh
$ deactivate
```
