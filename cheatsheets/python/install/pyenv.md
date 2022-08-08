---
title: Pyenv
description: Manage multipe versions of Python
---

"Simple Python version management"

<!-- TODO: Copy from learn to code python -->


Repo - [pyenv/pyenv](https://github.com/pyenv/pyenv)

## List installed versions

```sh
$ pyenv versions
```

## List available versions

```sh
$ pyenv install -l
```


## Install

```sh
$ pyenv install 3.10.4
```


## Select

Select just for current shell session:
```sh
$ pyenv shell <version>
```

Automatically select whenever you are in the current directory (or its subdirectories):

```sh
$ pyenv local <version>
```

Select globally for your user account:

```sh
$ pyenv global <version>
```
