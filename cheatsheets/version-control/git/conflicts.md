# Conflicts

How to handle conflicts.

You've started a merge or rebase and got a stuck. What now?


## Merge

The set up.
```sh
$ git merge BRANCH
$ # OR
$ git pull
Automatic merge failed; fix conflicts and then commit the result.
```

```sh
$ git status
...
You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)
...
```

### Undo

You want to undo and go to a clean state.

```sh
$ git merge --abort
```

### Fix up

Fix the conflicts. Save the files.

Then do:

```sh
$ git add PATH
```

If there are changes to add, that is fine, you can go to the next part.

Create a commit.

```sh
$ git commit
```



## Rebase

The set up.

```sh
$ git rebase -i COMMIT_REF
$ # OR
$ git rebase BRANCH
$ # OR
$ git pull --rebase
```

### Undo

```sh
$ git rebase --abort
```

### Skip commit

You want to drop the commit. Or after fixing up the conflicts, there is nothing to commit. So just skip.

```sh
$ git rebase --skip
```

### Fix up

After fixing conflicts, saving files, then stage everything.

```sh
$ git add PATH
```

Then continue the rebase so it will go to the next commits in the history.

```sh
$ git rebase --continue
```

I think using `git commit` might work too.
