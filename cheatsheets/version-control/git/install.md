# Install

See release versions on the [Git Wikipedia](https://en.wikipedia.org/wiki/Git) page.

## Linux

### Basic

```sh
$ sudo apt install git
```

### Latest

Using Ubuntu and the default source of software might mean the latest version of Git you can install is a few years old.

In this case, only `2.25` was available and not `2.38`.

```console
$ sudo apt list git -a
Listing... Done
git/focal-updates,focal-security 1:2.25.1-1ubuntu3.6 amd64
git/focal 1:2.25.1-1ubuntu3 amd64
```

#### 1. Uninstall

Uninstall your current Git, if necessary:

```sh
$ sudo apt remove git
```

#### 2. Add source

Get the latest available, add to sources with this:

```sh
$ sudo add-apt-repository ppa:git-core/ppa
```

You not need to add run `sudo apt update`.

Now list all versions you can now install with this command, including `2.38` now at the top in this exmaple:

```console
$ sudo apt list git -a
Listing... Done
git/focal,now 1:2.38.1-0ppa1~ubuntu20.04.1 amd64 [installed]
git/focal-updates,focal-security 1:2.25.1-1ubuntu3.6 amd64
git/focal 1:2.25.1-1ubuntu3 amd64
```

#### 3. Install

The one at the top of the list will be installed with a simple install.

```sh
$ sudo apt install git
```

Or if you want to pick a specific version, to this with the appropriate version:

```sh
$ sudo apt install git=1:2.38.1-0ppa1~ubuntu20.04.1
```
