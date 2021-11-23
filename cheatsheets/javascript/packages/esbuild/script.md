---
title: Script
description: Use in a script
---

See also the [CLI][] section.

[CLI]: {% link cheatsheets/javascript/packages/esbuild/cli.md %}

Using ES Modules, import from CDN URL.

- `index.js`
    ```javascript
    import build from "https://cdn.jsdelivr.net/npm/esbuild";

    esbuild.build({
      entryPoints: ['app.jsx'],
      bundle: true,
      outfile: 'out.js',
    })
    ```
