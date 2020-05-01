# Recommended plugins


## Setup

1. Add to `Gemfile`.
2. Add to config plugins.
3. Do any plugin-specific setup.


## Analytics

[jekyll-analytics](https://github.com/hendrikschneider/jekyll-analytics)

Add to config:

```yaml
jekyll_analytics:
  GoogleAnalytics:
    id: UA-123-456
```

Note this is **not** whitelisted on Github Pages, so you need an Actions deploy or use the HTML approach as in `minima` theme.

Reference [hendrikschneider/jekyll-analytics issue#5](https://github.com/hendrikschneider/jekyll-analytics/issues/5).


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
