# Install dependendencies


Dependencies are stored in a global cache.


## On run

Deno will download and install dependencies when they are needed in your project.

Such as with `deno run` or `deno test` (test dependencies). 


## Install

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


## Locking versions

This version will be the same whenever installed:

```
https://deno.land/x/abc@v1.2.4/mod.ts"
```

This will install the latest at the time. This is not reliable though - as if you upgrade or delete/install dependencies on your machine or install on another machine or on CI, then you'll get a newer version. Which might break you app.

```
https://deno.land/x/abc/mod.ts"
```
