# Git cheatsheet 

See also [Git](https://github.com/MichaelCurrin/learn-to-code/tree/master/Version%20control/Git) section of Learn to Code repo.

## Resources

Provided on the git website:

- Downloadable cheatsheet provided by Github https://github.github.com/training-kit/
- Visual cheatsheet https://ndpsoftware.com/git-cheatsheet.html

## Status

### Flags

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

### Length

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

### Conditional logic - check for unstaged modified files

Check if there are unstaged changes.

```sh
if [ -z "$(git status --porcelain)" ]; then
    echo 'No changes to commit'
fi
```

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

## Diff

Show file names and line changes. Ignores staged files.

```sh
git diff [COMMIT_REF] [COMMIT_REF]
```

Compares possibly modified files to the files at the current commit.

```sh
git diff
```

Include stage files.

```sh
git diff HEAD
```

Check commit against previous commit.

```sh
git diff HEAD~
```

Show names of modified files and not lines changed. This is like a very short `git status` with no color and indentation. Note this is does **not** include untracked files.

```sh
git diff --names-only
```

e.g.

```
foo/bar.txt
```

Compare current commit against remote.

```sh
git diff origin/master
```

Compare two commit references. Note the order matters.

```sh
git diff HEAD~3..HEAD~5

git diff HEAD~3 HEAD~5

git diff feature-a feature-b 
```

## Auto commit

Shell flow to apply remote changes, run a script to update a versioned file then commit and push changes.

```sh
FILENAME=foo.txt

git pull --no-edit

# ... do work

if [ -z "$(git status --porcelain)" ]; then
    echo 'No changes to commit'
else
    echo 'Committing and pushing changes'
    git commit $FILENAME -m "Cron task - Update $FILENAME"
    git push
fi
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTI0MDk4MDgzNV19
-->