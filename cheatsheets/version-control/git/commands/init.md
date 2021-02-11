# init

See [git-init](https://git-scm.com/docs/git-init) in the docs.


## Initialize repo in existing directory

```sh
$ mkdir my-app
$ cd my-app
$ git init
```


## Initialize repo in new directory

```sh
$ git init my-app
$ cd my-app
```


## Set default branch

Change the default branch used for future runs on `init`.

Currently, the Git default is `master`. You might want to override to `main` or `dev` or `edge`.

```sh
$ git config --global init.defaultBranch main
```

Or set it once-off:

```sh
$ git init -b main
```
