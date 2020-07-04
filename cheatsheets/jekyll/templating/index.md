---
title: Jekyll Templating
render_with_liquid: false
---

Cheat sheet for using Jekyll Liquid and plain HTML in Jekyll projects.


## Disable Liquid

Set in frontmatter:

```yaml
render_with_liquid: false
```


## Comment

```liquid
{% comment %}
Comment message
{% endcomment %}
```

## Collections


### Iterate over collection

- `_config.yml`
    ```yaml
    collections:
    foo:
        output: true
    ```
- `_foo/bars/*.md`
- `index.md`
    ```liquid
    ---
    ---
    {% for item in site.foo.bars %}
    {{ item.title }}
    {% endfor %}
    ```


## Filter assets

[source](https://stackoverflow.com/questions/17677094/jekyll-for-loop-over-all-images-in-a-folder)


```liquid
{% for asset in site.static_files %}
    {% if asset.path contains '<NEEDLE>' %}
        <a href="{{ asset.path | relative_url }}">{{ asset.path }}</a>
    {% endif %}
{% endfor %}
```


## SVGs

See also the [SVG section of the markdown cheatsheet](/cheatsheets/markdown/index.md#svgs).

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


```liquid
<a href="https://instagram.com/{{ site.instagram_username | default: '' | cgi_escape | escape }}">
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

## Improve this page

Add a button for visitors to go to GitHub and edit the page.

e.g.

```html
<a href="https://github.com/MichaelCurrin/cheatsheets/edit/master/{{ page.path }}">
<i class="fa fa-pencil"></i>Improve this page
</a>
```

For Docsify.js, use a plugin:

- [njleonzhang/docsify-edit-on-github](https://github.com/njleonzhang/docsify-edit-on-github)
