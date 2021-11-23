# Ways to access pip

## Outside virtual environment

Run global pip (probably uses Python 2).

```sh
$ pip
```

Run global pip for Python 3.

```sh
$ pip3
```

Or

```sh
$ python3 -m pip
```

Or target a more specific version which is not your system default.

```sh
$ python3.8 -m pip
```

Upgrade pip. If you get permissions errors, as `--user` flag.

```sh
$ PIP_REQUIRE_VIRTUALENV pip install --upgrade pip
# OR
$ PIP_REQUIRE_VIRTUALENV python3 -m pip install --upgrade pip
```

## Within a virtual environment

Run the pip which is in the scope of the environment - this requires the environment to be activated.

```sh
$ source venv/bin/activate
$ pip
```

Even if using Python 3, you won't need to use `pip3` - using `pip` in a virtual environment is fine.

This approach does **not** require the activate step.

```sh
$ venv/bin/pip
```
