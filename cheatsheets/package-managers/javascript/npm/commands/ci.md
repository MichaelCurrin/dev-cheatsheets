---
title: ci
description: About the `npm ci` command
---

## What is it?

This info about "clean install" command, as an alterentive to the plain install.

- It will **delete** `node_modules` and then install from scratch (so it will take logner).
- It requires a **lock** file to exist. It will not update that file. So it is very predictable - it will not install unexpected versions packages. 

This command is suited for production deploys. You can use it in your CI flow.

Note that `npm clean-install` and `npm ci` are the same thing. Running `--help` for either gives `npm ci` text and no other output.


## Usage

No arguments are needed.

```sh
$ npm ci
```

Install only production dependencies.

```sh
$ npm ci --production
```

## Compared with yarn install

Note for Yarn there is no `ci` command, so use this below.

```sh
$ yarn install --frozen-lockfile
```

From the docs:

> If you need reproducible dependencies, which is usually the case with the continuous integration systems, you should pass `--frozen-lockfile` flag.


## Purpose

This command is similar to running `npm install` but except `npm ci` is intended for CI flows (automated build and deploy of Node apps).

See [npm-ci](https://docs.npmjs.com/cli/ci.html) docs.

Why use `npm ci` instead of `npm install`, based on the docs:

- Good for automated deploys.
- Works on a clean slate - `node_modules` will be **deleted** if it exists.
- Stricter.
- It can be "significantly faster than a regular npm install by skipping certain user-oriented features".
- Requires `package-lock.json` or `npm-shrinkwrap.json`.
- Fails if the installed result does not match the lock file exactly
- Will not update `package.json`
- Can't be used to install one package at a time.
