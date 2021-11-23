# Enable


## Standard

For local development and use outside of GH Pages, it is sufficient to add a plugin to the `Gemfile` under the `:jekyll_plugins` group to enable it.

```ruby
group :jekyll_plugins do
  gem "jekyll-feed"
  gem "jekyll-sitemap"
end
```

For example, you can see the `sitemap.xml` file and `feed.xml` file get outputted in `_site` on a build.


## GitHub Pages

But when it comes to hosting on GitHub Pages, you must **also** add those to the `plugins` field in `_config.yml`.

However, for a plugin is already used by the theme then you don't have to add that to plugins. Like the `seo` tag is used in the Minima `head.html` file and installed as `jekyll-seo-tag` within the theme.

I found was all true when using `minima` as a theme for my [jekyll-blog-demo](https://github.com/MichaelCurrin/jekyll-blog-demo) site.


## Alternate

When I used my fork of minima, I found that I did **not** have to add to `plugins` field. Perhaps because I installed the theme with the Remote Theme plugin

See for example:

- Dev Cheatsheets:
    - [\_config.yml](https://github.com/MichaelCurrin/dev-cheatsheets/blob/master/_config.yml)
    - [sitemap.xml](https://michaelcurrin.github.io/dev-cheatsheets/sitemap.xml)
- Theme: [MichaelCurrin/minima](https://github.com/MichaelCurrin/minima)
