# Install types

When you run type checks with Mypy, you might get an error that types are missing for your installed 3rd-party packages.

So run a command below to install the missing types. If you can't find appropriate types, see other pages in this guide to make stubs or ignore that package for typechecks.

See [typeshed README](https://github.com/python/typeshed/blob/master/README.md) for more info.


## Install using Mypy

Note you cannot run this as the _first_ command as it will complain there is no Mypy cache, so you need to attempt your checks, install types, then do checks again.

### Interactive

```sh
$ mypy --install-types
```

Then you have to enter <kbd>y</kbd> and press <kbd>Enter</kbd>.

Sample console output:

```
Installing missing stub packages:
.../python3 -m pip install types-setuptools

Install? [yN] 
```

## Non-interactive

Or simply do this:

```sh
$ mypy --install-types --non-interactive
```

## Install using pip

See [types-requests](https://pypi.org/project/types-requests/) on PyPI.

### Install using CLI

```sh
$ pip install types-requests
```

Based on:

```
Library stubs not installed for "requests" (or incompatible with Python 3.9)
...:13: note: Hint: "python3 -m pip install types-requests"
...:13: note: (or run "mypy --install-types" to install all missing stub packages)
...:13: note: See https://mypy.readthedocs.io/en/stable/running_mypy.html#missing-imports
```

### Install using requirements file

After you know what types you need, then you should switch to this approach with name added to your `requirements-dev.txt` file. Then everytime someone sets up your project on their machine, it will include types.

1. Set up the file with content like:
    ```
    types-requests
    ```
1. Install from it:
    ```sh
    $ pip install -r requirements-dev.txt
    ```
