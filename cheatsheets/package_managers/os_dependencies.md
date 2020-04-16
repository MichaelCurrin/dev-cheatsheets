## macOS

### Homebrew

[Cheatsheet](https://devhints.io/homebrew) on _Devhints_.

#### Setup

See [brew.sh](https://brew.sh) homepage

#### Install

```sh
$ brew install PACKAGE
```

See [casks](https://formulae.brew.sh/cask/).

```sh
$ brew cask install CASK_NAME
```

#### Install taps

```sh
$ brew tap <TAP_NAME>/taps
$ brew install <TAP_NAME>
```

e.g. 

```sh
$ brew tap isacikgoz/taps
$ brew install gitbatch
```

## Linux

### APT

Usually you want to use `sudo` prefix.

```sh
$ apt update
```

Specify one or more packages (separated by spaces).

```sh
$ apt install PACKAGE

$ apt upgrade PACKAGE

$ apt remove PACKAGE
```

[Man page](http://manpages.ubuntu.com/manpages/trusty/man8/apt.8.html) for Apt on Ubuntu.
