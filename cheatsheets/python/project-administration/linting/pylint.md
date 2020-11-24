# Pylint

- [docs.pylint.org](https://docs.pylint.org/en/latest/index.html)
- [Pylint messages](https://pylint-messages.wikidot.com/all-codes)
- [Pylint message-control](https://pylint.readthedocs.io/en/latest/user_guide/message-control.html)

## Usage

You can't use `.`, but you can use a directory name or `*`.

```sh
$ pylint my_app
```

If you have import problems, you can do this:

```sh
$ export PYTHONPATH=my_app && pylint my_app
```

But this will **not** work as you'll get the same import error as before.

```sh
$ cd my_app && pylint *
```

The exit codes are not meaningful to read. But you can use a package to be more verbose and it also takes flags so you can set the tolerance of level to error out on.

```sh
$ pylint my_app || pylint-exit $?
```

## Rules

Formats that Pylint accepts - copied from message-control doc.

> For all of these controls, `pylint` accepts the following values:
> -   a symbolic message: `no-member`, `undefined-variable` etc.
> -   a numerical ID: `E1101`, `E1102` etc.
> -   The name of the group of checks. You can grab those with `pylint --list-groups`. For example, you can disable / enable all the checks related to type checking, with `typecheck` or all the checks related
> to variables with `variables`
> -   Corresponding category of the checks
>     -   `C` convention related checks
>     -   `R` refactoring related checks
>     -   `W` various warnings
>     -   `E` errors, for probable bugs in the code
>     -   `F` fatal, if an error occurred which prevented `pylint` from doing further processing.
> -   All the checks with `all`


Print all messages:

```sh
# Generate pylint's messages.
pylint OPTIONS --list-msgs         
```

Generate a config.

```sh
$ pylint OPTIONS --generate-rcfile > .pylintrc
````

## How to disable rules

Approaches to disabling a _pylint_ rule.

From the shell.

```sh
$ pylint OPTIONS --disable=W
$ pylint OPTIONS --disable-all
```

Disable for an entire file.

```python
# pylint: disable=missing-function-docstring
```

Disable for a scope - same as above but only applies in the scope.

```python
def test():
    # pylint: disable=no-member
    foo()
```

Disable for line.

```python
a, b = foo() # pylint: disable=unbalanced-tuple-unpacking
```

Using symbols:

```python
# pylint: disable=C0116, ..., ...
```

Using [symbolic names](https://docs.pylint.org/en/latest/faq.html#do-i-have-to-remember-all-these-numbers)

```python
# pylint: disable=locally-disabled, multiple-statements, fixme, line-too-long
```

Using config file:

- `.pylintrc`
    ```ini
    [MESSAGES CONTROL]
    disable= 
      wildcard-import,
      method-hidden,
      too-many-lines
    ```


## Flake8

### Disable

Disable for entire file:

```python
# flake8: noqa
```

Disable inline - all rules

```
foo() # noqa
```

Disable inline - comma-separated codes.

```
foo() # noqa: E234
```

Example config:

- `.flake8`
    ```ini
    [flake8]
    max-line-length = 88
    ignore = E501, E203, W503
    per-file-ignores = __init__.py:F401
    exclude =
        .git
        __pycache__
        setup.py
        build
        .venv
        .vscode
        .github
        foo/utils/_compat.py
        tests/fixtures/
        tests/repositories/fixtures/
        tests/utils/fixtures/
    ```
