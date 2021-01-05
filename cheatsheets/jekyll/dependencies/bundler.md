# Bundler

Guide to using [Bundler](https://bundler.io) for managing project gems in a Jekyll project or any Ruby project.

## Quick reference


```sh
$ bundle install
$ bundle update
$ bundle config
$ bundle exec COMMANDS
$ bundle clean
$ bundle help
```


## Config

Run this when setting up a project.

```sh
$ bundle config set --local path vendor/bundle
```

That will create - `.bundle/config` file.

Ignore it:

- `.gitignore`
    ```
    .bundle
    ```

In the case of using the frozen or deploy flags, you'll get values added to the config.


## Install

See [install](https://bundler.io/man/bundle-install.1.html) command help.

Install all project gems.

```sh
$ bundle install
$ # Equivalent but less clear.
$ bundle
```

Check paths of installed gems.

```sh
$ ls vendor/bundle/ruby/2.7.0/gems
```
```
addressable-2.7.0           jekyll-feed-0.15.1          minima-2.5.1
colorator-1.1.0             jekyll-sass-converter-1.5.2 pathutil-0.16.2
...
```

Production install.

```sh
$ bundle install --frozen --deployment
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


## Adding gems

Add a gem to `Gemfile` and install it.

```sh
$ bundle add GEM
```


## Upgrading gems

If you've made changes to your `Gemfile`, then you `Gemfile.lock` file will not match.

If you run `bundle install`, you'll get an error about a mismatch.

Therefore you can do:

```sh
$ bundle update
```

You can also do that if there no changes in `Gemfile` and you just want to get newer gems.



## Info


```sh
$ bundle info GEM [OPTIONS]
```

### All info

```sh
$ bundle info minima
```
```
  * minima (2.5.1)
	Summary: A beautiful, minimal theme for Jekyll.
	Homepage: https://github.com/jekyll/minima
	Path: /Users/mcurrin/repos/_static-sites/jekyll-blog-demo/vendor/bundle/ruby/2.7.0/gems/minima-2.5.1
```

### Path

```sh
$ bundle info minima --path
```
```
/Users/mcurrin/repos/_static-sites/jekyll-blog-demo/vendor/bundle/ruby/2.7.0/gems/minima-2.5.1
```

This replaces the now deprecated `bundle show GEM`.

