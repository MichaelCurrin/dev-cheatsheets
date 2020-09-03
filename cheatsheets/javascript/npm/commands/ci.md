---
title: CI
description: About the `npm ci` command
---

## Usage

No arguments are needed, however package lock file must exist to avoid an error.

```sh
$ npm ci
```

### What about Yarn?

Note for Yarn there is no `ci` command, so use this.

> If you need reproducible dependencies, which is usually the case with the continuous integration systems, you should pass --frozen-lockfile flag.

```sh
$ yarn install --frozen-lockfile
```


## Purpose

This command is similar to running `npm install` but except `npm ci` is intended for CI flows (automated build and deploy of Node apps).

See [npm-ci](https://docs.npmjs.com/cli/ci.html) docs.

Why use `npm ci` instead of `npm install`, based on the docs:

- Good for automated deploys
- Works on a clean slate - `node_modules` will be **deleted** if it exists.
- Stricter
- It can be "significantly faster than a regular npm install by skipping certain user-oriented features".
- Requires `package-lock.json` or `npm-shrinkwrap.json`.
- Fails if the installed result does not match the lock file exactly
- Will not update `package.json`
- Can't be used to install one package at a time
