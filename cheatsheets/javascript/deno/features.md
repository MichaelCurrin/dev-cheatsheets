---
title: Features
---

What Deno includes or reasons to use Deno. Based on [post](https://dev.to/mbilgil/what-is-deno-41p3).

- It works with
    - Modern JS
    - ES modules (First-class support. Node.js uses CommonJS syntax and adds ES modules)
- Compatible with the browser - includes `fetch` and `window`.
- Extensive standard lib
- Sandboxed execution for security
- Builtin-in support for
    - TypeScript
    - ES modules
    - await
    - bundling (replaces [Webpack](https://webpack.js.org) and [rollup](https://rollupjs.org/guide/en/))
    - formatting (replaces Prettier)
    - testing (replaces Jest, Jasmine etc.)
- No package manager needed (no `package.json` and no `node_modules`.

Deno runs on the server side but of course like Node.js it can be used to process and bundle scripts to be served on the frontend.
