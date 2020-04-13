# Jekyll Templating

Cheat sheet for using Jekyll Liquid and plain HTML in Jekyll projects.

## Links

### Local paths

Use the `link` tag. The smart way to do links for local pages. 

This will figure out the appropriate URL. And it will give build error if the page path is not valid.  Note - do NOT use quotes around the URL otherwise they will be rendered as escaped quote tags and possibly break the HTML.

e.g.

```
-  [Link description]({% link about.md %})
```

Result:

```html
<a href="/my-base-url/about.html">Link description</a>
```

### Footer links

More Markdown then Jekyll, but still useful to keep text readable. Also this link be just below the paragraph rather than the end of the page.

```
This paragraph covers [CircleCI][0], [GitHub][1] and also [Bitbucket][2].

[0]: https://circleci.com/
[1]: https://github.com/
[2]: https://bitbucket.org/
```

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

You can iterate over data in a data file or in the current page's frontmatter or any global variables from Jekyll or a plugin.

[source](https://stackoverflow.com/questions/17677094/jekyll-for-loop-over-all-images-in-a-folder)

### List of key-value pairs

`_data/items.yaml`
```
- foo: A
  bar: 10
  baz: 1000
- foo: B
  bar: 20
  baz: 999
```

`index.md`
```
---
---
{% for item in site.data.items %}
- {{ item.foo }} - {{ item.bar }} - {{ item.baz }}
{% endfor %}
```

### Key-value pairs


`_data/items.yaml`
```
Foo: A
Bar: B
```


`index.md`
```
{% for hash in site.data.items %}
- Key: {{ hash[0] }} - Value: {{ hash[1] }}
{% endfor %}
```

If the value is also a hash then you can do an inner loop which looks similar.


Another example

`index.md`
```
{% for link_hash in page.links %}
  {% for link in link_hash %}
    <a href="{{ link[1] }}">{{ link[0] }}</a>
  {% endfor %}
{% endfor %}
```

## Filter assets

[source](https://stackoverflow.com/questions/17677094/jekyll-for-loop-over-all-images-in-a-folder)

```
{% for asset in site.static_files %}
    {% if asset.path contains '<NEEDLE>' %}
        <a href="{{ asset.path | relative_url }}">{{ asset.path }}</a>
    {% endif %}
{% endfor %}
```

## SVGs

See also the [SVG section of the markdown cheatsheet](/cheatsheets/markdown.md#svgs).

### Image tag

An SVG can be referenced as an image.

```markdown
![alt text](/assets/images/foo.svg)
```

The SVG file should have structure like this:

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
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTE2ODY4ODk4MTAsLTgxMzM0Njk1OV19
-->