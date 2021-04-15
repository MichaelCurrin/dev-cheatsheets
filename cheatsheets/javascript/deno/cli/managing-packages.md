---
title: Managing packages
description: How to install and upgrade packages across projects
---

Dependencies are stored in a global cache - there is no `node_modules` directory.


## Check installed version

Given this package in use.

```typescript
export { default as React } from "https://dev.jspm.io/react";
```

Actually it doesn't have to be in use. It just means the next step will probably find it downloaded already and not have to download it.

Check the package by URL.

```sh
$ deno info https://dev.jspm.io/react
```
```
local: /Users/mcurrin/Library/Caches/deno/deps/https/dev.jspm.io/HASH
type: JavaScript
deps: 4 unique (total 84.4KB)

https://dev.jspm.io/react (168B)
├─┬ https://dev.jspm.io/npm:object-assign@4?dew (61B)
│ └── https://dev.jspm.io/npm:object-assign@4.1.1/index.dew.js (2.36KB)
├── https://dev.jspm.io/npm:react@17.0.1/cjs/react.development.dew.js *
└─┬ https://dev.jspm.io/npm:react@17.0.1/index.dew.js (264B)
  └─┬ https://dev.jspm.io/npm:react@17.0.1/cjs/react.development.dew.js (81.56KB)
    └── https://dev.jspm.io/npm:object-assign@4?dew *
```

From this, I see that React version `17.0.1` is in use.

Or I can check the content in the browser at [dev.jspm.io/react](https://dev.jspm.io/react) if I am happy with the latest version.

If I want to lock it, I would then set `17.0.1` as my version, or `17.0` to allow the patch version to float or `17` to allow minor version to float.

```typescript
export { default as React } from "https://dev.jspm.io/react@17.0.1";
```


## Install by running

Deno will download and install dependencies when they are needed in your project.

Such as with `deno run` or `deno test` (test dependencies). 


## Install with cache subcommand

You can get dependencies downloaded and installed without running your app. 

Provide a file, not a directory.

```sh
$ deno cache index.ts
```

Subsequent runs of that will **not** upgrade dependecies. Unless you follow the [Upgrade packages](#upgrade-packagse) section below.


## Upgrade packages

### Change locked versions

Change the version in your URL.

- `deps.ts`
    ```diff
    -export { Application } from "https://deno.land/x/abc@v1.2.4/mod.ts";
    +export { Application } from "https://deno.land/x/abc@v1.2.0/mod.ts";
    ```

You can lock using an exact version `@0.87.0`. But `@0.87` syntax doesn't work on Deno.land. On CDNs, you can partially lock - like JSPM says `pkg@1.2` translates to `~1.2` including pre-releases.

Then run the same command as to install. This works since the new package version has to be installed for the first time.

```sh
$ deno cache index.ts
```

Or skip updating cache and just run. You'll get the installed packages still.

```sh
$ deno run index.ts
```

### Reload packages

Use the `--reload` flag to force upgrading packages to the newest available. 

This is useful if a dependency is not locked.

```sh
$ deno cache --reload index.ts
```

Or maybe point as `deps.ts` instead.

Info on the flag:

- `-r, --reload=<CACHE_BLOCKLIST>` - Reload source code cache (recompile TypeScript)

This will upgrade the standard library as well (old packages will be kept though alongside the new ones). This helps, as your use of std lib packages which not locked can break after running `deno upgrade`.

Note that 3rd-party packages are also likely to rely on the std lib - hopefully with version numbers.


## Locking versions

You should probably install all your packages using locked URL versions.

The [Standard library](https://deno.land/manual/standard_library) manual recommends that you **lock** packages used from the standard lib.

This version will be the same whenever installed:

```
"https://deno.land/x/abc@v1.2.4/mod.ts"
```

This will install the latest at the time and will float.

```
"https://deno.land/x/abc/mod.ts"
```

This is not reliable though - as if you upgrade or delete/install dependencies on your machine or install on another machine or on CI, then you'll get a newer version. Which might break you app.

### Thoughts on locking and doing an upgrade

If you already lock versions, then upgrading them with `--reload` as above may not actually change anything. Even the subdependencies I think would not change, because a release of `1.2.3` should also (hopefully) lock external packages with versions. 

Though, if the external package only locks within a **range** like `^3.4.5` in NPM, then if you use the upgrade command then you'll keep your direct dependenices frozen by version numbers but allow floating subdependencies to be upgraded.

This upgrade command could be used in conjunction with the lockfile I guess.


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
