# Configure
> How to configure Jekyll


## Resources

Jekyll docs.

- [Configuration options](https://jekyllrb.com/docs/configuration/options/). That covers both CLI and config file options together.
- [Frontmatter Defaults](https://jekyllrb.com/docs/configuration/front-matter-defaults/) - setting page values using the `defaults` field.
- [Default config](https://jekyllrb.com/docs/configuration/default/) values.


## Load multiple configs

Use a comma and no spaces.

```sh
$ bundle exec jekyll build --trace \
  --config _config.yml,_config_prod.yml
```


## Null values

```yaml
foo: null
bar: ""
baz:
```

Note that YAML uses `null`, while Ruby uses `nil`.


## Plugins

### When to use

From the [docs](https://jekyllrb.com/docs/plugins/installation/), a gem listed in the `:jekyll_plugins` group of the `Gemfile` will **always** get activated, even if it is not listed in the `plugins` field of the config.

Therefore you can generally **omit** this key.

This works both locally and on GH Pages, using a theme directly or using Remote Theme plugin.

However, if you setup a GH Pages site without a `Gemfile`, then you should setup `plugins` in your config.

### Syntax

Should should be an array.

```yaml
plugins:
  - foo
  - bar
```

This key was `gems` in older Jekyll projects.


## URLs

Include protocol. No trailing forwardslash.
```yaml
url: "http://example.com"
```

```yaml
baseurl: ""
baseurl: "/my-repo"
```

If not empty, must start with a forwardlash and not end with one, as above.


## Build settings

This can be set with CLI flags, or in the config here if you prefer.

```yaml
future: true
profile: true
livereload: true
```

Cause a build to fail if there is a YAML syntax error in a page's frontmatter. Only works in Jekyll 4 though.

```yaml
strict_front_matter: true
```


## Exclude

Here is the default value for Jekyll 3:

```yaml
exclude:
  - vendor/
  - Gemfile
  - Gemfile.lock
  - node_modules/
```

The vendor folder is actually ignored as `"vendor/bundle/", "vendor/cache/", "vendor/gems/", "vendor/ruby/"`.

When you override `exclude`, you must also include those base values. Note that in Jekyll 4 that is not the case.

Using system and custom values.

```yaml
exclude:
  - docs/
  - vendor/
  - Gemfile
  - Gemfile.lock
  - LICENSE
  - Makefile
  - README.md
  - sample*.png
```

You may use a globstar pattern.

```yaml
exclude:
  - "*.png"
```

However, using `/*.png` doesn't work so images are removed at all levels such as assets.

Therefore rather ignore explicitly:

```yaml
exclude:
  - sample.png
```

Or:

```yaml
exclude:
  - sample*.png
```


## Check for Liquid errors

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
