# Install

See release versions on the [Git Wikipedia](https://en.wikipedia.org/wiki/Git) page.

## Linux

### Basic

```sh
$ sudo apt install git
```

### Latest

The default version for Ubuntu is usually old (2 years when I checked once).

So you get the latest available, use this:

```sh
$ sudo add-apt-repository ppa:git-core/ppa
```

List all:

```sh
$ sudo apt list git -a
Listing... Done
git/focal,now 1:2.38.1-0ppa1~ubuntu20.04.1 amd64 [installed]
git/focal-updates,focal-security 1:2.25.1-1ubuntu3.6 amd64
git/focal 1:2.25.1-1ubuntu3 amd64
```

The first one will be installed with a simple install.

If you want to pick a specific version, to this with the appropriate version:

```sh
$ sudo apt install git=1:2.38.1-0ppa1~ubuntu20.04.1
```
