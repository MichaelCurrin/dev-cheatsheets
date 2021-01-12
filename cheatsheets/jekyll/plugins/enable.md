# Enable


For local development and use outside of GH Pages, it is sufficient to add a plugin to the `Gemfile` under `:jekyll_plugins` group to enable it.

```Gemfile
group :jekyll_plugins do
  gem "jekyll-feed"
  gem "jekyll-sitemap"
end
```

For example, you can see the `sitemap.xml` file and `feed.xml` file get outputted in `_site` on a build.

But when it comes to hosting on GitHub Pages like jekyll-blog-demo](https://github.com/MichaelCurrin/jekyll-blog-demo), you must **also** add those to the `plugins` field in `_config.yml`.

I found this was the case when using `minima` as a theme. 

When I used my fork of minima and installed using Remote Theme plugin, I found that I did not have to add to `plugins` field.

See for example:

- Dev Cheatsheets:
    - [\_config.yml](https://github.com/MichaelCurrin/dev-cheatsheets/blob/master/_config.yml)
    - [sitemap.xml](https://michaelcurrin.github.io/dev-cheatsheets/sitemap.xml)
- Theme: [MichaelCurrin/minima](https://github.com/MichaelCurrin/minima)
