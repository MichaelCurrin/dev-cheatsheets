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

### For piping output

When using `git diff` output to pass to another command like a Python app, then here are some tips.

- Check for staged output first, otherwise default to index (staged and unstaged).
- Turn off pagination with `-P` `--no-pager`, so there is no interactive scrolling and it pipes the text to the next command.

e.g.

```sh
$ git diff --cached --exit-code && git -P diff || git -P diff --cached | echo
```

You can also look at `git diff-index` as that is meant for passing to a machine instead. But it has different flags and does not pick up files that are untracked.
