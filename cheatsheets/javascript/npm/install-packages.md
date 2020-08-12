---
title: Install packages
---

Note that `npm i` is an alias for `npm install`.

You must create a `package.json` file with `npm init` before you can run installs in a project.

See also the [npm ci](https://docs.npmjs.com/cli/ci) command which is simialr to `npm install` but is more suitable for deploy pipelines.


## Flags

```
-D, --save-dev
-G, --global
```


## Install by package name

### Install and save as production dependency

This will add to `dependencies` of `package.json` after installing.

Install latest:

```sh
$ npm i PACKAGE
```

Example:

```sh
$ npm i foo
$ # Install multiple at once.
$ npm i foo bar baz
```

Install specific version:

```sh
$ npm i PACKAGE@VERSION
```

Example:

```sh
$ npm i foo@1.2.3
```


### Install and save as dev dependency

Save to `devDependencies` in `package.json` using one of:

```sh
$ npm i PACKAGE --save-dev
$ npm i PACKAGE -D
```


## Install from package file

## Production and dev

This will install.

```sh
$ npm i
```


### Install only production dependencies

This will install from `dependencies` but not `devDependencies`:

```sh
$ npm i --production
```


## Install from GitHub

```sh
$ npm i USERNAME/PACKAGE_NAME
```
