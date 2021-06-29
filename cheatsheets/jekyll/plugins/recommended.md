---
title: Recommended
description: List of recommended plugins I'd like to share
---

{% raw %}


## GitHub metadata

[![jekyll - github-metadata](https://img.shields.io/static/v1?label=jekyll&message=github-metadata&color=blue&logo=github)](https://github.com/jekyll/github-metadata)
[![stars - github-metadata](https://img.shields.io/github/stars/jekyll/github-metadata?style=social)](https://github.com/jekyll/github-metadata)

See [docs](https://github.com/jekyll/github-metadata/blob/master/docs/site.github.md) for a description of the data available on the `site.github` object in Liquid.

```ruby
group :jekyll_plugins do
  gem 'jekyll-github-metadata'
end
```


## GitHub Pages

This includes many other gems, listed on [Dependency versions](https://pages.github.com/versions/) page.

Including themes, plugins and Jekyll itself.

```ruby
group :jekyll_plugins do
  gem 'github-pages'
end
```

This is rather heavy - you'll install a lot and only use a little.


## Embedding

[![jekyll - jekyll-gist](https://img.shields.io/static/v1?label=jekyll&message=jekyll-gist&color=blue&logo=github)](https://github.com/jekyll/jekyll-gist)
[![stars - jekyll-gist](https://img.shields.io/github/stars/jekyll/jekyll-gist?style=social)](https://github.com/jekyll/jekyll-gist)

- See _Installation_ section of README for setup.
- This will take a gist ID and optional filename and add the JS snippet to your page.
- It also includes `noscript` support - fetches the raw content and build time and adds the content to the page so that this works with JS disable.
- You can also just use the gist's standard embed functionality directly without this plugin, by clicking Embed on a gist or creating script tag yourself. That just requires JS to be enabled.


## Images

- [mmistakes/jekyll-picture-tag](https://github.com/mmistakes/jekyll-picture-tag) - most popular.
- [rbuchberger/jekyll_picture_tag](https://github.com/rbuchberger/jekyll_picture_tag) - fork of above.
- [CloudCannon/jekyll-resize](https://github.com/CloudCannon/jekyll-resize) - Jekyll 3 only. Similar to plugins above but simpler.
- [MichaelCurrin/jekyll-resize](https://github.com/MichaelCurrin/jekyll-resize) - my fork of the above, for Jekyll 3 and 4.

### jekyll_picture_tag

Crop and resize images and serve them responsively.

[![rbuchberger - jekyll_picture_tag](https://img.shields.io/static/v1?label=rbuchberger&message=jekyll_picture_tag&color=blue&logo=github)](https://github.com/rbuchberger/jekyll_picture_tag)
[![stars - jekyll_picture_tag](https://img.shields.io/github/stars/rbuchberger/jekyll_picture_tag?style=social)](https://github.com/rbuchberger/jekyll_picture_tag)

#### Install

See [Installation](https://rbuchberger.github.io/jekyll_picture_tag/users/installation) page in the docs.

Add to your Gemfile and install it.

```ruby
group :jekyll_plugins do
   gem 'jekyll_picture_tag', ~> '1'
end
```

Install [ImageMagick][].

#### Usage

See [Jekyll Picture Tag](https://rbuchberger.github.io/jekyll_picture_tag/) docs homepage.

Code:

```liquid
{% picture test.jpg %}
```

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


## CMS

### About

You can add one of the plugins below to your Gemfile, install it and when you run serve, you'll get localhost:4000/admin available for you to edit your site in a modern GUI. You don't have to add it to your config file.

You can then upload assets, edit and save pages and data and see stats on your site. You have to go to your repo actually commit and push any changes.

My favorite part is that the admin view makes it easy to make a page or post and edit it with rich text editor. You can even preview images. But your path might not be right on the built site so you then have to insert your image as markdown and with liquid handling of the URL to be relative.

The downside is that since there is **no auth** to login, that tool can only work for running local server.
This can work for your flow if all your editing is local. And if you do a build command locally or or remotely, you'll just build a static site which acts as if the the admin plugin is not even installed which is good.

#### Warnings

Note that when you start the server, it will automatically run in hot-reload mode so any saved changes cause a server rebuild and refresh of the page. This can take time to rebuild but fortunately the admin view itself is always fast.

Also if you save in files in your IDE, the server will **not** rebuild the site. It only listens for changes from the admin view. So you'll have to save a file in the admin or stop and start your server to see changes.

### Jekyll Admin

- [Docs homepage](https://jekyll.github.io/jekyll-admin/)
- GitHub: [jekyll/jekyll-admin](https://github.com/jekyll/jekyll-admin)

### Jekyll Manager

This is a fork of the above. It has some more advanced features but generally I find the Admin one is fine for my needs.

- GitHub: [ashmaroli/jekyll-manager](https://github.com/ashmaroli/jekyll-manager)

{% endraw %}


[ImageMagick]: {{ site.baseurl }}{% link cheatsheets/shell/image-magick %}

