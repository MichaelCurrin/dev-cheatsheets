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

- https://github.com/mmistakes/jekyll-picture-tag
- https://github.com/rbuchberger/jekyll_picture_tag
- https://github.com/CloudCannon/jekyll-resize
- https://github.com/MichaelCurrin/jekyll-resize (my fork)

### jekyll_picture_tag

Crop and resize images and serve them responsively.

Repo [rbuchberger/jekyll_picture_tag](https://github.com/rbuchberger/jekyll_picture_tag)

#### Install

[Install doc](https://rbuchberger.github.io/jekyll_picture_tag/users/installation).

Add to Gemfile and install.

```ruby
group :jekyll_plugins do
   gem 'jekyll_picture_tag', ~> '1'
end
```

Install [ImageMagick](https://imagemagick.org/script/index.php) using source download or package manager.

So you can run:

```sh
$ convert --version
```

#### Usage

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
