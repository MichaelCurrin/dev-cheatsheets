# diff

See git docs: [git-diff](https://git-scm.com/docs/git-diff)


## Usage

Short help:

```sh
$ git diff -h
```
```
usage: git diff [<options>] [<commit> [<commit>]] [--] [<path>...]
```
Long help:

```sh
$ git diff --help
```
```
NAME
       git-diff - Show changes between commits, commit and working tree, etc

SYNOPSIS
       git diff [<options>] [<commit>] [--] [<path>...]
       git diff [<options>] --cached [<commit>] [--] [<path>...]
       git diff [<options>] <commit> <commit> [--] [<path>...]
       git diff [<options>] <blob> <blob>
       git diff [<options>] --no-index [--] <path> <path>

DESCRIPTION
       Show changes between the working tree and the index or a tree, changes between the index and a tree, changes between two
       trees, changes between two blob objects, or changes between two files on disk.

       ...
```

So you can run against zero, one or two commits. And can specify paths.


## Select scope

What commits or files to run against.

### Default - no arguments

```sh
git diff
```

This will include:

- staged
- unstaged

But not:

- untracked

If you have no uncommit changes, you'll see no output.


If you want untracked files, then git status works file. The line count doesn't matter so much as the files are new and there is no lines changed.

### Staged only

Show diff of stages files only.

All the other flags below also assume all files that are tracked, unless you specifically ask for staged/cached, which can include previously untracked files.

```sh
$ git diff --cached
```

Note `--cached` and `--staged` are synonyms.

### Compare current against a commit

Specify target past commit only to compare against current `HEAD`. You might want to stash changes first.

```sh
$ git diff COMMIT
```

e.g.

```sh
$ git diff HEAD~

$ git checkout feature
$ git diff master
```

### Compare two commits

```sh
$ git diff COMMIT COMMIT
```
The order doesn't matter.

e.g.

```sh
$ git diff HEAD~5 HEAD~7
$ git diff master feature
```

This works too and is similar to what you'd run for `git log`.

```sh
$ git diff HEAD~5..HEAD~7
```

### No index option

Compare when at least one of the filse is out the repo, or the entire command is run outside the repo.

```sh
$ git diff [<options>] --no-index [--] <path> <path>
```

### Ignore submodules

```
--ignore-submodules[=<when>]
```

> Ignore changes to submodules in the diff generation. <when> can be either "none", "untracked", "dirty" or "all", which is the default.


## Output modes

### Patch

This is the default.

```sh
$ git diff -p
```

This can be hidden with `s` for `--no-patch`


### Output to file

> Output to a specific file instead of stdout.

```
--output=<file>
```

### Raw

> Generate the diff in raw format.

e.g.

```sh
$ git diff --raw
:100755 100755 0f5324b 0000000 M        genesis/install.sh
:100755 100755 b3858ab 0000000 M        genesis/upgrade.sh
```

### Stat

`--stat` - see [docs](https://git-scm.com/docs/git-diff#Documentation/git-diff.txt---statltwidthgtltname-widthgtltcountgt)

```sh
$ git diff --stat
 genesis/install.sh |  5 ++---
 genesis/upgrade.sh | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)
```

### Short stat

> Output only the last line of the --stat format containing total number of modified files, as well as number of added and deleted lines.

```sh
$ git diff --shortstat
 2 files changed, 16 insertions(+), 3 deletions(-)
```

### Summary

`--summary`

> Output a condensed summary of extended header information such as creations, renames and mode changes.

```sh
$ git diff --summary --staged
```
```
 create mode 100644 src/my-git.ts
```

Note this is only useful in certain cases such as when there is a new file AND it is staged. Otherwise you'll see no output. The other flags would be more useful.

### Compact summary

`--compact-summary`

> Output a condensed summary of extended header information such as file creations or deletions ("new" or "gone", optionally "+l" if it’s a symlink) and mode changes ("+x" or "-x" for adding or removing executable bit respectively) in diffstat. The information is put between the filename part and the graph part. Implies --stat.

e.g.

```sh
$ git diff --compact-summary
```
```
 genesis/install.sh |  5 ++---
 genesis/upgrade.sh | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 3 deletions(-)
```
```
 src/my-git.ts (new) | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
```

### Name and status

```sh
$ git diff
M       opm/datadog/Makefile
M       opm/datadog/README.md

### Name only

```sh
$ git diff --name-only
genesis/install.sh
genesis/upgrade.sh
```
