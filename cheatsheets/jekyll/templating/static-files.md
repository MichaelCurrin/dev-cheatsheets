# Static files

{% raw %}

[source](https://stackoverflow.com/questions/17677094/jekyll-for-loop-over-all-images-in-a-folder)

```liquid
{% for asset in site.static_files %}
    {% if asset.path contains '<NEEDLE>' %}
        <a href="{{ asset.path | relative_url }}">{{ asset.path }}</a>
    {% endif %}
{% endfor %}
```

{% endraw %}
