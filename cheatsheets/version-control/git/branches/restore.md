# Restore

## Restore deleted branch

Even often a branch is deleted, you can still create it from the local remote reference.

```sh
$ git branch -d foo
$ git checkout foo
Branch 'foo' set up to track remote branch 'foo' from 'origin'.
Switched to a new branch 'foo'
```

From the `git checkout` manpage:

> If `<branch>` is not found but there does exist a tracking branch in exactly one remote (call it `<remote>`) with a matching name, treat as equivalent to

```sh
$ git checkout -b <branch> --track <remote>/<branch>
```

e.g.

```sh
$ git checkout -b foo --track origin/foo
```
