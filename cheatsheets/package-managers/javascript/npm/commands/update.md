---
title: update
description: update all the packages listed to the latest version (specified by the tag config), respecting semver.
---

- [npm-update](https://docs.npmjs.com/cli/v7/commands/npm-update) docs
    > update all the packages listed to the latest version (specified by the tag config),
    >
    > respecting the semver constraints of both your package and its dependencies (if they also require the same package).

This will also install missing packages.


## Related

- [install][] command
- [outdated][] command
- [Install packages][]
- [Maintain packages][]
- [Upgrade packages][]

[install]: {% link cheatsheets/package-managers/javascript/npm/commands/install.md %}
[outdated]: {% link cheatsheets/package-managers/javascript/npm/commands/outdated.md %}
[Install packages]: {% link cheatsheets/package-managers/javascript/npm/install-packages.md %}
[Maintain packages]: {% link cheatsheets/package-managers/javascript/npm/maintain-packages.md %}
[Upgrade packages]: {% link cheatsheets/package-managers/javascript/npm/upgrade-packages.md %}



## Upgrade all

```sh
$ npm update
```


## Upgrade one


Optionally supply package names as arguments.

```sh
$ npm update PACKAGE_NAME
```

For example, this might change as follows:

```diff
- "foo": "^1.0.0"
+ "foo": "^1.2.3"
```

But, the package will **remain** within the initial bounds. So the command here would not upgrade from `1` to `2`. See the sections below for that.



Or use `install` with a falag.

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
