---
title: Project packages
---

<!-- TODO reduce this section and split it out for each language -->

## Package managers

Releases of package managers.

- [Bundler versions](https://rubygems.org/gems/bundler/versions) on [rubygems.org](https://rubygems.org)
- [pip](https://pypi.org/project/pip/) project on PyPI. See Release History.


## List installed packages

### Ruby

```sh
$ gem list

$ bundle list
```

### Python

```sh
$ pip list
$ pip freeze
```

### Node

```sh
$ npm list
$ npm -g list
```

## Locking dependencies

Understanding notation like `~> 3` and `^3.0.0` across languages:

- [NPM]({{ site.baseurl }}{% link cheatsheets/javascript/npm/dependency-versions.md %})
- [Python]({{ site.baseurl }}{% link cheatsheets/python/packages/versions.md %})
- [Jekyll]({{ site.baseurl }}{% link cheatsheets/jekyll/gems.md %}) (this can be moved out to a focused Ruby page)
