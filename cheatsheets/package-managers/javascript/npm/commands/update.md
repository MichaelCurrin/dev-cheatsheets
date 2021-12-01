---
title: update
description: update all the packages listed to the latest version (specified by the tag config), respecting semver.
---

- [npm-update](https://docs.npmjs.com/cli/v7/commands/npm-update) docs
    > update all the packages listed to the latest version (specified by the tag config),
    >
    > respecting the semver constraints of both your package and its dependencies (if they also require the same package).

This will also install any _missing_ packages. i.e. if you deleted anything from `node_modules` or if you added to `package.json` without doing `npm install`.


## Related

- [install][] command cheatsheet
- [outdated][] command cheatsheet
- [Install packages][] cheatsheet
- [Maintain packages][] cheatsheet
- [Upgrade packages][] cheatsheet
- [Upgrade packages with GH Actions][] recipe in Code Cookbook.

[install]: {% link cheatsheets/package-managers/javascript/npm/commands/install.md %}
[outdated]: {% link cheatsheets/package-managers/javascript/npm/commands/outdated.md %}
[Install packages]: {% link cheatsheets/package-managers/javascript/npm/install-packages.md %}
[Maintain packages]: {% link cheatsheets/package-managers/javascript/npm/maintain-packages.md %}
[Upgrade packages]: {% link cheatsheets/package-managers/javascript/npm/upgrade-packages.md %}
[Upgrade packages with GH Actions]: https://michaelcurrin.github.io/code-cookbook/recipes/ci-cd/github-actions/workflows/node/upgrade-packages.html


## Upgrade all

```sh
$ npm update
```

This will give as success exit status, even if nothing was upgraded.


## Upgrade one

### update command

```sh
$ npm update PACKAGE_NAME
```

e.g.

```sh
$ npm update foo
$ # Multiple
$ npm update foo bar bazz
```

Which could result in change in `package.json`:

```diff
- "foo": "^1.0.0"
+ "foo": "^1.2.3"
```

But, the package will **remain** within the initial bounds. So the command here would not upgrade from `1` to `2`. See the sections below for that.

### install and ugprade

To get the same result, you can use `install` with an upgrade flag.

```sh
$ npm install --upgrade PACKAGE_NAME
```


## Ignore scripts

Turn off pre- and post-install scripts.

```sh
$ npm update --ignore-scripts
```


## Global

```sh
$ npm update --global
$ npm update -g
```
