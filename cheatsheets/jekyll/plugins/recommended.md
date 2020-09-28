---
title: Recommended
description: List of recommended plugins I'd like to share
---

## Embedding

- [jekyll-gist](https://github.com/jekyll/jekyll-gist)
- See _Installation_ section of README for setup.
- This will take a gist ID and optional filename and add the JS snippet to your page.
- It also includes `noscript` support - fetches the raw content and build time and adds the content to the page so that this works with JS disable.
- You can also just use the gist's standard embed functionality directly without this plugin, by clicking Embed on a gist or creating script tag yourself. That just requires JS to be enabled.

## Images

### Install

[Install doc](https://rbuchberger.github.io/jekyll_picture_tag/users/installation).

```ruby
group :jekyll_plugins do
   gem 'jekyll_picture_tag', ~> '1'
end
```
