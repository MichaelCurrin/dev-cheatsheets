# push

Docs: [Git push](https://git-scm.com/docs/git-push)


## Push branch

```sh
git push
```

```sh
git push origin master
```

## Push all branches
Push all branches. It's a good idea to deleted merged branches first to avoid recreating them on the repo.

```sh
git push --all
```


## Push tags only

NB. Does not push the branch itself.

```sh
git push --tags
```

## Push new branch

When `git push` gives you an error that that the branch does not exist on the remote, use one of these.

```sh
git push origin HEAD
```

Use the `-u` flag for `--set-upstream`. This is not needed on future pushes.

```sh
git push -u origin my-feature
```
