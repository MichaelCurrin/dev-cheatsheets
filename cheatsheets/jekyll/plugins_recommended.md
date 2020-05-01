# Recommended plugins


## Setup

1. Add to `Gemfile`.
2. Add to config plugins.
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
