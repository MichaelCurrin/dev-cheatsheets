---
title: Git diff
---

Show file names and line changes. Ignores staged files.

```sh
git diff [COMMIT_REF] [COMMIT_REF]
```

Compares possibly modified files to the files at the current commit.

```sh
git diff
```

Include stage files.

```sh
git diff HEAD
```

Check commit against previous commit.

```sh
git diff HEAD~
```

Show names of modified files and not lines changed. This is like a very short `git status` with no color and indentation. Note this is does **not** include untracked files.

```sh
git diff --names-only
```

e.g.

```
foo/bar.txt
```

Compare current commit against remote.

```sh
git diff origin/master
```

Compare two commit references. Note the order matters.

```sh
git diff HEAD~3..HEAD~5

git diff HEAD~3 HEAD~5

git diff feature-a feature-b
```
