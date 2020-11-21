# Packaging
> Packaging a Jekyll theme

See [Themes](https://michaelcurrin.github.io/code-cookbook/recipes/jekyll/themes.html) in my Cookbook for sample files in a theme.


## Build

You can also omit the last argument as the filename will be inferred.

```sh
$ gem build foo.gemspec
```
```
  Successfully built RubyGem
  Name: foo
  Version: 2.5.1
  File: foo-2.5.1.gem
```

## Unpack

```sh
$ gem unpack foo-2.5.1.gem
```

```sh
ls foo-2.5.1/
```
```
LICENSE        LICENSE-source README.md      _includes      _layouts       _sass          assets
```
