# Remote

## Related

- [Remote](https://michaelcurrin.github.io/code-cookbook/recipes/version-control/git/rebase.html) in Code Cookbook.


## View

```console
$ git remote
origin
```

```console
$ git remote -v
origin  git@github.com:MichaelCurrin/foo.git (fetch)
origin  git@github.com:MichaelCurrin/foor.git (push)
```


## Change remote

For example, you might switch from HTTPS to SSH, or GitHub to BitBucket.

```sh
$ git remote set-url REMOTE_NAME URL
```

e.g.

```sh
$ git remote set-url origin git@github.com:MichaelCurrin/foo.git
```


## Add remote

```sh
$ git remote add REMOTE_NAME URL
```

e.g.

```sh
$ git remote set-url upstream git@github.com:AbcDef/foo.git
```


## Sync fork with original repo

```sh
$ git checkout main
$ git pull upstream main
$ git push
```

Or reset origin to point to upstream - useful if you made commits on `origin` that you want to undo.

```sh
$ git checkout main
$ git fetch upstream
$ git reset --hard upstream main
```
