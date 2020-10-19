# status

## Usage

Short help:

```sh
$ git status -h
```
```
usage: git status [<options>] [--] <pathspec>...

    -v, --verbose         be verbose
    -s, --short           show status concisely
    -b, --branch          show branch information
    --show-stash          show stash information
    --ahead-behind        compute full ahead/behind values
    --porcelain[=<version>]
                          machine-readable output
    --long                show status in long format (default)
    -z, --null            terminate entries with NUL
    -u, --untracked-files[=<mode>]
                          show untracked files, optional modes: all, normal, no. (Default: all)
    --ignored[=<mode>]    show ignored files, optional modes: traditional, matching, no. (Default: traditional)
    --ignore-submodules[=<when>]
                          ignore changes to submodules, optional when: all, dirty, untracked. (Default: all)
    --column[=<style>]    list untracked files in columns
    --no-renames          do not detect renames
    -M, --find-renames[=<n>]
                          detect renames, optionally set similarity index
```


## Flags

Some flags I am interested in. From the long help.

```
       -s, --short
           Give the output in the short-format.
           (Default is --long)

       -b, --branch
           Show the branch and tracking info even in short-format.

       --show-stash
           Show the number of entries currently stashed away.

       --porcelain[=<version>]
           Give the output in an easy-to-parse format for scripts. This is similar to the short output, but
           will remain stable across Git versions and regardless of user configuration. See below for details.

           The version parameter is used to specify the format version. This is optional and defaults to the
           original version v1 format.

           ...

           (This makes output without color for safety. Using with no arguments is OK.)

       -v, --verbose
           In addition to the names of files that have been changed, also show the textual changes that are
           staged to be committed (i.e., like the output of git diff --cached). If -v is specified twice, then
           also show the changes in the working tree that have not yet been staged (i.e., like the output of
           git diff).

      --find-renames[=<n>]
           Turn on rename detection, optionally setting the similarity threshold. See also git-diff(1)
           --find-renames.
```

Using verbose will show the lines changed including of lines of staged files (even if new at the bottom.


## Parse output

Use for scripting and git hooks.

This will show a summary, ignore untracked (untracked=no but not equals sign won't work) and porcelain for clean, parsable output.

```sh
git status -s -uno --porcelain
```

## Z format

As an alternative to porcelain.

This means that `R  foo -> bar` becomes `R  bar\0foo\0`.

From the man page:

```
       There is also an alternate -z format recommended for machine parsing. In that format, the status field is the same, but
       some other things change. First, the -> is omitted from rename entries and the field order is reversed (e.g from -> to
       becomes to from). Second, a NUL (ASCII 0) follows each filename, replacing space as a field separator and the terminating
       newline (but a space still separates the status field from the first filename). Third, filenames containing special
       characters are not specially formatted; no quoting or backslash-escaping is performed.
```


## Conditional logic
> Check for unstaged modified files

Check if repo is clean or dirty (unstaged changes to be committed still).

### Using porcelain

Check if there are unstaged changes.

```sh
if [ -z "$(git status --porcelain)" ]; then
    echo 'No changes to commit'
fi
```


### Using grep

The ZSH way of doing it - [article](https://coderwall.com/p/e-tsng/ziraga-oh-my-zsh-theme).

```sh
INDEX=$(git status 2> /dev/null)

if $(echo "$INDEX" | grep 'Untracked files' &> /dev/null); then
  echo 'There are untracked files'
fi

if $(echo "$INDEX" | grep -E -e 'Changes not staged' &> /dev/null); then
  echo 'Unstaged changes'
fi
```

This is then used conditionally to determine when these should be used.

```
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
```


## Format length style

### Long format

The default.

```sh
$ git status
```
```
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	deleted:    Makefile

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	test.text

no changes added to commit (use "git add" and/or "git commit -a")
```

### Short output

```sh
$ git status -s
```

e.g.

```
 D Makefile
?? test.text
```
