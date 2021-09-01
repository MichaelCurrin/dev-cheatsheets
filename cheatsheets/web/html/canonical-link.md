# Canonical link

## Syntax

```html
<link rel="canonical" href="URL" />
```

e.g.

```html
<link rel="canonical" href="https://example.com/my-page/" />
```


## About

When there is a risk of duplicate content across your pages, websites, or your cross-post on a blog and your own website, you can use this metatag to tell a search engine crawler which page is "preferred".

If you do not set this field, then a crawler will prefer the _first_ page it sees and conside all the rest duplicates and _not_ show them in search results.

See [article](https://yoast.com/rel-canonical/) on Yoast.com for more info.

### Forks

Setting this is useful if you have users forking your repo and setting up their own sites, but you want your "original" site to be the one search engines prefer.

Ideally the domain is hardcoded to be yours and not set programmatically (like from a YAML file). So that on all sites built from your fork, they all point to your original domain (and subpath, for GitHub Pages.

### Jekyll

For use in Jekyll, you can use the [Jekyll SEO plugin][] to render this for you. See [Advanced usage][] for more info.

Here is an example from the `seo` tag, when using Jekyll in production mode to get the absolute URL.

```html
<link rel="canonical" href="https://michaelcurrin.github.io/fractal/cli-demo.html" />
```

See [HTML source][] in the plugin.

That is great for a private codebase. 

But, unfortunately, if other users start building a site from your forked codebase, then the SEO tag might point to _their_ domain as the domain in the metatag.

```html
<link rel="canonical" href="https://anotheruser.github.io/fractal/cli-demo.html" />
```

And if every site has a different value, that has no effect. You need _all_ sites to use the same domain (yours), regardless of their _own_ domain where a (duplicate) page is.

[Jekyll SEO plugin]: https://github.com/jekyll/jekyll-seo-tag
[HTML source]: https://github.com/jekyll/jekyll-seo-tag/blob/master/lib/template.html
[Advanced usage]: https://github.com/jekyll/jekyll-seo-tag/blob/master/docs/advanced-usage.md
