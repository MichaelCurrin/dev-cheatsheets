---
title: Uninstall
description: How to remove Ruby and gems from your system
---


## Remove gems

Delete custom gems installed at the user level - only your user could run them.

```sh
$ rm -rf ~/.gem
```

Delete system-wide custom gems - any user could run them. If only root has access to modify this directory, then you'll need to run with `sudo`.

```sh
$ rm -rf /usr/local/lib/ruby/
```

That directory contains `gems/` and `site_ruby` by the way.


## Remove Ruby

Remove the custom Ruby using your package manager.

### macOS

```sh
$ brew uninstall ruby
```

### Linux

```sh
$ sudo apt remove ruby ruby-dev
```

Or, if you installed as `ruby-full`, then run:

```sh
$ sudo apt remove ruby-full
```
