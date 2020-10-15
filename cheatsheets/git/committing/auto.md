# Git auto commit

Shell flow to apply remote changes, run a script to update a versioned file then commit and push changes.

A pre-configured commit message is used.

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
