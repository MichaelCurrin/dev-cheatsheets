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


## Change default branch

Change the default branch for new repos setup with `init`.

Currently, the Git default is `master`. You might want to override to `main` or `dev` or `edge`.

### Configure globally

```sh
$ git config --global init.defaultBranch main
```

Then review your config:

```sh
$ git config --global -e
```

```ini
[init]
        defaultBranch = main
```

### Configure for one repo

Set the default with a flag.

```sh
$ git init -b main
```
