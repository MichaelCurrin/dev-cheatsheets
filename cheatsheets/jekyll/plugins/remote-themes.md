---
title: Remote themes
---

For themes not supported by GitHub Pages plugin, you can set a remote theme using a plugin.

- [benbalter/jekyll-remote-theme](https://github.com/benbalter/jekyll-remote-theme)

Add to `Gemfile`:

```ruby
gem "jekyll-remote-theme"
```

Add to `_config.yml`:

```yml
plugins:
  - jekyll-remote-theme

remote_theme: benbalter/retlab
```
