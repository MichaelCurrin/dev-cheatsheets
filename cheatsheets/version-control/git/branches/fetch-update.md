# Fetch and update branches

## Fetch only default remote

Implied `origin`.

```sh
$ git fetch
```

Add `-v` for verbose.


## Fetch tags

This fetches tags but not branches.

```sh
$ git fetch --tags
```


## Fetch all remotes

Useful if you push to say GitHub and BitBucket, or your have `origin` for your code of a forked repo and `upstream` for the original repo.

```sh
$ git fetch --all
```


## Fetch all branches

If you do a shallow clone, you'll only be able to fetch the default branch and can't checkout other branches on the remote.

This fixes it. I tested this successfuly after reading this [SO](https://stackoverflow.com/questions/23708231/git-shallow-clone-clone-depth-misses-remote-branches) thread.

```sh
$ git remote set-branches origin '*'
$ git fetch -v
```
