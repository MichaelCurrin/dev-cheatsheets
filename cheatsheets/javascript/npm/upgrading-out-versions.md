---
title: Upgrade old versions
description: Guide to managing out NPM packages in your project
---

## Find outdated packages

[docs](https://docs.npmjs.com/cli/outdated)

> This command will check the registry to see if any (or, specific) installed packages are currently outdated.

```sh
$ npm outdated
```

## Upgrade packages

[docs](https://docs.npmjs.com/cli/update)

> This command will update all the packages listed to the latest version (specified by the tag config), respecting semver.

```sh
$ npm update
```

This can be used with `-g` flag too.

Optionally supply package names as arguments.

Note that the above command will still stick with your bounds of tilde and caret.


### Newest

If you want to install the absolute latest available, you a separate tool.

[docs](https://www.npmjs.com/package/npm-upgrade)

> Interactive CLI utility to easily update outdated NPM dependencies with changelogs inspection support.

```sh
$ npx npm-upgrade
```

## Fix security vulnernabities

Use the `audit` command.

### CLI usage

```
npm audit [--json] [--production]
npm audit fix [--force|--package-lock-only|--dry-run|--production|--only=(dev|prod)]
```

### Audit

```sh
$ npm audit
```

### Fix

Use the fix subcommand.
```sh
$ npm audit fix
```
