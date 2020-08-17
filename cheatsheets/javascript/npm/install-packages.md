---
title: Install packages
---

Note that `npm i` is an alias for `npm install`.

You must create a `package.json` file with `npm init` before you can run installs in a project.

See also the [npm ci](https://docs.npmjs.com/cli/ci) command which is simialr to `npm install` but is more suitable for deploy pipelines.


## Flags

- `-D, --save-dev` - Save to dev dependencies. By default, installs are saved to prod dependencies without any flag (at least on newer NPM versions).
- `-G`, `-g`, `--global` - Install as a global dependency.


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

## Install prod and dev deps

```sh
$ npm i
```

### Install only production dependencies

```sh
$ npm i --production
```

Or using `--only`.

```sh
$ npm i --only=prod
$ npm i --only=production
```

### Install only dev dependencies

```sh
$ npm i --only=dev
$ npm i --only=development
```


## Install from GitHub

```sh
$ npm i USERNAME/PACKAGE_NAME
```

e.g.

```sh
$ npm install visionmedia/express#branch
```

Or add to package file:

- HTTPS
    ```json
    [
      "git+https://github.com/visionmedia/express.git"
    ]
    ```
- SSH
    ```json
    [
      "git+ssh://git@github.com/visionmedia/express.git"
    ]
    ```
