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
    ```ini
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
