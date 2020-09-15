---
title: npx
description: Node package executor
---

This is not a subcommand of `npm`. It already comes with `npm` (at least newer versions) and works well with the NPM ecosystem

- [npx](https://www.npmjs.com/package/npx) on NPM
    > execute npm package binaries


## Usage

```
npx [options] <command>[@version] [command-arg]...

npx [options] [-p|--package <pkg>]... <command> [command-arg]...

npx [options] -c '<command-string>'

npx --shell-auto-fallback [shell]
```


## Purpose


### Run installed package

> Executes `<command>` either from a local node_modules/.bin, or from a central cache, installing any packages needed in order for `<command>` to run.
>
> By default, npx will check whether <command> exists in $PATH, or in the local project binaries, and execute that.

For example, install a package in a local project:

```sh
$ npm install eslint
$ # Equivalent to:
$ ./node_modules/.bin/eslint
```

Or globally:

```sh
$ npm install --global eslint
```

Then use NPX to run it, either from in your project or from anywhere (if globally installed):

```sh
$ npx eslint --help
$ npx eslint .
```

### Run package not installed

> If `<command>` is not found, it will be installed prior to execution.

Run any package that is available on NPM, _without_ installing it first.

```sh
$ npx eslint
```

If you run the command above again, it will download a fresh copy of the package and then run it. It will not cache it.

This can be frustrating if you have to run the command a few times in a row.

[issue](https://github.com/zkat/npx/issues/113)

There is discussion in that issue and the docs arouch using a cache directory, but that might just _reading_ from NPM's cache and it doesn't seem to _write_ to it.


### Keep global packages clean

NPX does **not** leave behind any permanent affects.

If you install a lot of packages in you global NPM directory using `npm i -g`, then you would "pollute" the NPM bin directory in your `PATH`. So there are more commands to look through and accidentally run when running a command anywhere.

[reference](https://github.com/zkat/npx/issues/113#issuecomment-369379654)


## Commons uses

NPX is great for one-off commands where you don't plan to reuse the package. And if you always want to run the latest version (you don't have to worry if you installed package is outdated).

### Quickstarts

Such and when you want to scaffold a new app.

```sh
$ npx create-react-app
```

### Test commands

Or to run an ad hoc command for expermenting with arguments.

```sh
$ npx vue-cli-service serve
```

Before adding to your `package.json` file.

```sh
{
  "scripts": {
    "serve": "vue-cli-service serve",
  }
}
```
```sh
$ npm run serve
```

[vue docs](https://cli.vuejs.org/guide/cli-service.html#using-the-binary)
