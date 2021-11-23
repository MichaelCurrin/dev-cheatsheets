# Upgrade


## `update`

> Update the current environment

```sh
$ bundle update [OPTIONS]
```

If you've made changes to your `Gemfile`, then you `Gemfile.lock` file will not match.

If you run `bundle install`, you'll get an error about a mismatch.

Therefore you can do:

```sh
$ bundle update
```

You can also do that if there no changes in `Gemfile` and you just want to get newer gems.


## `outdated`

> List installed gems with newer versions available.

```sh
$ bundle outdated GEM [OPTIONS]
```
