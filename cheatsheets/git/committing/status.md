# Status

## Flags

```
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

## Length

Long (default) format:

```sh
git status
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

Short format:

```sh
git status -s
```

e.g.

```
 D Makefile
?? test.text
```

## Conditional logic - check for unstaged modified files

### git status porcelain

Check if there are unstaged changes.

```sh
if [ -z "$(git status --porcelain)" ]; then
    echo 'No changes to commit'
fi
```


### git status grep

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
<!--stackedit_data:
eyJoaXN0b3J5IjpbMzgxODczNDQ5XX0=
-->