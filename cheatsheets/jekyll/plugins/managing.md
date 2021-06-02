# Managing


## Local

Put plugins as `.rb` files in your `_plugins` directory.

Guides:
- [Your first plugin](https://jekyllrb.com/docs/plugins/your-first-plugin/)
- [Generators](https://jekyllrb.com/docs/plugins/generators/)


## External

If you are building on GitHub Pages, then in addition to a _Gemfile_ you must add plugins to your `_config.yml` file as such:

```yml
plugins:
  - jekyll-feed
  - jekyll-sitemap
```

Additional plugins:

```yml
plugins:
  # ...
  - github-pages
  - jekyll-github-metadata
```


## Submodule

See more info in the [Git Submodule][] section.

Add the submodule.

```sh
$ git submodule add git://github.com/foo/bar.git _plugins/foo
```

Update for the latest content.

```sh
$ git submodule update --rebase --remote
```

[Git Submodule]: {{ site.baseurl }}{% link cheatsheets/version-control/git/submodules.md %}

