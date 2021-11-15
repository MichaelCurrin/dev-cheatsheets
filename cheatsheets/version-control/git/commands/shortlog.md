# shortlog


## Help

```console
$ git shortlog -h
usage: git shortlog [<options>] [<revision-range>] [[--] <path>...]
   or: git log --pretty=short | git shortlog [<options>]

    -c, --committer       Group by committer rather than author
    -n, --numbered        sort output according to the number of commits per author
    -s, --summary         Suppress commit descriptions, only provides commit count
    -e, --email           Show the email address of each author
    -w[<w>[,<i1>[,<i2>]]]
                          Linewrap output
```


## Examples

The author name field is used here in some cases. If I commit locally my name is `Michael Currin` from `~/.gitconfig`. But if I use GitHub it is `michaelcurrin`. In both cases, it uses `MichaelCurrin` as the username.


### Default output

```console
$ git shortlog
Michael Currin (1122):
      docs: Update README.md
      feat: Add content
      feat: Add content
      chore: Move and rename
      feat: Add content
...
michaelcurrin (1205):
      Initial commit
      docs: Create README.md
      docs: Update README.md
      docs: Update README.md
      feat: Create markdown.md
      feat: Create semantic_commits.md
...
```


### Group by name

```console
$ git shortlog -n -s
  1122  Michael Currin
  1205  michaelcurrin
```

### Group by committer

The committer is who create the commit. The author wrote the commit.

Here, `GitHub` gets uses, for the same commits as used above.

```console
$ git shortlog -c -s
  1254  GitHub
   499  Michael Currin
   574  michaelcurrin
```

### Group by email

```console
$ git shortlog  -e -s
   872  Michael Currin <...@users.noreply.github.com>
   250  Michael Currin <...@gmail.com>
   1205  michaelcurrin <...@gmail.com>
```

Sort by commits and show committer in addition to email.

```sh
$ git shortlog -n -s -c -e
```
```
  1254  GitHub <noreply@github.com>
   574  michaelcurrin <...@gmail.com>
   250  Michael Currin <...@users.noreply.github.com>
   249  Michael Currin <...@gmail.com>
```

### Filter by paths

All commits in a directory.

```sh
$ git shortlog cheatsheets/python/ -s
```
```
   117  Michael Currin
   121  michaelcurrin
```

On a filename.

```sh
$ git shortlog cheatsheets/python/challenges.md
```
```
Michael Currin (5):
      Create challenges.md
      Update challenges.md
      Update challenges.md
      Update challenges.md
      refactor: Use title as heading
```

### Filter by commit range

Here we set revision range using commit references. A branch will probably work here.

```sh
$ git shortlog HEAD~10..HEAD~8
Michael Currin (2):
      Update export.md
      Update clipboard.md
```

Use the last 5 commits only.

```sh
$ git log -n 5 --pretty=short | git shortlog
```

```
Michael Currin (5):
      Update list.md
      Update arg-parse.md
      Update analytics.md
      docs: Update README.md
      refactor: Replace minima with fractal
```
