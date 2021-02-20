---
title: Managing packages
description: How to install and upgrade packages across projects
---

Dependencies are stored in a global cache - there is no `node_modules` directory.


## Install when running

Deno will download and install dependencies when they are needed in your project.

Such as with `deno run` or `deno test` (test dependencies). 


## Install with cach subcommand

You can get dependencies downloaded and installed without running your app. Any installed dependecies will not be upgraded.

Provide a file, not a directory.

```sh
$ deno cache index.ts
```


## Upgrade

For Deno to upgrade to the latest dependency.

```sh
$ deno cache --reload index.ts
```

You should probably install all your packages using locked URL versions, for predictable dev environments and deploys. If you already do that, then upgrading them as above may not actually change anything. 

Even the subdependencies I think would not change, because a release of `1.2.3` should also (hopefully) lock external packages with versions. 

Though, if the external package only locks within a **range** like `^3.4.5` in NPM, then if you use the upgrade command then you'll keep your direct dependenices frozen by version numbers but allow floating subdependencies to be upgraded.

This upgrade command could maybe be used in conjunction with the lockfile, to upgrade subdependencies.


## Locking versions

This version will be the same whenever installed:

```
https://deno.land/x/abc@v1.2.4/mod.ts"
```

This will install the latest at the time. This is not reliable though - as if you upgrade or delete/install dependencies on your machine or install on another machine or on CI, then you'll get a newer version. Which might break you app.

```
https://deno.land/x/abc/mod.ts"
```


## Cache directory

Deno uses a single cache directory for packages installed across projects.

See [Dependency Inspector](https://deno.land/manual/tools/dependency_inspector) in the docs.

Run like this:

```sh
$ deno info
```
```
DENO_DIR location: "/Users/mcurrin/Library/Caches/deno"
Remote modules cache: "/Users/mcurrin/Library/Caches/deno/deps"
TypeScript compiler cache: "/Users/mcurrin/Library/Caches/deno/gen"
```

Check a specific package. If that not installed, it will be downloaded first.

```sh
$ deno info https://deno.land/x/abc@v1.2.4/mod.ts
```

Location on macOS:

- `~/Library/Caches/deno/gen/https/deno.land/HASH.js`


## Install global package

Global packages will be installed this location:

- `~/.deno/bin`

Make sure that is in your path, if you want to run them from anywhere.

Install a package by URL.

```sh
$ deno install --allow-net --unstable URL
```

For example, here we install a Deno package from `deno.land/x`.

```sh
$ deno install --allow-net --unstable https://deno.land/x/vno/install/vno.ts
```

And run it.

```sh
$ vno --help
```
