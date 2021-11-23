# Paths

{% raw %}


## Split path

```liquid
{% assign crumbs = page.url | split: '/' %}
```

For page with URL `/demo/python/pypi.html`:

```liquid
{{ crumbs | inspect }}
```

```json
["", "demo", "python", "pypi.html"]
```

Recombine:

```liquid
{{ crumbs | join: '/' }}
```
```
/demo/python/pypi.html
```

Use just a portion of the URL:

```liquid
{{ crumbs | slice: 0, 3 | join: '/' }}
```

```
/demo/python
```

{% endraw %}
