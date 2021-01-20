# Liquid options

See [Liquid Options](https://jekyllrb.com/docs/configuration/liquid/) in the docs.

## Fields

### Defaults

Here are the default options:

```yaml
liquid:
  error_mode        : warn
  strict_filters    : false
  strict_variables  : false
```

### Strict settings

```yaml
liquid:
  error_mode: strict
  strict_variables: true
  strict_filters: true
```

Add strict Liquid settings so Jekyll will fail on bad syntax and give you confidence in deployed code.. 

Strict variables - This will prevent referencing a variable that has not been defined. Normally it would quietly appear as empty string. e.g. `{{ not_a_var }}`. Or an undefined attribute - `{{ site.not_an_attribute }}` will give an error that the key is not set.

Strict filters - Prevent using a bad filter. e.g. `{{ 'text' | not-a-filter }}` will say filter not available instead of ignoring it quietly.

You can also change the error mode from `warn` to `strict`.

I don't know why error mode needs to set and what it does - perhaps those are errors on other areas. For example, I have run my build in verbose mode before and seen warnings that didn't stop the build.

These are mutually exclusive fields according to the docs. Though weirdly my IDE's YAML linter doesn't like having the both error mode and strict settings in the same file.


## When strict checks are too strict

The safest is to set the values aggressively as above.

But this may be impractical. You may have issues on one or more fields caused by your code in your _theme_ and not your actual code.

Which means you'll have to leave out some fields covered above.

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
