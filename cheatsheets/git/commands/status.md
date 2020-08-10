---
title: Git status
---

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

Some flags I am interested in.

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

This will show a summary, ignore untracked (untracked=no but not equals sign won't work) and porcelain for clean, parseable output.

```sh
git status -s -uno --porcelain
```

## Anything to commit

Check if repo is clean.

```sh
if $(git status -s --porcelain) ; then
  echo 'Nothing to commit'
fi
```
