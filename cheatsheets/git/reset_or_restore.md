# Reset or restore cheatsheet


## Restore master

Restore your master branch to the state on the remote.

```sh
git fetch
git reset --hard origin/master
```
This is useful if you have local commits on a branch that you haven't pushed. Or a rebase a has been done on the remote and you are happy to use that remote and drop local commits.


## Clean a feature branch

If you
<!--stackedit_data:
eyJoaXN0b3J5IjpbODAwMzMwOTIzXX0=
-->