# install subcommand

See [install](https://bundler.io/man/bundle-install.1.html) command help.

Install all gems listed in `Gemfile`.

```sh
$ bundle install
$ # Equivalent but less clear.
$ bundle
```

Install using parallel processing for faster performance.

```sh
$ bundle install --jobs=8
```

Check paths of installed gems:

```console
$ ls vendor/bundle/ruby/2.7.0/gems
addressable-2.7.0           jekyll-feed-0.15.1          minima-2.5.1
colorator-1.1.0             jekyll-sass-converter-1.5.2 pathutil-0.16.2
...
```

## Arguments

Summary of args I find useful.

| Arg                               | Description                                                                                                          |
| --------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| `--quiet`                         | Do not print progress information to the standard output. Instead, Bundler will exit using a status code ($?).       |
| `--gemfile=PATH`                  | Specify path to a `Gemfile`. Defaults to the file in the current working directory.                                  |
| `--jobs=[<number>], -j[<number>]` | The maximum number of parallel download and install jobs. The default is 1. This seems to be popular in CI installs. |

## Deprecated flags

Note that `--frozen`, `--clean` and `--deployment` flags are marked as deprecated in the CLI help.

Production install - you might see this used and it still works in Bundler 2, but it is deprecated.

```sh
$ bundle install --frozen --deployment
```

The CLI also warns not to use `--with GROUP` for install groups.

### Install groups of dependencies

See the [Groups][] cheatsheet,

[Groups]: {% link cheatsheets/package-managers/ruby/bundler/groups.md %}
