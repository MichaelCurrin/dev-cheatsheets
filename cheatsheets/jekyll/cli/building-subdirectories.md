# Build a subdirectory

This page applies both for `build` and `serve` commands.

The default source for Jekyll is the current directory. But you might have put your Jekyll project in a subdirectory, such as `docs`. Here is how to do that.


## Navigate approach

The simplest is to navigate there first.

```sh
$ cd docs
$ bundle exec jekyll build 
```

This assumes you have a structure like this:

- `docs/`
    - `_site/`
    - `vendor/`
    - `_config.yml`
    - `Gemfile`
    - `index.md`

You can change the output directory.

```sh
$ cd docs
$ bundle exec jekyll build -d ../build
```

This will result in the following:

- `build`
- `docs/`
    - `vendor/`
    - `_config.yml`
    - `Gemfile`
    - `index.md`


## Build subdirectory from root approach

If you prefer, you can stay at the root.

Here we use the `--source` and `--destination` flags.

```sh
$ bundle exec jekyll build -s docs -d build
```

This assumes you have a structure like this:

- `build/` - in place of `_site`.
- `docs/`
    - `_config.yml`
    - `index.md`
- `vendor/`
- `Gemfile`

 As another use case, perhaps you have multiple Jekyll sites in your repo and they all share gems at the top-level.
