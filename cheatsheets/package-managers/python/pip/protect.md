
# Protect global environment

Prevent accidentally installing or upgrading in your user's global Python environment.

In Linux or macOS, set this value in your `~/.bashrc` or `~/.zshrc` file.

```sh
PIP_REQUIRE_VIRTUALENV=true
```

Now, any time you run `pip install` **outside** a virtual environment you'll get an error.

How to force global install:

```sh
$ PIP_REQUIRE_VIRTUALENV=false pip install PACKAGE
```
