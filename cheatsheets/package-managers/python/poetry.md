---
title: Poetry
---

[Homepage](https://python-poetry.org/)


## Project configuration

### New project

```sh
$ poetry new my-app
```

### Existing project

```sh
$ cd my-app
$ poetry init
```

## Package mode

Disable package mode, useful for if you intend to run directly and not as an installed package.

```toml
[tool.poetry]
package-mode = false
```

Otherwise you have to add this flag in the CLI:

```sh
$ poetry install --no-root
```

## Depenencies

### Add dependency

```sh
$ poetry add PACKAGE
```

```sh
$ poetry add PACKAGE==VERSION
```

For extras, make sure to quote the hard brackets:

```sh
$ poetry add 'lxml[html-clean]'
```

Result:

```
lxml = { extras = ["html-clean"], version = "^5.3.0" }
```

### Prod vs dev dependencies

```toml
[tool.poetry.dependencies]
python = "..."
abc = "..."

[tool.poetry.group.dev.dependencies]
def = "..."
```

### Locking

#### Lock minor version

```toml
[tool.poetry.dependencies]
python = "^3.10"
```

#### Lock patch version

```toml
[tool.poetry.dependencies]
python = "^3.10.1"
```

### Lock a range

```toml
[tool.poetry.dependencies]
python = ">=3.10,<3.13"
```


## Virtual environments

### Location

#### Default location

By default, Poetry creates an environment here in a central locatiion:

- `{cache-dir}/virtualenvs`

That uses the [Cache directory](https://python-poetry.org/docs/configuration/#cache-dir).

- macOS - `~/Library/Application Support/pypoetry`
- Windows - `C:\Users\<username>\AppData\Roaming\pypoetry`

### In project

You can choose to create virtual environment in the project. This makes it easier for configuring your IDE to recognize it for new terminal sessions and loading dependencies when viewing Python files.

- `poetry.toml` (not `pyproject.toml`)
    ```toml
    [virtualenvs]
    in-project = true
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


## Run commands in environment

```sh
$ poetry run python your_script.py

$ poetry run pytest
```

