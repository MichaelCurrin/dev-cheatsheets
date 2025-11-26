# log

Git docs: [git-log](https://git-scm.com/docs/git-log)

## Flags

Recommended flags for common usage.

```
--all
```

> Pretend as if all the refs in refs/ are listed on the command line as
> `<commit>`.

```
-p --patch
```

Generate patch i.e. diff for each commit.

```
--decorate[=short|full|auto|no]
```
> Print out the ref names of any commits that are shown. Defaults to
> short optionm such that the name prefixes refs/heads/, refs/tags/ and
> refs/remotes/ will not be printed.

```
--graph
```

> Draw a text-based graphical representation of the commit history on
> the left hand side of the output.

```
--stat
```

> Generate a diffstat.

See [Stat](#stat) below.

```
--pretty=FORAMT
```

Filter by text:

```
-S<string>
```
> Look for differences that change the number of occurrences of the specified <string> (i.e. addition/deletion) in a file. Intended for the scripter’s use.

## Pretty formats

See [Pretty formats](https://git-scm.com/docs/pretty-formats) on Git docs.

Available: 
- `oneline`
- `short`
- `medium`
- `full`
- `fuller`
- `email`
- `raw`
- `format:<string>`

## Examples

### One line

Including graphical tree.

#### git lol

From a recommended `git lol` alias I found and use.

```sh
$ git log --graph --decorate --oneline
```

e.g.

```
* 6e330b1 (HEAD -> master, tag: v1.12.0, origin/master) chore: Update LICENSE
...
* 21407f3 (tag: v1.11.0) build: Update requirements-dev.txt
* d902c90 build: Update Makefile
* a7593c6 refactor: Add type check and change return
*   cd879e7 Merge pull request #55 from MichaelCurrin/update-logo
|\
| * 58aa030 docs: Add favicon
| * 628a149 docs: Update license.md
```

#### glol alias 

From ZSH alias.

```sh
$ git glol
```

Or

```sh
$ git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'
```

e.g.

```
* 6e330b1 - (HEAD -> master, tag: v1.12.0, origin/master) chore: Update LICENSE (4 weeks ago) <Michael Currin>
...
* 21407f3 - (tag: v1.11.0) build: Update requirements-dev.txt (3 months ago) <Michael Currin>
* d902c90 - build: Update Makefile (3 months ago) <Michael Currin>
* a7593c6 - refactor: Add type check and change return (3 months ago) <Michael Currin>
*   cd879e7 - Merge pull request #55 from MichaelCurrin/update-logo (4 months ago) <Michael Currin>
|\
| * 58aa030 - docs: Add favicon (4 months ago) <Michael Currin>
| * 628a149 - docs: Update license.md (4 months ago) <Michael Currin>
```

Resulting colors:

- hash - red
- master - green
- tag - yellow
- origin/master - red
- message - white
- time - green
- name - blue

#### lold alias

From ZSH alias.

```sh
$ git lold
```

Or

```sh
$ git log --pretty='%C(yellow)%h %C(cyan)%ar %Creset%s'
```

```
47cc660 2 hours ago Update README.md
be035a0 2 hours ago Update README.md
73c1bf8 2 hours ago Update README.md
...
6e330b1 4 weeks ago chore: Update LICENSE
fee434f 4 weeks ago build: Update Makefile
dbd13a8 4 weeks ago chore: Create .editorconfig
dbf86af 4 weeks ago build: Upgrade requirements-dev.txt
45b4d13 8 weeks ago Update LICENSE
```

### Stat

```sh
$ git log --stat
```
```
Author: ...
Date:   Sun Dec 1 18:42:48 2019 -0600

    Add function return expression option

 .gitignore                     |   4 +
 ...
 README.md                      |  41 +++++
 images/demo.gif                | Bin 0 -> 12980699 bytes
 ...
 images/prefix-commit.svg       |   1 +
 images/prefix-commit_light.svg |   1 +
 ...
 tslint.json                    |  15 ++
 vsc-extension-quickstart.md    |  35 ++++
 23 files changed, 1623 insertions(+)
```
