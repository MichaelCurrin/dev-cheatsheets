---
title: Recommended plugins
render_with_liquid: false
---


## Setup

1. Add to `Gemfile`.
2. Add to the config's `plugins` section.
3. Do any plugin-specific setup.


## Analytics

### Plugin

- Title: `jekyll-analytics`
- Github: [hendrikschneider/jekyll-analytics](https://github.com/hendrikschneider/jekyll-analytics)
- Additional setup:
    - Add to config:
        ```yaml
        jekyll_analytics:
          GoogleAnalytics:
            id: UA-123-456
        ```

### HTML

Note the plugin above is **not** whitelisted on Github Pages, so you need an Actions deploy or use the HTML approach - reference [hendrikschneider/jekyll-analytics issue#5](https://github.com/hendrikschneider/jekyll-analytics/issues/5).

See [_includes/google-analytics.html](https://github.com/jekyll/minima/blob/master/_includes/google-analytics.html) on Minima. which expects `google_analytics` value in config.


1. Create `_includes/google-analytics.html`
    - From `minima`:
        ```liquid
        <script async src="https://www.googletagmanager.com/gtag/js?id={{ site.google_analytics }}"></script>
        <script>
            window['ga-disable-{{ site.google_analytics }}'] = window.doNotTrack === "1" || navigator.doNotTrack === "1" ||
                navigator.doNotTrack === "yes" || navigator.msDoNotTrack === "1";
            window.dataLayer = window.dataLayer || [];

            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', '{{ site.google_analytics }}');

        </script>
        ```
    - From Google Analytics (parametized for Jekyll):
        ```liquid
        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id={{ site.google_analytics }}"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() {
                dataLayer.push(arguments);
            }
            gtag('js', new Date());

            gtag('config', '{{ site.google_analytics }}');

        </script>
        ```
2. Use the file in to your `head` tag.
    - Copied here from `minima`.
        ```liquid
        {%- if jekyll.environment == 'production' and site.google_analytics -%}
          {%- include google-analytics.html -%}
        {%- endif -%}
        ```
3. Update config with your value:
    ```yaml
    google_analytics: UA-123-456
    ```


## Production environment


Some plugins will only work when using prod env - locally or through GH Pags.

```sh
JEKYLL_ENV='production' bundle exec jekyll build
```

Probably relating to the GH Metdata plugin, you can this this error when doing a prod build. Even if your remote is set:

```
Liquid Exception: No repo name found. Specify using PAGES_REPO_NWO environment variables, 'repository' in your configuration, or set up an 'origin' git remote pointing to your github.com repository.
```

You can solve it with your "NWO" (name with owner):

```yaml
repository: username/repo-name
```

See [Configuration](https://jekyll.github.io/github-metadata/configuration/) help page for Jekyll.


## Standard

These can go on most sites.

- [jekyll-feed](https://github.com/jekyll/jekyll-feed)
	- Produce RSS feed. _"A Jekyll plugin to generate an Atom (RSS-like) feed of your Jekyll posts."_
- [jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag)
	- Use as `{% seo %}` in your `head` tag. The result will be a HTML tag which starts with "SEO plugin"  comment.
	- See advanced usage for authors and image OG data.
- [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap)
	- Adds a `sitemap.xml` and `robots.txt` file to the site.
