# Install by script
> Install an application by running a remote script in the terminal

Examples


## Bash

### Node.js

Setting up a Debian source.

```sh
$ curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
```

Or as root.

```sh
$ curl -sL https://deb.nodesource.com/setup_14.x | bash -
```

### Yarn

[Yarn](https://classic.yarnpkg.com/en/docs/install#mac-stable)

```sh
curl -o- -L https://yarnpkg.com/install.sh | bash
```

I've also seen this.
```
       -s        If  the  -s  option is present, or if no arguments remain after option processing, then commands are read from the standard input.  This option
                 allows the positional parameters to be set when invoking an interactive shell.
```
```sh
curl ... | bash -s
```



### Homebrew

[Homebrew](https://brew.sh/)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```


## Python

### Poetry

From [Poetry](https://github.com/python-poetry/poetry) repo

```sh
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMTUzMzI0NTIzMiwtNjgwNTUxNDk1XX0=
-->
