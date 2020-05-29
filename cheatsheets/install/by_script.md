# Install by script
> Install an application by running a remote script in the terminal

Examples

## Bash

[Yarn](https://classic.yarnpkg.com/en/docs/install#mac-stable)

```sh
curl -o- -L https://yarnpkg.com/install.sh | bash
```

```
       -s        If  the  -s  option is present, or if no arguments remain after option processing, then commands are read from the standard input.  This option
                 allows the positional parameters to be set when invoking an interactive shell.
```
```sh
curl ... | bash -s
```

[Homebrew](https://brew.sh/)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```


## Python

[Poetry](https://github.com/python-poetry/poetry)

```sh
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTY4MDU1MTQ5NV19
-->
