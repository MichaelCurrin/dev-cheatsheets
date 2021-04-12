# revert

Create a commit to reverse the work of another commit. 

This keeps the old commits and builds on top of them - great for keeping history and when working with others environments or developers.

If you want to actually remove commits from your commit history, you can use `rebase` or `reset`. But those are destructive and also if you already pushed the commits you're deleting you'll have to do a force push to let you push them. This **will** cause conflicts for other developers working on your branch as your commit trees have diverged.


## Revert a commit

This reverses a single commit's changes. Any changes from later commits will be kept.

You'll get a prompt for a commit message and then the commit will be made.

```sh
$ git revert COMMIT_REF
```


## Revert a range of commits

Choose a commit hash for the start and another for the end, inclusive.

### Create a single revert commit

```sh
$ git revert --no-commit FIRST..LAST
$ # e.g. Target commit to now.
$ git revert --no-commit abc9872..HEAD
$ # e.g. 3 commits back to now.
$ git revert --no-commit HEAD~3..HEAD
```

Check the modified files. These will be staged already.

Then commit.

```sh
$ git commit
```

The placeholder message will be taken from the oldest commit.

So you'll want to update that to reflect you are reverting a range.

e.g.

```
Revert commit abc9872 through to def1231
```

Or

```
Undo all changes to revert back to commit abc9872.
```

You can then check that your current state after your revert commit now matches the state before the earliest commit you were reverting. You should see no difference.

```sh
$ git diff abc9872..HEAD
```

### Create multiple revert commits

```sh
$ git revert FIRST..LAST
$ # e.g. Target commit to now.
$ git revert abc9872..HEAD
$ # e.g. 3 commits back to now.
$ git revert HEAD~3..HEAD
```

Then you'll be prompted to make multiple commits, stepping back from the the latest point to the oldest. Each time you'll have to edit and save the pre-filled commit message.


## Manage a revert in progress

```sh
$ git revert --continue
$ git revert --abort
$ git revert --quit
```
