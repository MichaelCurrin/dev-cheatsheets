# Advanced

Not your everyday git commands, but useful in aliases and scripts.


## Get commit hash

Commit reference is required for both below.

### Single

Using [git rev-parse](https://git-scm.com/docs/git-rev-parse).

```sh
$ git rev-parse HEAD 
9641372537f8025591b8808c6f9194f211062394
```

```sh
$ git rev-parse --short HEAD 
9641372
```

### Range

Using [git rev-list](https://git-scm.com/docs/git-rev-parse).

```sh
$ g rev-list HEAD
8ac5f926afaeca7287dff1fb1528a085a30e0658
1190aedff7d744e238c90c2a00ba47dea11affa5
bdee52478edb26e3cfe96002e0f923f94d1e5798
177a4f43eb17a07fe87519030ffd59898ff4e8ed
47ca81d79395cc655430e68285911a26c0f39ee4
...
```

```sh
$ g rev-list -n 2 HEAD
dc17e80907f0a9d809b0997baf4114bc2b8338f7
cd037a2c5c61840b6cd9985fd7205db808ff5dfe
```


## Get commit details

### Single commit

Show summary of a commit and the diff.

Defaults to the current commit.

Using [git show](https://git-scm.com/docs/git-show).

```sh
$ git show
```
```
commit dc17e80907f0a9d809b0997baf4114bc2b8338f7 (HEAD -> master, origin/master, origin/HEAD)
Author: Michael Currin <18750745+MichaelCurrin@users.noreply.github.com>
Date:   Wed Jun 2 12:07:45 2021 +0200

    refactor: update prepareCommitMsg.ts

diff --git a/src/prepareCommitMsg.ts b/src/prepareCommitMsg.ts
index 230a716..b7dc357 100644
```

### Range of commits

Using [git log](https://git-scm.com/docs/git-log).

### From latest commit

```sh
$ git log
```

### Show diff

```sh
$ git log -p
```

### Compare branches or remote

```sh
$ git log main origin/main
```

```sh
$ git log main my-feature
```


### Path

```sh
$ git log my-dir
```

```sh
$ git log my-file.txt
```


## Show diff

Using [git diff](https://git-scm.com/docs/git-diff).

Only shows uncommit changes.

```sh
$ git diff
```

Show history.

```sh
$ git diff HEAD~
```

```sh
$ git diff HEAD~5..HEAD~2
```

```sh
$ git diff main my-feat
```
