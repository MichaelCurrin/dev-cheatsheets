# Compare

## Compare commits


### Patches

View patches from each commit.

```sh
$ git log -p
```

Or only for the last commit.

```sh
$ git show
```


### Files changed

```sh
$ git diff --name-status COMMIT [COMMIT]
$ git diff --name-status HEAD~2
```

For sample output see [Diff command]({% link cheatsheets/version-control/git/commands/diff.md %}) page.
