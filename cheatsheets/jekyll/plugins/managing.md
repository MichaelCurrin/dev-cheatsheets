---
title: Managing plugins
---


## Local

Put plugins as `.rb` files in your `_plugins` directory.

Guides:
- [Your first plugin](https://jekyllrb.com/docs/plugins/your-first-plugin/)
- [Generators](https://jekyllrb.com/docs/plugins/generators/)


## External

If you are building on Github Pages, then in addition to a _Gemfile_ you must add plugins to your `_config.yml` file as such:

```yml
plugins:
  - jekyll-feed
  - jekyll-sitemap
```

Additional:

```yml
  - github-pages
  - jekyll-github-metadata
```


## Submodule

Add.

```sh
$ git submodule add git://github.com/foo/bar.git _plugins/foo
```

Update.

```sh
$ cd _plugins/bar
$ git pull origin master
```
