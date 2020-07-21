---
title: Install packages
---

Note that `npm i` is an alias for `npm install`.

## Install by name

### Install and save as production dependency

This will add to `dependencies` of `package.json` after installing.

Install latest:
```sh
$ npm i PACKAGE
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
