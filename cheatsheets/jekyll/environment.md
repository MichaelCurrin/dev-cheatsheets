# Environment


{% raw %}

## Production builds

Some plugins or includes blocks as around Jekyll Analytics will only run when using prod env - locally or through GH Pages.

GH Pages will set this as production value for you when it builds.

```sh
JEKYLL_ENV=production bundle exec jekyll build
```

Example use:

```liquid
{% if jekyll.environment == 'production' and site.google_analytics %}
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
