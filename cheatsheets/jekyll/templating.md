# Jekyll

## Comment

```
{% comment %}
Comment message
{% endcomment %}
```

## Collections


### Iterate over collection

`_config.yml`

```yaml
collections:
  foo:
    output: true
```

`_foo/bars/*.md`

`index.md`
```
---
---
{% for item in site.foo.bars %}
{{ item.title }}
{% endfor %}
```

## Iterate over data

[source](https://stackoverflow.com/questions/17677094/jekyll-for-loop-over-all-images-in-a-folder)

`_data/items.yaml`
```
- foo: A
  bar: 10
- foo: B
  bar: 20
```

`index.md`
```
---
---
{% for item in site.data.items %}
    {{ item.food }} {{ item.bar }}
{% endfor %}
```

## Filter assets

[source](https://stackoverflow.com/questions/17677094/jekyll-for-loop-over-all-images-in-a-folder)

```
{% for asset in site.static_files %}
    {% if asset.path contains '<NEEDLE>' %}
        {{ asset.path | relative_url }}
    {% endif %}
{% endfor %}
```
