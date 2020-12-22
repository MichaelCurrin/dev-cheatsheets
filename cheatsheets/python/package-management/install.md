---
description: How to install Python packages using `pip`
---
# Install


## Resources

- [pip docs](https://pip.readthedocs.io/)
- [pip on PyPI](https://pypi.org/project/pip/)
- My [Installation](https://github.com/MichaelCurrin/python-package-quickstart/blob/master/docs/installation.md) guide on my Quickstart project.


## Install

### Install from requirements file

Set the version.

- `requirements.txt` for PyPI:
    ```
    foo>=0.2
    ```
- `requirement.txt` for GitHub:
    ```
    -e git+https://github.com/FooBar/baz.git@master
    ```

Then install from the file.

```sh
$ pip install -r requirements.txt
```


### Install using CLI

Or install the version directly. Note the quotes help to escape characters.

- Install from PyPI:
    ```sh
    $ pip install 'foo>=0.2'
    ```
- Install from GitHub:
    ```
    $ pip install -e git+https://github.com/FooBar/baz.git@master
    ```

You omit a version, though this can be dangerous for upgrading or setting up environments for import projects. If you omit a version, you'll get the latest.

```sh
$ pip install foo
```

But note that command has no version number requested. So if you run the command repeatedly, you won't ever get a new version, except on a fresh install.


## Upgrade

Specify a version number higher than the current one.

e.g.

```sh
$ pip install 'foo==1.1'
```

Upgrade to the newest release:

```sh
$ pip install foo --upgrade
```


## Uninstall

```sh
$ pip uninstall foo
```


## List installed versions

<!-- TODO move this content to Learn to Code and keep commands lean. See if there are other commands or flags to use here too -->

Note that packages are shown alphabetically - if you try and _install_ in the same order as the output you may get errors or conflicting versions.

Verbose description of packages.

```sh
$ pip list
```

Minimal description of packages.

```sh
$ pip freeze
```

 The content is suitable for a `requirements.txt` file, so you could copy a line there. Or write the entire file.

```sh
$ pip freeze > requirements.txt
```

Note that the this approach is likely to produce a list of packages that are dependencies of your dependencies. So you might want to reduce the lines in the file.

There is no lockfile standard for `pip`. If you use alternative approaches like `pipenv` or `poetry` then you'll get a lockfile separate from the main requirements file.

