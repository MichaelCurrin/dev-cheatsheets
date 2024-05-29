---
title: ci
description: About the `npm ci` command
---

## What is it?

This page is about "clean install", as an alterentive to the plain `install` command. This command is suited for production deploys as it has consistency, speed, strictness, and error detection on changes. You can use it in your CI flow.

You can ran as `npm clean-install` or more commonly `npm ci`.

See [npm-ci](https://docs.npmjs.com/cli/ci.html) docs.

## Benefits

Why use `npm ci` instead of `npm install`, based on the docs:

- Good for automated deploys.
- Works on a clean slate - `node_modules` will be **deleted** if it exists.
- Stricter.
- It can be "significantly faster than a regular npm install by skipping certain user-oriented features".
- Requires `package-lock.json` or `npm-shrinkwrap.json`.
- Fails if the installed result does not match the lock file exactly
- Will not update `package.json`.
- Can't be used to install one package at a time.


## Differences

Here’s a more detailed comparison of the two commands:

- **`npm ci`**:
  - Deletes the `node_modules` folder and installs dependencies from scratch.
  - Uses the exact versions specified in `package-lock.json`.
  - Faster and more deterministic for CI/CD environments.
  - Fails if `package-lock.json` and `package.json` are out of sync.
- **`npm install`**:
  - Installs dependencies listed in `package.json`.
  - May update `package-lock.json` to reflect changes in dependencies.
  - Can install newer versions of packages if version ranges are specified.
  - Does not necessarily provide a clean slate since it doesn’t delete `node_modules` by default.


## Usage

No arguments are needed.

```sh
$ npm ci
```

Install only production dependencies:

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

