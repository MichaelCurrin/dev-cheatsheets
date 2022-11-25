# Unstage

If a new file has been created and staged and you want to unstage it (but not delete it), you can follow this (from the tip in the `git status` output).

```sh
$ git restore --staged PATH
```

e.g.

```sh
$ touch abc.txt
$ git add abc.txt
$ git status
$ git restore --staged abc.txt
$ git status
```
