---
title: Git diff-index
---

## Docs

On Git docs - [git-diff-index](https://www.git-scm.com/docs/git-diff-index).


## Usage


### Short help

```sh
$ git diff-index -h
```
```
usage: git diff-index [-m] [--cached] [<common-diff-options>] <tree-ish> [<path>...]
common diff options:
  -z            output diff-raw with lines terminated with NUL.
  -p            output patch format.
  -u            synonym for -p.
  --patch-with-raw
                output both a patch and the diff-raw format.
  --stat        show diffstat instead of patch.
  --numstat     show numeric diffstat instead of patch.
  --patch-with-stat
                output a patch and prepend its diffstat.
  --name-only   show only names of changed files.
  --name-status show names and status of changed files.
  --full-index  show full object name on index lines.
  --abbrev=<n>  abbreviate object names in diff-tree header and diff-raw.
  -R            swap input file pairs.
  -B            detect complete rewrites.
  -M            detect renames.
  -C            detect copies.
  --find-copies-harder
                try unchanged files as candidate for copy detection.
  -l<n>         limit rename attempts up to <n> paths.
  -O<file>      reorder diffs according to the <file>.
  -S<string>    find filepair whose only one side contains the string.
  --pickaxe-all
                show all files diff when -S is used and hit is found.
  -a  --text    treat all files as text.
```

### Long help

This is same as `man git-diff-index`.

```sh
$ git diff-index --help
```
```
NAME
       git-diff-index - Compare a tree to the working tree or index

SYNOPSIS
       git diff-index [-m] [--cached] [<common diff options>] <tree-ish> [<path>...]

DESCRIPTION
       Compares the content and mode of the blobs found in a tree object with the corresponding tracked files in the working tree,
       or with the corresponding paths in the index. When <path> arguments are present, compares only paths matching those
       patterns. Otherwise all tracked files are compared.
```


### Cached mode

Copied from a docs example:

```sh
git diff-index --cached HEAD
```


## Flags

Examples of usage and output

Given 3 files, two untracked and one of the untracked is staged:

```
 M src/extension.ts
A  src/workspace.ts
?? src/my-git.ts
```

### Staged

Note that an argument is required, even if it is just `HEAD`.

Using `--cached` works but `--staged` does not, while these both work on `git diff`.

See below.


### Default view

Detailed

```sh
$ git diff-index HEAD
:100644 100644 c8a49f4b29c16d6989a5053d7338ac827e4587d9 0000000000000000000000000000000000000000 M      src/extension.ts
:000000 100644 0000000000000000000000000000000000000000 1d0872b88eb13128aed9c82ab2bc58d312d15802 A      src/workspace.ts
```

```sh
$ git diff-index --cached  HEAD
:000000 100644 0000000000000000000000000000000000000000 1d0872b88eb13128aed9c82ab2bc58d312d15802 A      src/workspace.ts
```

### Name status

`--name-status`

> Show only names and status of changed files. See the description of the --diff-filter option on what the status letters mean.

Jump to [Diff filter](#diff-filter) section.

Summary view, close to `git status -s`.

```sh
$ git diff-index --cached --name-status HEAD
A       src/workspace.ts
```

```sh
$ git diff-index --name-status HEAD
M       src/extension.ts
A       src/workspace.ts
```

### Stat

```sh
$ git diff-index --stat  --cached  HEAD
 src/workspace.ts | 8 ++++++++
 1 file changed, 8 insertions(+)
```

### Num stat

```sh
$ git diff-index --numstat  --cached  HEAD   
8       0       src/workspace.ts
```

```sh
$ git diff-index --numstat   HEAD         
82      55      src/extension.ts
8       0       src/workspace.ts
```

### Diff filter

```
       --diff-filter=[(A|C|D|M|R|T|U|X|B)...[*]]
           Select only files that are Added (A), Copied (C), Deleted (D), Modified (M), Renamed (R), have their type (i.e. regular
           file, symlink, submodule, ...) changed (T), are Unmerged (U), are Unknown (X), or have had their pairing Broken (B).
           Any combination of the filter characters (including none) can be used. When * (All-or-none) is added to the
           combination, all paths are selected if there is any file that matches other criteria in the comparison; if there is no
           file that matches other criteria, nothing is selected.

           Also, these upper-case letters can be downcased to exclude. E.g.  --diff-filter=ad excludes added and deleted paths.

           Note that not all diffs can feature all types. For instance, diffs from the index to the working tree can never have
           Added entries (because the set of paths included in the diff is limited by what is in the index). Similarly, copied and
           renamed entries cannot appear if detection for those types is disabled.
```

### Include

As per [Flags](#flags) at the top, you can include renames and copies.

- `-M, --find-renames` - detect renames.
- `-C, --find-copies` - detect copies.

```
       -M[<n>], --find-renames[=<n>]
           Detect renames. If n is specified, it is a threshold on the similarity index (i.e. amount of addition/deletions
           compared to the file’s size). For example, -M90% means Git should consider a delete/add pair to be a rename if more
           than 90% of the file hasn’t changed. Without a % sign, the number is to be read as a fraction, with a decimal point
           before it. I.e., -M5 becomes 0.5, and is thus the same as -M50%. Similarly, -M05 is the same as -M5%. To limit
           detection to exact renames, use -M100%. The default similarity index is 50%.

       -C[<n>], --find-copies[=<n>]
           Detect copies as well as renames. See also --find-copies-harder. If n is specified, it has the same meaning as for
           -M<n>.
```

Given status output:

```sh
$ git status -s
R  README.md -> FEEDME
 M src/extension.ts
A  src/workspace.ts
?? src/my-git.ts
```

Plain:

```sh
$ git diff-index --name-status HEAD
```
```
A       FEEDME
D       README.md
M       src/extension.ts
A       src/workspace.ts
```

With flags:

```sh
$ git diff-index --name-status -M -C HEAD
```
```
R100    README.md       FEEDME
M       src/extension.ts
A       src/workspace.ts
```
