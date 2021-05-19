---
title: install
description: The `npm install` command
---

## Resources

- [npm install](https://docs.npmjs.com/cli/v7/commands/npm-install) in NPM command docs.


## Help

```sh
$ npm i --help
```
```
npm install (with no args, in package dir)
npm install [<@scope>/]<pkg>
npm install [<@scope>/]<pkg>@<tag>
npm install [<@scope>/]<pkg>@<version>
npm install [<@scope>/]<pkg>@<version range>
npm install <alias>@npm:<name>
npm install <folder>
npm install <tarball file>
npm install <tarball url>
npm install <git:// url>
npm install <github username>/<github project>

aliases: i, isntall, add
common options: [--save-prod|--save-dev|--save-optional] [--save-exact] [--no-save]
```


## Flags

Some common or useful flags.

- `-D, --save-dev` - Save to dev dependencies. By default, installs are saved to prod dependencies without any flag (at least on newer NPM versions).
- `-G`, `-g`, `--global` - Install as a global dependency.
- `--production` or `--only=prod` or `--only=production` - Install only prod dependecies from `package.json` file.
- `-E, --save-exact`: Saved dependencies will be configured with an exact version rather than using npm's default semver range operator. e.g. `1.2.3` instead of `^1.2.3` if doing `npm install foo`.


## Install by package name

### Install production dependency

No flags are needed.

```sh
$ npm install PACKAGE
```

This will add to `dependencies` of `package.json` after installing.

Install latest:

```sh
$ npm install PACKAGE
```

Example:

```sh
$ npm install foo
$ # Install multiple packages at once.
$ npm install foo bar baz
```

Install specific version:

```sh
$ npm install PACKAGE@VERSION
```

Example:

```sh
$ npm install foo@1.2.3
```

### Install and save as dev dependency

Save to `devDependencies` in `package.json` using one of:

```sh
$ npm install PACKAGE --save-dev
$ npm install PACKAGE -D
```

### Install from GitHub

You can install the latest code on a GitHub repo easily, without it being published on the NPM registry.

```sh
$ npm install USERNAME/REPO_NAME
```

e.g.

```sh
$ npm install visionmedia/express
$ npm install visionmedia/express#develop
```

For clarity, you can add `github`:

```sh
$ npm install github:visionmedia/express
```

For more info, see the [Registries][] page.

[Registries]: {{ site.basurl }}{% link cheatsheets/package-managers/javascript/npm/registries.md %}


## Install from package file

### Install production and dev dependencies

```sh
$ npm install
```

### Install only production dependencies

```sh
$ npm install --production
```

Or using the more verbose `--only`.

```sh
$ npm install --only=prod
$ npm install --only=production
```

### Install only dev dependencies

```sh
$ npm install --only=dev
$ npm install --only=development
```

### Install quietly

Set log level

```sh
$ npm install --loglevel warn
```
