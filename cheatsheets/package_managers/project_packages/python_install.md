# Python package install cheatsheet
> How to install packages with `pip`

## Resources

- [pip docs](https://pip.readthedocs.io/)
- [pip on PyPI](https://pypi.org/project/pip/)


## Install

### Requirements file

Set the version in `requirements.txt` file:

```
foo>=0.2
```

Then install from the file.

```sh
$ pip install -r requirements.txt
```


### Command-line version

Or install the version directly. Note the quotes help to escape characters.

```sh
$ pip install 'foo>=0.2'
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

Verbose description of packages.
```sh
$ pip list
```

Minimal description of packages. Packa

```sh
$ pip freeze
```

 The content is suitable for a `requirements.txt` file, so you could copy a line there. Or write the entire file.
 
```sh
$ pip freeze > requirements.txt
```

Note that the this approach is likely to produce a list of packages that are dependencies of your dependencies. So you might want to reduce the lines in the file.

There is no lockfile standard for `pip`. If you use alternative approaches like `pipenv` or `poetry` then you'll get a lockfile separate from the main requirements file.
<!--stackedit_data:
eyJkaXNjdXNzaW9ucyI6eyJKcnVCYUZQbUJJelBzbUpjIjp7In
RleHQiOiJodHRwczovL3B5cGkub3JnL3Byb2plY3QvcGlwLyIs
ImVuZCI6MjU3LCJzdGFydCI6MjU3fX0sImNvbW1lbnRzIjp7Im
g4M2tWeFVtUXRYbmxUbXciOnsiZGlzY3Vzc2lvbklkIjoiSnJ1
QmFGUG1CSXpQc21KYyIsInN1YiI6ImdoOjE4NzUwNzQ1IiwidG
V4dCI6IkFkZCBsaW5rIiwiY3JlYXRlZCI6MTU4NzQ2Nzc0Mjg2
Nn0sIjRkMjJWWkxKWm5weGFjbHUiOnsiZGlzY3Vzc2lvbklkIj
oiSnJ1QmFGUG1CSXpQc21KYyIsInN1YiI6ImdoOjE4NzUwNzQ1
IiwidGV4dCI6ImRvbmUiLCJjcmVhdGVkIjoxNTg3NDY3Nzc0ND
E0fX0sImhpc3RvcnkiOlsyNzg4MjIzOF19
-->