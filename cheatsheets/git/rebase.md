# Rebase

```sh
$ git pull --rebase
```

```sh
$ git pull --rebase origin master
```

```sh
$ git fetch
$ git rebase origin/master
```


## Conflicts

### Actions

#### Update and continue

Common flow:

1. Edit a file to remove conflicts.
2. Add or remove.
    ```sh
    $ git add PATH
    $ # OR
    $ git rm PATH
    ```
3. Continue.
    ```sh
    $ git rebase --continue
    ```

I think you can run `git commit` to add and continue.


#### Skip

Skip the current commit. 

This is useful if after removing conflicts there are no changes to add or commit.
```sh
$ git rebase --skip
```

#### Abort

```sh
$ git rebase --abort
```

### Restore

I am not familiar with this but it comes from the suggested commands.

Unstage a file.

```sh
git restore --staged PATH
```

### Messaging

Message from rebase result on a conflict:

```
CONFLICT (content): Merge conflict in ...
...
git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
```

Message from `git status`:

```
  (fix conflicts and then run "git rebase --continue")
  (use "git rebase --skip" to skip this patch)
  (use "git rebase --abort" to check out the original branch)

Unmerged paths:
  (use "git restore --staged <file>..." to unstage)
  (use "git add <file>..." to mark resolution)
	both modified:   ...
```
