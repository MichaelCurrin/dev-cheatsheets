# Pre-commit

A tool to run formatting checks before committing.

See [pre-commit.com/](https://pre-commit.com/).

## Install

Install with `pip` directly, or add to `requirements.txt`.

```sh 
$ pip install pre-commit
```

## Configure

Create `.pre-commit.config.yaml` in your repo.

Install in your repo for each commit.

```sh 
$ pre-commit install
```

Or if you want commits to be quicker and rather check on a push, install on pre-push instead:

```sh
$ pre-commit install --hook-type pre-push
```


## Usage

```sh
$ pre-commit run --all-files
$ # OR
$ pre-commit run --files PATH PATH PATH
```

Verbose output:

```sh
$ pre-commit run --verbose
```
