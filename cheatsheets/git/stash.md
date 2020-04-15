# Git stash cheatsheet

Stashes are numbered where `0` is the most recent. New stashes are added to the front of the list to become the new index 

Create stash.

```sh
git stash
```

```sh
git add .
git stash
```

```sh
git stash save 'Name of stash'
```

List stashes

```sh
git stash list

stash@{0}: On foo-bar: stash name
stash@{1}: On master: another stash name
stash@{3}: WIP on master: a5a067af Commit message
```

Show stashed file list.

```sh
git stash show # 0

git stash show 1
```

Show stashed diff.

```sh
git stash show -p
```

Apply and remove.

```sh
git stash

Drop.

```sh
git stash drop # 0

git stash drop 1
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbLTExNDU3ODczNjJdfQ==
-->