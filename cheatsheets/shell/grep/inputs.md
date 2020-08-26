---
title: Input methods
---

General

```
grep PATTERN PATH
```

From file

```
cat PATH | grep PATTERN
```

From string

```
echo 'TEXT' | grep PATTERN
```

In a directory such as `.`, `*` or a directory name.

```
grep PATTERN DIR

grep -r PATTERN DIR
```

Or `-ir`.
