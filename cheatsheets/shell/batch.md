# Batch

How to perform multiple actions easily.

Pipe output, use awk to get the first column, then split into separate commands. I think `xargs` is more efficient `for` loop and more inline with Functional Programming.

```sh
FOO | \
    awk '{print $1}' | \
    xargs -I{} sh -c 'BAR "$1"' - {}
```
