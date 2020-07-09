---
title: Batch shell
---

How to perform multiple actions easily.

Pipe output, use awk to get the first column, then split into separate commands (`xargs` is more efficient than for loop I think).

```sh
FOO | \
    awk '{print $1}' | \
    xargs -I{} sh -c 'BAR "$1"' - {}
```
