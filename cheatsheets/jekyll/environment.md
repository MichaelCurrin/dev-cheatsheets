# Environment


{% raw %}

```sh
JEKYLL_ENV=production bundle exec jekyll build
```

```liquid
{% if jekyll.environment == 'production' and site.google_analytics %}
    {% include google-analytics.html %}
{% endif %}
```

{% endraw %}
