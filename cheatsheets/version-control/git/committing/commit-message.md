# Commit message

## Create commit

Reuse previous message.

```sh
$ git commit -C HEAD
```

Set a message from CLI.

```sh
$ git commit -m "My message"
```

Add `-e` to force edit more for that.


## Set default commit message

Give path to a file such as one in the repo that is ignored (such as in a global Git ignore list) or one in your Documents.

```sh
$ git config commit.message .COMMIT_MESSAGE
```

Create file `.COMMIT_MESSAGE` with your template.

e.g. If working on a feature with ticket number ABC-123:

```
feat: (#ABC-123)
``
