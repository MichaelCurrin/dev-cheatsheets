---
description: How to add common plugins to your site
---
# Standard plugins

{% raw %}

These are useful to add for most sites and work on GH Pages.


## Setup
> How to set up a plugin

1. Add to your `Gemfile`.
1. Run `bundle install` locally.
3. Add the plugin to the config's `plugins` section.
3. Follow any plugin-specific set up like configuring and adding your layouts.


## Plugins

### RSS feed

- Repo: [jekyll-feed](https://github.com/jekyll/jekyll-feed)
	- > "A Jekyll plugin to generate an Atom (RSS-like) feed of your Jekyll posts."_
	- > The plugin will automatically generate an Atom feed at /feed.xml.
- Produce an feed of posts.
	- If you don't have a `_posts` directory, this won't be useful for you.
	- But useful for consumers of your blog add to their reader tools.
	- This uses _Atom_ and not _RSS_, which is explained why in the docs.
- Follow the docs to configure.
- After installing, add to your `head` HTML tag such as in `_layouts/default.html`.
	```liquid
	{% feed_meta %}
	```

#### Sample

- The reason for the metadata is to generate a tag like this from [/michaelcurrin.github.io/jekyll-blog-demo](https://michaelcurrin.github.io/jekyll-blog-demo/).
```html
<link type="application/atom+xml" rel="alternate"
    href="https://michaelcurrin.github.io/jekyll-blog-demo/feed.xml"
    title="Jekyll Blog Demo" />
```

See file at [michaelcurrin.github.io/jekyll-blog-demo/feed.xml](https://michaelcurrin.github.io/jekyll-blog-demo/feed.xml). A piece is shown below.

- `feed.xml`
    ```xml
    <entry>
        <title type="html">First post!</title>
        <link href="https://michaelcurrin.github.io/jekyll-blog-demo/2018/12/22/first-post/" rel="alternate" type="text/html" title="First post!"/>
        <published>2018-12-22T00:00:00+00:00</published>
        <updated>2018-12-22T00:00:00+00:00</updated>
        <id>
            https://michaelcurrin.github.io/jekyll-blog-demo/2018/12/22/first-post
        </id>
        <content type="html" xml:base="https://michaelcurrin.github.io/jekyll-blog-demo/2018/12/22/first-post/">
            <p>This is my first post after the one created as part of the blog template.</p>
        </content>
        <author>
            <name/>
        </author>
        <summary type="html">
            This is my first post after the one created as part of the blog template.
        </summary>
    </entry>
    ```

### SEO tag

- Repo: [jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag)
- This adds metadata for search engines to use, including `title`, `meta` and a canonical tag. If you use this plugin, you don't need to set `title` yourself or in a theme layout (as you'd duplicate the tag).
- After installing, add to your `head` HTML tag such as in `_layouts/default.html`.
	```liquid
	{% seo %}
	```
- See the _advanced usage_ in the docs for setting authors and image OG data.

#### Sample

From [michaelcurrin.github.io/dev-cheatsheets](https://michaelcurrin.github.io/dev-cheatsheets/):

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
- It adds a `sitemap.xml` and `robots.txt` file to the site.
- Sample: [michaelcurrin.github.io/dev-cheatsheets/sitemap.xml](https://michaelcurrin.github.io/dev-cheatsheets/sitemap.xml)
- Sample: [michaelcurrin.github.io/dev-cheatsheets/robots.txt](https://michaelcurrin.github.io/dev-cheatsheets/robots.txt)

{% endraw %}
