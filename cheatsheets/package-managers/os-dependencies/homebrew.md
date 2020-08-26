---
title: Homebrew
description: A commonly-used macOS package manager
---

## Resources

See the [Homebrew Cheatsheet](https://devhints.io/homebrew) on _DevHints_.


## Install brew

See the [brew.sh](https://brew.sh) homepage.


## Update list

Update Homebrew's package list - this does _not_ actually update packages. Note you probably don't need to use this since an update is done before commands like install.

```sh
$ brew update
```


## Manage packages

### Install packages

Install a specific package. Note that `update` is done internally - [#1670](https://github.com/Homebrew/brew/issues/1670).

```sh
$ brew install PACKAGE
```

See also [casks](https://formulae.brew.sh/cask/).

```sh
$ brew cask install CASK_NAME
```

### Upgrade package

```sh
$ brew upgrade PACKAGE
```


## Upgrade all packages

Update outdated packages. WARNING Use this with caution - it can break Python virtual environments for example.

```sh
$ brew upgrade --dry-run

$ brew upgrade
```


Here is a shortcut I found - from [article](https://medium.com/@kkostov/how-to-install-node-and-npm-on-macos-using-homebrew-708e2c3877bd ).

```sh
alias brewery='brew update && brew upgrade && brew cleanup'
```

### Help

```sh
$ brew upgrade --help
```
```
Upgrade outdated, unpinned formulae using the same options they were originally
installed with, plus any appended brew formula options. If formula are
specified, upgrade only the given formula kegs (unless they are pinned; see
pin, unpin).

Unless HOMEBREW_NO_INSTALL_CLEANUP is set, brew cleanup will then be run for
the upgraded formulae or, every 30 days, for all formulae.
```


## Install taps

```sh
$ brew tap <TAP_NAME>/taps
$ brew install <TAP_NAME>
```

e.g.

```sh
$ brew tap isacikgoz/taps
$ brew install gitbatch
```
