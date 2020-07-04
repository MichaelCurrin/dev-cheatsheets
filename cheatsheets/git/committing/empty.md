---
title: Empty
---


## Commit with short message

Since `git`  does not allow an empty commit message, you can just use a space.

```sh
git commit -m ' '
```

## Commit with empty message

[source](https://stackoverflow.com/questions/6218199/git-commit-with-no-commit-message)

```sh
git commit --allow-empty-message -m ''
```

```sh
git config --global alias.nccommit 'commit -a --allow-empty-message -m ""'
```

## Commit with no changes

[Blog post](https://www.thread.house/2020/01/git-commit-allow-empty/) on [thread.house](https://thread.house).

```sh
git commit --allow-empty
```
