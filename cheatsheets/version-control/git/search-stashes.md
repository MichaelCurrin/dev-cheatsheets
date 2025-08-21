# Search stashes

Search Git stashes for a keyword and print the stash ID if one is found.

```sh
QUERY='my term'

git stash list | awk '{sub(/:$/, "", $1); print $1}' | while read stash; do
  if git stash show -p "$stash" | grep -q "$QUERY"; then
    echo "$stash"
  fi
done
```
