---
title: Extended
---

Grep already supports some patterns like glob and regex.

You can use `egrep` or `grep -e` for the extended matching.

```sh
egrep PATTERN PATH
```

Examples:

```sh
egrep "support|help|windows" myfile.txt
```

```sh
egrep '^[a-zA-Z]+$' myfile.txt
```

```sh
egrep -c '^begin|end$' myfile.txt
```
