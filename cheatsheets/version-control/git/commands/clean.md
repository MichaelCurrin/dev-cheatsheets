# clean


## Examples

Run in interactive mode and remove untracked directories.

From the `gclean` ZSH alias.

```sh
$ git clean -id
```


Remove untracked directories and all ignored files (warning!). Using a force flag.

```sh
$ git clean -dfx
```

From the `gpristine` ZSH alias:

```sh
alias gpristine='git reset --hard && git clean -dfx'
```


## Help

Man page extract:

```sh
$ git clean --help
```

```
GIT-CLEAN(1)                                                               Git Manual                                                               GIT-CLEAN(1)



NAME
       git-clean - Remove untracked files from the working tree

SYNOPSIS
       git clean [-d] [-f] [-i] [-n] [-q] [-e <pattern>] [-x | -X] [--] <path>...


DESCRIPTION
       Cleans the working tree by recursively removing files that are not under version control, starting from the current directory.

       Normally, only files unknown to Git are removed, but if the -x option is specified, ignored files are also removed. This can, for example, be useful to
       remove all build products.

       If any optional <path>... arguments are given, only those paths are affected.

OPTIONS
       -d
           Remove untracked directories in addition to untracked files. If an untracked directory is managed by a different Git repository, it is not removed by
           default. Use -f option twice if you really want to remove such a directory.

       -f, --force
           If the Git configuration variable clean.requireForce is not set to false, git clean will refuse to delete files or directories unless given -f, -n or
           -i. Git will refuse to delete directories with .git sub directory or file unless a second -f is given.

       -i, --interactive
           Show what would be done and clean files interactively. See "Interactive mode" for details.

       -n, --dry-run
           Don't actually remove anything, just show what would be done.

       -q, --quiet
           Be quiet, only report errors, but not the files that are successfully removed.

       -e <pattern>, --exclude=<pattern>
           In addition to those found in .gitignore (per directory) and $GIT_DIR/info/exclude, also consider these patterns to be in the set of the ignore rules
           in effect.

       -x
           Don't use the standard ignore rules read from .gitignore (per directory) and $GIT_DIR/info/exclude, but do still use the ignore rules given with -e
           options. This allows removing all untracked files, including build products. This can be used (possibly in conjunction with git reset) to create a
           pristine working directory to test a clean build.

       -X
           Remove only files ignored by Git. This may be useful to rebuild everything from scratch, but keep manually created files.
```
