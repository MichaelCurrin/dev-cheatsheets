---
description: Guide to managing out NPM packages in your project
---
# Upgrade packages


## Find outdated packages

From the [npm outdated](https://docs.npmjs.com/cli/outdated) command's docs.

> This command will check the registry to see if any (or, specific) installed packages are currently outdated.

```sh
$ npm outdated
```

<details>
<summary>Sample output using NPM 6.14.7</summary>

```
Package             Current  Wanted  Latest  Location
eslint                6.8.0   6.8.0   7.7.0  preact-quickstart
jest                 24.9.0  24.9.0  26.4.0  preact-quickstart
jest-preset-preact    1.0.0   1.0.0   4.0.2  preact-quickstart
sirv-cli              1.0.3   1.0.3   1.0.6  preact-quickstart
```

</details>


## Upgrade packages

From the [npm update](https://docs.npmjs.com/cli/update) command's docs.

> This command will update all the packages listed to the latest version (specified by the tag config), respecting semver.

```sh
$ npm update
```
Or the longer.

```sh
$ npm install --upgrade
```

For global packages, add `-g`.

Optionally supply package names as arguments.

Note that the above command will still stick with your bounds of tilde and caret.

### Newest

If you want to install the latest available.

Use NPM install. I Leave off the version number.

```sh
$ npm install PACKAGE
```

You can upgrade multiple packages at once using a 3rd-party package. 

See [npm-upgrade](https://www.npmjs.com/package/npm-upgrade) homepage and docs.

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

<details>
<summary>Sample output using NPM 6.14.7</summary>

```
                       === npm audit security report ===

┌──────────────────────────────────────────────────────────────────────────────┐
│                                Manual Review                                 │
│            Some vulnerabilities require your attention to resolve            │
│                                                                              │
│         Visit https://go.npm.me/audit-guide for additional guidance          │
└──────────────────────────────────────────────────────────────────────────────┘
┌───────────────┬──────────────────────────────────────────────────────────────┐
│ Moderate      │ Regular Expression Denial of Service                         │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Package       │ acorn                                                        │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Patched in    │ >=5.7.4 <6.0.0 || >=6.4.1 <7.0.0 || >=7.1.1                  │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Dependency of │ preact-cli [dev]                                             │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Path          │ preact-cli > fast-async > nodent-compiler > acorn            │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ More info     │ https://npmjs.com/advisories/1488                            │
└───────────────┴──────────────────────────────────────────────────────────────┘
┌───────────────┬──────────────────────────────────────────────────────────────┐
│ High          │ Remote Code Execution                                        │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Package       │ serialize-javascript                                         │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Patched in    │ >=3.1.0                                                      │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Dependency of │ preact-cli [dev]                                             │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Path          │ preact-cli > copy-webpack-plugin > serialize-javascript      │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ More info     │ https://npmjs.com/advisories/1548                            │
└───────────────┴──────────────────────────────────────────────────────────────┘
┌───────────────┬──────────────────────────────────────────────────────────────┐
│ High          │ Remote Code Execution                                        │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Package       │ serialize-javascript                                         │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Patched in    │ >=3.1.0                                                      │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Dependency of │ preact-cli [dev]                                             │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ Path          │ preact-cli > workbox-webpack-plugin > workbox-build >        │
│               │ rollup-plugin-terser > serialize-javascript                  │
├───────────────┼──────────────────────────────────────────────────────────────┤
│ More info     │ https://npmjs.com/advisories/1548                            │
└───────────────┴──────────────────────────────────────────────────────────────┘
found 3 vulnerabilities (1 moderate, 2 high) in 1649 scanned packages
  3 vulnerabilities require manual review. See the full report for details.
```

</details>

### Fix

Use the fix subcommand.
```sh
$ npm audit fix
```
