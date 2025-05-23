# Poetry

## CLI

```sh
$ poetry install
```

Install from lockfile:

```sh
$ poetry sync
```

Delete virtual env:

```sh
poetry env remove --all
```

## Environments

```sh
poetry env use PYTHON_VERSION
```
```sh
poetry env list
```

Print command for activating.

```sh
poetry env activate
```

```sh
$(poetry env activate)
```




## Config pyproject.toml

### Common

```toml
[tool.poetry]
package-mode = false

[tool.poetry.group.dev.dependencies]
... = "^1.2.3"
```

### Poetry v1

```toml
[tool.poetry]
name = "..."
version = "0.1.0"
description = ""
authors = ["... <...m>"]
readme = "README.md"

[tool.poetry.dependencies]
python = "^3.13"


[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"
```

### Poetry v2

```toml
[project]
name = "..."
version = "0.1.0"
description = ""
authors = [
    {name = "...",email = "..."}
]
readme = "README.md"
requires-python = ">=3.13"
dependencies = [
]


[build-system]
requires = ["poetry-core>=2.0.0,<3.0.0"]
build-backend = "poetry.core.masonry.api"
```
