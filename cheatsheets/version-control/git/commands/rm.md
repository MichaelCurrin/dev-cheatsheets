## rm

```sh
$ git rm PATH
```

Remove a directory from the working tree without deleting it.

```sh
$ git rm -r --cached PATH
```

Another approach uses the `rm` shell command.

```sh
$ rm PATH
$ git add PATH
$ git commit
```
