# pylint


- [pylint.org](https://pylint.org/)


## Help

```sh
$ pylint --help
```
```
Usage: pylint [options]

...
```

See also:


```sh
$ pylint --long-help
```


## Example

Pass a directory path.

```sh
$ pylint .
```

Given module `foo` at the top of your repo.

```sh
$ pylint foo
```


## Status codes

The exit codes of the `pylint` command are not so useful.

You can use the `pylint-exit` library to give more useful messages printed and exit on a fatal error. You can also change the level by passing flags to it.

Here we run `pylint-exit` if `pylint` gave a non-zero status (which could be a warning error) and pass the `pylint` status code to `pylint-exit`.

```sh
$ pylint foo || pylint-exit $?
```

- GitHub: [jongracecox/pylint-exit](https://github.com/jongracecox/pylint-exit)
- PyPI: [pylint-exit](https://pypi.org/project/pylint-exit/)
