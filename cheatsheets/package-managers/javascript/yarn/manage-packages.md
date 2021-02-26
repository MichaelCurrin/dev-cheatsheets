# Manage packages


## View

```sh
$ yarn list
```

Note `ls` will not work like for `npm`.


## Install package

### Project-scoped

Install package by name. Use `-D` for `--save-dev`.

```sh
$ yarn add react

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


## Install all packages

Install packages listed in `package.json`.

```sh
$ yarn install
```


## Outdated

Check for outdated packages.

```sh
$ yarn outdated
```


## Upgrade

Upgrade all packages. Note you cannot use `yarn update`.

```sh
$ yarn upgrade
```

Upgrade just one package.

```sh
$ yarn add react
```
