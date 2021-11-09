# update

- [npm-update](https://docs.npmjs.com/cli/v7/commands/npm-update) docs

> update all the packages listed to the latest version (specified by the tag config),
> 
> respecting the semver constraints of both your package and its dependencies (if they also require the same package).

This will also install missing packages.


## Upgrade all

```sh
$ npm update 
```


## Upgrade one

```sh
$ npm update PACKAGE_NAME
```

Or

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
```

