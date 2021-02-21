---
title: Install CLI tool
description: Install a Deno package globally for use in teh CLI
---


Example from [minifier](https://deno.land/x/minifier).

```sh
$ deno install --allow-read --allow-write --allow-hrtime \
  https://deno.land/x/minifier/cli.ts
```

Use `-f` to force install.

Use custom name with `-n my-name`.

Flags are set at install time so you don't have to set them at usage time.

Note from that package:

> We strongly suggest including the `--allow-hrtime` flag as it allows the performance benchmarks to be more accurate.
