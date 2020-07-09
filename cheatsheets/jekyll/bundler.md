---
title: Bundler
---

Use as `bundler` or `bundle` (more common).

## Install

See [install](https://bundler.io/man/bundle-install.1.html) command help.

```sh
bundle install
# Equivalent but less clear.
bundle
```

```sh
$ bundle install GEM
```

Production install.

```sh
bundle install --frozen --deployment
```

### Arguments

Summary of args I find useful.

| Arg                               | Description                                                                                                                                                                                                        |
| --------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `--clean`                         | On finishing the installation Bundler is going to **remove** any gems not present in the current Gemfile(5). Don't worry, gems currently in use will not be removed.                                               |
| `--deployment`                    | In [deployment mode], Bundler will 'roll-out' the bundle for production or CI use. Please check carefully if you want to have this option enabled in your development environment. Requires a `Gemfile.lock` file. |
| `--frozen`                        | Do not allow the `Gemfile.lock` to be updated after this install. Exits non-zero if there are going to be changes to the `Gemfile.lock`.                                                                           |
| `--quiet`                         | Do not print progress information to the standard output. Instead, Bundler will exit using a status code ($?).                                                                                                     |
| `--jobs=[<number>], -j[<number>]` | The maximum number of parallel download and install jobs. The default is 1.                                                                                                                                        |

[deployment mode]: https://bundler.io/man/bundle-install.1.html#DEPLOYMENT-MODE
