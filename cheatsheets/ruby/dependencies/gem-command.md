---
description: How to manage Ruby gems with the gem command
---
# Gem command


## Install

```sh
gem install GEM
```

Install in `~/.gem`.

```sh
gem install GEM --user-install
```


## Update

```sh
gem update --system
```

Using `--system` seems like a common flow.

```
--system [VERSION]           Update the RubyGems system software
```

I found I needed root access for /var/lib/gems/2.7.0 directory.

```sh
sudo gem update --system
```


## Bundler

```sh
$ gem install bundler --user-install
```

```sh
$ gem update bundler --user-install
```
