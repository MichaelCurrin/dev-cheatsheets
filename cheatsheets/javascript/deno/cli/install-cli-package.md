---
title: Install CLI package
description: Install a Deno package globally
---


Example from [minifier](https://deno.land/x/minifier).

```sh
$ deno install --allow-read --allow-write --allow-hrtime \
  -n minifier https://deno.land/x/minifier/cli.ts
```

Note permissions are set at install time here.

But you can also set them at the time of using the tool.

Note from that package:

> We strongly suggest including the `--allow-hrtime` flag as it allows the performance benchmarks to be more accurate.
