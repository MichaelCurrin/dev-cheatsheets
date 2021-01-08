# Flake8


## Config

[Configuring Flake8](https://flake8.pycqa.org/en/latest/user/configuration.html)

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


## Status codes

"error", "error code" or "violation"

> The symbol associated with a specific check. For example, pycodestyle implements checks that look for whitespace around binary operators and will either return an error code of W503 or W504.

Using Flake8 gives error codes from Flake8 and the lower level PyCode project.

- Flake8 docs
    - [Error codes](https://flake8.pycqa.org/en/latest/user/error-codes.html)
    - Flake8 errors start with `F` - F4XX, F5XX, F6XX, F8XX and F901.
- PyCode style
    - [Error codes](https://pycodestyle.pycqa.org/en/latest/intro.html#error-codes) - linked from the Flake8 docs
    - `E` errors - EXXX.
    - `W` warnings - WXXX. It looks like these are mostly taken care of by using an IDE to format the code and not using any deprecated code patterns.
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
