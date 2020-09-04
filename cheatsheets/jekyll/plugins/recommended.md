---
title: Recommended plugins
render_with_liquid: false
---


## Setup

1. Add to `Gemfile`.
2. Add to the config's `plugins` section.
3. Do any plugin-specific setup.


## Standard plugins
> How to add common plugins to your site

These can go on most sites.

- [jekyll-feed](https://github.com/jekyll/jekyll-feed)
	- Produce RSS feed. _"A Jekyll plugin to generate an Atom (RSS-like) feed of your Jekyll posts."_
- [jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag)
	- Use as `{% seo %}` in your `head` tag. The result will be a HTML tag which starts with "SEO plugin"  comment.
	- See advanced usage for authors and image OG data.
- [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap)
	- Adds a `sitemap.xml` and `robots.txt` file to the site.
