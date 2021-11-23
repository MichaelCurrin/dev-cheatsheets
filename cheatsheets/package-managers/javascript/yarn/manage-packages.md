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


## Remove package

### Project-scoped

```sh
$ yarn remove react
```

### Global

```sh
$ yarn global remove react
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

Or, for the absolute latest, which may conflict with your other packages.

```sh
$ yarn add react@latest
```


## Create app

Using the `create` subcommand.

For React:

```sh
$ yarn create react-app my-app
```

Equivalent of:

```sh
$ npx create-react-app my-app 
```
