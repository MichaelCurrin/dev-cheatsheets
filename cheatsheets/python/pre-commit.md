# Pre-commit

A tool to run formatting checks before committing.

See [pre-commit.com/](https://pre-commit.com/).

## Install

Install with `pip` directly, or add to `requirements.txt`.

```sh 
$ pip install pre-commit
```

Install in your repo:

```sh 
$ pre-commit install
```


## Usage


```sh
$ pre-commit run --all-files
$ # OR
$ pre-commit --files PATH PATH PATH
```

Verbose output:

```sh
$ pre-commit run --verbose
```
