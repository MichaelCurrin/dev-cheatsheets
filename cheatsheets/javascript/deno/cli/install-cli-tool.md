---
title: Install CLI tool
description: Install a Deno package globally for use as a CLI tool
---


## Install package by URL

Set the URL as as _deno.land_ package URL.

```sh
$ deno install \
  --allow-read --allow-write \
  PACKAGE_URL
```


## Suggested flags

- Add the `-f` to force install, if you have it installed already.
- Use a custom name with `-n my-name`.
- Flags are here set at install time. Otherwise, whenever you run the package you have to add the flags or accept the permissions in the prompt.
 

## Example

From the [minifier](https://deno.land/x/minifier) package.

```sh
$ deno install \
  --allow-read --allow-write --allow-hrtime \
  https://deno.land/x/minifier/cli.ts
```

Note from that package:

> We strongly suggest including the `--allow-hrtime` flag as it allows the performance benchmarks to be more accurate.

That might not be useful for other packages.
