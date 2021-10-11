---
title: Nest

description: How to manage a submodule that has submodules

---

## Create

Use the standard way of creating a submodule and adding it to `.gitsubmodules`.

In the next bit, the recursive part comes.


## Update

We need to `--recursive` to include submodules. And `--init` in case they were not initialized.

```sh
$ git submodule update --init --recursive
```


Going further to update each submodule in there. From [SO](https://stackoverflow.com/questions/10168449/git-update-submodules-recursively).

```sh
$ git submodule update --init --recursive
$ git submodule foreach --recursive git fetch
$ git submodule foreach git merge origin master
```
