
# Plugins

## When to use

From the [docs](https://jekyllrb.com/docs/plugins/installation/), a gem listed in the `:jekyll_plugins` group of the `Gemfile` will **always** get activated, even if it is not listed in the `plugins` field of the config.

Therefore you can generally **omit** this key.

This works both locally and on GH Pages, using a theme directly or using Remote Theme plugin.

However, if you set up a GH Pages site without a `Gemfile`, then you should set up `plugins` in your config.

## Syntax

Should should be an array.

```yaml
plugins:
  - foo
  - bar
```

This key was `gems` in older Jekyll projects.
