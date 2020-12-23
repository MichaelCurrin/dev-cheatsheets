# Liquid options

Add strict Liquid settings so Jekyll will fail on bad syntax.

From [Liquid Options](https://jekyllrb.com/docs/configuration/liquid/) in the docs.

Change the error mode from `warn` to `strict`. And make any invalid variables and filters cause build errors.

```yaml
liquid:
  error_mode: strict
  strict_variables: true
  strict_filters: true
```

These are mutually exclusive settings according to the docs. Though my YAML linter doesn't like having the 1st line and the last 2 lines together.

You may have issues caused by your _theme_ and not your actual code

Which you'll have to leave out some fields covered above.

Or you adjust for it. For example, the Minima theme's `post.html` layout uses `site.minima.date_format` and `site.disqus.short_name` as optional config values. So to do a build, you have to set them as empty in your config, or override the layout.

And it is not safe to set the entire `site.minima` to null for example, as you might affect other values used by the theme. Plus that is not actually effective because you get the error anyway on the last level.

This works though:

```yaml
minima:
  date_format:
disqus:
  shortname:
```

Also set this on your `index.md` and `404.html`

```yaml
title:
```

I had issues in other parts of my `jekyll-blog-demo` repo so I stopped using all the strict settings.
