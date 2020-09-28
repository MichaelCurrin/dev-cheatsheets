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


## Jekyll Picture Tag

Crop and resize images and serve them responsively.

Repo [rbuchberger/jekyll_picture_tag](https://github.com/rbuchberger/jekyll_picture_tag)

### Install

[Install doc](https://rbuchberger.github.io/jekyll_picture_tag/users/installation).

```ruby
group :jekyll_plugins do
   gem 'jekyll_picture_tag', ~> '1'
end
```

Install [ImageMagick](https://imagemagick.org/script/index.php) using source download or package manager.

### Usage

[doc](https://rbuchberger.github.io/jekyll_picture_tag/)

Write this: 

{% raw %}
```liquid
{% picture test.jpg %}
```
{% endraw %}

Result:

```html
<img src="/generated/test-800-195f7d.jpg"
  srcset="
    /generated/test-400-195f7d.jpg   400w,
    /generated/test-600-195f7d.jpg   600w,
    /generated/test-800-195f7d.jpg   800w,
    /generated/test-1000-195f7d.jpg 1000w
    ">
```
