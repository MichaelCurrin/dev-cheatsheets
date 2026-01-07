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

## Dependencies

### List dependencies

```sh
$ poetry show
```

### Add dependency

```sh
$ poetry add PACKAGE
```

```sh
$ poetry add PACKAGE==VERSION
```

Dev package:

```sh
$ poetry add -D PACKAGE
$ poetry add --dev PACKAGE
$ poetry add -G dev PACKAGE
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


### Lock dependencies

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

#### Lock a range

```
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

You can choose to create a virtual environment in the project. This makes it easier for configuring your IDE to recognize it for new terminal sessions and loading dependencies when viewing Python files.

- `poetry.toml` (not `pyproject.toml`)
    ```toml
    [virtualenvs]
    in-project = true
    ```

### Activate environment

This creates a subshell, so when you exit the subshell no changes are persisted.

```sh
$ $(poetry env activate)
```

Note the command alone only prints, so you need to add the outside level to execute.

The **old** way for Poetry v1 was `poetry shell` and now you need a plugin for that for v2.

Or, if you made the virtual env in your project.

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

### Get path to virtual env

```sh
$ poetry env info --path
```


## Run commands in the environment

Interactive console:

```sh
$ poetry run python
```
Run a script:
```sh
$ poetry run python your_script.py
```
Run a CLI tool from the installed packages:
```sh
$ poetry run pytest
```

