---
title: Install and upgrade Deno
description: How to manage Deno on your machine
---

See [Installation](https://deno.land/manual/getting_started/installation) page of the manual.


## Install

See my [gist](https://gist.github.com/MichaelCurrin/685279c5536d26cf59daa2f91fd26bbd).


## Upgrade

```sh
$ deno upgrade
```
Or

```sh
deno upgrade --version 1.0.1
```

If not locked, use of std lib packages can break after running a command above. So see the [Managing packages][] page around locking and upgrading std lib and 3rd-party packages.

[Managing packages]: {{ site.baseurl }}{% link cheatsheets/javascript/deno/cli/managing-packages.md %}
