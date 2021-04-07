# Environment


{% raw %}

## Production builds

Some plugins or includes blocks will behave differently when using production mode - locally or through GH Pages.

GitHub Pages will set this as production value for you when it builds.

If you are running CI or want to do production build locally, run this.

```sh
JEKYLL_ENV=production bundle exec jekyll build
```

### Domain

When in production mode, Jekyll will use your configured URL value for absolute URLs, rather than a localhost value.

Sample config:

```
url: https://michaelcurrin.github.io
baseurl: /code-cookbook
```

This production mode and URL setup won't affect links which use the `relative_url`

But will affect links using `absolute_url` filter. Notably, plugins generating SEO files and feeds will generate files like these which **must** have absolute URLs or they will not be read properly.

- `robots.txt`
- `sitemap.xml`
- `feed.xml` - an Atom feed or RSS feed.

### Google Analytics

Here is a typical example of reading the variable and rendering conditionally.

```liquid
{% if jekyll.environment == 'production' and site.google_analytics and site.google_analytics != '' %}
    {% include google-analytics.html %}
{% endif %}
```


## GitHub metadata

When using the GitHub Metadata plugin to get data for your GH profile and repos, you will this error when doing a prod build locally, outside of GH Pages. Even if your remote is set, which is what is requests:

```
Liquid Exception: No repo name found. Specify using PAGES_REPO_NWO environment variables, 'repository' in your configuration, or set up an 'origin' git remote pointing to your github.com repository.
```

You can solve this by setting your "NWO" (name with owner) in your config file.

```yaml
repository: username/repo-name
```

See [Configuration](https://jekyll.github.io/github-metadata/configuration/) help page for the GH Metadata plugin.

{% endraw %}
