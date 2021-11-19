# Move and rename

## git mv

Use `git mv` on a file or directory.

```sh
$ git mv OLD_PATH NEW_PATH
$ git commit
```


## mv

You can also just do a plain move or rename and Git will see it as the same file. The file can even be modified and seen as the same by Git, up to a threshold.

```sh
$ mv abc.txt def.txt
$ git add .
$ git commit
```

## Stage a rename

### status

Just rename is not known to Git.

```console
$ mv abc.txt def.txt
$ git status --short
 D abc.txt
?? def.txt
```

Stage and then it is known to Git.

```console
$ mv abc.txt def.txt
$ git add .
$ git status --short
R  abc.txt -> def.txt
```

### diff

Just rename is not known to Git.

```console
$ mv abc.txt def.txt
$ git add .
$ git diff HEAD --summary
 delete mode 100644 abc.txt
```

Stage and then it is known to Git.

```console
$ mv abc.txt def.txt
$ git add .
$ git diff HEAD --summary
 rename abc.txt => def.txt (100%)
```


## diff

You can get `git diff` to detect a rename and also pass a similarity index to `git diff`.

The default is `50%`.

See [git-diff](https://git-scm.com/docs/git-diff) docs.

```
-M[<n>]
--find-renames[=<n>] 
```

e.g.

```sh
$ git diff -M
$ git diff -M90%
```

Note that if you simply move/rename a file, Git will not see the new untracked path and it will also see a delete. So remember to [stage](#stage-a-rename) first.
