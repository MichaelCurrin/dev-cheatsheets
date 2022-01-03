---
title: Use with Deno
description: How to use ES Build in a Deno project
---


## Script

From the [Deno](https://esbuild.github.io/getting-started/#deno) section of the Getting Started docs.

- `build.ts`
    ```typescript
    import * as esbuild from 'https://deno.land/x/esbuild@v0.11.17/mod.js'

    const ts = 'let test: boolean = true'
    const result = await esbuild.transform(ts, { loader: 'ts' })

    console.log('result:', result)

    esbuild.stop()
    ```

Then run your script in the CLI.


## CLI

Note that the CLI tool is not available for use as a Deno package.

But you can install a binary using cURL and then use the package in the CLI, without needing Node or NPM.

See the [Install][] page's section on _Download a binary_.

[Install]: {% link cheatsheets/javascript/packages/esbuild/install.md %}
