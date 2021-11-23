# Advanced

Not your everyday git commands, but useful in aliases and scripts.


## Latest tag

[git describe](https://git-scm.com/docs/git-describe) docs

> git-describe - Give an object a human readable name based on an available ref

> The command finds the most recent tag that is reachable from a commit....

> By default (without `--all` or `--tags`) git describe only shows **annotated** tags

Shows tag number found, the number of commits back as a number and then a short commit hash.

```sh
$ git describe
v0.19.0-1-gdc17e80
```

Another case for 32 commits back. The hash is `9641372`. The `-g` always seems to appear as a prefix.

```sh
$ git describe
v1.0.2-32-g9641372
```

If the current commit already has a tag, only the tag will be shown.

```sh
$ git checkout gdc17e80
$ git describe
v0.19.0
```

Show just commit reference by setting the hash length to zero.

```sh
$ g describe --abbrev=0
v0.19.0
```

Including tags that are not annotated.

```sh
$ git describe --tags
```


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
