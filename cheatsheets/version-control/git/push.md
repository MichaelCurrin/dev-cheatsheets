# Push


## Basic

```sh
$ git push
```


## Explicit

```sh
$ git push origin my-branch
```


## Set upstream

This is useful to create the branch on the remote - this is only needed once. Use `-u` or `--set-upstream`.

```sh
$ git push -u origin my-branch
```

Or simply:

```sh
$ git push -u origin HEAD
```

You can also configure Git to do this for you.

```sh
$ git config --global push.autoSetupRemote true
```

But to avoid creating a branch by accident after your merged and deleted it, it can be useful to keep the original behavior. 


## Force

```sh
$ git push --force
```


## Skip hooks


```sh
$ git push --no-verify
```


## Delete branch

```sh
$ git push -d origin my-branch
```


## Trouble shooting

I found when I had issues pushing, even though my connection was fine and I already tried a force-push.

```
client_loop: send disconnect: Broken pipe
send-pack: unexpected disconnect while reading sideband packet
fatal: the remote end hung up unexpectedly
```

Then this worked to fix it:

```sh
$ git push origin HEAD:my-branch
```

Afterwards I only had to do the plain `git push` as usual.

