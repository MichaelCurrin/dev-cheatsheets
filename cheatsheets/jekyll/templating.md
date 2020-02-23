# Jekyll Templating

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

## SVGs

### Image tag

An SVG can be referenced as an image.

```markdown
![alt text](/assets/images/foo.svg)
```

The SVG file should have structure like this

```xml
<svg id="svg" version="1.1" width="..." height="..." viewBox="..."
    xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
    <g id="svgg">
      ...
    </g>
</svg>
```

### Social

Clickable social media SVG icon.

[source](https://github.com/jekyll/minima/blob/master/_includes/social.html)

How use the `svg` and `use` tags to reference a `.svg` file which contains multiple images (referenced by ID).

```jekyll
<a href="https://instagram.com/{{ site.instagram_username| cgi_escape | escape }}">
    <svg class="svg-icon">
        <use xlink:href="{{ '/assets/minima-social-icons.svg#instagram' | relative_url }}"></use>
    </svg>
</a>
```

```xml
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">

    <symbol id="instagram" fill-rule="evenodd" clip-rule="evenodd" stroke-linejoin="round" stroke-miterlimit="1.414">
        <path d="..."/>
    </symbol>

    <symbol>
        ...
    </symbol>

<svg>
```
