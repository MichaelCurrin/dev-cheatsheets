# Flake8


## CLI

Here are two recommended commands based on what you get in GitHub Actions for a Python template.

- Stop the build if there are Python syntax errors or undefined names.
    ```sh
    $ flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
    ```
- Exit-zero treats all errors as warnings. The GitHub editor is 127 chars wide.
    ```sh
    $ flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
    ```

I like to use those in a `Makefile` such as [here](https://github.com/MichaelCurrin/py-project-template/blob/master/Makefile) so that they are easy to use locally and in CI.

The arguments can be moved to a config as well.


## Config

See [Configuring Flake8](https://flake8.pycqa.org/en/latest/user/configuration.html) guide.

Flake8 supports storing its configuration in the following places:

- Your top-level user directory.
- In your project in one of `setup.cfg`, `tox.ini`, or `.flake8`.

Example:

- `setup.cfg`
    ```ini
    [flake8]
    ignore = E266,E402,E241
    ```
- `setup.cfg`
    ```
    [flake8]
    ignore = D203
    exclude =
      .git,
      __pycache__,
      docs/source/conf.py,
      old,
      build,
      dist
    max-complexity = 10
    ```

Max complexity is the number of linear paths allowed in a function - adding if/else statement for example increases this. See [Cyclomatic complexity](https://en.wikipedia.org/wiki/Cyclomatic_complexity). The value of 10 is a starting point based on the docs.

I find it useful to ignore these:

- `E203`. Since Black adds whitespace before a colon (e.g. `rows[(-1 * preview) :]` but Flake8 gives an error.


## Error status codes

> The symbol associated with a specific check. For example, pycodestyle implements checks that look for whitespace around binary operators and will either return an error code of W503 or W504.

Using Flake8 gives error codes from Flake8 and the lower level PyCode project.

- Flake8 docs
    - [Error codes](https://flake8.pycqa.org/en/latest/user/error-codes.html)
    - Flake8 errors start with `F` - `F4XX`, `F5XX`, `F6XX`, `F8XX` and `F901`.
- PyCode style
    - [Error codes](https://pycodestyle.pycqa.org/en/latest/intro.html#error-codes) - linked from the Flake8 docs
    - `E` errors - `EXXX`.
    - `W` warnings - `WXXX`. It looks like these are mostly taken care of by using an IDE to format the code and not using any deprecated code patterns.
        ```
        100 indentation
        200 whitespace
        300 blank lines
        400 imports
        500 line length
        600 deprecation
        700 statements
        900 syntax error
        ```
    - Help:
        ```sh
        $ python pycodestyle.py -h
        ```

e.g.

```
F404 	future import(s) name after other statements

E266 	too many leading ‘#’ for block comment
E402 	module level import not at top of file
E241 (*) 	multiple spaces after ‘,’

W606 	‘async’ and ‘await’ are reserved keywords starting with Python 3.7
```


## Ignore

### Basic

```python
# noqa: F123
```

e.g.

```python
abc = xyz()  # noqa: F123

def = (
  "xyz"  # noqa: F123
]
```


Note for the _unused variable_ error specifically, you need to put the comment on the first line (where the variable name is).

```python
abc = xyz(  # noqa: F841
  x=1
)
```

### Ignore multiple rules

```python
# noqa: E731,E123
```

### Ignore whole file

Either add to your config or add this to the top of the file:

```python
# flake8:noqa
```

Based on this [answer](https://stackoverflow.com/a/54454433) that you **cannot** ignore a specific rule for a file like you can for other linters. This does not work as it ignores everything: `# flake8: noqa: F401`

Ignore a rule for a file by setting it in the Flake8 config:

```ini
[flake8]
per-file-ignores = 
  file1.py: F401
  file2.py: E501
```

I tested this pattern also works with globstart:

```yaml
per-file-ignores =
  test_*:  FS003
```

## F-string

If you have a f-string subsitution but no `f` prefix, you can detect that. But you need a plugin and a flag.

- [MichaelKim0407/flake8-use-fstring](https://github.com/MichaelKim0407/flake8-use-fstring)

```sh
pip install flake8-use-fstring
```

```sh
flake8 --enable-extensions=FS003
```

Note that is aggressive - detecting strings which don't have variable subsitution but have a pair of `{}`. You can ignore the rule for that line. Or you can make it a raw string, such as for regex.

By default, the plugin will suggest precent (`%`) and format (`.format`) substitution get used. You can also add arguments based on the plugin's docs, to change the level of alerting. It seems they can only get more aggressive and not turned off.
