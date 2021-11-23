# Install and upgrade Yarn


## Install

Docs:

- [Yarn 1](https://classic.yarnpkg.com/en/docs/install/)
- [Yarn 2](https://yarnpkg.com/getting-started/install)

See also my instructions in a [gist](https://gist.github.com/MichaelCurrin/bdc34c554fa3023ee81449eb77375fcb) for using a package manager.

### NPM

```sh
$ npm install -g yarn
```

### Brew

```sh
$ brew install yarn
```

### Manual

```sh
$ curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
```


## Upgrade

### NPM

Use NPM to upgrade Yarn.

```sh
$ npm upgrade -g yarn
```

### Brew

```sh
$ brew upgrade yarn
```

### Manual

If you installed using `curl`, then use the same install command again to upgrade Yarn. This method is recommended on the Yarn docs and in the help when the CLI tells you it is out of date.

```sh
$ curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
```

