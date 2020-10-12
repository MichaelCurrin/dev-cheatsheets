---
title: Analytics
description: How to add Google Analyics tracking to your site using various approaches
---

Using [Google Analytics](https://analytics.google.com) or "GA" is a free, GDR-compliant way of tracking what visitors do you on your site and where they came from. This is a common tool in marketing and SEO.

You need to add a JavaScript snippet and your site ID to each page to enable GA. This would be impractical by hand, but since we use Jekyll we can use templating and includes to repeat the JS snippet on all pages, or use a plugin so we don't have to maintain the JS snippet ourselves.

## Enable production build

Note that whichever approach you choose below, you'll probably only want analytics on a prod build (not local dev or remote dev/staging) and then enable it using this flag. Note that GH Pages sets this for you already.

```sh
JEKYLL_ENV='production' bundle exec jekyll build
```

You can of course use `serve` instead of `build` but know that you'll send stats to GA and the traffic will appear on the localhost domain under sources.


## Approaches

Note that even if an approach below references Google Tag Manager, that is just where the script comes from. You don't have to login to GTM at all, you could login to Google Anlytics only and get all the functionality you need.

### Plugin

Note that is plugin is **not** whitelisted on GitHub Pages, so you need an Actions deploy or use the HTML approach - reference [hendrikschneider/jekyll-analytics issue#5](https://github.com/hendrikschneider/jekyll-analytics/issues/5).

- Title: `jekyll-analytics`
- Repo: [hendrikschneider/jekyll-analytics](https://github.com/hendrikschneider/jekyll-analytics)
- Additional setup:
    - Add to config:
        ```yaml
        jekyll_analytics:
          GoogleAnalytics:
            id: UA-123-456
        ```

### Theme

The the Minima covers Google Analytics already - just set `google_analytics` in the config. 

See [\_includes/google-analytics.html](https://github.com/jekyll/minima/blob/master/_includes/google-analytics.html)

### Add your own snippet

Instead of relying on a theme or plugin as above, you can add a JavaScript snippet to your project yourself. This does not have the limitations as covered above - it just means you have to maintain this code.


{% raw %}

1. Create `_includes/google-analytics.html` using a snippet below. Content from `minima` theme which is very close to what you get from GA itself:
    ```html
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
2. Use the file in to your HTML `head` tag such as in your `default.html` layout. Copied here from `minima`.
    ```liquid
    {%- if jekyll.environment == 'production' and site.google_analytics -%}
        {%- include google-analytics.html -%}
    {%- endif -%}
    ```
3. Add the value to your `_config.yml` file:
    ```yaml
    google_analytics: UA-123467-78
    ```

{% endraw %}

Do a production build as covered at the start of this page to test it locally.
