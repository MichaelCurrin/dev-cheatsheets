---
title: Linting
---

Some VS Code choices - there are flags for each (so multiple can be used), plus a linting enabled switch.

- [Pylint](#pylint)
    - [Rules](#rules)
    - [How to disable](#how-to-disable)
- [Flake8](#flake8)
    - [Disable](#disable)


## Pylint

- [docs.pylint.org](https://docs.pylint.org/en/latest/index.html)
- [Pylint messages](http://pylint-messages.wikidot.com/all-codes)
- [Pylint message-control](https://pylint.readthedocs.io/en/latest/user_guide/message-control.html)

### Rules

Formats that Pytlint accepts - copied from message-control doc.

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

### How to disable

Approaches to disabling a *pylint* rule.

Disable for scope. Either at the top of a file or scope like a function.

```
def test():
    # pylint: disable=no-member
    ...
```

Disable for line.

```
a, b = ... # pylint: disable=unbalanced-tuple-unpacking
```

Using [symbolic names](https://docs.pylint.org/en/latest/faq.html#do-i-have-to-remember-all-these-numbers)

```
# pylint: disable=locally-disabled, multiple-statements, fixme, line-too-long
```

Using config file:

```
disable= wildcard-import,
 method-hidden,
 too-many-lines
```


## Flake8

### Disable

Disable for file:

`# flake8: noqa`

Disable inline - all.

```
... #noqa
```

Disable inline - comma-separated codes.

```
... # noqa: E234
```

Example config:

`.flake8`

```toml
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
