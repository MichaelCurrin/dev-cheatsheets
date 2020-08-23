---
title: CI
description: About the npm-ci command
---

## Usage

```sh
$ npm ci
```


## Purpose

This command is similar to running `npm install` but except `npm ci` is intended for CI flows (automated build and deploy of Node apps).

See [npm-ci](https://docs.npmjs.com/cli/ci.html) docs.

Why use `npm ci` instead of `npm install`, based on the docs:

- Good for automated deploys
- Works on a clean slate - `node_modules` will be deleted if it exists.
- Stricter
- It can be "significantly faster than a regular npm install by skipping certain user-oriented features".
- Requires `package-lock.json` or `npm-shrinkwrap.json`.
- Fails if the installed result does not match the lock file exactly
- Will not update `package.json`
- Can't be used to install one package at a time
