---
description: A commonly-used macOS package manager
---
# Homebrew


## Resources

- [Homebrew Cheatsheet](https://devhints.io/homebrew) on _DevHints_.
- [Homebrew docs](https://docs.brew.sh/) homepage
- [Homebrew Tips N' Tricks](https://docs.brew.sh/Tips-N%27-Tricks) in the docs


## Install brew

See the [brew.sh](https://brew.sh) homepage.


## Update list

Update Homebrew's local list of packages.

This does _not_ actually update packages. Note you probably _don't_ need to use this, since an update is done before commands like install.

```sh
$ brew update
```


## Install

### Install package

Install a specific package by its formula.

_Note: Unlike `apt`, the `update` command is done internally to get the latest remote info - [#1670](https://github.com/Homebrew/brew/issues/1670)._

```sh
$ brew install PACKAGE
$ brew install PACKAGE@VERSION
```
e.g.

```sh
$ brew install gcc@7 python@3.9
```

Warning: The `install` command will also **automatically upgrade** all installed packages. This has caused issues for me where Python environments broke when upgrading something unrelated to Python.

Install without auto-upgrade - from [article](https://computingforgeeks.com/prevent-homebrew-auto-update-on-macos/).

```sh
$ HOMEBREW_NO_AUTO_UPDATE=1 brew install PACKAGE
```

Or set once-off in `.bashrc` or `.zshrc` so it is always set.

```sh
export HOMEBREW_NO_AUTO_UPDATE=1
```

### Install a cask

See also [Homebrew casks](https://formulae.brew.sh/cask/).

```sh
$ brew cask install CASK_NAME
```


## Upgrade packages

### Upgrade one package

```sh
$ brew upgrade PACKAGE
```

### Upgrade all packages

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


## Remove

```sh
$ brew uninstall PACKAGE
```


## Taps

```sh
$ brew tap <TAP_NAME>/taps
$ brew install <TAP_NAME>
```

e.g.

```sh
$ brew tap isacikgoz/taps
$ brew install gitbatch
```
