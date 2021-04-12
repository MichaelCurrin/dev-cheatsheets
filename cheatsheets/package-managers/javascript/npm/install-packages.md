# Install packages

Note that `npm i` is an alias for `npm install`.

You must create a `package.json` file with `npm init` before you can run installs in a project.

See also the [npm ci][] command.

[npm ci]: {{ site.basurl }}{% link cheatsheets/package-managers/javascript/npm/commands/ci.md %}


## Flags

- `-D, --save-dev` - Save to dev dependencies. By default, installs are saved to prod dependencies without any flag (at least on newer NPM versions).
- `-G`, `-g`, `--global` - Install as a global dependency.


## Install by package name

### Install and save as production dependency

This will add to `dependencies` of `package.json` after installing.

Install latest:

```sh
$ npm install PACKAGE
```

Example:

```sh
$ npm install foo
$ # Install multiple at once.
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


## Install from package file

### Install prod and dev deps

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

The `ci` subcommand also has a flag like this.

```sh
$ npm ci --production
```

### Install only dev dependencies

```sh
$ npm i --only=dev
$ npm i --only=development
```


## Install from GitHub

You can install the latest code on a GitHub repo easily, without it being published on the NPM registry.

```sh
$ npm i USERNAME/PACKAGE_NAME
```

e.g.

```sh
$ npm install visionmedia/express
$ npm install visionmedia/express#develop
```

For more info, see the [Registries][] page.

[Registries]: {{ site.basurl }}{% link cheatsheets/package-managers/javascript/npm/registries.md %}


## View

Get info on a package before installing it.

```sh
$ npm view @vue/cli
```

```
@vue/cli@4.5.11 | MIT | deps: 35 | versions: 140
Command line interface for rapid Vue.js development
https://cli.vuejs.org/
...
dist-tags:
latest: 4.5.11       next: 5.0.0-alpha.4
```
