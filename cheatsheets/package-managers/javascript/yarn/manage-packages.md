# Manage packages


## Install package

### Project-scoped

Install package by name. Use `-D` for `--save-dev`.

```sh
$ yarn add markdown-it

$ yarn add -D tslint typescript
```

Note you cannot use `yarn install PACKAGE_NAME` anymore.

### Global

Install package globally by name.

```sh
$ yarn global add tslint
```

Or

```sh
$ yarn add tslint -g
```


## Install all

Install all packages in `package.json`.

```sh
$ yarn install
```


## Outdated

```sh
$ yarn outdated
```


## Upgrade

Upgrade all packages. Note you cannot use `yarn update`.

```sh
$ yarn upgrade
```
