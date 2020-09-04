---
title: Standard plugins
description: How to add common plugins to your site
render_with_liquid: false # Jekyll 4 only
---

{% raw %}
These are useful to add for most sites and work on GH Pages.

## Setup
> How to setup a plugin

1. Add to your `Gemfile`
1. Run `bundle install` locally.
3. Add the plugin to the config's `plugins` section.
3. Follow any plugin-specific setup like configuring and adding your layouts.


## Plugins

### RSS feed

- Repo: [jekyll-feed](https://github.com/jekyll/jekyll-feed)
- _"A Jekyll plugin to generate an Atom (RSS-like) feed of your Jekyll posts."_
- Produce an RSS feed of content - especially useful for consumers of your blog add to their RSS reader tools.
- Add to your `head` HTML tag such as in `_layouts/default.html`.
	```liquid
	{% feed_meta %}
	```

Sample result from [michaelcurrin.github.io/dev-cheatsheets](https://michaelcurrin.github.io/dev-cheatsheets/):

- `index.html`
	```html
	<link type="application/atom+xml" 
		rel="alternate" 
        href="https://michaelcurrin.github.io/dev-cheatsheets/feed.xml" 
		title="Dev Cheatsheets" /><script>
	```

See the generated feed on this site - [feed.xml](https://michaelcurrin.github.io/dev-cheatsheets/feed.xml).

### SEO tag

- Repo: [jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag)
- This adds metadata for search engines to use, including `title`, `meta` and a canonical tag. If you use this plugin, you don't need to set `title` yourself or in a theme layout (as you'd duplicate the tag).
- Add to your `head` HTML tag such as in `_layouts/default.html`.
	```liquid
	{% seo %}
	```
- See the _advanced usage_ in the docs for setting authors and image OG data.

Sample from [michaelcurrin.github.io/dev-cheatsheets](https://michaelcurrin.github.io/dev-cheatsheets/):

- `index.html`
	```html
	<!-- Begin Jekyll SEO tag v2.6.1 -->
	<title>Home | Dev Cheatsheets</title>

	<meta name="generator" content="Jekyll v3.9.0" />
	<meta property="og:title" content="Home" />
	<meta property="og:locale" content="en_US" />
	<meta name="description" content="A collection of code snippets and CLI guides for quick and easy reference while coding" />
	<meta property="og:description" content="A collection of code snippets and CLI guides for quick and easy reference while coding" />
	
	<link rel="canonical" href="https://michaelcurrin.github.io/dev-cheatsheets/" />
	<meta property="og:url" content="https://michaelcurrin.github.io/dev-cheatsheets/" />
	<meta property="og:site_name" content="Dev Cheatsheets" />
	
	<script type="application/ld+json">
	{
		"description": "A collection of code snippets and CLI guides for quick and easy reference while coding",
		"@type": "WebSite",
		"headline": "Home",
		"url": "https://michaelcurrin.github.io/dev-cheatsheets/",
		"name": "Dev Cheatsheets",
		"@context": "https://schema.org"
	}
    </script>
	<!-- End Jekyll SEO tag -->
	```

### Sitemap and robots

- Repo: [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap)
- Adds a `sitemap.xml` and `robots.txt` file to the site.
- Sample: [michaelcurrin.github.io/dev-cheatsheets/sitemap.xml](https://michaelcurrin.github.io/dev-cheatsheets/sitemap.xml)
- Sample: [michaelcurrin.github.io/dev-cheatsheets/robots.txt](https://michaelcurrin.github.io/dev-cheatsheets/robots.txt)

{% endraw %}
