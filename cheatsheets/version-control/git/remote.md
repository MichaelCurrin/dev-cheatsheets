# Remote

## Related

- [Remote](https://michaelcurrin.github.io/code-cookbook/recipes/version-control/git/rebase.html) in Code Cookbook.


## View

### List remotes

```console
$ git remote
origin
```

### List remotes - verbose

Use list all remotes and their URLs (two for each).

```console
$ git remote -v
origin  git@github.com:MichaelCurrin/foo.git (fetch)
origin  git@github.com:MichaelCurrin/foor.git (push)
```

### URL for remote

```console
$ git remote get-url origin
git@github.com:MichaelCurrin/foo.git
```


## Change remote URL

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

When creating a repo, you need to create `origin`.

```sh
$ git init
$ git remote add origin git@github.com:MyUsername/foo.git
```

If you are working creating across forks, it can be useful to add a second remote.

```sh
$ git remote add upstream git@github.com:AnotherUsername/foo.git
$ git fetch upstream
```


## Sync fork with original repo

```sh
$ git checkout main
$ git pull upstream main
$ git push  # Implied as `git push origin main`
```

Or, reset your origin to point to upstream without doing a merge or pull. Useful if you made commits on `origin` that you want to undo, or have conflicts.

```sh
$ git checkout main
$ git fetch upstream
$ git reset --hard upstream/main
$ git push  # Implied as `git push origin main`
```
