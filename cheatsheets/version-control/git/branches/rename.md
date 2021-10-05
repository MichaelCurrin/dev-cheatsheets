# Rename branch


## Locally

Use the `--move` flag.

```sh
$ git branch -m CURRENT NEW
```


## On GitHub

In GitHub settings for a default branch, you can rename the branch .

You get this prompt for renaming from `master` to something else.

> Your members will have to manually update their local environments. We'll let them know when they visit the repository, or you can share these commands:

```sh
$ git branch -m master <BRANCH>
$ git fetch origin
$ git branch -u origin/<BRANCH> <BRANCH>
```

After a rename, GH gives you a filled snippet to copy, like:

```sh
$ git branch -m master main
$ git fetch origin
$ git branch -u origin/main main
```
