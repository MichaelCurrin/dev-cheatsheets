---
title: Compile cross platform
description: How to compile for different operating systems
---

Use `go build` and some environment flags.

e.g.

```sh
$ GOOS=linux GOARCH=386 go build -o linux_386_build
```
