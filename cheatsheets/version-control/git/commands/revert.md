# revert

Create a commit to reverse the work of another commit. 

This keeps the old commits and builds on top of them - great for keeping history and when working with others environments or developers.

If you want to actually remove commits from your commit history, you can use `rebase` or `reset`. But those are destructive and also if you already pushed the commits you're deleting you'll have to do a force push to let you push them. This **will** cause conflicts for other developers working on your branch as your commit trees have diverged.


## Revert a commit

This reverses a single commit's changes. Any changes from later commits will be kept.

You'll get a prompt for a commit message and then the commit will be made.

```sh
$ git commit REF
```


## Revert a range of commits

Choose a commit hash for the start and another for the end, such as `HEAD` for current commit.

This will prompt you to make multiple commits, each reversing a commit (starting from the latest). The message will be populated for you.

```sh
$ git commit
```

If you prefer to create a _single_ commit, you can do this.

```sh
$ git revert --no-commit 4eab63b2..HEAD
```

Check the changed files.

Then commit.

```sh
$ git commit
```

The placeholder message will be taken from the oldest commit. 
```
Revert "My commit message"

This reverts commit 27ad6.....
```

So you'll want to update it to reflect you are reverting a range.

e.g.

```
Revert commit abc9872 through to def1231
```


## Manage a revert in progress

```sh
$ git revert --continue
$ git revert --abort
$ git revert --quit
```
