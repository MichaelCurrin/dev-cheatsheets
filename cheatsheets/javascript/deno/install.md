---
title: Install and upgrade Deno
description: How to manage Deno on your machine
---

See [Installation](https://deno.land/manual/getting_started/installation) page of the manual.


## Install Deno

See my [gist](https://gist.github.com/MichaelCurrin/685279c5536d26cf59daa2f91fd26bbd).


## Upgrade Deno

Get the latest Deno.

```sh
$ deno upgrade
```

Install a target version. This will replace the existing installed Deno.

```sh
$ deno upgrade --version 1.0.1
```

See [GitHub Releases](https://github.com/denoland/deno/releases) and pick a valid version number.


## Upgrade Deno package

If not locked, the use of [std lib](https://deno.land/std) packages can break after running a command above.

Upgrade your stdlib and other installed packages with the reload command:

```sh
$ deno cache --reload index.ts
```

That only works within a project though and didn't seem effective on an empty index page, so I need to research that more.

The safest is to always do imports of locked versions in your apps.

See [Managing packages][] page for more info around locking and upgrading standard lib and 3rd-party packages.


## Uninstall Deno

### Delete Deno binary

```sh
$ rm $(which deno)
```

### Delete Deno directory

Including `.deno/bin` which has installed CLI packages.

```sh
$ rm -rf ~/.deno
```

### Delete cache

The cache includes downloaded packages.

On macOS, here is the configuration:

```sh
$ deno info
```
```
DENO_DIR location: "/Users/mcurrin/Library/Caches/deno"
Remote modules cache: "/Users/mcurrin/Library/Caches/deno/deps"
Emitted modules cache: "/Users/mcurrin/Library/Caches/deno/gen"
Language server registries cache: "/Users/mcurrin/Library/Caches/deno/registries"
```

So then you know what to delete. e.g.

```sh
$ rm -rf ~/Library/Caches/deno
```

[Managing packages]: {% link cheatsheets/javascript/deno/cli/managing-packages.md %}
