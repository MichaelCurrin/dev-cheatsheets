---
title: Distribute
description: Make a Node CLI file available to run as a global command
---

## Package as a binary

This does not need Node installed and makes an executable binary file.

```sh
$ npm i pkg
```

```sh
$ npx dist/index.js
```

Then find your executable without the `.js` extension. Or multiple files for each OS. This can be sent to others or added as a download on your website or GitHub Releases.

Recommended config for TypeScript:

```json
{
  "name": "my-ts-app",
  "version": "1.0.0",
  "main": "dist/index.js",
  "bin": "dist/index.js",
  "scripts": {
    "build:ts": "tsc",
    "build:pkg": "pkg dist/index.js",
    "build": "npm run build:ts && npm run build:pkg"
  },
  "devDependencies": {
    "typescript": "^5.0.0"
  }
}
```

```sh
$ npm run build
```

## Link

Use a symlink from the JS file to a bin directory. This requires an appropriate level of node and the project to exist (such as a Git repo).

Run a step to build your app or compile to plain JS.

Then configure like this:

```json
{
  "bin": {
    "my-project": "dist/index.js",
  }
}
```

Run

```sh
$ npm link
```

Then you can run:

```sh
$ my-project
```

## Bundle

Put a Node shebang at the top of your JS file. It does not have to execute permissions though.

```sh
#!/usr/bin/env node
```

Give a path e.g. `src/index.ts`.

Run this:

```sh
$ esbuild PATH --outdir=dist --bundle --platform=node
```

Then run as

```sh
$ dist/index.js
```
