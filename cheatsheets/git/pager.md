# Git pager cheatsheet


Pager can be off or on depending on global config (switching from Bash to ZSH also changed this for me but it can be changed back).

## Branch

### Global

```sh
git config --global pager.branch false
```

### Once-off

```sh
git --no-pager branch
```

## Log

### Global

```sh
git config --global pager.log false
```

### Once-off

Log can be very long so limit it.

```sh
git --no-pager log --oneline -40
```

This could be aliased.
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTEzNzkwMjAxM119
-->