# Git cheatsheet 


## Resources

Provided on the git website:

- Downloadable cheatsheet provided by Github https://github.github.com/training-kit/
- Visual cheatsheet https://ndpsoftware.com/git-cheatsheet.html

## Status

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
