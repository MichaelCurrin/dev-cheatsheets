# Package managers

## List installed packages

```sh
gem list

bundle list

pip list
pip freeze

npm list
npm -g list
```

## Install package version

### Python

#### Version format

[Version specifiers](https://www.python.org/dev/peps/pep-0440/#version-specifiers) in a Python PEP.

Example:

```
~= 0.9, >= 1.0, != 1.3.4.*, < 2.0
```

- `~=`: Compatible release clause.
- `==`: Version matching clause
- `!=`: Version exclusion clause
- `<=`, `>=`: Inclusive ordered comparison clause
- `<`, `>`: Exclusive ordered comparison clause
- `===`: Arbitrary equality clause.

For compatible release clause, the documentation says that the following groups of version clauses are equivalent:

- Two levels (X.Y)
    ```
    ~= 2.2
    >= 2.2, == 2.*
    ```
- Three levels (X.Y.Z)
    ```
    ~= 1.4.5
    >= 1.4.5, == 1.4.*
    ```


From the `pip` docs on [requirements file format](https://pip.readthedocs.io/en/stable/reference/pip_install/#requirements-file-format):

```
docopt == 0.6.1             # Version Matching. Must be version 0.6.1
keyring >= 4.1.1            # Minimum version 4.1.1
coverage != 3.5             # Version Exclusion. Anything except version 3.5
Mopidy-Dirble ~= 1.1        # Compatible release. Same as >= 1.1, == 1.*
```

#### Install

Set the version in `requirements.txt` file:

```
foo>=0.2
```

Then install from the file.

```sh
$ pip install -r requirements.txt
```


Or install the version directly. Note the quotes help to escape characters.

```sh
$ pip install 'foo>=0.2'
```


You omit a version, though this can be dangerous for upgrading or setting up environments for import projects. If you omit a version, you'll get the latest.

```sh
$ pip install foo
```

But note that it won't get upgraded later even if there is a newer version available.

To upgrade:

```sh
$ pip install foo --upgrade
```

To uninstall:

```sh
$ pip uninstall foo
```
